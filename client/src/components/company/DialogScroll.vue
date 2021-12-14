<template>
    <v-row justify="center">
        <v-dialog v-model="dialog" persistent max-width="500px">
            <template v-slot:activator="{ on, attrs }">
                <v-btn
                    color="deep-purple accent-4"
                    class="white--text"
                    v-bind="attrs"
                    v-on="on"
                >
                    {{ title }}
                </v-btn>
            </template>

            <v-card>
                <v-card-title class="white--text deep-purple accent-4"
                    >Select VP</v-card-title
                >
                <v-divider></v-divider>

                <v-card-text
                    scrollable
                    style="padding: 5px;"
                    :key="i"
                    v-for="(n, i) in completePeople"
                >
                    <!-- 설문 참여 완료한 사람들 중 특정 vp를 공개한 사람 -->
                    <v-checkbox
                        v-if="n.user_vp != null"
                        v-model="selected"
                        :label="n.user_account"
                        :value="n.user_account"
                        @click="vpData(n.user_vp)"
                    ></v-checkbox>

                    <!-- 설문 참여 완료한 사람들 중 아무런 vp도 공개하지 않은 사람 -->
                    <v-checkbox
                        v-else
                        disabled
                        indeterminate
                        v-model="selected"
                        :label="
                            `${n.user_account}` +
                                ' - ' +
                                'VP제공에 동의하지 않은 사용자 입니다'
                        "
                        :value="n.user_account"
                    >
                    </v-checkbox>
                </v-card-text>

                <v-divider></v-divider>
                <v-card-actions>
                    <v-btn color="blue darken-1" text @click="dialog = false">
                        Close
                    </v-btn>
                    <Loader
                        :userVp="userVp1"
                        :selected1="selected"
                        :vcList2="vcList1"
                    />
                </v-card-actions>
            </v-card>
        </v-dialog>
    </v-row>
</template>
<script>
import Loader from './Loader.vue'
export default {
    components: { Loader },
    props: {
        title: {
            type: String,
            default: '페이지 제목'
        },
        completePeople: {
            type: Array,
            default: function() {
                return []
            }
        },
        surveyId: {
            type: Number,
            default: 0
        },
        vcList5: {
            type: Array,
            default: function() {
                return []
            }
        }
    },

    created() {
        this.vcList1 = this.vcList5
    },

    data() {
        return {
            dialogm1: '',
            dialog: false,
            selected: [],
            surveyData1: [],
            userVp1: null,
            vcList1: null
        }
    },
    methods: {
        // vp를 Loader에 전달하기 위해 저장
        vpData(vp) {
            this.userVp1 = vp
            console.log('다이알로그창', this.vcList5)
        }
    }
}
</script>
