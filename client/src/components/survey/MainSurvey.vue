<template>
    <div>
        <v-card style="width: 100%; height: 100%; subheading mt-16 ">
            <v-carousel
                v-model="model"
                :continuous="false"
                style="width: 800px; height: 500px; mt-16 subheadings"
            >
                <v-parallax style="height:100%;" aspect-ratio="1.4" src="">
                    <v-carousel-item
                        v-for="(question, i) in questions"
                        :key="i"
                    >
                        <div style="font-size: 2.5em; margin-top:50px;">
                            {{ question.quesiton_order }}.
                            {{ question.quesiton_content }}
                        </div>
                        <v-radio-group
                            class="d-flex align-center "
                            v-model="radios"
                            v-if="model < questions.length - 1"
                        >
                            <v-radio
                                class="ml-10 mt-6 "
                                color="orange lighten-1"
                                :value="t_order.uniq"
                                @click="checkRadioUnique"
                                v-for="(orders, i) in t_orders[i]"
                                :key="i"
                            >
                                <template v-slot:label>
                                    <div>
                                        <h3>
                                            {{ orders }}
                                        </h3>
                                    </div>
                                </template>
                            </v-radio>
                        </v-radio-group>
                        <v-text-field
                            v-else
                            class="d-flex align-center"
                            flat
                            height="100"
                            v-model="userInput"
                            color="yellow  darken-2"
                            label="입력해주세요"
                            placeholder="Start_nexting..."
                            loading
                        >
                        </v-text-field>
                        <div
                            style="margin-bottom:20%;"
                            align="center "
                            justify="space-around"
                            class="position"
                        >
                            <v-btn
                                :id="i"
                                @click="complete(i)"
                                color="#9568FD"
                                dark
                                class="my-2 mb-1 "
                                x-large
                                elevation="7"
                            >
                                확인
                            </v-btn>
                        </div>
                    </v-carousel-item>
                </v-parallax>
            </v-carousel>
        </v-card>
        <br />
        <SurveyModal
            :dialog="dialog"
            :dialog2="dialog2"
            :vp="vp"
            :price="price"
            :sC="sC"
            :surveyId="surveyId"
            :companyAccount="companyAccount"
            v-if="dialog"
            @next-modal=";(dialog2 = true), (dialog = false)"
        ></SurveyModal>
        <SurveyModal
            :dialog="dialog"
            :dialog2="dialog2"
            :price="price"
            :coupon="coupon"
            v-if="dialog2"
            @close-modal="dialog2 = false"
        ></SurveyModal>
    </div>
</template>

