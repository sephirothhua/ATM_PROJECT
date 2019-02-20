// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import ElementUI from 'element-ui'
import store from './store'
import '@/theme/index.css'
import $backend from '@/utils/backend'
import Toast from './components/toast'
import $ from 'jquery'

require('./mock/mock.js')
require('./assets/icon/iconfont.css')

Vue.use(ElementUI)
Vue.use(Toast)
Vue.prototype.$backend = $backend

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  template: '<App/>',
  components: { App }
})

export default app

