<div class="body main-body {$appMainBodyClasses}" data-target=".body" data-spy="scroll" data-twttr-rendered="true" style="width: 100%">

    {* <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet"> *}

    {if $isCustomModuleCss}
        <link rel="stylesheet" href="{$customAssetsURL}/css/module_styles.css?version={$moduleVersion}">
    {/if}

    {$content}

</div>


{if $isDebug}
    <script type="text/javascript" src="{$fullAssetsURL}/js/lottie.min.js?version={$moduleVersion}"></script>
    <script type="text/javascript" src="https://unpkg.com/vue@2.6.14/dist/vue.js"></script>
    <script type="text/javascript" src="https://unpkg.com/vuex@3.1.0/dist/vuex.js"></script>
    <script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script type="text/javascript" src="https://unpkg.com/qs/dist/qs.js"></script>
    <script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.5.1/nouislider.min.js'></script>
    <script type="text/javascript" src="{$fullAssetsURL}/js/mgComponents.js?version={$moduleVersion}"></script>
    <script type="text/javascript" src="{$fullAssetsURL}/js/LagomOrderForm.min.js?version={$moduleVersion}"></script>
    <script type="text/javascript" src="{$fullAssetsURL}/js/swiper-bundle.min.js?version={$moduleVersion}"></script>
    <script type="text/javascript" src="{$fullAssetsURL}/js/pagination.min.js?version={$moduleVersion}"></script>
    <script type="text/javascript" src="{$fullAssetsURL}/js/layers-ui.js?version={$moduleVersion}"></script>
    <script src="https://unpkg.com/vue-inline-svg"></script>
    <script src="https://unpkg.com/vue-cookies@1.7.4/vue-cookies.js"></script>
{else}
    <script type="text/javascript" src="{$fullAssetsURL}/js/lottie.min.js?version={$moduleVersion}"></script>
    <script type="text/javascript" src="{$fullAssetsURL}/js/LagomOrderForm.min.js?version={$moduleVersion}"></script>
    <script type="text/javascript" src="{$fullAssetsURL}/js/swiper-bundle.min.js?version={$moduleVersion}"></script>
    <script type="text/javascript" src="{$fullAssetsURL}/js/pagination.min.js?version={$moduleVersion}"></script>
    <script type="text/javascript" src="{$fullAssetsURL}/js/layers-ui.js?version={$moduleVersion}"></script>
{/if}