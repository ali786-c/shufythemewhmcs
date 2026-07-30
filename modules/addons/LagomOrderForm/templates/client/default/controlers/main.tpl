<div class="mg-wrapper body" data-target=".body" data-spy="scroll" data-twttr-rendered="true">

    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <link rel="stylesheet" href="{$fullAssetsURL}/css/layers-ui.css?version={$moduleVersion}">
    <link rel="stylesheet" href="{$fullAssetsURL}/css/mg_styles.css?version={$moduleVersion}">
    {if $isCustomModuleCss}
        <link rel="stylesheet" href="{$fullAssetsURL}/css/module_styles.css?version={$moduleVersion}">
    {/if}

    <div class="full-screen-module-container" id="layers">
        <div class="lu-app">
            {$content}
        </div>
    </div>
</div>

{if $isDebug}
    <script type="text/javascript" src="https://unpkg.com/vue@2.6.14/dist/vue.js"></script>
    <script type="text/javascript" src="https://unpkg.com/vuex@3.1.0/dist/vuex.js"></script>
{else}
    <script type="text/javascript" src="{$fullAssetsURL}/js/vue.min.js?version={$moduleVersion}"></script>
    <script type="text/javascript" src="{$fullAssetsURL}/js/vuex.min.js?version={$moduleVersion}"></script>
{/if}
<script type="module" src="{$fullAssetsURL}/js/lottie.min.js?version={$moduleVersion}"></script>
<script type="text/javascript" src="{$fullAssetsURL}/js/mgComponents.js?version={$moduleVersion}"></script>
<script type="text/javascript" src="{$fullAssetsURL}/js/LagomOrderForm.min.js?version={$moduleVersion}"></script>
<script type="text/javascript" src="{$fullAssetsURL}/js/jscolor.min.js?version={$moduleVersion}"></script>
<script type="text/javascript" src="{$fullAssetsURL}/js/layers-ui.js?version={$moduleVersion}"></script>
<script type="text/javascript" src="{$fullAssetsURL}/js/chart.min.js?version={$moduleVersion}"></script>
<script type="module" src="{$fullAssetsURL}/js/swiper-bundle.min.js?version={$moduleVersion}"></script>
<script type="module" src="{$fullAssetsURL}/js/pagination.min.js?version={$moduleVersion}"></script>
<script src="https://unpkg.com/vue-inline-svg"></script>
<script src="https://unpkg.com/vue-cookies@1.7.4/vue-cookies.js"></script>
<div class="clear"></div>
