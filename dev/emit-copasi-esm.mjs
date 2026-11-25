import fs from "node:fs";

const [sourcePath, destPath] = process.argv.slice(2);
if (!sourcePath || !destPath) {
    console.error("usage: node dev/emit-copasi-esm.mjs <source> <dest>");
    process.exit(1);
}

const source = fs.readFileSync(sourcePath, "utf8");
const marker = "\n// if module is defined, export the COPASI class\n";
const at = source.indexOf(marker);
if (at < 0) {
    console.error("COPASI class file is missing the CommonJS export tail");
    process.exit(1);
}

const esm = `${source.slice(0, at)}\nexport { COPASI };\nexport default COPASI;\n`;
if (esm.includes("module.exports")) {
    console.error("ESM copy still assigns module.exports");
    process.exit(1);
}

fs.writeFileSync(destPath, esm);
