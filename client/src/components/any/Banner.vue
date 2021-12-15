<template>
    <v-container>
        <v-row align="center" justify="center">
            <v-col cols="9">
                <v-sheet
                    class="d-flex align-center px-10"
                    :style="{
                        backgroundImage:
                            'url(' +
                            require('@/assets/images/' + imagePath) +
                            ')',
                        backgroundPosition: 'center center',
                        color: 'white',
                        height: '150px'
                    }"
                >
                    <div class="ml-6 text-center ">
                        <span style="font-size:1.5em;">
                            {{ title }}
                        </span>
                    </div>
                    <div class="ml-10">
                        <span style="font-size:1.2em">
                            {{ des[0] }}
                        </span>
                        <br />
                        <span style="font-size:0.8em">
                            {{ des[1] }}
                        </span>
                    </div>
                </v-sheet>
            </v-col>
        </v-row>
    </v-container>
</template>
<script>
export default {
    name: 'Banner',
    data: () => ({
        title: '설문참여',
        des: [
            '더 많이 참여하고 더 많이 받아가세요',
            '지금 서베이에 참여하고 더 많은 WeDIDsurvey 포인트를쌓아보세요.'
        ],
        imagePath: 'components/banner.png'
    }),
    computed: {}
}
</script>
<style scoped>
/* .testLine {
    border: 3px solid black;
} */
</style>
