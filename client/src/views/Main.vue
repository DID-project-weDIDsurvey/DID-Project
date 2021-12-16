<template>
    <v-sheet color="secondary" height="100vh">
        <Navbar class="outline" />
    </v-sheet>
</template>
<script>
import Navbar from '@/components/main/Navbar.vue'
export default {
    name: '',
    components: { Navbar },
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
::-webkit-scrollbar {
    display: none;
}

.outline {
    border: 3px solid red;
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
