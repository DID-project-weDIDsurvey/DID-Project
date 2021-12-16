<template>
    <div>
        <!-- 메인 네비게이션 바 -->
        <v-app-bar elevation="0" color="transparent">
            <!-- 네비바 왼쪽 로고 -->
            <router-link class="text-decoration-none" to="/">
                <v-toolbar-title class="font-weight-bold white--text ml-4">
                    {{ title }}
                </v-toolbar-title>
            </router-link>
            <!-- 네비바 중간 채우기 -->
            <v-spacer></v-spacer>

            <v-toolbar-items>
                <span
                    to="mypage"
                    text
                    class="py-2 mr-2 mt-1 white--text"
                    v-if="this.loginStatus == true"
                >
                    <v-chip
                        @click="copyAddress"
                        class="px-10 mt-3 mr-3"
                        color="white"
                        v-if="this.loginStatus == true"
                    >
                        {{ truncatedUserAddress }}
                    </v-chip>
                </span>
                <v-btn to="about" text class="white--text text-none">
                    About
                </v-btn>
                <v-btn
                    to="company"
                    text
                    plain="false"
                    class="white--text"
                    v-if="
                        this.$store.state.web3.coinbase ==
                            0x68993b9454f760e81c8e7630ace72b3638f6f6f7f
                    "
                >
                    설문결과
                </v-btn>
                <v-btn to="possible" text class="white--text">
                    설문참여
                </v-btn>
                <v-btn to="trade" text class="white--text">
                    쿠폰교환
                </v-btn>
                <v-btn
                    text
                    class="white--text"
                    @click="login()"
                    v-if="this.loginStatus == false"
                >
                    지갑연결
                </v-btn>

                <v-btn
                    to="mypage"
                    text
                    class="white--text"
                    v-if="this.loginStatus == true"
                >
                    마이페이지
                </v-btn>

                <v-btn
                    text
                    class="white--text"
                    @click="logout()"
                    v-if="this.loginStatus == true"
                >
                    로그아웃
                </v-btn>
            </v-toolbar-items>
        </v-app-bar>
    </div>
</template>

<script>
module.exports = {
    name: 'MainNavBar',

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
            ],
            decryptedVC: null
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

            this.tabList[4].isActive = !this.tabList[4].isActive
            this.tabList[5].isActive = !this.tabList[5].isActive
            this.tabList[6].isActive = !this.tabList[6].isActive
        },
        // 메타마스크 로그아웃
        logout() {
            this.$store.commit('loginStatus', false)
            this.tabList[4].isActive = !this.tabList[4].isActive
            this.tabList[5].isActive = !this.tabList[5].isActive
            this.tabList[6].isActive = !this.tabList[6].isActive
        },

        // Local Storage에서 암호화 VC 파일을 불러서 복호화 한다
        async decrypt() {
            this.decryptVc = await window.ethereum.request({
                method: 'eth_decrypt',
                params: [
                    localStorage.getItem('intoVp'),
                    this.$store.state.web3.coinbase
                ]
            })

            // 복호화된 string VC를 다시 Json object로 바꾼다
            this.vc = JSON.parse(this.decryptVc)
            // 복호화 VC를 store에 저장
            this.$store.commit('addDecryptVc', this.vc)
            this.getVC()
        }
    }
}
</script>
