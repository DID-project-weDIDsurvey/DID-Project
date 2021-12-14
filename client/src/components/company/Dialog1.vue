<template>
    <v-dialog v-model="dialog11" persistent width="500">
        <v-card>
            <v-card-title class="white--text deep-purple accent-4">
                {{ ment }}
                <span class="ml-5">
                    <v-btn
                        @click="$emit('close-modal1')"
                        class="deep-purple--text white accent-4"
                    >
                        <v-icon>mdi-close</v-icon></v-btn
                    >
                </span>
            </v-card-title>
        </v-card>
    </v-dialog>
</template>
<script>
export default {
    name: '',
    components: {},
    props: ['ment', 'dialog11']
}
</script>
