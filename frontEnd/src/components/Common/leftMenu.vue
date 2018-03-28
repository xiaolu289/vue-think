<template>
  <div>
    <el-menu ref="menu" mode="vertical" class="el-menu-vertical-demo" 
      router 
      background-color="#324057"
      :default-active="defaultActive"
      text-color="#fff"
      active-text-color="#e4ba55"
      @open="handleOpen">
      <el-submenu v-for="menu in menuData" :key="menu.id" :index="menu.id.toString()">
        <template slot="title">
          <i class="el-icon-menu"></i>
          <span>{{menu.title}}</span>
        </template>
        <el-menu-item-group>
          <el-menu-item v-for="item in menu.child" :key="item.id" :index="item.url">{{item.title}}</el-menu-item>
        </el-menu-item-group>
      </el-submenu>
    </el-menu>
  </div>
</template>

<script>
import _g from '@/assets/js/global'

export default {
  props: ['menuData', 'menu'],
  data() {
    const path = this.defaultOpends()
    return {
      actived: '54',
      defaultActive: path
    }
  },
  methods: {
    findMenuByUrl (menus, pathModule) {
      // 非递归方案
      const queue = [...menus]
      let i = 0
      while (i < queue.length) {
        const item = queue[i]
        if (item.url.indexOf(pathModule) !== -1) {
          return item.url
        } else if (item.child) {
          queue.push(...item.child)
        }
        i++
      }
    },
    defaultOpends() {
      const pathsArr = this.$route.path.split('/')
      const pathModule = ['', pathsArr[1], pathsArr[2]].join('/')
      const url = this.findMenuByUrl(this.$store.state.menus, pathModule)
      console.log(url)
      return url
    },
    handleOpen(index, indexPath) {

    }
  },
  watch: {
    '$route' (to, from) {
      this.defaultActive = this.defaultOpends()
    }
  }
}
</script>