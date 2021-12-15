<template>
    <v-container>
        <v-row align="center" justify="center">
            <v-col cols="10">
                <v-sheet elevation="3">
                    <v-sheet class="pa-3 white--text" color="#7b45fd">
                        <span>카테고리</span>
                    </v-sheet>
                    <div class="pa-4">
                        <v-chip-group column>
                            <v-chip
                                color="secondary"
                                class="white--text"
                                v-for="tag in tags"
                                :key="tag"
                                @click="category"
                                active-class=""
                            >
                                {{ tag }}
                            </v-chip>
                        </v-chip-group>
                    </div>
                </v-sheet>
            </v-col>
        </v-row>
    </v-container>
</template>
<script>
export default {
    name: '',
    components: {},
    data() {
        return {
            tags: [
                ' 쇼핑 ',
                '문화',
                '자동차',
                '음식',
                '아트',
                '주택',
                '인터넷',
                '전자제품'
            ]
        }
    },
    setup() {},
    created() {},
    mounted() {},
    unmounted() {},
    methods: {
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
        }
    }
}
</script>
