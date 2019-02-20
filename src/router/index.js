import Vue from 'vue'
import Router from 'vue-router'
import {routers} from './router'
import store from '@/store'
import app from "@/main"

Vue.use(Router)

// 路由配置
const RouterConfig = {
  mode: 'history',
  routes: routers
}

const router = new Router(RouterConfig)

export default router

//每次路由跳转预处理
router.beforeEach((to, from, next) => {
  // 如果尚未登录且访问的不是登录页面跳转到登录页面
  if (to.name != "login" && !localStorage.getItem("token")) {
    next({ name: "login", query: { "next_path": to.fullPath } })
    return
  }
  // 如果访问的页面不存在返回上一页 如果上一页也不存在了 跳转到根目录
  if (to.matched.length === 0) {
    //如果未匹配到路由
    // app.$message.warning("您访问的页面不存 自动跳转到上一页")
    if (from.name && from.name !== "login") {
      next({ name: from.name })
      return
    }
    next("/home")
    return
  }
  store.commit('reset_canceltoken')                                             //取消当前所有访问

  store.dispatch('UpdateMenulist').then(() => { // 生成可访问的路由表
    next()
  })   //如果匹配到正确跳转
})
router.afterEach((to) => {
  window.scrollTo(0, 0)
})
