const set_cookie = (name, value, valid_time=1) => {
  let date = new Date()
  date.setTime(date.getTime()+valid_time*24*3600)
  document.cookie = name+"="+value+";expires="+date.toString()
}

const get_cookie = (name) => {
  let cookies = document.cookie.split("; ")
  for(let i of cookies){
    let name_value = i.split("=")
    if(name==name_value[0]){
      return name_value[1]
    }
  }
}

export default {
  set_cookie,
  get_cookie
}
