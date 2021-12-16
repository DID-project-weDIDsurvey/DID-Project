<template>
    <div>
        <v-card width="1200px" class="mx-auto outline" height="350">
            <v-carousel
                v-model="model"
                vertical-delimiters="right"
                :vertical="true"
                :show-arrows="false"
                :hide-delimiter-background="true"
                height="73vh"
                color="secondary"
            >
                <v-carousel-item @wheel.prevent="test($event)">
                    <!--투잡해? 문구 시작-->
                    <v-sheet class="my-16" color="secondary" height="100vh">
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
    </div>
</template>
<script>
export default {
    name: '',
    components: {},
    data() {
        return {
            sampleData: ''
        }
    },
    setup() {},
    created() {},
    mounted() {},
    unmounted() {},
    methods: {}
}
</script>
