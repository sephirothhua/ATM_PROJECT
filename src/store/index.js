import Vue from 'vue'
import Vuex from 'vuex'
import getters from './getters'
import app from './modules/app'
import axios from 'axios'
import cookie from '../utils/cookie'
import * as mutation from './mutation'

Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    app
  },
  state: {
    count: 0,
    token: localStorage.getItem('token')?localStorage.getItem('token'): null,
    username: cookie.get_cookie('username'),
    user_info: {},
    cancel_token: axios.CancelToken.source(),
    page_size: 0,
    next: 'root',
    next_path: '/',
  },
  mutations: mutation,
  getters
})

export default store
