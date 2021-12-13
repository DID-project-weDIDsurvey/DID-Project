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
import DefaultNavBar from './default/Navbar'
import DefaultFooter from './default/Footer'

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
