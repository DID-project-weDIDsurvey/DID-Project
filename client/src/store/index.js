import Vue from 'vue'
import Vuex from 'vuex'
import persistedstate from 'vuex-persistedstate'

import getWeb3 from '@/service/getWeb3'
import pollWeb3 from '@/service/pollWeb3'

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
            vcItemList: [],
            encMsg: null,
            reservedSurvey: []
        }
    },
    mutations: {
        registerWeb3Instance(state, data) {
            // 요청된 web3 instance를 store에 저장
            state.web3 = data
            pollWeb3()
        },
        // Web3Instance(state, data) {
        //     // 요청된 web3 instance를 store에 저장
        //     state.web33 = data
        //     console.log('hello web3')
        // },
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

        // vcItemList store에 저장
        addVcItemList(state, data) {
            state.vcItemList = data
        },

        encMsg(state, data) {
            state.encMsg = data
        },

        // 찜한 설문 store에 저장
        addReservedSurvey(state, data) {
            state.reservedSurvey.push(data)
        },

        // 찜한 설문 store에 초기화
        initReservedSurvey(state) {
            state.reservedSurvey = []
        }

        // makeSurveyContract(state, data) {
        //     state.surveyContract = data
        // },
        // surveyContractInstance(state, data) {
        //     // console.log('survey contract instance: ', data)
        //     state.surveyContract = data
        // },
        // vcContractInstance(state, data) {
        //     // console.log('vc contract instance: ', data)
        //     state.vcContract = data
        // }
    },
    actions: {
        async registerWeb3({ commit }) {
            console.log('actions')
            // web3 instance 요청
            var web3 = await getWeb3()
            console.log(web3)
            commit('registerWeb3Instance', web3)
        },

        // getSurveyContractInstance({ commit }) {
        //     console.log('startSurvey')
        //     var getContract21 = getContract()
        //     commit('surveyContractInstance', getContract21)
        // },

        // getVcContractInstance({ commit }) {
        //     console.log('startVc')
        //     var getContract21 = getContract1()
        //     commit('vcContractInstance', getContract21)
        // },

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
