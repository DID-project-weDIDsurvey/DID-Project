<template>
    <v-main>
        <v-container fluid>
            <v-row>
                <v-col cols="3"> </v-col>
                <v-col>
                    <PossibleHeader />
                </v-col>
            </v-row>
            <v-row>
                <v-col cols="3">
                    <PossibleNav />
                </v-col>
                <v-col>
                    <PossibleMain />
                </v-col>
            </v-row>
        </v-container>
    </v-main>
</template>

<script>
import PossibleHeader from '@/components/any/Banner.vue'
import PossibleMain from '@/components/possible/PossibleMain.vue'
import PossibleNav from '@/components/possible/PossibleNav.vue'

export default {
    name: 'Possible',

    components: {
        PossibleHeader,
        PossibleMain,
        PossibleNav
    },
    data() {
        return {
            cards: ['Today', 'Yesterday'],
            drawer: null,
            links: [
                ['mdi-inbox-arrow-down', 'Inbox'],
                ['mdi-send', 'Send'],
                ['mdi-delete', 'Trash'],
                ['mdi-alert-octagon', 'Spam']
            ]
        }
    }
}
</script>
<style scoped>
.testLine {
    border: 3px solid black;
}
</style>
