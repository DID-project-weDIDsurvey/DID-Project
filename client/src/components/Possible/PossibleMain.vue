<template>
    <v-container fluid class="pa-0">
        <v-row no-gutters>
            <!-- 왼쪽 layout -->
            <v-col
                cols="6"
                md="2"
                class="possible-bg-color"
                style="padding-top:10px"
            >
                <v-row justify="center" class="pa-0">
                    <v-col cols="2" sm="12" md="10" lg="10">
                        <v-sheet elevation="3">
                            <v-sheet
                                class="pa-3  text-left white--text"
                                color="#7b45fd"
                                light
                            >
                                <span>카테고리</span>
                            </v-sheet>
                            <div class="pa-4">
                                <v-chip-group
                                    active-class="pink accent-1"
                                    column
                                >
                                    <v-chip
                                        color="#7b45fd"
                                        class="white--text"
                                        v-for="tag in tags"
                                        :key="tag"
                                        @click="category"
                                    >
                                        {{ tag }}
                                    </v-chip>
                                </v-chip-group>
                            </div>
                        </v-sheet>
                    </v-col>
                </v-row>
            </v-col>
            <!-- 오른쪽 layout -->
            <v-col cols="12" sm="10" ma="4">
                <!-- <v-btn color="purple lighten-1" dark @click="decrypt()">복호화</v-btn> -->

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

                <v-container class="mb-5">
                    <v-bottom-navigation
                        :value="value"
                        color="hsl(258, 98%, 70%)"
                        class="d-flex justify-start"
                    >
                        <v-btn
                            class="ml-10 font-weight-bold text-subtitle-1"
                            @click="getSurvey()"
                        >
                            <span>전체 설문</span>
                        </v-btn>

                        <v-btn
                            class="ml-5 font-weight-bold text-subtitle-1"
                            @click="dialog = true"
                            v-if="this.loginStatus == false"
                        >
                            <span>참여 가능한 설문</span>
                        </v-btn>

                        <v-btn
                            class="ml-5 font-weight-bold text-subtitle-1"
                            @click=";[canSurvey()]"
                            v-else
                        >
                            <span>참여 가능한 설문</span>
                        </v-btn>
                        <div></div>
                    </v-bottom-navigation>
                </v-container>

                <v-container>
                    <v-row>
                        <v-col
                            :key="i"
                            v-for="(d, i) in surveys"
                            sm="12"
                            md="6"
                            lg="3"
                        >
                            <v-card
                                elevation="3"
                                class="mx-auto"
                                max-width="344"
                            >
                                <v-img
                                    :src="
                                        `http://localhost:3000/download/${d.survey_image_path}`
                                    "
                                    height="200px"
                                    @click="showStartModal"
                                ></v-img>

                                <v-card-title>
                                    {{ d.survey_title }}
                                </v-card-title>
                                <v-chip
                                    close-icon="mdi-close-outline"
                                    color="#c3aafe"
                                    fill
                                    outlined
                                    class="black--text pa-0 ml-2"
                                >
                                    <v-card-subtitle
                                        class="text-subtitle-1 font-weight-bold"
                                    >
                                        적립금
                                        {{ d.survey_price }}
                                        | 쿠폰
                                        {{ d.survey_coupon }}
                                    </v-card-subtitle>
                                </v-chip>
                                <v-card-subtitle>
                                    <v-icon v-text="icon"></v-icon>남은 기간

                                    <!-- dDays배열 dday 오브젝트 하나씩 접근해서 for문 돌린다 -->
                                    <span
                                        class="font-weight-bold deep-purple--text ml-1 mr-2"
                                        >D-{{ dDays[i].dday }}</span
                                    >
                                    <br />
                                    <v-icon>mdi-account-circle-outline</v-icon
                                    >참여 현황<span
                                        class="text-caption font-weight-bold deep-purple--text ml-1"
                                        >{{ d.survey_done_number }} /
                                        {{ d.survey_total_number }}</span
                                    >

                                    <br />
                                    <v-icon> mdi-alarm-check </v-icon>소요 시간
                                    <span
                                        class="text-caption font-weight-bold deep-purple--text ml-1"
                                        >약

                                        {{
                                            d.survey_time
                                                .slice(3, 5)
                                                .replace(/(^0+)/, '')
                                        }}분</span
                                    >
                                </v-card-subtitle>

                                <v-card-actions>
                                    <v-btn
                                        color="deep-purple accent-3"
                                        text
                                        @click="d.isShow = !d.isShow"
                                    >
                                        상세 내용
                                    </v-btn>

                                    <v-spacer></v-spacer>

                                    <v-btn icon @click="d.isShow = !d.isShow">
                                        <v-icon>{{
                                            d.isShow
                                                ? 'mdi-chevron-up'
                                                : 'mdi-chevron-down'
                                        }}</v-icon>
                                    </v-btn>
                                </v-card-actions>

                                <v-expand-transition>
                                    <div v-show="d.isShow">
                                        <v-divider></v-divider>
                                        <v-card-text class="text-justify">
                                            {{ d.survey_description }}
                                        </v-card-text>
                                    </div>
                                </v-expand-transition>
                            </v-card>
                        </v-col>
                        <!-- <Navbar /> -->
                    </v-row>
                </v-container>
            </v-col>
        </v-row>
        <SurveyStartModal :surveymodalOfen="surveymodalOfen" @child="parents" />
    </v-container>
</template>

<script>
import SurveyStartModal from './SurveyStartModal.vue'

