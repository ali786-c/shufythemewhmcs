<script type="text/x-template" id="t-mg-one-page-promo-code-info-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
    <div class="promocode promocode--not-applied" v-if="cart.promo && !cart.promo.isApplied">
        <div class="alert alert-info" role="alert">
            <div class="alert-body">
                {$MGLANG->absoluteT('LagomOrderForm','cart','promo','notApplied')}
            </div>
        </div>
    </div>
</script>
