<template>
    <v-sheet class="bg-primary" height="auto">
        <v-card
            elevation="0"
            width="1200px"
            class="mx-auto"
            height="350"
            color="hsl(258, 98%, 70%)"
        >
            <DefaultBar />
            <v-carousel
                v-model="model"
                vertical-delimiters="right"
                :vertical="true"
                :show-arrows="false"
                :hide-delimiter-background="true"
                height="73vh"
            >
                <v-carousel-item @wheel.prevent="test($event)">
                    <!--투잡해? 문구 시작-->
                    <v-sheet
                        class="my-16"
                        color="hsl(258, 98%, 70%)"
                        height="100vh"
                    >
                        <v-row class="fill-height">
                            <v-col cols="12" sm="6" md="7">
                                <v-img
                                    src="@/assets/img/main/mainImg.png"
                                    aspect-ratio="2.4"
                                    style="margin-left:-2rem; margin-top:1rem"
                                ></v-img>
                            </v-col>
                            <v-col cols="4" md="5">
                                <v-img
                                    class="custom-img"
                                    src="@/assets/img/main/bank-book1.png"
                                    aspect-ratio="1"
                                    ><h3 class="test22">
                                        {{ text }}
                                    </h3>
                                    <h2 class="test33">
                                        {{ text1 }}
                                    </h2>
                                </v-img>
                            </v-col>
                            <v-img
                                class="test1 mt-10"
                                src="@/assets/img/main/pngegg.png"
                                width="36vh"
                            ></v-img>
                        </v-row>
                    </v-sheet>

                    <!--투잡해? 문구 끝-->
                </v-carousel-item>

                <v-carousel-item @wheel.prevent="test($event)">
                    <v-sheet
                        class="my-16"
                        color="hsl(258, 98%, 70%)"
                        height="100vh"
                    >
                        <v-row class="fill-height">
                            <v-col cols="12" sm="6" md="8">
                                <v-img
                                    width="700px"
                                    src="@/assets/img/main/mainImg1.png"
                                    aspect-ratio="2.4"
                                    style="margin-left:-2rem; margin-top:1rem"
                                ></v-img>
                            </v-col>
                            <v-col cols="6" md="4" class="">
                                <v-img
                                    class="custom-img"
                                    src="@/assets/img/main/mainImg2.png"
                                    aspect-ratio="1"
                                    style="margin-top:10rem"
                                ></v-img>
                            </v-col>
                        </v-row>
                    </v-sheet>
                </v-carousel-item>

                <v-carousel-item @wheel.prevent="test($event)">
                    <v-sheet
                        class="my-16"
                        color="hsl(258, 98%, 70%)"
                        height="100vh"
                        ><v-row class="fill-height">
                            <v-col cols="12" sm="6" md="8">
                                <v-img
                                    width="700px"
                                    src="@/assets/img/main/mainImg3.png"
                                    aspect-ratio="2.4"
                                    style="margin-left:-2rem; margin-top:1rem"
                                ></v-img>
                            </v-col>
                            <v-col cols="6" md="4" class="">
                                <v-img
                                    class="custom-img"
                                    src="@/assets/img/main/mainImg4.png"
                                    aspect-ratio="1"
                                    style="margin-top:10rem"
                                ></v-img>
                            </v-col>
                        </v-row>
                    </v-sheet>
                </v-carousel-item>
            </v-carousel>
            <div class="scrollSelect d-flex justify-center"></div>
        </v-card>
    </v-sheet>
</template>
<script>
import DefaultBar from '../components/Main/Navbar.vue'
export default {
    name: '',
    components: { DefaultBar },
    data() {
        return {
            surveys: [],
            model: 0,
            wheelTimer: null,
            dDays: '',
            text: null,
            text1: null
        }
    },
    watch: {
        model() {
            if (this.model === 0) {
                this.text = ''
                setTimeout(() => {
                    this.text = '상위 10% 한달 평균 수익 : 77만원'
                }, 2100)

                this.text1 = ''
                setTimeout(() => {
                    this.text1 = '한달 최고 수익 : 119만원'
                }, 5900)
            }
        }
    },
    setup() {},
    mounted() {},
    created() {
        this.getSurvey()
        this.discountDay()
        this.textCall()
        this.textCall1()
    },
    unmounted() {},
    methods: {
        async getSurvey() {
            this.surveys = await this.$get('/surveys')
        },

        async metamask() {
            await this.$store.dispatch('registerWeb3')

            this.goPossible()
        },
        goPossible() {
            if (this.$store.state.web3.coinbase) {
                this.$router.push({ path: 'possible' })
            } else {
                window.alert('조금만 더 기다려주세요 ^^')
            }
        },
        async discountDay() {
            this.dDays = await this.$api('/date', 'get')
            console.log(this.dDays)
        },
        test(event) {
            console.log(event)
            clearTimeout(this.wheelTimer)

            this.wheelTimer = setTimeout(() => {
                if (event.deltaY > 0) {
                    console.log('down')
                    console.log(this.model, ++this.model)
                } else {
                    console.log('up')
                    console.log(this.model, --this.model)
                }
            }, 300)
        },
        doScroll(sidx) {
            console.log(sidx)
        },
        textCall() {
            setTimeout(() => {
                this.text = '상위 10% 한달 평균 수익 : 77만원'
            }, 2100)
        },
        textCall1() {
            setTimeout(() => {
                this.text1 = '한달 최고 수익 : 119만원'
            }, 5900)
        }
    }
}
</script>
<style lang="scss">
.outline {
    border: 2px solid black;
}
.container-fluid {
    max-width: 500px;
}

.scrollSelect {
    background: url('../assets/img/shapes/sc_img.png') no-repeat 0 0;

    align-items: center;
    justify-content: center;
    width: 120px;
    height: 150px;
    margin: auto;
    animation: sample-ani 5s linear infinite alternate;
}
.scrollSelect:hover {
    animation-play-state: paused;
}

.scrollSelect2 {
    animation: sample-ani2 2s linear infinite alternate;
}
.scrollSelect2:hover {
    animation-play-state: paused;
}

.scrollSelect3 {
    animation: sample-ani3 3s linear infinite alternate;
}
.scrollSelect3:hover {
    animation-play-state: paused;
}
.panel {
    background-color: white;
    width: 25rem;
    height: 30rem;
    border-radius: 5rem 5rem 5rem 5rem;
}

.flicking {
    margin: 0 auto;
}
.Viewport {
    height: 350px;
}

.test {
    align-items: center;
    justify-content: center;
    margin: auto;
    animation: sample-ani-test 3s linear infinite alternate;
}

.test1 {
    position: absolute;

    transition-property: margin-left;
    transition-duration: 3s;
    animation-name: tejin3;
    animation-duration: 2s;
    animation-duration: leaner;
    animation-iteration-count: 3;
    animation-direction: alternate;
    animation-fill-mode: forwards;
}

.test22 {
    position: absolute;
    left: 24%;
    top: 28%;
}
.test33 {
    position: absolute;
    left: 24%;
    top: 40%;
}

/* 키프레임 이름 = 애니메이션 이름 */
@keyframes tejin3 {
    0% {
        left: 40%;
    }
    100% {
        left: 48%;
    }
}

.bg-primary {
    background-color: #9568fd;
}
</style>
