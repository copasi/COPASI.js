import { COPASI } from './copasi.js'
import { createCpsModule } from './copasijs.js'
import { reactive } from 'vue'
/**
 * Install function for installing plugin into Vue 3 application.
 *
 * @param {Object} app
 * @param {Object} options
 */
function install(app) {
  const copasi = reactive({
    state: 'loading',
    module: undefined,
    instance: undefined,
    version: 'loading'
  })

  app.provide('$copasi', copasi)

  createCpsModule().then((module) => {
    const c = new COPASI(module)
    copasi.state = 'ready'
    copasi.module = module
    copasi.instance = c
    copasi.version = c.version
    // console.log('initialized COPASI', copasi.instance.version)
  })
}

export default install