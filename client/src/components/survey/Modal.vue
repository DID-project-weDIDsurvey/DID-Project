<template>
    <v-app>
        <v-row justify="center">
            <v-dialog v-model="this.dialog" persistent max-width="450">
                <v-card>
                    <v-toolbar color="hsl(258, 98%, 70%)" dark>
                        VP를 추가 공개해 보실래요?</v-toolbar
                    >
                    <v-card-text>
                        <v-chip-group
                            v-model="selection"
                            active-class="deep-purple accent-4 white--text"
                            column
                            multiple
                            class="pt-5"
                        >
                            <div v-for="(aa, i) in aa" :key="i">
                                <v-chip large filter
                                    >{{ aa.item }}<br />{{ aa.price }}원</v-chip
                                >
                            </div>
                        </v-chip-group>
                        <p></p>
                        <p>
                            * 위 항목 선택시 조사업체에 설문 기간동안 VP 제공에
                            동의한 것으로 간주합니다.
                        </p>
                    </v-card-text>

                    <v-card-actions>
                        <v-spacer></v-spacer>

                        <v-btn
                            color="#F04A27"
                            dark
                            @click="$emit('next-modal')"
                        >
                            비동의
                        </v-btn>

                        <v-btn
                            color="#599CF7"
                            dark
                            @click="
                                ;[$emit('next-modal'), createVP(), vpPoint()]
                            "
                        >
                            동의
                        </v-btn>
                    </v-card-actions>
                </v-card>
            </v-dialog>
            <v-dialog v-model="this.dialog2" persistent max-width="450">
                <v-card>
                    <v-toolbar color="hsl(258, 98%, 70%)" dark></v-toolbar>
                    <v-sheet class="d-flex justify-center pt-6">
                        <v-card
                            width="150"
                            elevation="3"
                            class="mx-auto element-center pb-5"
                            max-width="150"
                        >
                            <v-img height="150" src="@/assets/img/point.png">
                                <v-app-bar
                                    flat="flat"
                                    color="rgba(0, 0, 0, 0) "
                                ></v-app-bar>
                            </v-img>
                            <!--텍스트부분-->
                            <v-card-text>
                                <div class="text--primary">
                                    + {{ price }} 포인트
                                </div>
                                <p style="height:4em">
                                    내가 받는 총 보상 {{ point + price }} 포인트
                                </p>
                            </v-card-text>
                            <router-link
                                class="text-decoration-none"
                                to="/mypage"
                            >
                                <v-btn
                                    color="#599CF7"
                                    dark="dark"
                                    small="small"
                                    @click="
                                        ;[$emit('close-modal'), saveReward()]
                                    "
                                >
                                    포인트 받기
                                </v-btn>
                            </router-link>
                        </v-card>
                        <v-card
                            width="150"
                            elevation="3"
                            class="mx-auto element-center pb-5"
                            max-width="150"
                        >
                            <v-img
                                height="150"
                                src="@/assets/img/bucks-cafe.png"
                            >
                                <v-app-bar
                                    flat="flat"
                                    color="rgba(0, 0, 0, 0) "
                                ></v-app-bar>
                            </v-img>

                            <!--텍스트부분-->
                            <v-card-text>
                                <div class="text--primary">
                                    + {{ coupon }} 쿠폰
                                </div>
                                <p style="height:4em;">
                                    내가 받는 총 보상 {{ point }} 포인트
                                    <br />
                                    {{ coupon }} 쿠폰
                                </p>
                            </v-card-text>
                            <router-link
                                class="text-decoration-none"
                                to="/trade"
                            >
                                <v-btn
                                    color="#599CF7"
                                    dark="dark"
                                    small="small"
                                    @click="
                                        ;[
                                            $emit('close-modal'),
                                            selectPoint(),
                                            saveReward()
                                        ]
                                    "
                                >
                                    쿠폰 받기
                                </v-btn>
                            </router-link>
                        </v-card>
                    </v-sheet>
                    <v-card-actions>
                        <v-spacer></v-spacer>
                    </v-card-actions>
                </v-card>
            </v-dialog>
        </v-row>
    </v-app>
</template>
<script>
export default {
    name: 'SurveyModal',
    components: {},
    props: [
        'dialog',
        'dialog2',
        'vp',
        'price',
        'coupon',
        'sC',
        'surveyId',
        'companyAccount'
    ],
    data() {
        return {
            aa: [
                {
                    item: '구매금액',
                    price: 500
                },
                {
                    item: '온오프라인',
                    price: 300
                },
                {
                    item: '상품종류',
                    price: 400
                }
            ],
            selection: [],
            selectVp: [],
            point: 0,
            encMsg: null
        }
    },
    setup() {},
    created() {},
    mounted() {},
    unmounted() {},
    methods: {
        // 동의 버튼을 누를시 선택한 VP 생성
        createVP() {
            // 넘겨받은 VP리스트에 선택한 VC가 담긴 VP를 생성
            var stringVp

            // 선택한 vp가 없을때
            if (this.selection.length === 0) {
                this.sC.methods
                    .recordVP(
                        this.surveyId,
                        'no',
                        // 회사 주소
                        '0xb6f945dfafbc1b9f728d8bc3c34d25178d0c6c71'
                    )
                    .send({ from: this.$store.state.web3.coinbase })
                    // 내 주소
                    .then(receipt => {})
                this.encryptedMessage()
            } else {
                // 선택한 vp가 있을 때
                for (var index of this.selection) {
                    this.selectVp.push(this.vp[parseInt(index)])
                }
                for (var het of this.selectVp) {
                    stringVp = stringVp + ',' + Object.keys(het)
                }
                this.sC.methods
                    .recordVP(
                        this.surveyId,
                        stringVp.slice(10),
                        // 회사 주소
                        '0xb6f945dfafbc1b9f728d8bc3c34d25178d0c6c71'
                    )
                    .send({ from: this.$store.state.web3.coinbase })
                    // 내 주소
                    .then(receipt => {})
                this.encryptedMessage()
            }
        },

        // 동의 버튼을 누르면 추가되는 포인트
        vpPoint() {
            for (var index of this.selection) {
                this.point += this.aa[index].price
            }
        },

        // 동의 버튼을 누르고 포인트를 받기를 선택할시에 적립되는 포인트
        selectPoint() {
            this.point += this.price
        },

        // 받기 버튼을 누르면 DB로 포인트와 쿠폰 전달
        async saveReward() {
            this.$api('/reward', 'post', {
                param: {
                    account: this.$store.state.web3.coinbase,
                    point: this.point,
                    coupon: this.coupon
                }
            })
        },

        // 회사 암호화된 공개키로 암호화
        async encryptedMessage() {
            const sigUtil = require('eth-sig-util')
            // eth-sig-util: A small collection of Ethereum signing functions
            const msg = JSON.stringify(this.selectVp)
            await this.sC.methods
                .companyPublic(this.surveyId)
                .call()
                .then(result => {
                    const buf = Buffer.from(
                        JSON.stringify(
                            sigUtil.encrypt(
                                result,
                                { data: msg },
                                'x25519-xsalsa20-poly1305'
                            )
                        ),
                        'utf8'
                    )
                    return (this.encMsg = '0x' + buf.toString('hex'))
                })
            this.$store.commit('encMsg', this.encMsg)
        }
    }
}
</script>

<style lang="css">
.element-center {
    text-align: center;
    margin: 0 auto;
}
</style>
