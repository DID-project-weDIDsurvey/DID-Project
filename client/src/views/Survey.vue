<template>
    <div>
        <div class="black-bg" v-if="모달창열렸니 == true">
            <div class="white-bg">
                <h2>✨예약완료✨</h2>
                <br />
                <p>
                    <strong>'마이페이지 > 개인정보 > 맞춤설문 예약확인'</strong
                    >에 들어가시면<br />
                    예약하신 설문조사를 계속해서 진행하실 수 있습니다.
                </p>
                <br />
                <v-btn
                    @click=";[(모달창열렸니 = false), changeTest()]"
                    color="warning"
                    dark
                    class="my-2"
                    elevation="3"
                    >확인</v-btn
                >
            </div>
        </div>
        <v-row class="d-flex justify-center mt-5">
            <div class="d-flex justify-center">
                <v-col
                    md="3"
                    class="mt-30"
                    style="width:2px; height=2px; margin-top:110px border: 3px solid blue"
                >
                    <v-row justify="center">
                        <img
                            src="@/assets/img/surveyP.png"
                            alt=""
                            style="width:150px; height:150px; "
                        />
                    </v-row>
                    <v-row>
                        <v-card style="margin:0 auto">
                            <v-app-bar
                                dark
                                class="d-flex justify-center mb-5 "
                                color="#9568fd"
                                height="40px"
                            >
                                <div>
                                    <v-icon>mdi-account-check</v-icon>맞춤
                                    설문조사
                                </div>
                            </v-app-bar>

                            <v-container>
                                <!--맞춤설문조사 그리는 영역  -->
                                <v-row style class="d-flex justify-center ">
                                    <v-col
                                        v-for="(survey, i) in surveys"
                                        :key="i"
                                        cols="11"
                                    >
                                        <v-card>
                                            <v-img
                                                class="white--text align-end"
                                                height="60px"
                                                :src="
                                                    `http://localhost:3000/download/${survey.survey_image_path}`
                                                "
                                            >
                                                <div
                                                    style="font-size:0.9em; margin-left:5px"
                                                >
                                                    {{ survey.survey_title }}
                                                </div>
                                            </v-img>

                                            <v-card-text
                                                class="black--text text-darken-1 mb-2"
                                            >
                                                <div style="height=40px  ">
                                                    <p style="font-size:0.5em;">
                                                        {{
                                                            survey.survey_description
                                                        }}
                                                    </p>
                                                </div>
                                                <div>
                                                    <v-btn
                                                        @click="
                                                            ;[
                                                                test(i),
                                                                addReservedSurvey(
                                                                    survey.survey_id
                                                                )
                                                            ]
                                                        "
                                                        v-if="
                                                            survey.isBooked ==
                                                                true
                                                        "
                                                        class="ml-5 reservationBtn"
                                                        outlined
                                                        rounded
                                                        color="white"
                                                        x-small
                                                    >
                                                        찜하기
                                                    </v-btn>
                                                    <v-btn
                                                        v-else
                                                        class="ml-5 disabledBtn"
                                                        outlined
                                                        rounded
                                                        x-small
                                                        @click="
                                                            initReservedSurvey()
                                                        "
                                                    >
                                                        예약완료
                                                    </v-btn>
                                                </div>
                                            </v-card-text>
                                        </v-card>
                                    </v-col>
                                </v-row>
                            </v-container>
                        </v-card>
                    </v-row>
                </v-col>

                <!--left 맞춤설문조사 끝-->
                <v-col class="d-flex align-center" style="margin-bottom:-50px">
                    <main-survey />
                </v-col>
            </div>
        </v-row>
    </div>
</template>
<script>
import MainSurvey from '@/components/survey/MainSurvey.vue'
export default {
    name: 'SurveyLayout',
    components: { MainSurvey },
    created() {
        this.canSurvey()
        this.isBooked = true
    },
    mounted() {},

    data: () => ({
        // 예약완료: true,
        모달창열렸니: false,
        surveys: [],
        cards: [
            {
                title: 'Questions',
                number: '12'
            },
            {
                title: 'Time to answer',
                number: '3'
            }
        ]
    }),
    methods: {
        // 맞춤설문지 가져오기
        async canSurvey() {
            this.surveys = await this.$api('/survey', 'post', {
                param: [2, 4]
            })
            console.log('canSurvey()', this.surveys)

            var myObject = {}

            for (let i = 0; i < this.surveys.length; i++) {
                this.surveys[i].isBooked = true
                console.log('this.surveys[i]', this.surveys[i])
            }
            console.log('myObject _ for문dddd', myObject)
        },
        changeTest() {
            console.log(' changeTest()')
            this.isBooked = false
        },
        test(_num) {
            this.모달창열렸니 = true
            this.surveys[_num].isBooked = false
        },

        addReservedSurvey(surveyId) {
            this.$store.commit('addReservedSurvey', surveyId)
        },

        initReservedSurvey() {
            this.$store.commit('initReservedSurvey')
        }
    }
}
</script>
<style scoped>
body {
    margin: 0;
}
div {
    box-sizing: border-box;
}
.black-bg {
    /* position: fixed; */
    top: 0;
    left: 0;
    position: absolute;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.7);
    padding: 20px;
    z-index: 2;
}
.white-bg {
    position: absolute;
    width: 100%;
    background: white;
    border-radius: 8px;
    padding: 20px;
    text-align: center;
    position: absolute;
    top: 50%;
    left: 50%;
    width: 500px;
    height: 230px;
    border-radius: 10px;
    transform: translateX(-50%) translateY(-50%);
    z-index: 1;
}

.reservationBtn {
    background: #9568fd;
    position: absolute;
    top: 50%;
    left: 50%;
    margin-top: 40px;
}
.disabledBtn {
    background: rgb(192, 192, 192);
    position: absolute;
    top: 50%;
    left: 50%;
    margin-top: 40px;
}
</style>
