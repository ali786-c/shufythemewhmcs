<script type="text/x-template" id="t-mg-one-page-payment-methods-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>

<div class="section payment-section" :class="[{ 'section--full-width': !showNumber}]" v-if="isVisible && (!$store.state.cartStore.areAvailableAddons || isAddonPage) ">
    <input class="hidden" id="isWhmcs88OrHigher" :value="$store.getters['cartStore/isWhmcs88OrHigher']()">
    <div class="section-number" v-if="showNumber">X</div>
    <div class="section-header">
        <h2 class="section-title">{$MGLANG->absoluteT('LagomOrderForm','payments','orderForm', 'paymentDetails')}</h2>
    </div>
    <div class="section-body" >
        <div class="panel panel-default panel-form" v-if="personalDetailsValid" id="payment-credits-component">
            <div class="panel-body">
                <div class="credit-balance">
                    <p class="credit-balance-title">{$MGLANG->absoluteT('LagomOrderForm','payments','orderForm', 'availableCredits')}</p>
                    <span v-html="personalDetails.credit.prefixed + (layoutSettings.displayPriceSuffix ? (' ' + currency.suffix) : '')"></span>
                </div>

                <div id="applyCreditContainer" class="apply-credit-container radio-content" data-apply-credit="1">
                    <div class="form-group">
                        <div class="radio radio-custom">
                            <label>
                                <input id="useFullCreditOnCheckout" type="radio" name="applycredit" class="" value="1" v-model="applyCredit">
                                <div class="radio-styled"></div>
                                {* <span v-html="getValidationMessage()">{$MGLANG->absoluteT('LagomOrderForm','payments','text', 'applyCreditAmountNoFurtherPayment')|html_entity_decode}</span> *}
                                {literal}
                                    <span v-html="getTranslatedMessage('applyCreditAmount', {amount: amount})" v-if="furtherPayment"></span>
                                    <span v-html="getTranslatedMessage('applyCreditAmountNoFurtherPayment', {amount: amount})" v-else></span>
                                {/literal}
                            </label>
                        </div>
                    </div>
                    <div class="form-group m-b-0">
                        <div class="radio radio-custom m-b-0">
                            <label>
                                <input id="skipCreditOnCheckout" type="radio" name="applycredit" value="0" class="" v-model="applyCredit" checked="checked">
                                <div class="radio-styled"></div>
                                <span>{$MGLANG->absoluteT('LagomOrderForm','payments','text', 'doNotApply')}</span>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel-group panel-group-condensed m-b-0" v-if="showPaymentGateways" id="payment-gateway-component" data-inputs-container >
            <div class="panel panel-check panel--no-border panel-check--payments" v-for="gateway in paymentGateways" v-if="isAvailableGateway(gateway)" data-virtual-input :class="isChecked(selectedGateway === gateway.gatewayKey)">
                <div class="panel-heading check check-custom">
                    <label>
                        <input :value="gateway.gatewayKey" class="" type="radio" name="payment_method" :id="'payment_' + gateway.gatewayKey" v-model="selectedGateway">
                        <div class="radio-styled"></div>
                        <div class="check-content" :class="{ 'has-pcg': gateway.charge && gateway.charge.isChargeable}">
                            <span v-html="gateway.name"></span>
                            <div class="pcg-label" v-if="gateway.charge && gateway.charge.isChargeable != 0">
                                <span>{$MGLANG->absoluteT('LagomOrderForm','payments','tab','gatewayCharge')} </span>
                                <span v-html="gateway.charge.fixed_amount"></span>
                            </div>
                        </div>
                        <img class="check-icon" v-bind:src="gateway.img.urlPath" />
                    </label>
                </div>
                <div class="panel-collapse collapse" v-bind:class="[(selectedGateway == gateway.gatewayKey ) ? 'in': '']" data-input-collapse role="tabpanel" v-if="gateway.type.toLowerCase() == 'cc' && !gateway.disableCC && (!gateway.charge || (gateway.charge && !gateway.charge.isChargeable))">
                    <div class="panel-body" :id="'mg-gateway-form-' + gateway.gatewayKey" >
                        <div v-if="getAvailableCreditCards(gateway)">
                            <ul class="nav nav-tabs m-b-20 m-b-2x nav-payment">
                                <li class="nav-item" :class="{ 'active': cardInfo == 'existing'}" data-toggle="tab" v-on:click="setCardInfo('existing')" v-if="getAvailableCreditCards(gateway).length > 0">
                                    <a href="" class="nav-link">
                                        <input type="radio" name="cardInfo" v-model="cardInfo" value="existing">
                                        <span> {$MGLANG->absoluteT('LagomOrderForm','payments','tab','existing')} </span>
                                    </a>
                                </li>
                                <li class="nav-item" :class="{ 'active': cardInfo == 'new'}" data-toggle="tab" v-on:click="setCardInfo('new')">
                                    <a href="" class="nav-link">
                                        <input type="radio" name="cardInfo" v-model="cardInfo" value="new">
                                        <span> {$MGLANG->absoluteT('LagomOrderForm','payments','tab','add')} </span>
                                    </a>
                                </li>
                            </ul>
                            <div class="cc-input-container m-t-2x" v-if="getAvailableCreditCards(gateway)">
                                <div class="cc-list" v-for="card in getAvailableCreditCards(gateway)" v-if="cardInfo == 'existing'">
                                    <label class="cc-item " :class="[{ 'active': ccinfo == card.id && !card.isExpired },{ 'disabled': card.isExpired }]">
                                        <div class="cc-item-checkbox radio-custom" style="margin-bottom:16px;">
                                            <input type="radio" :value="gateway.gatewayKey + '_' +card.id" :name="selectedGateway" v-model="ccinfoId" @click="enableCard(card.id, gateway.gatewayKey)" v-if="!card.isExpired">{* v-model="ccinfo" problem with v-model*}
                                            <input type="radio" :value="gateway.gatewayKey + '_' +card.id" :name="selectedGateway" v-model="ccinfoId" disabled v-else>
                                            <div class="d-block radio-styled" :class="{ 'disabled': card.isExpired }"></div>
                                        </div>
                                        <div class="cc-item-name">
                                            <span v-html="card.cardType+'-'+card.lastFour"></span>
                                        </div> &nbsp;
                                        <div class="cc-item-desc" v-if="card.description && card.description !== 'null'">
                                            <span v-html="card.description"></span>
                                        </div>
                                        <div class="cc-item-expiry">
                                            {$MGLANG->absoluteT('LagomOrderForm','payments','card','status','expiry_at')}
                                            <span v-html="card.expiry"></span>
                                        </div>
                                        <div class="cc-item-status" >
                                            <span class="status status-active" v-if="!card.isExpired">{$MGLANG->absoluteT('LagomOrderForm','payments','card','status','active')}</span>
                                            <span class="status status-expired" v-else>{$MGLANG->absoluteT('LagomOrderForm','payments','card','status','expired')}</span>
                                        </div>
                                        <div class="cc-item-icon">
                                            <inline-svg :src="card.img"></inline-svg>
                                        </div>
                                    </label>
                                </div>
                                <div class="form-group"  :class="{ 'has-error': cccvvError != false }" v-if="showCcvInput" :id="'mg-card-container-' + gateway.gatewayKey">
                                    <label class="control-label">{$MGLANG->absoluteT('LagomOrderForm','payments','card','status','ccv')}</label>
                                    <div class="form-tooltip">
                                        <input type="tel" name="cccvv" id="cccvv" class="form-control" placeholder="1234" autocomplete="off" v-model="cccvv">
                                        <div class="alert alert-danger alert-sm" v-if="cccvvError">
                                            {$MGLANG->absoluteT('LagomOrderForm','payments','card','status','ccvisNotValid')}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div :hidden="ccDetailsVisible ? false : true" :id="'mg-card-container-' + gateway.gatewayKey" v-if="cardInfo == 'new'">
                            <div class="alert alert-danger text-center gateway-errors hidden"></div>
                            <div class="m-w-400">
                                <label class="control-label">{$MGLANG->absoluteT( 'LagomOrderForm','payments','creditcardcardnumber')}</label>
                                <input type="tel"  placeholder="1234 1234 1234 1234" class="form-control" :id="'mg-card-' + gateway.gatewayKey" name="ccnumber" autocomplete="off">
                            </div>
                                <div class="form-group">
                                    <label for="inputDescription" class="control-label">
                                        {$MGLANG->absoluteT( 'LagomOrderForm','payments','provide','name')}
                                    </label>
                                    <input type="text" class="form-control" name="ccdescription" id="ccdescription" autocomplete="off" value="" v-model="ccDescription">
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                    <div class="m-w-400">
                                        <label class="control-label">{$MGLANG->absoluteT( 'LagomOrderForm','payments','creditcardcardexpires')}</label>
                                        <input type="tel" class="form-control" :id="'mg-card-expiry-' + gateway.gatewayKey" placeholder="{$MGLANG->absoluteT('mm / yy')}" name="ccexpirydate" autocomplete="off">
                                    </div>
                                    </div>
                                    <div class="col-md-6">
                                    <div class="m-w-400" id="inputCardCVV">
                                        <label class="control-label">{$MGLANG->absoluteT('LagomOrderForm','payments', 'creditcardcvvnumber')}</label>
                                        <input type="tel" class="form-control" :id="'mg-card-cvv-' + gateway.gatewayKey" name="cccvv" placeholder="1234" autocomplete="off">
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
</script>