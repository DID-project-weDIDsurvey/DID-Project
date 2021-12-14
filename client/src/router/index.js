import Vue from 'vue'
import VueRouter from 'vue-router'

import Home from '../views/Main.vue'
import Possible from '../views/Possible.vue'
import Survey from '../views/Survey.vue'
import Trade from '../views/Trade.vue'
import Company from '../views/Company.vue'
import Encrypt from '../views/Encrypt.vue'
import MyPage from '../views/MyPage.vue'
import About from '../views/About.vue'
import DefaultLayout from '../layouts/default/Index'
import Test from '@/views/Test'
Vue.use(VueRouter)

const routes = [
    {
        path: '/',
        name: 'Main',
        component: Home
    },
    {
        path: '/',
        component: DefaultLayout,
        children: [
            {
                path: '/test',
                component: Test
            },
            {
                path: '/possible',
                name: '설문조사 참여 페이지',
                component: Possible
            },
            {
                path: '/survey',
                name: 'Survey',
                component: Survey
            },
            {
                path: '/trade',
                name: 'Trade',
                component: Trade
            },
            {
                path: '/encrypt',
                name: 'Encrypt',
                component: Encrypt
            },
            {
                path: '/mypage',
                name: 'MyPage',
                component: MyPage
            },

            {
                path: '/company',
                name: 'Company',
                component: Company
            },
            {
                path: '/about',
                name: 'About',
                component: About
            }
        ]
    }
]
const router = new VueRouter({
    mode: 'history',
    base: process.env.BASE_URL,
    routes
})

export default router
