<script type="text/x-template" id="t-mg-one-page-complete-order-{$elementId|strtolower}" :component_id="component_id"
        :component_namespace="component_namespace" :component_index="component_index">

    <div class="section" v-if="isVisible">
        <div class="message message-lg message-no-data" v-if="redirectButton && redirectionType === 'gateway'">
            <div class="loader">
                <div class="spinner ">
                    <div class="rect1"></div>
                    <div class="rect2"></div>
                    <div class="rect3"></div>
                    <div class="rect4"></div>
                    <div class="rect5"></div>
                </div>
            </div>
            <h2 class="message-text message-title">{$MGLANG->absoluteT('LagomOrderForm','complete','redirect', 'description')} </h2>
            <div id="frmPayment">
                <div v-html="redirectButton"></div>
            </div>
        </div>
        <div class="message message-success message-lg message-no-data" v-else>
            <div class="message-icon">
                <i class="lm lm-check"></i>
            </div>
            <h3 class="message-text message-title" v-if="status === 'placed'">{$MGLANG->absoluteT('LagomOrderForm','complete','orderPlaced')} {literal}#{{orderId}}{/literal}</h3>
            <h3 class="message-text message-title" v-if="status === 'completed'">{$MGLANG->absoluteT('LagomOrderForm','complete','orderCompleted')} {literal}#{{orderId}}{/literal}</h3>
            <p class="text-center text-light">{$MGLANG->absoluteT('LagomOrderForm','complete','questionAboutOrder')}</p>
            <div>
                <a href="/clientarea.php" class="btn btn-default">
                    {$MGLANG->absoluteT('LagomOrderForm','complete','goToClientArea')}
                </a>
                <a :href="'viewinvoice.php?id='+invoiceId" class="btn btn-default" v-if="invoiceId">
                    {$MGLANG->absoluteT('LagomOrderForm','complete','goToInvoice')}
                </a>
            </div>
        </div>
    </div>
</script>