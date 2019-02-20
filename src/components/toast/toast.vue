<template>
  <transition name="demo">
    <div class="toast" v-show="theToast">
      {{msg}}
    </div>
  </transition>
</template>

<script>
  export default {
    data () {
      return {
        theToast: false,
        msg: ''
      }
    }
  }
</script>

<style lang="less" scoped>
  .toast {
    opacity: 0.6;
    position: fixed;
    top: 45%;
    left: 50%;
    margin-left: -7vw;
    padding: 2vw;
    width: 15vw;
    font-size: 1.5vw;
    color: #fff;
    text-align: center;
    background-color: #466be7;
    border-radius: 5vw;
    z-index: 9999;
  }

  .demo-enter-active,
  .demo-leave-active {
    transition: 0.3s ease-out;
  }

  .demo-enter {
    opacity: 0;
    transform: scale(1.2);
  }

  .demo-leave-to {
    opacity: 0;
    transform: scale(0.8);
  }
</style>
