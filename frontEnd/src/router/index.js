// 依赖
import Vue from 'vue'
import VueRouter from 'vue-router'
import store from '@/vuex/store.js'
import NProgress from 'nprogress'
import 'nprogress/nprogress.css'
import baseHttp from '@/assets/js/base_http.js'
import Lockr from 'lockr'
import config from '@/assets/js/config.js'
import _g from '@/assets/js/global.js'
// 组件
import Login from '@/components/Account/Login.vue'
import refresh from '@/components/refresh.vue'
import Home from '@/components/Home.vue'
import menuList from '@/components/Admin/system/menu/list.vue'
import menuAdd from '@/components/Admin/system/menu/add.vue'
import menuEdit from '@/components/Admin/system/menu/edit.vue'
import systemConfig from '@/components/Admin/system/config/add.vue'
import ruleList from '@/components/Admin/system/rule/list.vue'
import ruleAdd from '@/components/Admin/system/rule/add.vue'
import ruleEdit from '@/components/Admin/system/rule/edit.vue'
import positionList from '@/components/Admin/structures/position/list.vue'
import positionAdd from '@/components/Admin/structures/position/add.vue'
import positionEdit from '@/components/Admin/structures/position/edit.vue'
import structuresList from '@/components/Admin/structures/structures/list.vue'
import structuresAdd from '@/components/Admin/structures/structures/add.vue'
import structuresEdit from '@/components/Admin/structures/structures/edit.vue'
import groupsList from '@/components/Admin/structures/groups/list.vue'
import groupsAdd from '@/components/Admin/structures/groups/add.vue'
import groupsEdit from '@/components/Admin/structures/groups/edit.vue'
import usersList from '@/components/Admin/personnel/users/list.vue'
import usersAdd from '@/components/Admin/personnel/users/add.vue'
import usersEdit from '@/components/Admin/personnel/users/edit.vue'
import mailList from '@/components/Busi/mail/mail/list.vue'
import mailAdd from '@/components/Busi/mail/mail/add.vue'
import mailEdit from '@/components/Busi/mail/mail/edit.vue'

Vue.use(VueRouter)

/**
 * meta参数解析
 * hideLeft: 是否隐藏左侧菜单，单页菜单为true
 * module: 菜单所属模块
 * menu: 所属菜单，用于判断三级菜单是否显示高亮，如菜单列表、添加菜单、编辑菜单都是'menu'，用户列表、添加用户、编辑用户都是'user'，如此类推
 */

