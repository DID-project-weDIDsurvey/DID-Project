<template>
    <!-- 지갑 연결 전 참여가능한 설문 버튼 누르면 modal창 뜬다 -->
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
</template>
<script>
export default {
    name: 'PossibleModal',
    components: {},
    data() {
        return {
            dialog: false
        }
    },
    setup() {},
    created() {},
    mounted() {},
    unmounted() {},
    methods: {}
}
</script>
<style>
.metamaskCenter {
    position: absolute;
    left: 42%;
}
</style>
