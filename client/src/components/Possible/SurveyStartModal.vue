<template>
    <div>
        <!-- 저는 우선 파서블페이지에서 설문지 누르면 만들어야할 아래의 모달창 먼저 만들겠습니다. -->
        <!-- 원래는 각 surveyId 마다 달리 db에있는 것들을 받아와야되지만 우선 이렇게하기 -->
        <!-- <div class="black-bg" v-if="모달창열렸니 == true"> -->
        <v-dialog
            class="modalblack-bg"
            persistent
            v-model="this.surveymodalOfen"
        >
            <div class="white-bg">
                <div align="left">
                    <img src="../../assets/img/logo.png" width="20px" alt="" />
                </div>
                <div
                    style="border:2px solid pink; margin-bottom:10px; background-color:pink;"
                ></div>
                <h1>설문참여 가이드 📑</h1>

                <!--첫번째 블럭-->
                <v-card class="d-flex justify-center mb-6" flat>
                    <!--왼쪽 카드-->
                    <v-card class="mr-2" max-width="300" outlined>
                        <v-list-item three-line>
                            <v-list-item-avatar tile size="120">
                                <img
                                    src="../../assets/img/survey/noBack.png"
                                    alt=""
                                />
                            </v-list-item-avatar>
                            <v-list-item-content>
                                <h4 align="left">
                                    설문 중<br />
                                    뒤로가기 금지
                                </h4>
                                <h5 align="left" style="color:grey">
                                    설문 중에 뒤로가기를<br />
                                    클릭하시면<br />
                                    설문이 중단됩니다.
                                </h5>
                            </v-list-item-content>
                        </v-list-item>

                        <v-card-actions> </v-card-actions>
                    </v-card>
                    <!--오른쪽 카드-->
                    <v-card class="ml-2" max-width="300" outlined>
                        <v-list-item three-line>
                            <v-list-item-avatar
                                tile
                                width="115px"
                                height="138px"
                            >
                                <img
                                    src="../../assets/img/survey/ten_m.png"
                                    alt=""
                            /></v-list-item-avatar>
                            <v-list-item-content>
                                <h4 align="left">
                                    설문 중단 시<br />
                                    10분 내 재참여 가능
                                </h4>
                                <h5 align="left" style="color:grey">
                                    설문 중 중단되어도<br />
                                    10분 이내에는 다시<br />
                                    참여하실 수 있습니다.
                                </h5>
                            </v-list-item-content>
                        </v-list-item>
                        <v-card-actions> </v-card-actions>
                    </v-card>
                </v-card>

                <!--두번째 블럭-->
                <v-card class="d-flex justify-center mb-6" flat>
                    <!--왼쪽 카드-->
                    <v-card class="mr-2" max-width="300" outlined>
                        <v-list-item three-line>
                            <!-- <v-list-item-avatar tile> </v-list-item-avatar> -->

                            <v-list-item-content>
                                <h4 align="left">
                                    불량응답 안내
                                </h4>
                                <h5 align="left" style="color:grey">
                                    당사는 조사 종료 후 검증 시스템을 통해
                                    응답신뢰성을 관리 하고있습니다. 검증작업
                                    결과 패널님의 응답이 불성실 하다고 확인될
                                    경우 불량응답 처리를 하여, 불량응답을 3회 한
                                    경우 직권탈퇴 및 적립금이 소멸 될 수 있으니
                                    이 점 유의해 주시기 바랍니다.
                                </h5>
                            </v-list-item-content>
                        </v-list-item>

                        <v-card-actions> </v-card-actions>
                    </v-card>
                    <!--오른쪽 카드-->
                    <v-card class="ml-2" max-width="300" outlined>
                        <v-list-item three-line>
                            <v-list-item-content>
                                <h4 align="left">
                                    지적재산권 보호
                                </h4>
                                <h5 align="left" style="color:grey">
                                    조사를 통해서 습득한 모든 정보에 대한
                                    지적재산권을 당사와 조사의뢰 회사에 있으며,
                                    조사내용을 제 3자에게 발설하거나 관련자료나
                                    조사 화면을 유포한 경우에는 법 불이익을 받을
                                    수 있습니다.
                                </h5>
                            </v-list-item-content>
                        </v-list-item>
                        <v-card-actions> </v-card-actions>
                    </v-card>
                </v-card>

                <!--teble블럭-->
                <table>
                    <tr>
                        <th>
                            조사명
                        </th>
                        <th>
                            조사기간
                        </th>
                        <th>
                            응답시간
                        </th>
                        <th>
                            적립금 | 쿠폰
                        </th>
                    </tr>
                    <tr>
                        <td>
                            패션조사
                        </td>
                        <td>
                            D-18
                        </td>
                        <td>
                            약 3분소요
                        </td>
                        <td>
                            적립금 : 5000 원 <br />
                            쿠폰 : 9
                        </td>
                    </tr>
                </table>

                <br />
                <div>
                    <v-btn
                        color="grey"
                        dark
                        class="margin-s my-2"
                        elevation="3"
                        @click="goBack"
                        >돌아가기</v-btn
                    >
                    <v-btn
                        @click="changeTest()"
                        color="#9568FD"
                        dark
                        class="margin-s my-2"
                        elevation="3"
                        >설문참여하기</v-btn
                    >
                </div>
            </div>
        </v-dialog>
    </div>
</template>
<script>
export default {
    name: '',
    props: ['surveymodalOfen'],
    components: {},
    data() {
        return {
            modal: false,
            getSurveys: [],
            dDays: ''
        }
    },
    setup() {},
    created() {
        this.getSurvey()
        this.getIsShow()
        this.discountDay()
        this.modal.surveymodalOfen = this.surveymodalOfen
    },
    mounted() {},
    unmounted() {},
    methods: {
        changeTest() {
            this.$router.push({ path: 'survey?surveyId=3' })
        },
        goBack() {
            this.$emit('child', this.modal)
        },
        // 제일 처음 모든 설문지 보여준다
        async getSurvey() {
            this.getSurveys = await this.$api('/surveys', 'get')
        }
    },
    async discountDay() {
        this.dDays = await this.$api('/date', 'get')
    }
}
</script>
<style scoped>
.margin-s {
    margin-left: 10px;
}
.modalblack-bg {
    position: absolute;
    width: 100%;
    height: 100%;
    /* background-color: rgb(33, 33, 33); */
    /* opacity: 0.9; */
    padding: 20px;
    z-index: 2;
}
.white-bg {
    background: white;
    border-radius: 8px;
    padding: 20px;
    text-align: center;
    position: absolute;
    top: 50%;
    left: 50%;
    width: 800px;
    height: 650px;
    border-radius: 10px;
    transform: translateX(-50%) translateY(-50%);
    z-index: 1;
}
table {
    border: 2px solid black;
    border-collapse: collapse;
    text-align: center;
    margin: 0 auto;
}
th,
td {
    border: 0.5px solid;
    padding: 10px 5px;
    width: 155px;
}
th {
    background-color: pink;
    color: white;
}
.v-card__actions {
    padding: 0px;
}
</style>
