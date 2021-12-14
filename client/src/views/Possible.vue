<template>
    <div>
        <PossibleHeader />
        <PossibleMain />
        <PossibleModal />
    </div>
</template>

<script>
import PossibleHeader from '@/components/possible/PossibleHeader.vue'
import PossibleMain from '@/components/possible/PossibleMain.vue'
import PossibleModal from '@/components/possible/PossibleModal.vue'

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
