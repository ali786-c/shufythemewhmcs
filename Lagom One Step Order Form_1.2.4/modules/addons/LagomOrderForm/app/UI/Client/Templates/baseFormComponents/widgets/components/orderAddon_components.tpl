<script type="text/x-template" id="t-mg-one-page-order-addon-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
    <div class="section" :class="[{ 'section--full-width': !showNumber}]" v-if="isVisible">
        <div class="section-number" v-if="showNumber">X</div>
        <div class="section-header has-toolbar">
            <h2 class="section-title">{$MGLANG->absoluteT('LagomOrderForm','products','addons','section','title')}</h2>
            <div class="section-toolbar">
                <div class="search-group">
                    <div class="search-field search-field-sm">
                        <i class="search-field-icon lm lm-search"></i>
                        <form autocomplete="off">
                            <input type="text" id="table-search" class="form-control input-sm" placeholder="{$MGLANG->absoluteT('search')}" v-model="searchedWord">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="section-body">
            <div class="panel panel-addon has-actions-right" v-for="addon in availableAddons" v-if="availableAddons.length > 0 && isAddonAvailable(addon)">
                <div class="panel-body">
                    <h4 class="panel-title" v-html="addon.name"></h4>
                    <p class="panel-desc" v-html="addon.description.original"></p>
                </div>
                <div class="panel-actions">
                    <div class="panel-actions-price" v-if="addon.paytype == 'free'">
                        <div class="price" >{$MGLANG->absoluteT('LagomOrderForm','products','addons','pricing','free')}</div>
                    </div>
                     <div class="panel-actions-price" v-else>
                        <span class="price price-right">
                            <span class="price-savings" v-if="getAddonDiscountPrice(addon)">
                                <span v-html="getAddonRegularPrice(addon)"></span>
                            </span>
                            <div>
                                <span v-html="getAddonFinalPrice(addon)"></span>
                            </div>
                        </span>
                         <span class="price-savings align-self-end" v-if="getAddonDiscountSetupFee(addon)">
                             <span v-html="getAddonRegularSetupFee(addon) + ' {$MGLANG->absoluteT('LagomOrderForm','product', 'setupFee')}'"></span><br>
                         </span>
                         <span class="price price-sm" v-if="getAddonRawSetupFee(addon) > 0">
                             <span v-html="getAddonFinalSetupFee(addon) + ' {$MGLANG->absoluteT('LagomOrderForm','product', 'setupFee')}'"></span>
                         </span>
                    </div>
                    <div class="btn-group" v-if="hasSelectedAddon(addon.id)">
                        <button class="btn btn-sm btn-primary no-hover" style="min-width: 0"> {$MGLANG->absoluteT('LagomOrderForm','addons','order','added')}</button>
                        <button type="button" class="btn btn-sm btn-primary btn-icon" style="min-width: 0" @click="removeAddon(addon.id)"><i class="ls ls-close"></i></button>
                    </div>
                    <button class="btn btn-sm btn-primary-faded" data-toggle="modal" data-target="#orderAddonModal" v-else @click="openModalAddon(addon)">
                        {$MGLANG->absoluteT('LagomOrderForm','products','addons','order','add')}
                    </button>
                    <button class="btn btn-sm btn-primary-faded" v-else @click="addAddonWithoutBillingCycle(addon)" >
                        {$MGLANG->absoluteT('LagomOrderForm','products','addons','order','add')}
                    </button>
                </div>
                <span class="check-sign"><i class="ls ls-check"></i></span>
            </div>

            <div class="message message-danger message-lg message-no-data" v-if="availableAddons.length == 0">
                <div class="message-icon">
                    <i class="lm lm-close"></i>
                </div>
                <h3 class="message-text message-title">{$MGLANG->absoluteT('LagomOrderForm','products','addons','alert','noAddons')}</h3>
            </div>

        <div class="modal fade" id="orderAddonModal">
            <div class="modal-dialog" >
                <div class="modal-content" v-if="addonToModal">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="lm lm-close"></i></button>
                        <h3 class="modal-title">{$MGLANG->absoluteT('LagomOrderForm','products','addons','select','product','title')}</h3>
                    </div>
                    <div class="modal-body">
                        <div class="form-group" v-if="addonToModal.paytype === 'recurring'">
                            <p>{$MGLANG->absoluteT('LagomOrderForm','products','addons','select','description','billingCycle')}</p>
                            <select class="form-control" v-model="selectedCycle">
                                <option v-for="(pricing, index) in addonToModal.pricings[currency]" :value="index">
                                    <span v-if="pricing.price" v-html="pricing.cycle + ' - ' + getModalAddonPrice(pricing)" ></span>
                                    <span v-else v-html="pricing.cycle" ></span>
                                </option>
                            </select>
                        </div>
                        <div class="form-group">
                            <p>{$MGLANG->absoluteT('LagomOrderForm','products','addons','select','description','product')}</p>
                            <select class="form-control" v-model="selectedProduct">
                                <option v-for="hosting in addonToModal.hostings"  :value="hosting.hostingId">
                                    <span v-if="hosting.productDomain" v-html="hosting.productName + ' - ' + hosting.productDomain"></span>
                                    <span v-else v-html="hosting.productName"></span>
                                </option>
                            </select>
                        </div> 
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" @click="addAddon()">{$MGLANG->absoluteT('LagomOrderForm','products','addons','select','product','add')}</button>
                        <button type="button" class="btn btn-default" @click="closeModalAddon()">{$MGLANG->absoluteT('LagomOrderForm','products','addons','select','product','cancel')}</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</script>