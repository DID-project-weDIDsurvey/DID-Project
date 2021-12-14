<template>
    <div class="text-center">
        <v-btn
            class="white--text"
            color="deep-purple accent-4"
            @click="checked()"
        >
            검증
        </v-btn>
        <!-- 하나만 선택했을때 첫번째 모달창 -->
        <Dialog
            :ment="'잠시만 기다려 주세요 해당 유저의 정보를 검증하는 중입니다.'"
            :dialog00="dialog"
        />

        <!-- 하나만 선택했을때 두번째 모달창 -->
        <v-dialog v-model="dialog1" width="500">
            <v-card>
                <v-card-title class="white--text deep-purple accent-4">
                    검증 결과
                </v-card-title>

                <v-card-text class="mt-5">
                    <h2>검증기관 :</h2>
                    BC카드(0x0d309284F3c761FD31F02084207c1f86f0B1e0af)
                </v-card-text>

                <v-card-text>
                    <h2>DID</h2>
                    {{ selectedAccount }}
                </v-card-text>
                <v-card-text>
                    <h2>검증결과 :</h2>
                    {{ same }}
                </v-card-text>
                <v-card-text>
                    <h2>제공한 VP :</h2>
                    {{ decMsg }}
                </v-card-text>
                <v-card-text>
                    <h2>검증</h2>
                    <v-switch
                        color="deep-purple accent-4"
                        v-model="showMessages"
                        label="검증기관이 유저 암호화된 공개키로 암호화"
                    ></v-switch>

                    <v-input
                        hint="데이터 확인"
                        persistent-hint
                        :messages="messages"
                    >
                        암호화 데이터
                    </v-input>

                    <v-switch
                        color="deep-purple accent-4"
                        v-model="showMessages1"
                        label="의뢰업체가 유저 암호화된 공개키로 암호화"
                    ></v-switch>
                    <br />
                    <v-input
                        hint="데이터 확인"
                        persistent-hint
                        :messages="messages1"
                    >
                        암호화 데이터
                    </v-input>
                </v-card-text>

                <v-divider></v-divider>

                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn
                        class="white--text deep-purple accent-4"
                        text
                        @click="dialog1 = false"
                    >
                        확인
                    </v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
        <!-- 아무것도 선택 안했을때 모달창 -->
        <Dialog1
            :ment="'선택한 설문조사 참가자가 없습니다.'"
            :dialog11="dialog2"
            @close-modal1="dialog2 = false"
        />

        <!-- 중복체크 했을때 첫번째 모달창 -->
        <Dialog
            :ment="
                '잠시만 기다려 주세요 선택한 유저들의 정보를 불러오는 중입니다.'
            "
            :dialog00="dialog3"
        />
        <!-- 중복체크 했을 때 두번째 모달창 -->
        <Dialog1
            :ment="'검증결과 모두 정상입니다.'"
            :dialog11="dialog4"
            @close-modal1="dialog4 = false"
        />
    </div>
</template>
<script>
import Dialog from './Dialog.vue'
import Dialog1 from './Dialog1.vue'
import getContract2 from '@/service/getContract2'

