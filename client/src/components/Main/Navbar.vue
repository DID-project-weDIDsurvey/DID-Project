<template>
    <div>
        <!-- 메인 네비게이션 바 -->
        <v-app-bar elevation="0" color="transparent" height="50">
            <!-- 네비바 왼쪽 타이틀 -->
            <router-link class="text-decoration-none" to="/">
                <v-toolbar-title class="font-weight-bold white--text ml-4">
                    {{ title }}
                </v-toolbar-title>
            </router-link>
            <!-- 네비바 중간 채우기 -->
            <v-spacer></v-spacer>
            <!-- 네비바 개인주소 chip -->
            <v-chip
                @click="copyAddress"
                class="px-10 mr-3"
                color="secondary"
                v-if="this.loginStatus == true"
            >
                {{ truncatedUserAddress }}
            </v-chip>
            <!-- 네비바 메뉴들 -->
            <v-sheet>
                <v-tabs height="50" right>
                    <!-- 네비바 메뉴 슬라이더 -->
                    <v-tabs-slider color="secondary"></v-tabs-slider>
                    <!-- 네비바 메뉴들 -->
                    <v-tab
                        v-for="(tab, idx) in tabList"
                        :key="idx"
                        class="black--text text-none font-weight-bold"
                        @click="tab.click"
                        v-show="tab.isActive"
                    >
                        {{ tab.desc }}
                    </v-tab>
                </v-tabs>
            </v-sheet>
        </v-app-bar>
    </div>
</template>

<script>
module.exports = {
    name: 'MainNavBar',
    data() {
        return {
            decryptVC: null,
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
                    isActive: true
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
                    isActive: false
                },
                {
                    name: 'logout',
                    desc: '로그아웃',
                    click: () => this.logout(),
                    isActive: false
                }
            ]
        }
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
        // 네비게이션 개인주소 chip 클릭 시 주소가 copy
        async copyAddress() {
            try {
                const userAddress = this.$store.state.web3.coinbase
                await navigator.clipboard.writeText(userAddress)
            } catch (err) {}
        },
        // 메타마스크 로그인
        async login() {
            await this.$store.dispatch('registerWeb3')
            this.$store.commit('loginStatus', true)
            this.decrypt()

            // 로그인 시 isActive 변경
            this.tabList[5].isActive = !this.tabList[5].isActive
            this.tabList[6].isActive = !this.tabList[6].isActive
            this.tabList[7].isActive = !this.tabList[7].isActive
        },
        // 메타마스크 로그아웃
        logout() {
            this.$store.commit('loginStatus', false)

            // 로그인 시 isActive 변경
            this.tabList[5].isActive = !this.tabList[5].isActive
            this.tabList[6].isActive = !this.tabList[6].isActive
            this.tabList[7].isActive = !this.tabList[7].isActive
        },
        // Local Storage 내 VC data decript
        async decrypt() {
            await this.$decrypt('intoVp')

            this.getVC()
        }
    }
}
</script>
