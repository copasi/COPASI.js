import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'

import copasi_plugin from './copasi-plugin'

createApp(App).
use(copasi_plugin).mount('#app')
