{if $isDebug}
    <script type="text/javascript" src="https://unpkg.com/vue@2.6.14/dist/vue.js"></script>
    <script type="text/javascript" src="https://unpkg.com/vuex@3.1.0/dist/vuex.js"></script>
    <script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script type="text/javascript" src="https://unpkg.com/qs/dist/qs.js"></script>
{else}
    <script type="text/javascript" src="{$assetsURL}/js/vue.min.js?version={$moduleVersion}"></script>
    <script type="text/javascript" src="{$assetsURL}/js/vuex.min.js?version={$moduleVersion}"></script>
    <script type="text/javascript" src="{$assetsURL}/js/axios.min.js?version={$moduleVersion}"></script>
    <script type="text/javascript" src="{$assetsURL}/js/qs.min.js?version={$moduleVersion}"></script>
{/if}
<script type="module" src="{$assetsURL}/js/lottie.min.js?version={$moduleVersion}"></script>
<script type="text/javascript" src="{$assetsURL}/js/moment.js?version={$moduleVersion}"></script>
<script type="text/javascript" src="{$assetsURL}/js/mgComponents.js?version={$moduleVersion}"></script>
<script type="text/javascript" src="{$assetsURL}/js/LagomOrderForm.min.js?version={$moduleVersion}"></script>
<script type="text/javascript" src="{$assetsURL}/js/jscolor.min.js?version={$moduleVersion}"></script>
<script type="text/javascript" src="{$assetsURL}/js/layers-ui.js?version={$moduleVersion}"></script>
<script type="text/javascript" src="{$assetsURL}/js/layers-ui-table.js?version={$moduleVersion}"></script>
<script type="text/javascript" src="{$assetsURL}/js/chart.min.js?version={$moduleVersion}"></script>
<script type="module" src="{$assetsURL}/js/swiper-bundle.min.js?version={$moduleVersion}"></script>
<script type="module" src="{$assetsURL}/js/pagination.min.js?version={$moduleVersion}"></script>
<script src="https://unpkg.com/vue-inline-svg"></script>
<script src="https://unpkg.com/vue-cookies@1.7.4/vue-cookies.js"></script>