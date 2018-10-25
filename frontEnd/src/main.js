import 'babel-polyfill'
import Vue from 'vue'
import App from './App'
import router from '@/router/index.js'
import store from './vuex/store'
import filter from './assets/js/filter'
import 'assets/css/global.css'
import 'assets/css/base.css'
import './.htaccess'

new Vue({
  el: '#app',
  template: '<App/>',
  filters: filter,
  router,
  store,
  components: { App }
}).$mount('#app')
