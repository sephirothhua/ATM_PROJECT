import Layout from '@/views/layout/Layout'

// 不作为Main组件的子页面展示的页面单独写，如下
export const loginRouter = {
  path: '/login',
  name: 'login',
  meta: {
    title: 'Login - 登录'
  },
  component: resolve => { require(['@/views/login/index.vue'], resolve) }
}

// 作为Main组件的子页面展示并且在菜单显示的路由写在appRouter里
export const appRouter = [
  {
    path: '/home',
    icon: '&#xeaac;',
    name: 'home',
    title: '概览',
    redirect: '/home/index',
    component: Layout,
    meta: {unfold: false},
    index: '1',
    children: [
      { path: 'index', index: '1', title: '概览', name: 'home_index', component: resolve => { require(['@/views/home/home.vue'], resolve) } }
    ]
  },
  {
    path: '/camera',
    icon: '&#xeaba;',
    name: 'home',
    title: '设备管理',
    redirect: '/camera/index',
    component: Layout,
    meta: {unfold: false},
    index: '2',
    children: [
      { path: 'index', index: '1', title: '设备管理', name: 'camera_index', component: resolve => { require(['@/views/camera/device.vue'], resolve) } }
    ]
  },
  {
    path: '/log',
    icon: '&#xeab0;',
    name: 'home',
    title: '日志管理',
    redirect: '/log/index',
    component: Layout,
    meta: {unfold: false},
    index: '2',
    children: [
      { path: 'index', index: '1', title: '日志管理', name: 'log_index', component: resolve => { require(['@/views/log/log.vue'], resolve) } }
    ]
  },
  {
    path: '/alert',
    icon: '&#xeaa8;',
    name: 'home',
    title: '报警日志',
    redirect: '/alert/index',
    component: Layout,
    meta: {unfold: false},
    index: '2',
      children: [
    { path: 'index', index: '1', title: '报警日志', name: 'alert_index', component: resolve => { require(['@/views/alert/alert.vue'], resolve) } }
  ]
  },
  {
    path: '/view',
      icon: '&#xeaa8;',
    name: 'home',
    title: 'View',
    redirect: '/view/index',
    component: Layout,
    meta: {unfold: false},
    index: '2',
      children: [
    { path: 'index', index: '1', title: 'view', name: 'view_index', component: resolve => { require(['@/views/camera/view.vue'], resolve) } }
  ]
  },
  {
    path: '/user',
    icon: '&#xeaa8;',
    name: 'home',
    title: '用户管理',
    redirect: '/user/index',
    component: Layout,
    meta: {unfold: false},
    index: '2',
    children: [
      { path: 'index', index: '1', title: '人员管理', name: 'user_index', component: resolve => { require(['@/views/user/people.vue'], resolve) } }
    ]
  }
]

// 所有上面定义的路由都要写在下面的routers里
export const routers = [
  loginRouter,
  ...appRouter
]
