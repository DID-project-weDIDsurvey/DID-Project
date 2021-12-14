<template>
    <v-sheet>
        <v-container>
            <!-- 탭 제목 영역 -->
            <v-toolbar elevation="3" color="white">
                <!-- 화면이 클 때 -->
                <v-tabs
                    class="hidden-xs-only"
                    v-model="tab"
                    align-with-title
                    center-active
                >
                    <v-tabs-slider color="deep-purple accent-3"></v-tabs-slider>
                    <!-- tap value = 0 -->
                    <v-tab class="font-weight-bold">
                        <v-icon class="mr-2">mdi-account-box</v-icon>
                        개인정보
                    </v-tab>
                    <!-- tap value = 1 -->
                    <v-tab class="font-weight-bold">
                        <v-icon class="mr-2">mdi-tag</v-icon>
                        쿠폰함</v-tab
                    >
                </v-tabs>
                <!-- 화면이 작을 때 -->
                <v-tabs class="hidden-sm-and-up" v-model="tab" grow>
                    <v-tabs-slider color="primary"></v-tabs-slider>
                    <!-- tap value = 0 -->
                    <v-tab class="font-weight-bold">
                        <v-icon class="mr-2">mdi-account-box</v-icon>
                        개인정보
                    </v-tab>
                    <!-- tap value = -->
                    <v-tab class="font-weight-bold">
                        <v-icon class="mr-2">mdi-tag</v-icon>
                        쿠폰함</v-tab
                    >
                </v-tabs>
            </v-toolbar>
            <!-- 탭 컨텐츠 영역 -->
            <v-card elevation="3" max-height="650px" height="600px">
                <v-tabs-items v-model="tab">
                    <!-- tap value = 0, 개인정보 탭 일 때 -->
                    <v-tab-item>
                        <v-row>
                            <v-col col="6" class="mt-16 mx-5">
                                <div
                                    class="text-h5 text--primary d-flex justify-center pb-5 mb-5 vc"
                                >
                                    나의 VC
                                </div>
                                <v-row>
                                    <v-col
                                        v-for="(vc, i) in vcs"
                                        :key="i"
                                        col="2"
                                    >
                                        <v-card
                                            class="mx-auto py-2 px-1 rounded-xl"
                                            max-height="120"
                                            width="150"
                                        >
                                            <v-card-text>
                                                <v-row>
                                                    <v-col
                                                        cols="5"
                                                        class="mt-2"
                                                    >
                                                        <v-img
                                                            src="@/assets/img/mypage/user.png"
                                                            width="40"
                                                        ></v-img>
                                                    </v-col>
                                                    <v-col
                                                        cols="7"
                                                        class="mt-2"
                                                    >
                                                        <p
                                                            class="text--primary"
                                                            style="font-size:0.8rem"
                                                        >
                                                            {{ vc }}
                                                        </p>
                                                        <p
                                                            class="text--primary"
                                                            style="font-size:0.5rem"
                                                        >
                                                            {{ issuer[i] }}
                                                        </p>
                                                    </v-col>
                                                </v-row>
                                            </v-card-text>
                                        </v-card>
                                    </v-col>
                                </v-row>
                            </v-col>
                            <v-col cols="6" class="px-12 py-5 mt-5">
                                <v-container>
                                    <v-row dense>
                                        <v-col cols="12" class="pt-6">
                                            <v-row>
                                                <v-col cols="6">
                                                    <v-card-title
                                                        class="text-h5"
                                                    >
                                                        나의 보상
                                                    </v-card-title></v-col
                                                >
                                                <v-col
                                                    cols="6"
                                                    class="d-flex justify-end"
                                                    ><v-btn color="#FEF9EF"
                                                        >적립금 신청</v-btn
                                                    ></v-col
                                                >
                                            </v-row>
                                            <v-progress-linear
                                                color="deep-purple accent-3"
                                                rounded
                                                value="100"
                                                class="pb-5"
                                            ></v-progress-linear>
                                            <v-card-subtitle class="text-h5">
                                                <v-icon
                                                    x-large
                                                    color="deep-purple accent-3"
                                                >
                                                    mdi-file-powerpoint-box
                                                </v-icon>
                                                {{ user[0].user_point }} 포인트
                                                <v-icon
                                                    x-large
                                                    color="deep-purple accent-3"
                                                >
                                                    mdi-tag-multiple
                                                </v-icon>
                                                {{ user[0].user_coupon }}
                                                쿠폰</v-card-subtitle
                                            >
                                            <v-progress-linear
                                                color="deep-purple accent-3"
                                                rounded
                                                value="100"
                                                class="py-5"
                                            ></v-progress-linear>
                                        </v-col>
                                        <v-col cols="6">
                                            <v-card
                                                color="#FFB085"
                                                height="150px"
                                            >
                                                <v-card-title class="text-h5">
                                                    참여완료한 설문
                                                </v-card-title>
                                                <v-card-subtitle class="text-h4"
                                                    ><span
                                                        class="deep-purple--text font-weight-bold"
                                                        >22</span
                                                    >개</v-card-subtitle
                                                >
                                                <Icon />
                                            </v-card>
                                        </v-col>

                                        <v-col cols="6">
                                            <v-card
                                                color="#FEF9EF"
                                                height="150px"
                                            >
                                                <v-card-title class="text-h5">
                                                    참여가능한 설문
                                                </v-card-title>
                                                <v-card-subtitle class="text-h4"
                                                    ><span
                                                        class="deep-purple--text font-weight-bold"
                                                        >2</span
                                                    >개</v-card-subtitle
                                                >
                                                <v-card-actions>
                                                    <v-btn>
                                                        지금 하러가기
                                                    </v-btn>
                                                </v-card-actions>
                                            </v-card>
                                        </v-col>
                                        <v-col cols="6">
                                            <v-card
                                                color="#FEF9EF"
                                                height="150px"
                                            >
                                                <v-card-title class="text-h5">
                                                    찜한 설문
                                                </v-card-title>
                                                <v-card-subtitle class="text-h4"
                                                    ><span
                                                        class="deep-purple--text font-weight-bold"
                                                        >{{
                                                            this.$store.state
                                                                .reservedSurvey
                                                                .length
                                                        }}</span
                                                    >개</v-card-subtitle
                                                >
                                                <v-card-actions>
                                                    <v-btn
                                                        @click="
                                                            reservedModalOpen()
                                                        "
                                                    >
                                                        지금 하러가기
                                                    </v-btn>
                                                </v-card-actions>
                                            </v-card>
                                        </v-col>
                                        <v-col cols="6">
                                            <v-card
                                                color="#FEE440"
                                                height="150px"
                                            >
                                                <v-card-title class="text-h5">
                                                    보유한 VC
                                                </v-card-title>
                                                <v-card-subtitle class="text-h4"
                                                    ><span
                                                        class="deep-purple--text font-weight-bold"
                                                        >10</span
                                                    >개</v-card-subtitle
                                                >
                                            </v-card>
                                        </v-col>
                                    </v-row>
                                </v-container>
                            </v-col>
                        </v-row>
                    </v-tab-item>
                    <!-- tap value = 1, 쿠폰 탭일 때 -->
                    <v-tab-item class="pt-10">
                        <span class="ma-10 text-h6"
                            >현재, 미사용 쿠폰
                            <span class="red--text font-weight-bold">4</span
                            >개가 있어요!</span
                        >

                        <v-row class="mt-13">
                            <v-col
                                class="testLine ma-10 pa-0 text--center"
                                cols="2"
                                v-for="card in cards"
                                :key="card.goods_id"
                            >
                                <v-card
                                    width="200"
                                    height="310"
                                    @click="showCode(card.goods_name)"
                                >
                                    <v-img
                                        class="white--text align-end"
                                        height="200"
                                        :src="
                                            require(`@/assets/img/trade/${card.goods_image_path}`)
                                        "
                                    >
                                    </v-img>

                                    <v-card-subtitle class="pb-0 text-center">
                                        {{ card.goods_issuer }}
                                    </v-card-subtitle>
                                    <v-card-subtitle
                                        class="pt-0 pb-0 black--text font-weight-bold text-center"
                                    >
                                        {{ card.goods_name }}
                                    </v-card-subtitle>
                                    <v-divider></v-divider>
                                    <v-card-text
                                        class="pt-1 pb-1 text--primary text-center"
                                    >
                                        유효기간 <br />{{
                                            card.goods_valid.slice(0, 10)
                                        }}
                                    </v-card-text>
                                </v-card>
                            </v-col>
                        </v-row>

                        <MypageModal
                            :dialog="dialog"
                            :qrValue="qrValue"
                            :size="size"
                            :barcodeValue="barcodeValue"
                            :barcodeText="barcodeText"
                            v-if="dialog"
                            @close-modal="dialog = false"
                        />
                    </v-tab-item>
                </v-tabs-items>
            </v-card>
            <ReservedSurveyModal
                :modalOpen="modalOpen"
                @close-modal="modalOpen = false"
            />
        </v-container>
    </v-sheet>
