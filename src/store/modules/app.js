import {appRouter} from '@/router/router'

const app = {
  state: {
    menuList: [] // 导航菜单
  },
  mutations: {
    setMenulist (state, permissions) {
      state.menuList = permissions
    }
  },
  actions: {
    UpdateMenulist ({ commit }, data) {
      return new Promise(resolve => {
        commit('setMenulist', appRouter)
        resolve()
      })
    }
  }
}

export default app
