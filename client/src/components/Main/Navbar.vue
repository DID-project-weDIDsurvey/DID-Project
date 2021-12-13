<template>
    <!-- 메인 navbar -->
    <div>
        <v-app-bar elevation="0" color="transparent" class="mt-3">
            <router-link class="text-decoration-none" to="/">
                <v-toolbar-title class="font-weight-bold white--text">
                    {{ title }}
                </v-toolbar-title>
            </router-link>
            <v-spacer></v-spacer>

            <!-- 네비바 오른쪽 부분 2 : 화면이 클 때 -->
            <v-toolbar-items class="hidden-xs-only">
                <span
                    to="mypage"
                    text
                    class="py-2 mr-2 mt-1 white--text"
                    v-if="this.loginStatus == true"
                >
                    <v-avatar class="avatar" size="40">
                        <img src="@/assets/img/profile.jpg" alt="John" />
                    </v-avatar>
                    <v-chip
                        class="address pl-7 pr-4 pt-2"
                        color="#Fee440"
                        style="color:black;font-weight:bold"
                    >
                        {{
                            `${this.$store.state.web3.coinbase.substr(
                                0,
                                6
                            )}  ...
                                ${this.$store.state.web3.coinbase.substr(
                                    38,
                                    41
                                )}`
                        }}
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
    name: 'DefaultBar',
    computed: {
        loginStatus() {
            return this.$store.state.loginStatus
        }
    },
    data() {
        return {
            title: 'weDIDsurvey',
            decryptVc: []
        }
    },
    methods: {
        async login() {
            console.log('login click')
            await this.$store.dispatch('registerWeb3')
            this.$store.commit('loginStatus', true)
            this.decrypt()
        },
        logout() {
            console.log('logout click')
            this.$store.commit('loginStatus', false)
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
<style>
.avatar {
    position: fixed;
    left: 1.2rem;
    bottom: 0.01rem;
    z-index: 1;
    border: 4px solid #ffd233;
}
</style>