export default {
    components: { Dialog, Dialog1 },
    props: {
        // 암호화된 유저 vp 정보
        userVp: {
            type: String,
            default: ''
        },
        selected1: {
            type: Array,
            default: function() {
                return []
            }
        },
        vcList2: {
            type: Array,
            default: function() {
                return []
            }
        }
    },

    data() {
        return {
            dialog: false,
            dialog1: false,
            dialog2: false,
            dialog3: false,
            dialog4: false,
            decMsg: null,
            iC: null,
            verificationEncMsg: null,
            encMsg: null,
            vcList3: null,
            same: null,
            showMessages: false,
            showMessages1: false
        }
    },
    created() {
        this.issuerContractInstance()
        this.vcList3 = this.vcList2
    },
    computed: {
        messages() {
            return this.showMessages ? this.verificationEncMsg : undefined
        },
        messages1() {
            return this.showMessages1 ? this.encMsg : undefined
        },
        selectedAccount() {
            return this.selected1[0]
        }
    },

    watch: {
        // 중복선택 했을때 모달창 온오프
        dialog3(val) {
            if (!val) return

            setTimeout(() => this.modalUp1(), 4000)
            // alert('hello')
        }
    },
    methods: {
        // 모달창을 번갈아 가면서 띄우기 위해
        modalUp() {
            this.dialog = false
            this.dialog1 = true
        },
        modalUp1() {
            this.dialog3 = false
            this.dialog4 = true
        },
        // 암호화된 Vp 파일을 가져와 복호화 한다
        async decrypt() {
            try {
                this.decMsg = await window.ethereum.request({
                    method: 'eth_decrypt',
                    params: [this.userVp, this.$store.state.web3.coinbase]
                })
                await this.encryptedMessage()
                this.dialog = true
                this.verificationCall()
                // setTimeout(() => this.modalUp(), 4000)
            } catch {
                alert('암호를 풀 수 없습니다')
            }
        },
        // 하나 선택, 중복 선택, 선택x 를 판별 후 적절한 모달창 오픈
        checked() {
            if (this.selected1.length === 0) {
                console.log('여기0')

                this.dialog2 = true
            } else if (this.selected1.length === 1) {
                console.log('여기1')

                this.decrypt()
            } else {
                console.log('여기2')
                this.dialog3 = true
                setTimeout(() => this.modalUp1(), 4000)
            }
        },
        issuerContractInstance() {
            console.log('연결시도')
            if (this.iC === null) {
                console.log('연결완료')
                var getContract223 = getContract2()
                this.iC = getContract223
                console.log('ContractInstance', this.iC)

                // this.verificationCall실행해서 결과가 나오면 실행됨
                this.iC.events.Approval({}, async (error, event) => {
                    console.log('여기는 2')

                    console.log(error)
                    console.log(event)

                    // 검증기관에서 하는 역할. 지금은 우리가 대신함.
                    console.log('암호화', this.encMsg)
                    this.forCompany1(
                        event.returnValues[0],
                        this.encMsg
                        // .slice(2, 20)
                    )
                })
            }
        },
        // 검증기관에서 유저 암호화된 공개키로 암호화 해서 등록
        forCompany1(verificationCallCount, encryptVC) {
            console.log('여기는 3')

            this.iC.methods
                // vc이름과 유저 암호화된 공개키로 암호화된 데이터
                .forCompany(verificationCallCount, encryptVC)
                .send({ from: this.$store.state.web3.coinbase })
                // 내 주소
                .then(receipt => {
                    console.log(receipt)
                    this.encryptForCompany1(verificationCallCount)
                })
        },
        // 검증기관에서 보내준 유저 암호화된 공개키로 암호화한 VC 데이터 불러오기
        encryptForCompany1(verificationCallCount) {
            console.log('여기는 4')

            this.iC.methods
                .encryptForCompany(verificationCallCount)
                .call()
                .then(result => {
                    this.verificationEncMsg = result
                    this.modalUp()
                    console.log(
                        '검증기관에서 유저 암호화된 공개키로 암호화',
                        this.verificationEncMsg
                    )
                    console.log(
                        '내가 복호화한 데이터를 유저 암호화된 공개키로 암호화',
                        this.encMsg
                    )
                    if (this.verificationEncMsg === this.encMsg) {
                        this.same = true
                    } else {
                        this.same = false
                    }
                })
        },
        // 검증 업체에 검증 요청, 유저의 암호화된 공개키, 검증하려는 vc이름
        // 검증해다랄고 요청 보냄
        verificationCall() {
            console.log('여기는 1')
            console.log('vclist가져오니', this.vcList3)

            const listUp = this.vcList3.toString()
            console.log(listUp)
            console.log('여기는 때문?')
            this.iC.methods
                .approval(
                    'oYDUi/TuHJetEVDypjFJywDbcIUPXpzqj8U5eGHeWSs=',
                    listUp
                )
                .send({ from: this.$store.state.web3.coinbase })
                // 내 주소
                .then(receipt => {
                    console.log(receipt)
                })
        },
        encryptedMessage() {
            console.log('여기는 0')

            const sigUtil = require('eth-sig-util')
            // eth-sig-util: A small collection of Ethereum signing functions
            const msg = JSON.stringify(this.decMsg)
            console.log(this.decMsg)
            console.log(msg)
            // Buffer는 binary의 데이터를 담을 수 있는 object
            const buf = Buffer.from(
                JSON.stringify(
                    sigUtil.encrypt(
                        'oYDUi/TuHJetEVDypjFJywDbcIUPXpzqj8U5eGHeWSs=',
                        { data: msg },
                        'x25519-xsalsa20-poly1305'
                    )
                ),
                'utf8'
            )
            return (this.encMsg = '0x' + buf.toString('hex'))
        }
    }
}
</script>
<style scoped>
.loaderColor {
    background-color: slateblue;
}
</style>
