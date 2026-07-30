<script type="text/x-template" id="t-mg-one-page-billing-cycles-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
    <div class="section" :class="[{ 'section--full-width': !showNumber}, { 'billing-cycle-padding': showNumber} ,{ 'section-packages': !isOneStep}]" v-if="isVisible && billingCycles">
        <div class="section-number" v-if="showNumber">X</div>

        <div class="section-header" >
            <h2 class="section-title">{$MGLANG->absoluteT('LagomOrderForm','section','title','billing_cycles')}</h2>
        </div>
        <div class="section-body">
            <div class="row row-eq-height row-eq-height-xs m-b-neg-24 m-b-neg-3x">
                <div :class="getClass()"
                     v-for="(option, cycle) in billingCycles">
                    <div class="panel panel-check panel-billingcycle" v-bind:class="[isSelected(cycle) ? 'checked': '']" v-on:click="setBillingCycle(cycle)">
                        <div class="panel-body check">
                            <span class="check-sign"><i class="ls ls-check"></i></span>
                            <h6 class="check-cycle" v-if="option" v-html="getTranslatedMessage(option.cycle)"></h6>
                            <span class="price price-sm">
                                <span v-if="option.discountPrice">
                                    <span class="price-savings">
                                        <span v-html="option.price"></span>
                                        <div class="price-discount" v-html="`{$MGLANG->absoluteT('LagomOrderForm','section','billing_cycle','save')} ` + option.discountPercentage" v-if="layoutSettings.enableDiscountPercentage"></div>
                                    </span>
                                    <span v-html="option.discPrice"></span>
                                </span>
                                <span v-else-if="option.fullPrice">
                                    <span class="price-savings">
                                        <span v-html="option.fullPrice"></span>
                                        <div class="price-discount" v-html="`{$MGLANG->absoluteT('LagomOrderForm','section','billing_cycle','save')} ` + option.comparisonPercentage"></div>
                                    </span>
                                    <span v-html="option.price"></span>
                                </span>
                                <span v-else v-html="option.price"></span>
                            </span>
                            <span v-if="orderSettings.ProductMonthlyPricingBreakdown == 'on'" v-html="option.monthlyPrice + ' ' +`{$MGLANG->absoluteT('LagomOrderForm','billingCycles', 'per_month')}`"></span>
                            <span v-if="option && option.discountSetupFee">
                                <span class="price-savings"><span v-html="option.setupFee"></span></span>
                                <span class="check-desc ml-2" v-html="'+ ' + option.discountSetupFee"></span>
                            </span>
                            <span class="check-desc" v-else-if="option && option.setupFee" v-html="'+ ' + option.setupFee"></span>
                            <div class="panel-footer" v-if="!layoutSettings.hideBillingCyclesButtons">
                                <button class="btn btn-primary-faded btn-sm has-loader" v-if="!((chosenItem != 0 && selectedBillingCycle == cycle) || (chosenItem == 0 && selectedBillingCycle == cycle))" :class="[{ 'is-loading' : showLoaderOnCycle == cycle}]">
                                    <span class="btn-text">
                                        {$MGLANG->absoluteT('LagomOrderForm','ordernowbutton')}
                                    </span>
                                    <div class="btn-loader" v-if="(showLoaderOnCycle == cycle) && !((chosenItem != 0 && selectedBillingCycle == cycle) || (chosenItem == 0 && selectedBillingCycle == cycle))">
                                        <div class="spinner spinner-sm">
                                            <div class="rect1"></div>
                                            <div class="rect2"></div>
                                            <div class="rect3"></div>
                                            <div class="rect4"></div>
                                            <div class="rect5"></div>
                                        </div>
                                    </div>
                                </button>
                                <button class="btn btn-sm btn-primary" v-else>
                                    <span class="btn-text">
                                        <i class="ls ls-check"></i>
                                        {$MGLANG->absoluteT('LagomOrderForm','is_product_selected')}
                                    </span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</script>