export default {
    name: 'PossibleMain',
    components: {
        SurveyStartModal
    },
    computed: {
        loginStatus() {
            return this.$store.state.loginStatus
        }
    },
    data() {
        return {
            tags: [
                '쇼핑',
                '문화',
                '자동차',
                '음식',
                '아트',
                '주택',
                '인터넷',
                '전자제품'
            ],
            decryptVc: {},
            conditions: [],
            vcItemList: [],
            passSurveyList: [],
            surveys: [],
            proofSurveys: [],
            dDays: '',
            value: 0,
            icon: 'mdi-calendar-range',
            isShow: false,
            keyList: [],
            web3: {},
            surveyCategory: [],
            surveymodalOfen: false
        }
    },
    created() {
        this.getVC()
        this.getSurvey()
        this.discountDay()
        this.getIsShow()
    },
    mounted() {},
    unmounted() {},
    methods: {
        // 제일 처음 모든 설문지 보여준다
        async getSurvey() {
            this.surveys = await this.$api('/surveys', 'get')
            this.getIsShow()
        },

        // 로그인없이 이 페이지에 들어온 경우, 참여가능한설문 버튼 누르면 메타마스크 연결
        async canSurvey() {
            this.getCondition()
            this.matchSurvey()

            // 설문 조건 넣는 함수
            await this.$api('/survey', 'post', {
                param: this.passSurveyList
            }).then(res => {
                console.log('aaaa', res)
                res.forEach(item => {
                    this.$set(item, 'isShow', false)
                })
                this.surveys = res
            })
        },

        // 모든 설문지 보여준다
        allSurvey() {
            this.getSurvey()
            this.getIsShow()
        },
        // d-day 보여준다
        async discountDay() {
            this.dDays = await this.$api('/date', 'get')
        },

        // 설문 조건을 가져온다
        async getCondition() {
            this.conditions = await this.$api('/conditions', 'get')
        },

        async connectMask() {
            if (this.loginStatus === false) {
                await this.$store.dispatch('registerWeb3')

                this.$store.commit('loginStatus', true)
            }
        },

        // vcList.json에서 항목의 key/value를 가져와 vcItemList에 담기
        getVC: function() {
            this.decryptVc = this.$store.state.decryptVc
            for (
                var i = 0;
                i < this.decryptVc.verifiableCredentials.data.length;
                i++
            ) {
                const vcItem = this.decryptVc.verifiableCredentials.data[i]
                    .credentialSubject.infomation.value

                // 항목의 key와 value값 추출
                var key = Object.keys(vcItem)[0]
                var value = vcItem[Object.keys(vcItem)[0]]

                // 추출한 key/value를 객체로 담아 배열에 넣기
                var obj = {}

                this.keyList.push(key)
                obj[key] = value
                this.vcItemList.push(obj)

                // 로컬에서 vC 꺼낸 기록
                // var keykey
                // keykey = keykey + ',' + key
            }
            this.$store.commit('addVcItemList', this.vcItemList)
        },

        // 설문 조건과 VC항목을 비교
        matchSurvey: function() {
            // 설문 아이디별로 불러오기
            for (var i = 0; i < this.conditions.result.length; i++) {
                const condition = this.conditions.result[i].condition
                // 조건을 통과한 항목이 담기는 배열
                const pass = []

                // 설문 아이디에 해당하는 조건 불러오기
                for (var j = 0; j < condition.length; j++) {
                    // 조건을 항목, 연산자, 값으로 나누기
                    const snippet = condition[j].split(' ')

                    // vcList에서 조건의 항목과 일치하는 key 찾기
                    for (const vc of this.vcItemList) {
                        // vcList에 조건의 항목이 있는지 검증
                        if (
                            Object.prototype.hasOwnProperty.call(vc, snippet[0])
                        ) {
                            // 있는 항목의 경우 값이 담김
                            snippet[0] = vc[snippet[0]]
                        }
                    }
                    // check함수에 해당 VC값, 조건 연산자, 조건 값을 넣어 검증하기
                    const checkResult = this.check(
                        snippet[0],
                        snippet[2],
                        snippet[1]
                    )

                    if (checkResult === true || checkResult === 0) {
                        pass.push(snippet[0])
                    }
                }
                // 통과한 항목 개수와 조건 개수와 같을 경우 해당 설문 아이디 통과, 번호 배열에 담기
                if (pass.length === condition.length) {
                    this.passSurveyList.push(i + 1)
                }
            }
            this.$store.commit('addMatchedSurvey', this.passSurveyList)
        },

        // 값과 연산자와 조건값을 넣어서 true/false or 0/-1 반환
        check(param1, param2, operation) {
            switch (operation) {
                case '>=':
                    return param1 >= param2
                case '<=':
                    return param1 <= param2
                case '===':
                    return param1 === param2
                case '==':
                    return param1.indexOf(param2)
            }
        },

        // isShow 넣기
        async getIsShow() {
            await this.$api('/surveys', 'get').then(res => {
                res.forEach(item => {
                    this.$set(item, 'isShow', false)
                })
                this.surveys = res
            })
        },

        async category() {
            await this.$api('/surveys', 'get').then(res => {
                res.forEach(item => {
                    for (var tag of this.tags) {
                        if ((tag[0] === item.survey_id) === 3) {
                            this.surveyCategory.push(item)
                        }
                    }
                })
            })
        },

        parents(modal) {
            this.surveymodalOfen = modal
        },
        showStartModal() {
            this.surveymodalOfen = true
        }
    }
}
</script>

<style>
.possible-bg-color {
    background-color: #f8f8f9;
}

.categoryBox {
    top: 120px;
}
</style>
