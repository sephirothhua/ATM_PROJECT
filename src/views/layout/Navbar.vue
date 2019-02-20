<template>
  <div>
    <el-menu class="navbar" mode="horizontal">
      <span class="title">管理平台</span>
      <div class="avatar-wrapper">
        <span class="user-name">您好！{{ user_info.username ? user_info.username: "未登录" }}</span>
        <i class="iconfont navbar-icon" title="退出登录" @click="logout">&#xe60e;</i>
      </div>
    </el-menu>
  </div>
</template>

<script>
  import store from '@/store'
  import app from "@/main";

  export default {
    data () {
      return {
        user_info: {},
      }
    },
    mounted () {
      this.get_user_info()
    },
    methods: {
      get_user_info(token) {
        this.user_info = store.state.user_info;
        // 为空则重新获取
        if (!this.user_info.id){
          this.$backend.$getMyUser().then((responseData) => {
            this.user_info = responseData;
          })
        }
      },
      logout() {
        this.$toast('已经注销用户', 2000)
        this.$store.commit("logout");
        this.$router.push("login");
      }
    }
  }
</script>

<style  lang="less" scoped>
	.navbar {
    z-index: 2000 !important;
    height: 60px;
    line-height: 60px;
    border-radius: 0px !important;
    width: 100%;
    position: fixed;
    top: 0;
    z-index: 100;
    background: #0D96E7;
    .title {
      color:#fff;
      font-size:25px;
      display: inline-block;
      margin-left: 30px;
    }
    .avatar-wrapper {
      cursor: pointer;
      float: right;
      height: 60px;
      line-height: 60px;
      margin-right: 10px;
      &:focus {
        outline: none;
      }
      .user-avatar {
        width: 30px;
        height: 30px;
        float: left;
        margin-top: 15px;
      }
      .user-name {
        float: left;
        margin: 0 10px;
        font-size: 14px;
        opacity: 0.6;
        color:#fff;
      }
      .navbar-icon {
        font-size:16px;
        color:#fff;
        margin: 0 6px;
        float: left;
      }
    }
	}
</style>
