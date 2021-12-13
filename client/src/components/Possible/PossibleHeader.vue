<template>
    <!-- 메인 배너 -->
    <div
        class="d-flex justify-center align-center gradient"
        style="padding-bottom:20px; padding-top:23px;"
    >
    <div class="banner">
           <div class="img" style="justify-content:center; display:flex;">
            <div class="text pt-1" style="color:white;  margin-left:20px">
                <div
                align="left"
                style="color:white; font-size:1.5em;"
                class="d-flex align-center mr-5"
            >
                설문참여
                </div>
                <div>
                    <span style="font-size:1.2em">
                    더 많이 참여하고 더 많이 받아가세요</span><br>
                <span style="font-size:0.8em">
                    지금 서베이에 참여하고 더 많은 WeDIDsurvey 포인트를
                    쌓아보세요.
                    </span>
                </div>
            </div>
        </div>
        <img src="@/assets/img/trade/banner-2.png" class="img-bn-class" />


        </div>
    </div>
</template>

<script>
export default {
    name: 'PossibleHeader'
}
</script>

<style>

.gradient {
    width: 254px;
    background: linear-gradient(#F8F8F9 100%, white 0%)
}

.banner {
    position: relative;
    left: 47rem
}

.img {
position:relative;
}
.text {
 position:absolute;
  top:2.5em;
  display:flex;
  flex-direction: row;

}
</style>
