import Vue from 'vue'
import Vuex from 'vuex'
import persistedstate from 'vuex-persistedstate'

import getWeb3 from '@/service/getWeb3'
import pollWeb3 from '@/service/pollWeb3'
// import justWeb3 from '@/service/justWeb3'

Vue.use(Vuex)

export default new Vuex.Store({
    strict: true,
    state() {
        return {
            web3: { isInjected: false, coinbase: null },
            loginStatus: false,
            survey: [],
            decryptVc: [],
            matchedSurvey: [],
            vcItemList: []
        }
    },
    mutations: {
        registerWeb3Instance(state, data) {
            // 요청된 web3 instance를 store에 저장
            state.web3 = data
            pollWeb3()
        },
        Web3Instance(state, data) {
            // 요청된 web3 instance를 store에 저장
            state.web33 = data
            console.log('hello web3')
        },
        updateWeb3Instance(state, data) {
            console.log('updateWeb3Instance', data)
            state.web3.isInjected = data.isInjected
            state.web3.coinbase = data.coinbase
        },
        loginStatus(state, data) {
            state.loginStatus = data
        },
        // registerContractInstance(state, data) {
        //     console.log('register contract instance', data)
        //     state.contractInstance = () => 'data'
        // }

        // decryptVc store에 저장/삭제
        addDecryptVc(state, data) {
            state.decryptVc = data
        },

        // matched Survey store에 저장/삭제
        addMatchedSurvey(state, data) {
            state.matchedSurvey = data
        },

        // vcItemList store에 저장/삭제
        addVcItemList(state, data) {
            state.vcItemList = data
        }
    },
    actions: {
        async registerWeb3({ commit }) {
            console.log('actions')
            // web3 instance 요청
            var web3 = await getWeb3()
            console.log(web3)
            commit('registerWeb3Instance', web3)
        },
        // pollWeb3 함수에서 실행한 결과를 커밋
        updateWeb3({ commit }, data) {
            commit('updateWeb3Instance', data)
        }
    },
    modules: {},
    plugins: [
        persistedstate({
            paths: ['vcList', 'web3', 'loginStatus']
        })
    ]
})