<script>
import SurveyModal from './Modal.vue'
import vc from '@/assets/vc/vc.json'
import getContract from '@/service/getContract'
export default {
    name: 'MainSurvey',
    components: { SurveyModal },
    data() {
        return {
            items: [
                {
                    src:
                        'https://cdn.vuetifyjs.com/images/carousel/squirrel.jpg'
                },
                {
                    src: 'https://cdn.vuetifyjs.com/images/carousel/sky.jpg'
                },
                {
                    src: 'https://cdn.vuetifyjs.com/images/carousel/bird.jpg'
                },
                {
                    src: 'https://cdn.vuetifyjs.com/images/carousel/planet.jpg'
                }
            ],
            sC: null,
            t_order: 0,
            radios: 0,
            vc,
            questions: null,
            value: '',
            custom: true,
            userInput: '',
            dialog: false,
            dialog2: false,
            model: 0,
            condition: {},
            vp: [],
            price: 0,
            coupon: 0,
            t_orders: [
                {
                    // 1번문제
                    question1: '1~2회',
                    question2: '2~3회',
                    question3: '5회',
                    question4: '7회 이상'
                },
                {
                    // 2번문제
                    question1: '매우좋다',
                    question2: '좋다',
                    question3: '보통이다',
                    question4: '그저그렇다'
                },

                {
                    // 3번문제
                    question1: '50000원 ~ 100000원',
                    question2: '100000원 ~ 300000원',
                    question3: '300000원 ~ 500000원',
                    question4: '500000원 이상'
                },
                {
                    // 4번문제
                    question1: '오프라인 매장 유무',
                    question2: '후기',
                    question3: '지인추천',
                    question4: '인지도'
                },
                {
                    // 5번문제
                    question1: '매우 만족한다',
                    question2: '만족한다',
                    question3: '보통이다',
                    question4: '인지도'
                }
            ],
            companyAccount: '',
            user_account: null,
            encMsg: null
        }
    },
    computed: {
        progress() {
            return Math.min(100, this.value.length * 10)
        }
    },
    setup() {},
    created() {
        this.surveyId = this.$route.query.surveyId
        this.getQuestions()
        this.userInput = ''
        this.answerValue = []
        this.answers = []
        this.getSurveyById()
        this.getSurveyContractInstance()
    },
    mounted() {
        this.selectedCondition()
    },
    unmounted() {},
    methods: {
        checkRadioUnique() {
            console.log('checkRadioUnique()', this.radios)
        },

        async getQuestions() {
            try {
                this.questions = await this.$api('/questions', 'post', {
                    param: [this.surveyId]
                })
                console.log(this.questions[0].quesiton_content)
            } catch (err) {}
        },

        async complete(btnId) {
            if (this.model + 1 !== this.questions.length) {
                var tempObj = {}
                tempObj.questionsId = this.model + 1
                tempObj.answerValue = this.radios + 1

                this.answers.push(tempObj)
                this.userInput = ''
                this.model++
            } else {
                tempObj = {}
                tempObj.questionsId = this.model + 1
                tempObj.answerValue = this.userInput

                this.answers.push(tempObj)
                this.userInput = ''

                this.$api('/answers', 'post', {
                    param: {
                        answers: this.answers,
                        userAccount: this.$store.state.web3.coinbase,
                        surveyId: this.surveyId
                    }
                })
                if (btnId === 5) {
                    this.dialog = true
                }
            }
        },

        // 컨트랙트 연결
        getSurveyContractInstance() {
            if (this.sC === null) {
                var getContract21 = getContract()
                this.sC = getContract21
                // 이벤트 받기
                this.sC.events.addUser({}, async (error, event) => {
                    console.log(error)
                    console.log(event)
                    // 설문 중복체크를 위해 체인에 정보를 기록하고 난 후 이벤트를 받아서 DB에 데이터 저장
                    await this.$api('/CompletePeople', 'post', {
                        param: {
                            survey_id: event.returnValues[0],
                            user_account: event.returnValues[1],
                            user_vp: this.$store.state.encMsg
                        }
                    })
                })
            }
        },

        // 선택한 설문 조건 가져오기
        async selectedCondition() {
            var surveyIdArray = []
            surveyIdArray.push(parseInt(this.surveyId))
            this.condition = await this.$api('/condition', 'post', {
                param: surveyIdArray
            })

            // 가져온 설문 조건에 해당하는 VC 항목 필터링해서 배열에 담기
            const vcItemList = this.$store.state.vcItemList
            const rawVp = []
            for (var i = 0; i < this.condition.result.condition.length; i++) {
                const snippet = this.condition.result.condition[i].split(' ')
                const result = vcItemList.filter(
                    e => Object.keys(e)[0] === snippet[0]
                )
                rawVp.push(result[0])
            }

            // vp 배열의 중복값 제거
            this.vp = rawVp.filter((element, index) => {
                return rawVp.indexOf(element) === index
            })
        },

        // 해당 설문의 보상 포인트와 쿠폰을 가져온다
        async getSurveyById() {
            try {
                const survey = await this.$api('/survey', 'post', {
                    param: [this.surveyId]
                })
                this.price = survey[0].survey_price
                this.coupon = survey[0].survey_coupon
                this.companyAccount = survey[0].user_account
            } catch (err) {}
        }
    }
}
</script>
<style>
.position {
    /* background: greenyellow; */
    position: absolute;
    top: 50%;
    left: 50%;
    margin-right: -50%;
    margin-top: 17%;
    transform: translate(-50%, -50%);
}
.title-style {
    background: hotpink;
}
</style>
