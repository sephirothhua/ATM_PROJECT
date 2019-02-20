<template>
    
</template>

<script>
    export default {
      created(){
        this.getParams()
      },
      methods :{getParams(){
          // 取到路由带过来的参数
          const routerParams = this.$route.query.mallCode
          // 将数据放在当前组件的数据内
          this.mallInfo.searchMap.mallCode = routerParams;
          this.keyupMallName()
        }
      },

    }
</script>

<style scoped>

</style>