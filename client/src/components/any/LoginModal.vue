<template>
    <div>
        <v-dialog v-model="dialog" max-width="340">
            <v-card>
                <img
                    class="metamaskCenter"
                    width="50"
                    src="@/assets/img/metamask.svg"
                />
                <br />
                <br />
                <v-card-text class="text-h6 text-center">
                    지갑 연결 후 맞춤 설문 <br />확인이 가능합니다.
                </v-card-text>

                <v-card-actions>
                    <v-spacer></v-spacer>

                    <v-btn
                        color="blue darken-1"
                        text
                        @click=";[connectMask(), (dialog = false)]"
                    >
                        지갑 연결하기
                    </v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
    </div>
</template>
<script>
export default {
    name: '',
    components: {},
    data() {
        return {
            sampleData: ''
        }
    },
    setup() {},
    created() {},
    mounted() {},
    unmounted() {},
    methods: {
        async connectMask() {
            if (this.loginStatus === false) {
                await this.$store.dispatch('registerWeb3')

                this.$store.commit('loginStatus', true)
            }
        }
    }
}
</script>
