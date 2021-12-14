<template>
    <v-dialog v-model="dialog00" hide-overlay persistent width="500">
        <v-card class="deep-purple accent-4">
            <v-card-text class="white--text">
                {{ ment }}
                <v-progress-linear
                    indeterminate
                    color="white"
                    class="mb-0"
                ></v-progress-linear>
            </v-card-text>
        </v-card>
    </v-dialog>
</template>
<script>
export default {
    name: '',
    components: {},
    props: {
        ment: {
            type: String,
            default: ''
        },
        dialog00: {
            type: Boolean,
            default: true
        }
    }
}
</script>
