<template>
    <div class="mt-16">
        <!-- 헤더부분 -->

        <!-- <div class="banner"> -->
        <div class="img" style="justify-content:center; display:flex;">
            <div class="text pt-1" style="color:white;  margin-left:20px">
                <div
                    align="left"
                    style="color:white; font-size:1.5em;"
                    class="d-flex align-center mr-5"
                >
                    설문 결과
                </div>
                <div>
                    <span style="font-size:1.2em">
                        weDIDsurvey의 정확한 설문 결과를 확인하세요</span
                    ><br />
                    <span style="font-size:0.8em">
                        우리 weDIDsurvey에서는 설문 참가자들이 제공한 신원증명을
                        확인 할 수 있습니다
                    </span>
                </div>
            </div>
            <img
                src="@/assets/img/trade/banner-2.png"
                class="img-bn-class justify-center align-center"
            />
        </div>

        <!-- </div> -->

        <!-- 헤더부분 끝 -->

        <!-- 중간에 네비 처럼 생긴애-->
        <v-container>
            <v-bottom-navigation :value="value" color="deep-purple" horizontal>
                <v-btn @click="show(2)" class="mr-3">
                    <h2 class="mt-2">전체 설문 : {{ surveyLength }}</h2>

                    <v-icon>mdi-magnify</v-icon>
                </v-btn>

                <v-btn @click="show(0)" class="mr-3">
                    <h2 class="mt-2">진행중 설문 : {{ unComplete }}</h2>
                    <v-icon>mdi-history</v-icon>
                </v-btn>

                <v-btn @click="show(1)">
                    <h2 class="mt-2">완료된 설문 : {{ complete }}</h2>

                    <v-icon>mdi-checkbox-marked-circle</v-icon>
                </v-btn>
            </v-bottom-navigation>
        </v-container>
        <!-- 중간에 네비처럼 생긴애 끝 -->

        <!-- 설문 결과 카드 그리기 -->
        <v-container>
            <v-card elevation="3" class=" my-6">
                <v-row>
                    <v-col
                        v-for="(m, n) in surveyData"
                        :key="n"
                        class="d-flex child-flex"
                        cols="3"
                    >
                        <!-- 마우스 호버시 모달창, 완료된 설문은 회색 -->
                        <v-card
                            class="mx-auto my-6"
                            max-width="374"
                            v-on:mouseover=";(m.hover = true), testPlz($event)"
                            @mouseout="m.hover = false"
                            :color="
                                m.selection == 0 ? 'white' : 'grey lighten-2'
                            "
                        >
                            <template slot="progress">
                                <v-progress-linear
                                    color="deep-purple"
                                    height="10"
                                    indeterminate
                                ></v-progress-linear>
                            </template>

                            <v-card-title
                                >{{ m.survey_title }}
                                <br />
                                [설문번호 :{{ m.survey_id }}]</v-card-title
                            >

                            <!-- 세로선 설문 D-day 와 종료일 -->
                            <v-card-text class="py-0">
                                <v-timeline align-top dense>
                                    <v-timeline-item color="deep-purple">
                                        <v-row class="pt-1">
                                            <v-col>
                                                설문 종료일까지
                                                <v-chip
                                                    class="font-weight-bold"
                                                    color="deep-purple accent-3"
                                                    outlined
                                                    small
                                                >
                                                    D-{{ m.dDay }}
                                                </v-chip>
                                            </v-col>
                                        </v-row>
                                    </v-timeline-item>
                                    <v-timeline-item small>
                                        <v-row class="pt-1">
                                            <v-col>
                                                <strong>
                                                    설문 종료 :
                                                    {{
                                                        m.survey_end_date.slice(
                                                            0,
                                                            10
                                                        )
                                                    }}</strong
                                                >
                                            </v-col>
                                        </v-row>
                                    </v-timeline-item>
                                </v-timeline>
                            </v-card-text>
                            <!-- 세로선 설문 D-day 와 종료일 끝-->

                            <!-- 설문 참여율(참여인원 / 종료인원) -->
                            <v-card-text>
                                <div class="mt-6">
                                    <v-slider
                                        class="mt-6"
                                        v-model="m.total_complte"
                                        label="설문참여율"
                                        thumb-color="red"
                                        thumb-label="always"
                                        readonly
                                    ></v-slider>
                                </div>
                                <v-chip-group
                                    active-class="deep-purple accent-4 white--text"
                                    column
                                    mandatory
                                    v-model="m.selection"
                                >
                                    <!-- 0이면 설문중 1이면 설문완료 -->
                                    <v-chip small>설문중</v-chip>

                                    <v-chip small>설문완료</v-chip>
                                </v-chip-group>
                            </v-card-text>
                            <!-- 설문 참여율(참여인원 / 종료인원) -->

                            <v-divider
                                color="purple lighten-2 "
                                class="mx-4"
                            ></v-divider>
                        </v-card>

                        <!-- 호버창 -->
                        <v-card
                            class="mx-auto my-6"
                            max-width="374"
                            :style="
                                `position:absolute; z-index: 100; width: ${eventWidth}px; height: ${eventHeight}px; opacity: 0.9; padding: 100px 0 0 0`
                            "
                            @mouseover="m.hover = true"
                            @mouseout="m.hover = false"
                            v-show="m.hover"
                        >
                            <v-card-text>
                                <h1>요청 VC List</h1>
                                <v-chip-group column mandatory>
                                    <!-- 요청한 vc list -->
                                    <v-chip
                                        small
                                        :key="k"
                                        v-for="(w, k) in m.vcList"
                                    >
                                        {{ w }}
                                    </v-chip></v-chip-group
                                >
                            </v-card-text>
                            <v-card-text>
                                <v-chip-group column>
                                    <v-chip>
                                        <!-- 설문 번호랑 완료한 사람 전체 리스트에서 같은 설문 번호 매칭 -->
                                        <DialogScroll
                                            :vcList5="m.vcList"
                                            title="vp 확인"
                                            :completePeople="
                                                users.filter(
                                                    filtering =>
                                                        filtering.survey_id ==
                                                        n + 1
                                                )
                                            "
                                            :surveyId="m.survey_id"
                                    /></v-chip>
                                </v-chip-group>
                            </v-card-text>
                        </v-card>
                        <!-- 호버창 -->
                    </v-col>
                </v-row>
            </v-card>
        </v-container>
    </div>
