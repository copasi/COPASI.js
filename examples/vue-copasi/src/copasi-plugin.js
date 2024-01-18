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
    instance: {version: 'loading'},
  })

  app.provide('$copasi', copasi)

  createCpsModule().then((module) => {
    copasi.state = 'ready'
    copasi.module = module
    copasi.instance = new COPASI(module)
    //console.log('initialized COPASI', copasi.instance.version)
  })
}

export default install