<script type="text/x-template" id="t-mg-one-page-ip-log-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
    <div class="section" :class="[{ 'section--full-width': !showNumber}]" v-if="ipAddress.isSsl && isVisible">
        <div class="section-body">

            <h1>{$servedOverSsl}</h1>

            <div class="alert alert-warning alert-primary checkout-security-msg">
                <div class="alert-body">
                    <i class="ls ls-shield"></i>
                    <span>
                        {$MGLANG->absoluteT('LagomOrderForm','section','ipLog','orderSecure')} (<strong v-html="ipAddress.ip"></strong>) {$MGLANG->absoluteT('LagomOrderForm','section','ipLog','orderSecure2')}
                    </span>
                </div>
            </div>
        </div>
    </div>
</script>	