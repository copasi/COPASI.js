## Vue example (JS version)
Here I describe how to use COPASI.js with vue3. We first start with a 
sample project, using npm and installing the plotly and uuid package:

```bash
npm create vue@latest
cd copasi-vue
npm i vue3-plotly
npm i uuid
npm run dev
```

I also copied the files from the COPASI.js web distribution straight into the src directory, so add the 
latest `copasi.js`, `copasijs.js` file there. As it seems the node and web environments seem incompatible 
with each other, so you will have to choose the right one.

For reasons beyond my understanding, here we need to add: 

```javascript

export default COPASI;
export {COPASI};

```

at the end of `copasi.js`, and:

```javascript 

export {createCpsModule};
export default createCpsModule;
    
```

at the end of `copasijs.js`. 

Once that is done `copasi-plugin.js` adds a `$copasi` object to the vue application
and then initialized in `main.js`:

```javascript
import copasi_plugin from './copasi-plugin'

const app = createApp(App)
...
app.use(copasi_plugin)
...

```

from there it is available to any view that would like to use it using: 

```javascript
<script setup lang="ts">
import { inject } from 'vue'

// inject the COPASI object from the main app
const copasi = inject('$copasi')
</script>
```

an example in in the `HomeView.vue`.

Unfortunately I'm not yet used to typescript, so some type errors are in this example and you'd have 
to use: 

```bash
npm run build-only
```

for now.

-----
## vue-copasi

This template should help get you started developing with Vue 3 in Vite.

## Recommended IDE Setup

[VSCode](https://code.visualstudio.com/) + [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) (and disable Vetur) + [TypeScript Vue Plugin (Volar)](https://marketplace.visualstudio.com/items?itemName=Vue.vscode-typescript-vue-plugin).

## Customize configuration

See [Vite Configuration Reference](https://vitejs.dev/config/).

## Project Setup

```sh
npm install
```

### Compile and Hot-Reload for Development

```sh
npm run dev
```

### Compile and Minify for Production

```sh
npm run build
```