</template>
<script>
import DialogScroll from '@/components/Company/DialogScroll.vue'

export default {
    name: 'CompanyView',
    components: { DialogScroll },
    data() {
        return {
            surveyData: [],
            surveyData1: [],
            users: [],
            loading: false,
            companyAccount: '0x12',
            snippet: [],
            finalData: null,
            value: 0,
            hover: false,
            eventWidth: 0,
            eventHeight: 0,
            unComplete: 0,
            complete: 0,
            colorSelect: ''
        }
    },
    computed: {
        surveyLength() {
            return this.surveyData1.length
        }
    },
    setup() {},
    created() {
        this.init()
    },
    mounted() {},
    unmounted() {},
    methods: {
        async init() {
            try {
                // 1. 회사 데이터를 불러와서 저장한다.
                const surveys = await this.$api('/survey/company', 'post', {
                    param: [this.companyAccount]
                })
                console.log(surveys)

                // 2. 설문지 조건들을 요청한다.
                const len1 = surveys.length
                const surveyId1 = []
                for (let ii = 0; ii < len1; ii++) {
                    surveyId1.push(parseInt(surveys[ii].survey_id))
                }
                // const output = await this.$api('/conditions', 'get')
                const output = await this.$api('/condition', 'post', {
                    param: surveyId1
                })
                const conditions = output.result
                console.log(conditions)
                this.surveyData1 = this.matchSurvey(surveys, conditions)
                this.surveyData = this.surveyData1
                // 완료한 설문과 진행준인 설문 카운트
                var unComplete1 = 0
                var complete1 = 0
                for (let c = 0; c < this.surveyData.length; c++) {
                    if (this.surveyData[c].selection === 0) {
                        unComplete1++
                    } else {
                        complete1++
                    }
                }
                this.unComplete = unComplete1
                this.complete = complete1
            } catch (err) {
                console.log('설문지 및 설문지 조건 데이터 불러오기 실패')
            }

            try {
                // 3. 완료된 목록을 불러와서 저장한다.
                this.users = await this.$api('/completes', 'get')
                console.log(this.users)
            } catch (err) {
                console.log('유저 데이터 불러오기 실패')
            }
        },
        matchSurvey(surveys, conditions) {
            const len = surveys.length

            for (let i = 0; i < len; i++) {
                var surveyId = parseInt(surveys[i].survey_id)
                var conditionId = parseInt(conditions[i].survey_id)

                // survey의 id랑 condition의 id랑 비교
                if (surveyId === conditionId) {
                    // 먼저 더미 배열 하나 생성
                    var vcList = []
                    var tempCondition = conditions[i].condition
                    // vc 정보만 잘래내서 배열에 담음
                    for (const vc of tempCondition) {
                        var key = vc.split(' ')[0]
                        vcList.push(key)
                    }
                    // 중복되는 애들 합친뒤 다시 배열 형태로 바꿔서 저장
                    var tempArray = new Set(vcList)
                    surveys[i].vcList = Array.from(tempArray)
                    surveys[i].hover = false
                }
            }

            return surveys
        },

        // 호버창 크기 원래 창과 맞춤
        testPlz: function(event) {
            // console.log(event)

            if (
                event.target.offsetParent.parentElement._prevClass ===
                'd-flex child-flex col col-3'
            ) {
                console.log('안녕')
                this.eventWidth = event.target.offsetParent.offsetWidth
                this.eventHeight = event.target.offsetParent.offsetHeight
            }
        },

        // 완료, 진행, 전체 설문 필터링
        show(n) {
            if (n === 0) {
                console.log('왔니')
                this.surveyData = this.surveyData1
                this.surveyData = this.surveyData.filter(
                    filtering => filtering.selection === 0
                )
                console.log(this.surveyData)
            } else if (n === 1) {
                console.log('왔니1')
                this.surveyData = this.surveyData1
                this.surveyData = this.surveyData.filter(
                    filtering => filtering.selection === 1
                )
                console.log(this.surveyData)
            } else {
                console.log('왔니2')

                this.surveyData = this.surveyData1
                console.log(this.surveyData)
            }
        }
    }
}
</script>
