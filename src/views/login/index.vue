<template>
  <div class="login-container">
    <el-form class="login-form" :rules="rules" :model="loginForm" ref="loginForm" label-position="left">
      <h3 class="title">系统登录</h3>
      <el-form-item prop="username">
        <span class="svg-container svg-container_login">
          <i class="iconfont">&#xeaa6;</i>
        </span>
        <el-input name="username" type="text" v-model="loginForm.username" placeholder="用户名" />
      </el-form-item>

      <el-form-item prop="password">
        <span class="svg-container">
          <i class="iconfont">&#xeaa2;</i>
        </span>
        <el-input name="password" type="password" @keyup.enter.native="handleLogin" v-model="loginForm.password" placeholder="密码" />
      </el-form-item>

      <el-button type="primary" class="login-btn" @click.native.prevent="handleLogin">登录</el-button>
    </el-form>
  </div>
</template>

<script>
import store from '@/store'

export default {
  name: 'login',
  data () {
    const validatePassword = (rule, value, callback) => {
      if (value.length < 6) {
        callback(new Error('密码不能小于6位'))
      } else {
        callback()
      }
    }
    return {
      loginForm: {
        username: '',
        password: ''
      },
      rules: {
        username: [{ required: true, message: '请输入用户名' }],
        password: [{ required: true, validator: validatePassword }]
      }
    }
  },
  mounted () {
  },
  methods: {
    handleLogin () {
      this.$refs.loginForm.validate(valid => {
        if (valid) {
          this.$backend.$login(this.loginForm).then((responseData) => {
            localStorage.setItem("token", "Bearer " + responseData.token);
            store.commit("login", {
              username: this.loginForm.username,
              token: responseData.token
            });
            this.get_user_info();
          }).catch(error => {
            console.log(error)
            this.$toast('登录错误', 2000)
          })
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
    get_user_info(token) {
      this.$backend.$getMyUser().then((responseData) => {
        store.state.user_info = responseData;
        let next_path = this.get_next_path();
        if (!next_path || next_path.startsWith === "/login") {
          next_path = "/home";
        }
        this.$router.push({ path: next_path });
      })
    },
    get_next_path() {
      console.log("get_next_path:", window.location.href);
      let l = window.location.href.split("next_path=");
      if (l.length >= 2) {
        let next_path = l[1].split("&token")[0];
        return decodeURIComponent(next_path);
      }
      return null;
    },
  }
}
</script>

<style lang="less">
  .login-container {
    height: 100vh;
    background: url("../../assets/images/bj.png") no-repeat;
    background-size: 100% 100%;
    .login-form {
      position: absolute;
      left: 0;
      right: 0;
      top: 30%;
      width: 360px;
      padding: 35px 35px 15px 35px;
      margin: 0px auto;
      border: 3px solid #2C89B5;
      background: #fff;
      input {
        background: transparent;
        border: 0px;
        -webkit-appearance: none;
        border-radius: 0px;
        padding: 0 5px 2px 15px;
        color: #000;
        height: 30px;
      }
      .el-input {
        display: inline-block;
        height: 30px;
        width: 85%;
      }
      .svg-container {
        padding: 0px 5px 2px 15px;
        vertical-align: middle;
        width: 30px;
        display: inline-block;
        color:#fff;
        &_login {
          font-size: 20px;
        }
        .iconfont {
          color: #0666b2;
        }
      }
      .title {
        font-size: 20px;
        font-weight: 400;
        color: #0666b2;
        margin: 0px auto 20px auto;
        text-align: center;
        font-weight: bold;
      }
      img {
        margin-bottom: 20px;
      }
      .verfiy-img-box {
        position: relative;
      }
      .verfiy-img {
        position: absolute;
        top: 4px;
        right: 4px;
        height: 36px;
      }
    }
    .el-form-item {
      border: 1px solid #0666b2;
      border-radius: 5px;
      margin-bottom: 20px !important;
    }
    .login-btn {
      width: 100%;
      margin-bottom: 30px;
      background: #0D96E7;
      border-color: #0D96E7;
    }
  }
</style>
