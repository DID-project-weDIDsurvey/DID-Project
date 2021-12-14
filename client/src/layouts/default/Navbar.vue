<template>
    <div>
        <v-tabs height="55">
            <!-- 네비바 왼쪽 타이틀 -->
            <router-link class="text-decoration-none" to="/">
                <v-toolbar-title class="font-weight-bold black--text mt-4 ml-7">
                    {{ title }}
                </v-toolbar-title>
            </router-link>
            <!-- 네비바 중간 채우기 -->
            <v-spacer></v-spacer>
            <!-- 네비바 개인 주소 -->
            <v-chip
                @click="copyAddress"
                class="px-10 mt-3 mr-3"
                color="secondary"
                v-if="this.loginStatus == true"
            >
                {{ truncatedUserAddress }}
            </v-chip>
            <!-- 네비바 메뉴들 -->
            <v-tabs-slider color="hsl(258, 98%, 70%)"> </v-tabs-slider>

            <v-tab
                v-for="(tab, idx) in tabList"
                :key="idx"
                class="black--text text-none font-weight-bold"
                @click="tab.click"
            >
                {{ tab.desc }}
            </v-tab>
        </v-tabs>
    </div>
</template>
<script>
module.exports = {
    name: 'DefaultBar',
    data() {
        return {
            title: 'weDIDsurvey',
            tabList: [
                {
                    name: 'about',
                    desc: 'About',
                    click: () => this.$router.push('about'),
                    isActive: true
                },
                {
                    name: 'company',
                    desc: '설문결과',
                    click: () => this.$router.push('company'),
                    isActive:
                        this.$store.state.web3.coinbase ===
                        0x68993b9454f760e81c8e7630ace72b3638f6f6f7
                },
                {
                    name: 'possible',
                    desc: '설문참여',
                    click: () => this.$router.push('possible'),
                    isActive: true
                },
                {
                    name: 'trade',
                    desc: '쿠폰교환',
                    click: () => this.$router.push('trade'),
                    isActive: true
                },
                {
                    name: 'login',
                    desc: '로그인',
                    click: () => this.login(),
                    isActive: true
                },
                {
                    name: 'mypage',
                    desc: '마이페이지',
                    click: () => this.$router.push('mypage'),
                    isActive: true
                },
                {
                    name: 'logout',
                    desc: '로그아웃',
                    click: () => this.logout(),
                    isActive: true
                }
            ]
        }
    },
    mounted() {
        console.table(this.tabList)
        console.log(this.loginStatus)
    },
    computed: {
        loginStatus() {
            return this.$store.state.loginStatus
        },
        truncatedUserAddress() {
            return (
                this.$store.state.web3.coinbase.slice(0, 2) +
                ' ... ' +
                this.$store.state.web3.coinbase.slice(38, 42)
            )
        }
    },
    methods: {
        async copyAddress() {
            try {
                const userAddress = this.$store.state.web3.coinbase
                await navigator.clipboard.writeText(userAddress)
            } catch (err) {}
        },
        async login() {
            await this.$store.dispatch('registerWeb3')
            this.$store.commit('loginStatus', true)
        },
        logout() {
            this.$store.commit('loginStatus', false)
        }
    }
}
</script>
<style scoped></style>
