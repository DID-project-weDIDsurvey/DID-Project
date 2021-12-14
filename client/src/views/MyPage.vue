<template>
    <div>
        <!-- 유저 프로필 헤더 -->
        <!-- props로 넣어줘야 할 데이터는 유저 어드레스, 유저네임, 유저 프로필 이미지 패스 -->
        <MyPageHeader />
        <!-- 유저 프로필 상세 내용 -->
        <MyPageMain />
    </div>
</template>
<script>
import MyPageHeader from '@/components/mypage/MyPageHeader'
import MyPageMain from '@/components/mypage/MyPageMain'

export default {
    name: 'MypageView',
    components: { MyPageHeader, MyPageMain },
    data() {
        return {}
    },
    computed: {},
    mounted() {},
    unmounted() {},
    methods: {}
}
</script>