</template>
<script>
import { Icon } from '@iconify/vue2'
import MypageModal from '@/components/mypage/Modal.vue'
import ReservedSurveyModal from '@/components/mypage/ReservedSurveyModal.vue'

export default {
    components: { Icon, MypageModal, ReservedSurveyModal },
    data() {
        return {
            // goods:[],
            // icon: 'mdi-tag',
            tab: null,
            cards: [],
            items: ['Appetizers', 'Entrees', 'Deserts', 'Cocktails'],
            user: [],
            vcs: [],
            issuer: [
                '행정안전부',
                '행정안전부',
                '행정안전부',
                '무신사',
                '무신사',
                '무신사',
                '국민건강보험',
                '국민건강보험',
                '국민건강보험'
            ],
            dialog: false,
            qrValue: '',
            size: 130,
            barcodeValue: '',
            barcodeText: '',
            modalOpen: false,
            decryptVc: {}
        }
    },
    created() {
        this.showUserGoods()
        this.getUser()
        this.setting()
    },

    methods: {
        async getUser() {
            var result = await this.$api('/user', 'post', {
                param: this.$store.state.web3.coinbase
            })
            this.user = result
        },

        async showUserGoods() {
            var result = await this.$api('/userGoods', 'get')

            for (var item of result) {
                if (item.user_goods_amount !== 0) {
                    if (this.cards.length < 5) {
                        this.cards.push(item)
                    }
                }
            }
        },
        showCode(name) {
            console.log(this.decryptVc)
            this.dialog = true
            this.qrValue = name
            this.barcodeValue = 'goods_name'
            var spacer = ' '
            var number = String(Math.floor(Math.random() * 10 ** 13))
            this.barcodeText = [
                number.slice(0, 1),
                spacer,
                number.slice(1, 7),
                spacer,
                number.slice(7, 12)
            ].join('')
        },

        // Local Storage에서 암호화 VC 파일을 불러서 복호화 한다
        async setting() {
            var vcs = this.$store.state.decryptVc
            for (var i = 0; i < vcs.verifiableCredentials.data.length; i++) {
                const vcItem =
                    vcs.verifiableCredentials.data[i].credentialSubject
                        .infomation.value

                var key = Object.keys(vcItem)[0]
                switch (key) {
                    case 'name':
                        key = '이름'
                        break
                    case 'age':
                        key = '나이'
                        break
                    case 'address':
                        key = '주소'
                        break
                    case 'onOffline':
                        key = '온오프라인'
                        break
                    case 'amount':
                        key = '구매금액'
                        break
                    case 'product':
                        key = '상품종류'
                        break
                    case 'occupation':
                        key = '직업'
                        break
                    case 'income':
                        key = '소득'
                        break
                    case 'location':
                        key = '직장위치'
                        break
                }
                this.vcs.push(key)
            }
        },
        reservedModalOpen() {
            this.modalOpen = true
        }
    }
}
</script>
<style scoped></style>
<style scoped>
svg {
    font-size: 2rem;
    line-height: 1em;
}

.image {
    position: absolute;
    right: 57%;
}

.vc {
    position: relative;
}
.vc:after {
    content: '';
    display: block;
    width: 100%;
    height: 4px;
    position: absolute;
    bottom: 0px;
    left: 1px;
    background: #651fff;
}
</style>
