<script type="text/x-template" id="t-mg-one-page-products-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
    <div class="section" :class="[{ 'section-packages': !isOneStep}]" v-if="isVisible">
        <div class="section-number" v-if="showNumber">X</div>
        <div class="section-header has-toolbar" v-if="isOneStep">
            <h2 class="section-title">{$MGLANG->absoluteT('LagomOrderForm','section','title','products')}</h2>
        </div>
        <div class="section-body">
            <div class="row row-eq-height row-eq-height-xs " :class="[{ 'm-b-neg-24 m-b-neg-3x': isOneStep}, { 'm-b-neg-24 m-b-neg-3x': !isOneStep}]">
                <div class="col-sm-12 col-xs-6 col-xxs-12" v-for="product in products" v-if="product.hidden == '0' || product.id == selectedProduct || product.id == refLinkProductId">
                    <div class="package package-horizontal" :class="getPackageHorizontalClass(product)"
                        v-on:click="{$rawObject->getOnClickAction()}"
                        >
                        <div class="package-side package-side-left">
                            <div class="package-header">
                                <span class="check-sign"><i class="ls ls-check"></i></span>
                                <h3 class="package-title package-name" :class="[{ 'h5': isOneStep}]">
                                    <span v-html="product.name"></span>
                                    <span v-if="product.is_featured === 1" class="label label-primary">{$MGLANG->absoluteT('LagomOrderForm','labels','featured')}</span>
                                </h3>
                                <div class="package-price">
                                </div>
                            </div>
                            <div class="package-body">
                                <div class="package-content" v-if="product.description.featuresLagomDescription" v-html="product.description.featuresLagomDescription">
                                </div>
                                <div class="package-content" v-else>
                                    <p v-html="product.description.featuresDescription"></p>
                                    <ul class="package-features" v-if="product.description.features !== undefined && Object.keys(product.description.features).length !== 0">
                                        <li v-for="(feature, key) in product.description.features">
                                            <b v-html="feature.name"></b> <span v-html="feature.value"></span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="package-footer package-side package-side-right">
                            <div class="package-price">
                                <div v-if="product.paytype == 'free'">
                                    <div class="price price-right price-right-h " :class="[ { 'price-sm': isOneStep } ]">{$MGLANG->absoluteT('LagomOrderForm','product','price','free')}</div>
                                </div>
                                <div class="price price-right price-right-h " :class="[ { 'price-sm': isOneStep } ]" v-else>
                                    <div v-if="getProductStartingPrice(product)" class="price-title" v-html="`{$MGLANG->absoluteT('LagomOrderForm','startingFrom')}`"></div>
                                    <div class="price-amount" v-if="getProductDiscountPrice(product)">
                                            <span class="price-savings">
                                                <span v-html="getProductPrice(product)"></span>
                                                <div class="price-discount" v-html="`{$MGLANG->absoluteT('LagomOrderForm','section','billing_cycle','save')} ` + getProductDiscountPercentage(product)"></div>
                                            </span>
                                        <span v-html="getProductDiscountPrice(product)"></span>
                                    </div>
                                    <div class="price-amount" v-else>
                                        <span v-html="getProductPrice(product)"></span>
                                    </div>
                                    <div class="price-cycle" v-if="product.paytype == 'onetime'">
                                        {$MGLANG->absoluteT('LagomOrderForm','oneTime')}
                                    </div>
                                    <span class="price-cycle" 
                                        v-else-if="
                                        product.pricing && 
                                        product.pricing[Object.keys(product.pricing)[0]] && 
                                        product.pricing[Object.keys(product.pricing)[0]].cycle &&
                                        orderSettings.ProductMonthlyPricingBreakdown == 'on'
                                        "
                                        :class="[
                                            { 'price-cycle--package-description' : product.description.featuresLagomDescription || product.stockcontrol === 1}
                                        ]">
                                        {$MGLANG->absoluteT('LagomOrderForm','section','billing_cycle','cycles','monthly', 'full')}
                                    </span>
                                    <div class="price-cycle" v-else v-html="translateBillingCycle(getAvailableCycle(product))"></div>

                                    <div v-if="getProductSetupFee(product)">
                                        <div class="price-setup-fee" v-if="getProductDiscountRawSetupFee(product) > 0" :class="[{ 'price-setup-fee--package-description' : product.description.featuresLagomDescription || product.stockcontrol === 1}]">
                                            <span class="price-savings">
                                                <span v-html="getProductSetupFee(product)"></span>
                                                <div class="price-discount" v-html="`{$MGLANG->absoluteT('LagomOrderForm','section','billing_cycle','save')} ` + getProductDiscountSetupFeePercentage(product)"></div>
                                            </span>
                                            <span  v-html="getProductDiscountSetupFee(product)"></span>
                                        </div>
                                        <div class="price-setup-fee" v-else  :class="[{ 'price-setup-fee--package-description' : product.description.featuresLagomDescription || product.stockcontrol === 1}]" >
                                            <div class="price-setup-fee" v-html="getProductSetupFee(product)"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="package-qty" 
                                v-if="product.stockcontrol === 1"
                                :class="[
                                    { 'package-qty--package-description' : product.description.featuresLagomDescription}
                                ]"
                            >
                                <span v-html="product.qty"></span> {$MGLANG->absoluteT('LagomOrderForm','productAvailable')}
                            </div>
                            <button class="btn btn-primary-faded" :class="[{ 'btn-lg': !isOneStep}]" v-if="product.outOfStock === true" disabled>{$MGLANG->absoluteT('LagomOrderForm','productNotAvailable')}</button>
                            <button class="btn has-loader btn-primary-faded" :class="[{ 'is-loading' : ((showLoaderOnId == product.id) && (selectedProduct != product.id) || (!isOneStep && (showLoaderOnId == product.id)))}, { 'btn-lg': !isOneStep}]" v-else-if="selectedProduct != product.id || !isOneStep">                                
                                <span class="btn-text">{$MGLANG->absoluteT('LagomOrderForm','ordernowbutton')}</span>
                                <div class="btn-loader" v-if="((showLoaderOnId == product.id) && (selectedProduct != product.id) || (!isOneStep && (showLoaderOnId == product.id)))">
                                    <div class="spinner spinner-sm">
                                        <div class="rect1"></div>
                                        <div class="rect2"></div>
                                        <div class="rect3"></div>
                                        <div class="rect4"></div>
                                        <div class="rect5"></div>
                                    </div>
                                </div>
                            </button>
                            <button class="btn btn-primary" :class="[{ 'btn-lg': !isOneStep}]" v-else-if="isOneStep">{$MGLANG->absoluteT('LagomOrderForm','is_product_selected')}</button>
                        </div>
                    </div>
                </div>
            </div>        
        </div>
    </div>
</script>