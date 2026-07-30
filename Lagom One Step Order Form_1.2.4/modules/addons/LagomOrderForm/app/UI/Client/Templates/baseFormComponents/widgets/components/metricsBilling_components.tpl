<script type="text/x-template" id="t-mg-one-page-metrics-billing-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
    <div class="section" :class="[{ 'section--full-width': !showNumber}]" v-if="Object.keys(metricsBilling).length > 0 && isVisible">
        <div class="section-number" v-if="showNumber">X</div>
        <div class="section-header">
            <h2 class="section-title">{$MGLANG->absoluteT('LagomOrderForm','metrics')}</h2>
            <p class="section-desc">{$MGLANG->absoluteT('LagomOrderForm','metricsDescription')}</p>
        </div>
        <div class="section-body">
            <ul class="list-group list-group-bordered">
                <li class="list-group-item d-flex align-center space-between" v-for="item in metricsBilling">
                    <div v-if="Object.keys(item.nextFloors)[1] === undefined">
                        <span v-html="getTranslatedMessage(item.name) + ' - ' + item.price + getUnit(item.unit)"></span>
                        <span v-if="item.included" v-html="'(' + formatPrice.getFormattedPrice(item.included, 1) + ` {$MGLANG->absoluteT('LagomOrderForm','included')})`">
                        </span>
                    </div>
                    <span class="w-100" v-else>
                        <span v-html="getTranslatedMessage(item.name) + ' - ' + '{$MGLANG->absoluteT('LagomOrderForm','startingFrom')} ' + item.price + ' ' + getUnit(item.unit)"></span>
                        <button type="button" class="btn btn-default btn-xs float-right" data-toggle="modal" data-target="#modalMetricPricing" @click='setData(item.key)'>
                            {$MGLANG->absoluteT('LagomOrderForm','viewPricing')}
                        </button>
                    </span>
                </li>
            </ul>

            <div class="modal fade modal-metric-pricing" tabindex="-1" id="modalMetricPricing" role="dialog" >
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                            <h4 class="modal-title" v-html="getTranslatedMessage(name) + ' ' + `{$MGLANG->absoluteT('LagomOrderForm','pricing')}`"></h4>
                        </div>
                        <div class="modal-body">
                            <p v-if="type == 'flat'">{$MGLANG->absoluteT('LagomOrderForm','metricsFlatDescription')}</p>
                            <p v-else="type == 'grad'">{$MGLANG->absoluteT('LagomOrderForm','metricsGradDescription')}</p>
                            <table class="table m-b-0">
                                <thead>
                                <tr>
                                    <th class="text-center">{$MGLANG->absoluteT('LagomOrderForm','startingQuantity')}</th>
                                    <th class="text-center" v-html="getUnitModal(unit)"></th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="floor in floors">
                                    <td class="text-center" v-html="formatPrice.getFormattedPrice(floor.floor, 1)"></td>
                                    <td class="text-center" v-html="floor.price"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <p v-if="included" class="text-center" v-html="formatPrice.getFormattedPrice(included) + ` {$MGLANG->absoluteT('LagomOrderForm','included_long')}`"></p>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</script>
