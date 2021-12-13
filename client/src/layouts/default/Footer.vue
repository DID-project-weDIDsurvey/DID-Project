<template>
    <div>
        <v-footer color="white" padless>
            <v-row justify="center" no-gutters>
                <v-btn
                    v-for="link in links"
                    :key="link"
                    color="black"
                    text
                    rounded
                    class="my-2"
                >
                    {{ link }}
                </v-btn>
                <v-col cols="12" class="text-center text-caption pb-2">
                    사업자등록번호 : 323-45-52413 서울 영등포구 양산로
                    (양평동3가) 월드메르디앙비즈센터 2층 대표팀 딩딩<br />
                    Copyright ⓒ 2009-2021 SM C&C. All rights reserved
                </v-col>
                <v-col
                    class="primary lighten-2 py-4 text-center black--text"
                    cols="12"
                >
                    {{ currentYear }} —
                    <strong>weDIDSurvey</strong>
                </v-col>
            </v-row>
        </v-footer>
    </div>
</template>
<script>
module.exports = {
    name: 'DefaultFooter',
    data() {
        return {
            links: ['FAQ', '1:1문의', '이용약관', '개인정보처리방침', '블로그']
        }
    },
    computed: {
        currentYear() {
            return new Date().getFullYear()
        }
    }
}
</script>
