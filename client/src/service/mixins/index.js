import axios from 'axios'
axios.defaults.baseURL = 'http://localhost:3000'
axios.defaults.headers.post['Content-Type'] = 'application/json;charset=utf-8'
axios.defaults.headers.post['Access-Control-Allow-Origin'] = '*'

export default {
    methods: {
        async $api(url, method, data) {
            return (
                await axios({
                    method: method,
                    url: url,
                    data: data
                }).catch(e => {
                    console.log(e)
                })
            ).data
        },
        async $upload(url, file, description) {
            const formData = new FormData()
            formData.append('attachment', file)
            formData.append('description', description)

            return (
                await axios
                    .post(url, formData, {
                        headers: { 'Content-Type': 'multipart/form-data' }
                    })
                    .catch(e => {
                        console.log(e)
                    })
            ).data
        },
        async decrypt(vcKey) {
            // window ethereum 있는지 없는지 체크하는 부분 필요

            // VC 복호화
            const decryptVC = await window.ethereum.request({
                method: 'eth_decrypt',
                params: [
                    localStorage.getItem(vcKey),
                    this.$store.state.web3.coinbase
                ]
            })

            // 복호화 VC JSON parsing 후 store에 저장
            this.$store.commit('addDecryptVC', JSON.parse(decryptVC))
        }
    }
}
