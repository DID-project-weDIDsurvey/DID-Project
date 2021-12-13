<template>
    <div>
        asddsad
        <PossibleHeader />
        <PossibleMain />
        <PossibleModal />
    </div>
</template>

<script>
import PossibleHeader from '@/components/Possible/PossibleHeader.vue'
import PossibleMain from '@/components/Possible/PossibleMain.vue'
import PossibleModal from '@/components/Possible/PossibleModal.vue'

export default {
    name: 'Possible',

    components: {
        PossibleHeader,
        PossibleMain,
        PossibleModal
    },
    data() {
        return {}
    }
}
</script>
