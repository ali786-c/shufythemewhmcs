{if $mainAssetsUrl}
    <link rel="stylesheet" href="{$mainAssetsUrl}">
{/if}
{* {debug} *}
{if $isCustomModuleCss}
    <link rel="stylesheet" href="{$customAssetsURL}/css/module_styles.css?version={$moduleVersion}">
{/if}

{if !$isLagomTemplate}
    {if $isDebug}
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.13.2/js/selectize.min.js"></script>
    {else}
        <script type="text/javascript" src="{$fullAssetsURL}/js/selectize.min.js?version={$moduleVersion}"></script>
    {/if}
{/if}

{foreach from=$integrations key=varible item=value}
    <div class="mg-integration-container" mg-integration-target="{$value.integrationDetails->getJqSelector()}" mg-integration-type="{$value.integrationDetails->getIntegrationType()}"
         mg-integration-function="{$value.integrationDetails->getJsFunctionName()}">
        {$value.htmlData}
    </div>
{/foreach}

{if $mainContainer->useJsBuild()}
{elseif $isDebug}
    <script type="text/javascript" src="{$fullAssetsURL}/js/lottie.min.js?version={$moduleVersion}"></script>
    <script type="text/javascript" src="https://unpkg.com/vue@2.6.14/dist/vue.js"></script>
    <script type="text/javascript" src="https://unpkg.com/vuex@3.1.0/dist/vuex.js"></script>
    <script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script type="text/javascript" src="https://unpkg.com/qs/dist/qs.js"></script>
    <script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.5.1/nouislider.min.js'></script>
    <script type="text/javascript" src="{$fullAssetsURL}/js/mgComponents.js?version={$moduleVersion}"></script>
    {* <script type="text/javascript" src="{$fullAssetsURL}/js/layers-ui.js"></script> *}
    <script type="text/javascript" src="{$fullAssetsURL}/js/LagomOrderForm.min.js?version={$moduleVersion}"></script>
    <script type="text/javascript" src="{$fullAssetsURL}/js/swiper-bundle.min.js?version={$moduleVersion}"></script>
    <script type="text/javascript" src="{$fullAssetsURL}/js/pagination.min.js?version={$moduleVersion}"></script>
    <script src="https://unpkg.com/vue-inline-svg"></script>
    <script src="https://unpkg.com/vue-cookies@1.7.4/vue-cookies.js"></script>
{else}
    <script type="text/javascript" src="{$fullAssetsURL}/js/lottie.min.js?version={$moduleVersion}"></script>
    <script type="text/javascript" src="{$fullAssetsURL}/js/LagomOrderForm.min.js?version={$moduleVersion}"></script>
    <script type="text/javascript" src="{$fullAssetsURL}/js/swiper-bundle.min.js?version={$moduleVersion}"></script>
    <script type="text/javascript" src="{$fullAssetsURL}/js/pagination.min.js?version={$moduleVersion}"></script>
    <script src="https://unpkg.com/vue-inline-svg"></script>
    <script src="https://unpkg.com/vue-cookies@1.7.4/vue-cookies.js"></script>
    {* <script type="text/javascript" src="{$fullAssetsURL}/js/layers-ui.js"></script> *}
{/if}