const routes = [
  { path: '/', component: Login, name: 'Login' },
  {
    path: '/admin',
    component: Home,
    children: [
      { path: '/refresh', component: refresh, name: 'refresh' }
    ]
  },
  {
    path: '/admin',
    component: Home,
    children: [
      { path: 'menu/list', component: menuList, name: 'menuList', meta: { hideLeft: false, module: 'Admin', menu: 'menu' }},
      { path: 'menu/add', component: menuAdd, name: 'menuAdd', meta: { hideLeft: false, module: 'Admin', menu: 'menu' }},
      { path: 'menu/edit/:id', component: menuEdit, name: 'menuEdit', meta: { hideLeft: false, module: 'Admin', menu: 'menu' }}
    ]
  },
  {
    path: '/admin',
    component: Home,
    children: [
      { path: 'config/add', component: systemConfig, name: 'systemConfig', meta: { hideLeft: false, module: 'Admin', menu: 'systemConfig' }}
    ]
  },

  {
    path: '/admin',
    component: Home,
    children: [
      { path: 'rule/list', component: ruleList, name: 'ruleList', meta: { hideLeft: false, module: 'Admin', menu: 'rule' }},
      { path: 'rule/add', component: ruleAdd, name: 'ruleAdd', meta: { hideLeft: false, module: 'Admin', menu: 'rule' }},
      { path: 'rule/edit/:id', component: ruleEdit, name: 'ruleEdit', meta: { hideLeft: false, module: 'Admin', menu: 'rule' }}
    ]
  },
  {
    path: '/admin',
    component: Home,
    children: [
      { path: 'position/list', component: positionList, name: 'positionList', meta: { hideLeft: false, module: 'Admin', menu: 'position' }},
      { path: 'position/add', component: positionAdd, name: 'positionAdd', meta: { hideLeft: false, module: 'Admin', menu: 'position' }},
      { path: 'position/edit/:id', component: positionEdit, name: 'positionEdit', meta: { hideLeft: false, module: 'Admin', menu: 'position' }}
    ]
  },
  {
    path: '/admin',
    component: Home,
    children: [
      { path: 'structures/list', component: structuresList, name: 'structuresList', meta: { hideLeft: false, module: 'Admin', menu: 'structures' }},
      { path: 'structures/add', component: structuresAdd, name: 'structuresAdd', meta: { hideLeft: false, module: 'Admin', menu: 'structures' }},
      { path: 'structures/edit/:id', component: structuresEdit, name: 'structuresEdit', meta: { hideLeft: false, module: 'Admin', menu: 'structures' }}
    ]
  },
  {
    path: '/admin',
    component: Home,
    children: [
      { path: 'groups/list', component: groupsList, name: 'groupsList', meta: { hideLeft: false, module: 'Admin', menu: 'groups' }},
      { path: 'groups/add', component: groupsAdd, name: 'groupsAdd', meta: { hideLeft: false, module: 'Admin', menu: 'groups' }},
      { path: 'groups/edit/:id', component: groupsEdit, name: 'groupsEdit', meta: { hideLeft: false, module: 'Admin', menu: 'groups' }}
    ]
  },
  {
    path: '/admin',
    component: Home,
    children: [
      { path: 'users/list', component: usersList, name: 'usersList', meta: { hideLeft: false, module: 'Admin', menu: 'users' }},
      { path: 'users/add', component: usersAdd, name: 'usersAdd', meta: { hideLeft: false, module: 'Admin', menu: 'users' }},
      { path: 'users/edit/:id', component: usersEdit, name: 'usersEdit', meta: { hideLeft: false, module: 'Admin', menu: 'users' }}
    ]
  },
  {
    path: '/busi',
    component: Home,
    children: [
      { path: 'mail/list', component: mailList, name: 'mailList', meta: { hideLeft: false, module: 'Busi', menu: 'mail' }},
      { path: 'mail/add', component: mailAdd, name: 'mailAdd', meta: { hideLeft: false, module: 'Busi', menu: 'mail' }},
      { path: 'mail/edit/:id', component: mailEdit, name: 'mailEdit', meta: { hideLeft: false, module: 'Busi', menu: 'mail' }}
    ]
  }
]

const router = new VueRouter({
  mode: 'history',
  base: __dirname,
  routes
})
router.beforeEach(async(to, from, next) => {
  const hideLeft = to.meta.hideLeft
  store.dispatch('showLeftMenu', hideLeft)
  // 如果跳转去登录页
  if (to.name !== 'Login') {
    const expire = Lockr.get('expire')
    const advanceTime = config.advanceTime
    const nowTime = Math.floor(new Date().getTime() / 1000)
    const infos = baseHttp.apiPost('admin/infos/index')
    const quees = [infos]
    // if (nowTime >= (expire - advanceTime)) {
    const refresh = baseHttp.apiPost('admin/infos/refresh') // 获取新token
    quees.push(refresh)
    // }
    const result = await Promise.all(quees)
    // 如果请求多于1个（获取用户信息）
    if (result.length >= 1) {
      if (result[0].code === 200) {
        const data = result[0].data
        store.dispatch('setMenus', data.menusList)      // 菜单信息
        store.dispatch('setRules', data.authList)       // 权限信息
        store.dispatch('setUsers', data.userInfo)       // 用户信息
      } else {
        _g.toastMsg('warning', '请重新登录')
        setTimeout(() => {
          router.replace('/')
        }, 1500)
        return
      }
    };
    // 如果请求多于2个(获取用户信息，刷新token)
    if (result.length >= 2) {
      if (result[0].code === 200) {
        const data = result[1].data
        Lockr.set('authKey', data.authKey)              // 权限认证
        Lockr.set('expire', data.expire)              // 权限认证
      } else {
        _g.toastMsg('warning', '请重新登录')
        setTimeout(() => {
          router.replace('/')
        }, 1500)
        return
      }
    }
  }
  NProgress.start()
  next()
})

router.afterEach(transition => {
  NProgress.done()
})

export default router

