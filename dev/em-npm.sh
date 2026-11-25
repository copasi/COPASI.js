set -eu

export ENVIRONMENT=web
export BUILD_DIR=em-build-npm
export INSTALL_PREFIX=dist-npm
export COPASIJS_EXPORT_ES6=ON
export COPASIJS_INCLUDE_EXAMPLE_FILES=OFF

cd "$(dirname "$0")/.."

rm -rf "$INSTALL_PREFIX"

./dev/em-build.sh

cp LICENSE "$INSTALL_PREFIX/"
cp npm/index.js npm/index.d.ts npm/README.md "$INSTALL_PREFIX/"
node dev/emit-copasi-esm.mjs js/copasi.js "$INSTALL_PREFIX/copasi.js"

node --input-type=module -e '
import fs from "node:fs";
const version = fs.readFileSync("VERSION.txt", "utf8").trim();
const pkg = JSON.parse(fs.readFileSync("npm/package.json", "utf8"));
pkg.version = version;
fs.writeFileSync("dist-npm/package.json", JSON.stringify(pkg, null, 2) + "\n");
'

if find "$INSTALL_PREFIX" -name "*.data" -o -name "test*" | grep -q .; then
    echo "dist-npm contains tests or a data file" >&2
    exit 1
fi

node dev/check-npm-package.mjs "$INSTALL_PREFIX"
