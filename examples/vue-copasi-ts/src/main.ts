import './assets/main.css'

import { createApp } from 'vue'
import { createPinia } from 'pinia'

import App from './App.vue'
import router from './router'
import copasi_plugin from './copasi-plugin'

const app = createApp(App)

app.use(createPinia())
app.use(router)
app.use(copasi_plugin)
app.mount('#app')
