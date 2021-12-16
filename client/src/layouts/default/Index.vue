<template>
    <v-app>
        <!-- Top Navigation Bar -->
        <DefaultNavBar />
        <!-- Current View Page -->
        <router-view />
        <!-- Footer -->
        <DefaultFooter />
    </v-app>
</template>
<script>
import DefaultNavBar from './Navbar'
import DefaultFooter from './Footer'

export default {
    name: 'DefaultLayout',
    components: {
        DefaultNavBar,
        DefaultFooter
    },
    data: () => ({})
    // computed: {
    //     path() {
    //         return this.$route.path
    //     }
    // }
}
</script>
<style scoped>
.outLine {
    border: 5px solid black;
}
</style>
