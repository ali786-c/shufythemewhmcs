<script type="text/x-template" id="t-mg-one-page-currency-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
    <div class="main-header-actions" v-if="isVisible">
        <div class="dropdown">
            <a class="btn btn-outline" data-toggle="dropdown" href="#">{$MGLANG->absoluteT('LagomOrderForm', 'choosecurrency')}: <span v-html="selectedCurrency.code"></span><b class="ls ls-caret"></b></a>
            <div class="dropdown-menu dropdown-menu-right">
                <div class="dropdown-menu-item" :class="{ active: currency.id === selectedCurrency.id}" v-for="currency in currencies" v-on:click="changeCurrency(currency.id, true)"><a class="lu-btn--link" role="button" v-html="currency.code"></a></div>
            </div>
            <div class="package-popover popover popover-confirmation popover-currency bottom fade in" v-if="popoverIsVisible">
                <div class="arrow"></div>
                <div class="popover-title">
                    <i class="ls ls-info-circle"></i> {$MGLANG->absoluteT('LagomOrderForm','note')}
                </div>
                <div class="popover-content">
                    {$MGLANG->absoluteT('LagomOrderForm','currency_change_popover')}
                </div>
                <div class="popover-actions">
                    <button class="btn btn-xs btn-primary-faded" v-on:click="changeCurrency(currencyToPopover, false)">{$MGLANG->absoluteT('LagomOrderForm','confirm')}</button>
                    <button class="btn btn-xs btn-default" v-on:click="hidePopover()">{$MGLANG->absoluteT('LagomOrderForm','cancel')}</button>
                    <label class="checkbox checkbox-custom checkbox-sm">
                        <input type="checkbox" name="popoverNotShowAgain" class="" v-model="popoverNotShowAgain">
                        <span class="checkbox-styled"></span>
                        <div class="check-content">{$MGLANG->absoluteT('LagomOrderForm','doNotShowAgain')}</div>
                    </label>
                </div>
            </div>
        </div>
    </div>
</script>
