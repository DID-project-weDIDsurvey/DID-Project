<template>
    <div>
        <v-row justify="center">
            <v-dialog v-model="dialog" persistent max-width="300">
                <v-sheet class="rounded-xl">
                    <v-card-title class="text-center center">
                        바로 결제<img
                            width="40"
                            src="@/assets/img/mypage/coupon.png"
                            class="ml-3 mb-2"
                        />
                    </v-card-title>
                    <v-sheet color="white" class="mx-6 pb-3">
                        <barcode
                            class="barcode"
                            :value="barcodeValue"
                            displayValue="true"
                            width="2"
                            :text="`${barcodeText}`"
                            fontOptions="bold italic"
                            fontSize="20"
                        >
                        </barcode>
                        <qrcode-vue
                            class="qrcode my-5"
                            :value="qrValue"
                            :size="size"
                            level="H"
                        ></qrcode-vue>
                    </v-sheet>
                    <v-col col="12" class="center">
                        <v-card-actions>
                            <v-btn dark color="#ff8bbd">
                                <span class="pt-2">코드 스캐너</span>
                            </v-btn>
                            <v-btn
                                dark
                                color="#ff8bbd"
                                @click="$emit('close-modal')"
                            >
                                <span class="pt-2">닫기</span>
                            </v-btn>
                        </v-card-actions>
                    </v-col>
                </v-sheet>
            </v-dialog>
        </v-row>
    </div>
</template>
<script>
import QrcodeVue from 'qrcode.vue'
import VueBarcode from 'vue-barcode'
export default {
    name: '',
    components: { QrcodeVue, barcode: VueBarcode },
    props: ['dialog', 'qrValue', 'size', 'barcodeValue', 'barcodeText'],
    data() {
        return {}
    },
    setup() {},
    created() {},
    mounted() {},
    unmounted() {},
    methods: {}
}
</script>
<style>
.barcode {
    display: flex;
    justify-content: center;
}
.qrcode {
    display: flex;
    justify-content: center;
}
.center {
    display: flex;
    justify-content: center;
}
</style>
