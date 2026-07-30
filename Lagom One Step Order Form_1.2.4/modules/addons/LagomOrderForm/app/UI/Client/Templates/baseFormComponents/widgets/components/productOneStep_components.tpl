<script type="text/x-template" id="t-mg-one-page-products-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
    <div class="section section-show-overflow" v-if="isVisible" v-bind:class="{ 'section-packages' : !showNumber}">
        <div class="section-number" v-if="showNumber" >X</div>
        <div class="section-header" v-if="isOneStep">
            <h2 class="section-title">{$MGLANG->absoluteT('LagomOrderForm','section','title','products')}</h2>
        </div>
        <div class="section-top-nav swiper-header" v-if="products.length > 3 && $store.state.cartStore.pageType !== 'bottom' && isOneStep && layoutSettings.packagesSlider || products.length > 4 && $store.state.cartStore.pageType !== 'bottom' && !isOneStep && layoutSettings.packagesSlider || products.length > 4 && $store.state.cartStore.pageType == 'bottom' && layoutSettings.packagesSlider" :class="{ 'is-enabled' : sliderEnabled}">
            <div class="swiper-switcher">
                <span class="swiper-switcher__label active" @click="changeMode" data-slider='on'>
                    {$MGLANG->absoluteT('LagomOrderForm','labels','slider')}
                </span>
                <span class="swiper-switcher__label" @click="changeMode" data-slider='off'>
                    {$MGLANG->absoluteT('LagomOrderForm','labels','all')}
                </span>
            </div>
            <div class="swiper-nav" v-if="sliderEnabled">
                <span class="swiper-button swiper-button-prev">
                    <inline-svg :src="sysURL + '/modules/addons/LagomOrderForm/templates/client/default/assets/img/templates/18x18-left.svg'"/>
                </span>
                <div class="swiper-navigation">
                    <span class="swiper-navigation-current-slide"></span>
                    /
                    <span class="swiper-navigation-last-slide"></span>
                </div>
                <span class="swiper-button swiper-button-next">
                    <inline-svg :src="sysURL + '/modules/addons/LagomOrderForm/templates/client/default/assets/img/templates/18x18-right.svg'"/>
                </span>
            </div>
        </div>
        <div
                class="section-body"
                :data-slide-width="slideWidths"
                :data-visible-slides="visibleSlides"
                :class="getSlidesClasses()"
                :dir="isPageRTL() ? 'rtl' : 'ltr'"
                >
            <div class="swiper-navigation-secondary swiper-navigation-secondary-left" v-if="products.length > 3 && $store.state.cartStore.pageType !== 'bottom' || products.length > 4 && $store.state.cartStore.pageType == 'bottom'"></div>
            <div class="row row-eq-height row-eq-height-xs m-b-neg-24 m-b-neg-3x"
                 :class="getSecondaryNavigationClasses()"
            >
                <div v-for="product in products"
                     :class="getProductClasses()">
                    <div class="package"
                         :class="getPackageClass(product)"
                         v-on:click="{$rawObject->getOnClickAction()}">
                        <div class="package-header">
                            <span v-if="product.is_featured === 1" class="label-corner label-primary">{$MGLANG->absoluteT('LagomOrderForm','labels','featured')}</span>
                            <span class="check-sign"><i class="ls ls-check"></i></span>
                            <h3 class="package-name package-title h5" v-html="product.name"></h3>
                            <div v-if="product.pricing !== null && getProductStartingPrice(product) && product.paytype != 'free'" class="price-starting-from mt-3" v-html="`{$MGLANG->absoluteT('LagomOrderForm','startingFrom')}`"></div>
                            <a class="nav-link"  v-html="cart.products[0].domain" v-if="isMarketConnectProductWithDomain()" style="display: block; width:80%; margin:0 auto; word-wrap: break-word">
                            </a>

                            <div class="package-price">
{*                                FREE PRODUCT *}
                                <div v-if="product.paytype == 'free'">
                                    <div class="price" :class="[ { 'price-sm': isOneStep } ]">{$MGLANG->absoluteT('LagomOrderForm','product','price','free')}</div>
                                </div>
                                <div v-else>
                                    <div class="price" :class="[ { 'price-sm': isOneStep } ]">
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
                                        <div class="price-cycle" v-else-if="orderSettings.ProductMonthlyPricingBreakdown == 'on'">
                                            {$MGLANG->absoluteT('LagomOrderForm','product','price','monthly')}
                                        </div>
                                        <div class="price-cycle" v-else v-html="getTranslatedMessage(product.pricing[getAvailableCycle(product)].cycle)"></div>
                                        <div  v-if="getProductSetupFee(product)">
                                            <div class="price-setup-fee" v-if="getProductDiscountRawSetupFee(product) > 0">
                                                <span class="price-savings">
                                                    <span v-html="getProductSetupFee(product)"></span>
                                                    <div class="price-discount" v-html="`{$MGLANG->absoluteT('LagomOrderForm','section','billing_cycle','save')} ` + getProductDiscountSetupFeePercentage(product)"></div>
                                                </span>
                                                <span v-html="getProductDiscountSetupFee(product)"></span>
                                            </div>
                                            <div class="price-setup-fee" v-else>
                                                <div class="price-setup-fee" v-html="getProductSetupFee(product)"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="package-body" :class="{ 'm-t-0' : !product.description.featuresLagomDescription && !product.description.featuresDescription }">
                            <div class="package-content" v-if="product.description.featuresLagomDescription" v-html="product.description.featuresLagomDescription">
                            </div>
                            <div class="package-content" v-else>
                                <p v-html="product.description.featuresDescription"></p>
                                <ul class="package-features" :class="{ 'm-t-3x' : !product.description.featuresLagomDescription && !product.description.featuresDescription }" v-if="product.description.features !== undefined && Object.keys(product.description.features).length !== 0">
                                    <li v-for="(feature, key) in product.description.features">
                                        <b v-html="feature.name"></b> <span v-html="feature.value"></span>
                                    </li>
                                </ul>
                            </div>
                            <div class="package-footer">
                                <button class="btn btn-primary-faded" :class="[{ 'is-loading' : ((showLoaderOnId == product.id) && (selectedProduct != product.id) || (!isOneStep && (showLoaderOnId == product.id)))}]"  v-if="product.outOfStock === true" >
                                    <span class="btn-text">
                                        {$MGLANG->absoluteT('LagomOrderForm','productNotAvailable')}
                                    </span>
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
                                <button class="btn btn-primary-faded has-loader" :class="[{ 'is-loading' : ((showLoaderOnId == product.id) && (selectedProduct != product.id) || (!isOneStep && (showLoaderOnId == product.id)))}]" v-else-if="selectedProduct != product.id || !isOneStep">
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
                                <button class="btn btn-primary" v-else-if="isOneStep">
                                    <span class="btn-text">
                                        <i class="ls ls-check"></i>
                                        {$MGLANG->absoluteT('LagomOrderForm','is_product_selected')}
                                    </span>
                                </button>
                                <div class="package-qty" v-if="product.stockcontrol === 1">
                                    <span v-html="product.qty"></span> {$MGLANG->absoluteT('LagomOrderForm','productAvailable')}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="swiper-navigation-secondary swiper-navigation-secondary-right" v-if="products.length > 3 && $store.state.cartStore.pageType !== 'bottom' || products.length > 4 && $store.state.cartStore.pageType == 'bottom'"></div>
        </div>
    </div>

</script>