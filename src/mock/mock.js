import {deepClone} from './index'
// 引入mockjs
const Mock = require('mockjs')
// 获取 mock.Random 对象
const Random = Mock.Random

// mock一组数据
let data = []
for (let i = 0; i < 20; i++) {
  let userObject = {
    id: i,
    username: Random.name(),
    name: Random.cname(),
    email: Random.email(),
    department_name: 'aa',
    role_name: 'bb',
    comment: Random.csentence(5, 20)
  }
  data.push(userObject)
}

// 数据的查询操作
let userData = options => {
  let obj = JSON.parse(options.body)
  return {
    data: {
      total: data.length,
      data: deepClone(data).splice(obj.start, obj.length)
    }
  }
}
Mock.mock('/user/data', 'post', userData)

// 数据的删除操作
let userRemove = options => {
  let id = options.body.split(',')
  data = data.filter(val => {
    return id.indexOf(String(val.id)) === -1
  })
  return {
    data: {
      total: data.length,
      data: deepClone(data).splice(0, 10)
    }
  }
}
Mock.mock('/user/remove', 'post', userRemove)

// 数据的添加操作
let userAdd = options => {
  let obj = JSON.parse(options.body)
  obj.id = data.length + 1
  data.unshift(obj)
  return {
    data: {
      total: data.length,
      data: deepClone(data).splice(0, 10)
    }
  }
}
Mock.mock('/user/add', 'post', userAdd)

// 数据的修改操作
let userEdit = options => {
  let obj = JSON.parse(options.body)
  data = data.map(val => {
    return val.id === obj.id ? obj : val
  })
  return {
    data: {
      total: data.length,
      data: deepClone(data).splice(0, 10)
    }
  }
}
Mock.mock('/user/edit', 'post', userEdit)
