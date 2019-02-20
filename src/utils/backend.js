import axios from 'axios'
import cookie from "./cookie"
import store from "@/store"
import router from "@/router"

let local_token = localStorage.getItem("token")
let token = cookie.get_cookie("token")
//
// console.log("local", local_token)
// console.log(token)
if (token) {
  localStorage.setItem("token", token)
} else {
  token = localStorage.getItem("token")
}

let $backend = axios.create({
  baseURL: '/api',
  timeout: 5000,
  headers: {'Content-Type': 'application/json'}
})

// 请求头
$backend.interceptors.request.use(config => {
  config.headers.Authorization = store.state.token
  config.cancelToken = store.state.cancel_token.token
  return config
}, error => {
  return Promise.reject(error)
})


// Response Interceptor to handle and log errors
$backend.interceptors.response.use(function (response) {
  return response
}, function (err) {
  // eslint-disable-next-line
  if (err && err.response) {
    console.log(err.response)
    switch (err.response.status) {
      case 400:
        if (err.response.request.responseText) {
          err.message = err.response.request.responseText
        } else {
          err.message = '请求错误(400)'
        }
        break
      case 401: err.message = '未授权，请重新登录(401)'
        store.state.token = null
        localStorage.removeItem("token")
        router.push({ name: "login"})
        return Promise.reject(error)
        break
      case 403: err.message = '拒绝访问(403)'
        break
      case 404: err.message = '请求出错(404)'
        break
      case 408: err.message = '请求超时(408)'
        break
      case 500: err.message = '服务器错误(500)'
        break
      case 501: err.message = '服务未实现(501)'
        break
      case 502: err.message = '网络错误(502)'
        break
      case 503: err.message = '服务不可用(503)'
        break
      case 504: err.message = '网络超时(504)'
        break
      case 505: err.message = 'HTTP版本不受支持(505)'
        break
      default: err.message = `连接出错(${err.response.status})!`
    }
  } else {
    err.message = '连接服务器失败!'
  }
  // alert(err.message)
  return Promise.reject(err)
})

// 获取所有设备
$backend.$getAllDevice = () => {
  return $backend.get('camera/get_devices/')
    .then(response => response.data)
}

// 分页获取设备列表
$backend.$getDeviceList = (payload) => {
  return $backend.get('camera/', {params: payload})
    .then(response => response.data)
}

// 创建设备
$backend.$createDevice = (payload) => {
  return $backend.post('camera/', payload)
    .then(response => response.data)
}

// 编辑设备
$backend.$editDevice = (deviceId, payload) => {
  return $backend.patch(`camera/${deviceId}/`, payload)
    .then(response => response.data)
}

// 删除设备
$backend.$deleteDevice = (deviceId) => {
  return $backend.delete(`camera/${deviceId}/`)
    .then(response => response.data)
}

// 获取日志列表
$backend.$getLogList = (payload) => {
  return $backend.get('log/', {params: payload})
    .then(response => response.data)
}

// 删除日志
$backend.$deleteLog = (logId) => {
  return $backend.delete(`log/${logId}/`)
    .then(response => response.data)
}

// 用户登录
$backend.$login = (payload) => {
  return $backend.post('token', payload)
    .then(response => response.data)
}

// 获取当前用户的值
$backend.$getMyUser = () => {
  return $backend.get('user/get_my_info/')
    .then(response => response.data)
}

// 获取用户列表
$backend.$getUserList = (payload) => {
  return $backend.get('user/', {params: payload})
    .then(response => response.data)
}

// 创建用户
$backend.$createUser = (payload) => {
  return $backend.post('user/', payload)
    .then(response => response.data)
}

// 编辑用户
$backend.$editUser = (userId, payload) => {
  return $backend.patch(`user/${userId}/`, payload)
    .then(response => response.data)
}

// 删除设备
$backend.$deleteUser = (userId) => {
  return $backend.delete(`user/${userId}/`)
    .then(response => response.data)
}

// 修改密码
$backend.$changePassword = (payload) => {
  return $backend.post('user/change_password/', payload)
    .then(response => response.data)
}

// 获取报警列表
$backend.$getAlertLogList = (payload) => {
  return $backend.get('alert/', {params: payload})
    .then(response => response.data)
}

// 删除报警日志
$backend.$deleteAlertLog = (alertId) => {
  return $backend.delete(`alert/${alertId}/`)
    .then(response => response.data)
}

export default $backend
