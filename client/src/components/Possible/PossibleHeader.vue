<template>
    <div class="banner">
        <div style="justify-content:center; display:flex;">
            <div class="text pt-1" style="color:white;  margin-left:20px">
                <!-- 배너 제목 -->
                <div
                    style="color:white; font-size:1.5em;"
                    class="d-flex align-center mr-5"
                >
                    설문참여
                </div>
                <!-- 배너 세부 내용 -->
                <div>
                    <span style="font-size:1.2em">
                        더 많이 참여하고 더 많이 받아가세요
                    </span>
                    <br />
                    <span style="font-size:0.8em">
                        지금 서베이에 참여하고 더 많은 WeDIDsurvey 포인트를
                        쌓아보세요.
                    </span>
                </div>
            </div>
        </div>
        <img src="@/assets/images/components/banner.png" />
    </div>
</template>
<script>
export default {
    name: 'PossibleHeader'
}
</script>

<style>
.banner {
    position: relative;
    left: 47rem;
}

.text {
    position: absolute;
    top: 2.5em;
    display: flex;
    flex-direction: row;
}
</style>
