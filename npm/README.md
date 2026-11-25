# @copasi/copasijs

Browser build of [COPASI.js](https://github.com/copasi/COPASI.js) for Vite, webpack, and Rollup.

```bash
npm install @copasi/copasijs
```

```javascript
import createCpsModule, { COPASI } from "@copasi/copasijs";

const module = await createCpsModule();
const copasi = new COPASI(module);
```

The same function is also a named export:

```javascript
import { createCpsModule, COPASI } from "@copasi/copasijs";
```

`copasijs.wasm` is published next to the generated glue. The glue loads it with `new URL("copasijs.wasm", import.meta.url)`. Pass `locateFile` only when a bundler does not rewrite that URL.

GitHub Packages uses the same name and requires a token. In the consumer project:

```
@copasi:registry=https://npm.pkg.github.com
```

Script-tag pages and Node keep using the zip archives from the COPASI.js releases. This package is the web build for bundlers.
