#!/bin/bash
set -euo pipefail

# Local Sphinx build matching .readthedocs.yaml:
#   - Python 3 venv with docs/requirements.txt (breathe, sphinx-js, rtd theme)
#   - npm install (jsdoc) as RTD post_install
#   - READTHEDOCS=True so conf.py also runs doxygen for the C++ API

# change into this directory
pushd "$(dirname "$0")" >/dev/null

REPO_ROOT="$(cd .. && pwd)"
DOCS_DIR="$REPO_ROOT/docs"
VENV_DIR="$DOCS_DIR/.venv"

if command -v python3.12 >/dev/null 2>&1; then
    PYTHON=python3.12
elif command -v python3 >/dev/null 2>&1; then
    PYTHON=python3
else
    echo "Python 3 is required to build the documentation (Read the Docs uses 3.12)."
    exit 1
fi

if ! command -v npm >/dev/null 2>&1; then
    echo "npm is required to install jsdoc (Read the Docs uses Node.js 20)."
    exit 1
fi

# Create the virtual environment locally if it does not exist yet
if [ ! -d "$VENV_DIR" ]; then
    echo "Creating virtual environment in $VENV_DIR"
    "$PYTHON" -m venv "$VENV_DIR"
fi

if [ -f "$VENV_DIR/bin/activate" ]; then
    # shellcheck source=/dev/null
    source "$VENV_DIR/bin/activate"
elif [ -f "$VENV_DIR/Scripts/activate" ]; then
    # Git Bash / Windows
    # shellcheck source=/dev/null
    source "$VENV_DIR/Scripts/activate"
else
    echo "Could not find a virtual environment activate script in $VENV_DIR"
    exit 1
fi

python -m pip install --upgrade pip
python -m pip install -r "$DOCS_DIR/requirements.txt"

# Same as Read the Docs post_install: install jsdoc from the root package.json
cd "$REPO_ROOT"
npm install

# RTD adds node_modules/.bin to PATH so sphinx-js can find jsdoc
export PATH="$REPO_ROOT/node_modules/.bin:$PATH"

if ! command -v jsdoc >/dev/null 2>&1; then
    echo "jsdoc was not found on PATH after npm install."
    exit 1
fi

# Match the Read the Docs environment so conf.py runs doxygen as it does on RTD
export READTHEDOCS=True

cd "$DOCS_DIR"
sphinx-build -b html . _build/html

echo
echo "Documentation built at: $DOCS_DIR/_build/html/index.html"

popd >/dev/null
