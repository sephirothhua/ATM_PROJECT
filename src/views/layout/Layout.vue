<template>
	<div class="app-wrapper clearfix">
    <navbar></navbar>
		<div class="main-container">
      <sidebar class="sidebar-container"></sidebar>
			<app-main></app-main>
		</div>
	</div>
</template>

<script>
import Navbar from './Navbar'
import Sidebar from './Sidebar'
import AppMain from './AppMain'

export default {
  name: 'layout',
  components: {
    Navbar,
    Sidebar,
    AppMain
  },
  computed: {
    sidebar () {
      return true
    }
  }
}
</script>

<style lang="less" scoped>
	.app-wrapper {
		position: relative;
		height: 100%;
		width: 100%;
		.sidebar-container {
			width: 140px;
			height: 100%;
			position: fixed;
      margin-top: 60px;
			top: 0;
			bottom: 0;
			left: 0;
			z-index: 1001;
      overflow-y: auto;
      background: #eef1f6;
 		}
		.app-main {
			width: calc(100% - 140px);
			position: fixed;
			top: 60px;
			bottom: 0;
			left: 140px;
			z-index: 1001;
      overflow-y: auto;
		}
	}
</style>
