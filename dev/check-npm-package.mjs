import { execFileSync } from "node:child_process";
import fs from "node:fs";
import path from "node:path";

const root = path.resolve(process.argv[2] ?? "dist-npm");
const version = fs.readFileSync("VERSION.txt", "utf8").trim();

function fail(message) {
    console.error(message);
    process.exit(1);
}

function read(name) {
    const file = path.join(root, name);
    if (!fs.existsSync(file)) {
        fail(`missing ${name}`);
    }
    return fs.readFileSync(file, "utf8");
}

const glue = read("copasijs.js");
if (!/export default createCpsModule\s*;/.test(glue)) {
    fail("copasijs.js does not default-export createCpsModule");
}
if (!glue.includes("new URL('copasijs.wasm', import.meta.url)") && !glue.includes('new URL("copasijs.wasm", import.meta.url)')) {
    fail("copasijs.js does not locate copasijs.wasm with import.meta.url");
}

const wasm = path.join(root, "copasijs.wasm");
if (!fs.existsSync(wasm) || fs.statSync(wasm).size === 0) {
    fail("copasijs.wasm is missing");
}

const copasi = read("copasi.js");
if (!copasi.includes("export { COPASI };") || !copasi.includes("export default COPASI;")) {
    fail("copasi.js is missing ESM exports");
}
if (copasi.includes("module.exports")) {
    fail("copasi.js still assigns module.exports");
}

const pkg = JSON.parse(read("package.json"));
if (pkg.name !== "@copasi/copasijs") {
    fail(`package name is ${pkg.name}`);
}
if (pkg.version !== version) {
    fail(`package version ${pkg.version} does not match VERSION.txt ${version}`);
}
const listed = pkg.files ?? [];
const listedText = JSON.stringify(listed);
if (listedText.includes("test") || listedText.includes(".data")) {
    fail("package files list tests or a data file");
}
for (const name of ["index.js", "index.d.ts", "copasijs.js", "copasijs.wasm", "copasi.js", "copasi.d.ts", "README.md", "LICENSE"]) {
    if (!listed.includes(name)) {
        fail(`package files list is missing ${name}`);
    }
    if (!fs.existsSync(path.join(root, name))) {
        fail(`missing ${name}`);
    }
}

const dry = execFileSync("npm", ["pack", "--dry-run", "--json"], {
    cwd: root,
    encoding: "utf8",
});
const packed = JSON.parse(dry);
const names = (packed[0]?.files ?? []).map((file) => file.path);
for (const name of ["copasijs.wasm", "copasijs.js", "copasi.js", "copasi.d.ts", "index.d.ts", "index.js", "README.md", "LICENSE", "package.json"]) {
    if (!names.includes(name)) {
        fail(`npm pack is missing ${name}`);
    }
}

console.log(`npm package shape ok (${pkg.name}@${pkg.version})`);
