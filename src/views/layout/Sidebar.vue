<template>
  <el-menu class="sidebar-nav" :default-active="$route.path" unique-opened :show-timeout="100">
    <template v-for="(route, index) in menu_list">
      <el-submenu v-if="route.children.length > 1 && !route.meta.unfold" :key="index" :index="route.redirect">
        <template slot="title">
          <i class="iconfont" v-html="route.icon"></i>
          <span class="nav-title">{{route.title}}</span>
        </template>
        <el-menu-item-group>
          <template v-for="(child, index) in route.children">
            <router-link v-if="!child.hidden" :to="route.path + '/' + child.path" :key="index">
              <el-menu-item :index="route.path + '/' + child.path">
                <span slot="title" class="nav-title">{{child.title}}</span>
              </el-menu-item>
            </router-link>
          </template>
        </el-menu-item-group>
      </el-submenu>
      <router-link v-else :to="route.path" :key="index">
        <el-menu-item :index="route.redirect">
          <i class="iconfont" v-html="route.icon"></i>
          <span slot="title" class="nav-title">{{route.title}}</span>
        </el-menu-item>
      </router-link>
    </template>
  </el-menu>
</template>


<script>
import { mapGetters } from 'vuex'

export default {
  data () {
    return {
    }
  },
  mounted () {
  },
  methods: {
  },
  computed: {
    ...mapGetters([
      'menu_list'
    ])
  }
}
</script>

<style lang="less">
</style>
