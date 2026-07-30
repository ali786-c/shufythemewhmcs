<script type="text/x-template" id="t-mg-one-page-domains-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
    <div class="section section--domain" v-if="(isSearchVisible || isVisible) && getSPage !== 'twoSteps'" :class="[{ 'section--full-width': !showNumber}]">
        <div class="section-number" v-if="showNumber">X</div>
        <div class="section-header">
            <h2 class="section-title">{$MGLANG->absoluteT('LagomOrderForm','domain','cartdomainsconfig')}</h2>
        </div>
        {* Tab Options *}
        <div class="section-body" v-if="!isDomainSelected">
            <div class="tab-nav tab-nav--section tab-nav--domain" data-nav-tabs-container ref="tabSliderContainer">
                <ul class="nav nav-tabs nav-lg  m-b-3x" data-nav ref="tabSlider">
                    <li class="nav-item"  :class="{ active: type.id === selectedRegType}"   v-on:click="changeType($event, type.id)" v-for="type in regTypes" :href="'#'+type.href" :key="type.id">
                        <a class="nav-link" href="nav-link" >
                            <input type="radio" :name="'type_name' + type.id" :id="'type_id' + type.id">
                            <span v-html="type.name"></span>
                        </a>
                    </li>
                </ul>
            </div>
            {* Search Component *}
            <div class="tab-content">
                <div id="tab-new-domain" class="tab-pane active" >
                    <div id="domain" class="box box-search-domain" :class="getSearchBoxClasses()">
                        <div class="box-body" :class="{ 'has-error': isValidField === false }">
                            {* Search *}
                            <div class="search-group search-group-combined panel-choose-domain panel-choose-domain--subdomain">
                                <div class="search-field search-field-lg">
                                    <i class="search-field-icon lm lm-search"></i>
                                    <form autocomplete="off" @submit.prevent>
                                        <input v-if="layoutSettings.showDropdownWithTLDs" type="text" class="form-control form-control-lg input-lg" ref="inputFocus" :class="{ 'has-error': isValidField == false }" :placeholder="searchPlaceholder" v-model="domainName" :id="field.id" @keyup.enter="searchDomain('enter', $event)" data-toggle="tooltip" data-placement="top" data-trigger="manual" title="{$MGLANG->absoluteT('LagomOrderForm', 'domain', 'empty')}">
                                        <input type="text" v-else @blur="setTimeout(()=>searchDomain(), 100)" class="form-control form-control-lg input-lg" ref="inputFocus" :class="{ 'has-error': isValidField == false }" :placeholder="searchPlaceholder" v-model="domainName" :id="field.id" @keyup.enter="searchDomain('enter', $event)" data-toggle="tooltip" data-placement="top" data-trigger="manual" title="{$MGLANG->absoluteT('LagomOrderForm', 'domain', 'empty')}">
                                    </form>
                                </div>
                                <div v-if="selectedRegType == 'subdomain' && productSubdomain.length > 0 && layoutSettings.showDropdownWithTLDs" class="dropdown search-dropdown">
                                    <div data-toggle="dropdown" class="tld-wrapper">
                                        <div class="tld-select">
                                            <span data-dropdown-select-value-view="" v-html="subdomain" class="tld-select-domain"></span>
                                            <b class="caret"></b>
                                        </div>
                                    </div>
                                    <ul class="dropdown-menu dropdown-menu-right">
                                        <li v-for="(domain,index) in productSubdomain" class="dropdown-menu-item">
                                            <a class="radio" v-on:click="changeSubdomain(domain)">
                                                <label class="radio-label" >
                                                    <div class="radio-styled" :class="{ 'checked': subdomain == domain}">
                                                        <input type="radio" :name="domain" class="icheck-control" value="index">
                                                        <ins class="iCheck-helper"></ins>
                                                    </div>
                                                    <div class="text" v-html="domain"></div>
                                                </label>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div v-if="(selectedRegType == 'register' || selectedRegType == 'transfer' && tlds.length > 0) && layoutSettings.showDropdownWithTLDs" class="dropdown search-dropdown">
                                    <div data-toggle="dropdown" class="tld-wrapper">
                                        <div class="tld-select">
                                            <span v-html="selectedTld" class="tld-select-domain"></span>
                                            <b class="caret"></b>
                                        </div>
                                    </div>
                                    <div class="dropdown-menu dropdown-menu-search pull-right">
                                        <div class="dropdown-header input-group align-center">
                                            <i class="input-group-icon lm lm-search"></i>
                                            <input class="form-control" placeholder="Search..." type="text" v-model="searchedWord">
                                        </div>
                                        <ul class="dropdown-menu-items has-scroll">
                                            <li v-for="(tld, tldIndex) in tldToShow" class="dropdown-menu-item">
                                                <a class="radio" @click="changeTld(tld.extension)">
                                                    <label class="radio-label" >
                                                        <div class="radio-styled" :class="{ 'checked': selectedTld == tld.extension}">
                                                            {* <input type="radio" :name="tld.extension" class="icheck-control"> *}
                                                            <ins class="iCheck-helper"></ins>
                                                        </div>
                                                        <div class="text" v-html="tld.extension"></div>
                                                    </label>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>

                                </div>
                                <div class="search-group-btn">
                                    <button type="button" class="btn btn-lg has-loader" :class="{ 'btn-primary': !searchSpinner, 'btn-primary-faded': searchSpinner, 'btn-recaptcha btn-recaptcha-invisible' : captcha.type =='invisible'}" v-on:click="searchDomain()">
                                        <span class="btn-text" v-if="!searchSpinner && (selectedRegType != 'own' && selectedRegType != 'subdomain' )">{$MGLANG->absoluteT('LagomOrderForm','domain','search')}</span>
                                        <span class="btn-text" v-else-if="!searchSpinner && selectedRegType == 'own'">{$MGLANG->absoluteT('LagomOrderForm','domain','use')}</span>
                                        <span class="btn-text" v-else-if="!searchSpinner && selectedRegType == 'subdomain'">{$MGLANG->absoluteT('LagomOrderForm','domain','check')}</span>
                                        <div class="btn-loader">
                                            <div class="spinner spinner-sm" v-if="searchSpinner">
                                                <div class="rect1"></div>
                                                <div class="rect2"></div>
                                                <div class="rect3"></div>
                                                <div class="rect4"></div>
                                                <div class="rect5"></div>
                                            </div>
                                        </div>
                                    </button>
                                </div>
                            </div>
                            <div class="alert alert-danger alert-sm" v-if="isValidField === false" v-html="fieldValidationMessages"></div>
                            {* Spotlights *}
                            <div class="spotlight-list"
                                 :class="getSpotlightClasses()"
                                 v-if="spotlights && layoutSettings.domainSpotlightsSearchBox">
                                <div class="spotlight-col" v-for="spotli in spotlights">
                                    <div class="spotlight" v-if="spotli.registerPrefixed" @click="selectSpotlight(spotli.tld)">
                                        <span class="spotlight-label" v-html="spotli.tld"></span>
                                        <span v-if="spotli.isFreeWithSelectedProduct">
                                            <span class="spotlight-old-price" v-html="getSpotlightValueForProductFreeDomain(spotli) + `/{$MGLANG->absoluteT('LagomOrderForm','domain', 'firstPeriodShort')}`"></span>
                                            <span  class="spotlight-value" v-html="`{$MGLANG->absoluteT('LagomOrderForm','domain', 'freeProductDomain')}`"></span>
                                        </span>
                                        <span v-else-if="getSpotlightDiscountData(spotli).save">
                                            <span class="price-savings">
                                                <span class="spotlight-value" v-html="getSpotlightDiscountData(spotli).save"></span>
                                            </span>
                                            <span class="spotlight-value" v-html="getSpotlightDiscountData(spotli).discount"></span>
                                        </span>
                                        <span class="spotlight-value" v-html="getSpotlightPrice(spotli)" v-else></span>
                                    </div>
                                </div>
                                <div class="spotlight-col" v-if="availableMoreSpotlights">
                                    <a class="spotlight spotlight-more" @click="showMoreSpotlights()">{$MGLANG->absoluteT('LagomOrderForm','domain','show_all')}</a>
                                </div>
                                <div class="spotlight-col" v-if="availableLessSpotlights">
                                    <a class="spotlight spotlight-more" @click="showLessSpotlights()">{$MGLANG->absoluteT('LagomOrderForm','domain','show_less')}</a>
                                </div>
                            </div>
                            {* END Spotlights *}
                        </div>
                        <div class="box-result" v-if="searchSpinner && selectedRegType != 'own' && selectedRegType != 'subdomain'">
                            <div class="search-result search-result--info" v-if="searchSpinner">
                                <div class="search-result-actions">
                                    <i class="search-result-icon ls ls-refresh"></i>
                                    <p class="search-result-message">
                                        {$MGLANG->absoluteT('LagomOrderForm','domain','result', 'loading')}
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="box-result" v-if="isInvalidDomain">
                            <div class="search-result search-result--danger">
                                <div class="search-result-actions">
                                    <i class="search-result-icon ls ls-close"></i>
                                    <p class="search-result-message">
                                        <span v-html="`{$MGLANG->absoluteT('LagomOrderForm','domain', 'invalidDomainFormat')}`"></span>
                                        <span class="search-result-desc" v-html="`{$MGLANG->absoluteT('LagomOrderForm','domain', 'invalidDomainFormatDesc')}`"></span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="box-result" v-if="( searchDetails && !isInvalidDomain && (selectedRegType != 'own' && selectedRegType != 'subdomain')) || (searchDetails && (selectedRegType == 'own' || selectedRegType == 'subdomain') && searchedError !== false)">
                            <div class="search-result search-result--success" v-if="searchedError === false">
                                <div class="search-result-actions">
                                    <i class="search-result-icon ls ls-check"></i>
                                    <p class="search-result-message">
                                        <span v-html="getResultMessageByActionType()"></span>
                                    </p>
                                    <div v-if="parseInt(periodPrice) === 0" class="search-result-price">
                                        <span v-if="period === 1 && !/\d/.test(getZeroValue())" v-html="getZeroValue()"></span>
                                        <span v-else-if="period === 1" v-html="getZeroValue() + `/{$MGLANG->absoluteT('LagomOrderForm','domain', 'firstPeriodShort')}`"></span>
                                        <span v-else-if="!/\d/.test(getZeroValue())" v-html="getZeroValue() + `/{$MGLANG->absoluteT('LagomOrderForm','domain', 'firstPeriodShort')}`"></span>
                                        <span v-else v-html="getZeroValue() + `/` + period + `{$MGLANG->absoluteT('LagomOrderForm','domain', 'periodShort')}`"></span>
                                    </div>
                                    <div class="search-result-price" v-else-if="periodPrice">
                                        <span v-html="`{$MGLANG->absoluteT('LagomOrderForm','domain', 'freeProductDomain')}`" v-if="isFreeForSelectedProduct"></span>
                                        <span v-else-if="domainDiscountPrice">
                                            <span class="price-savings">
                                                <span class="search-result-period" v-if="!isFreeForSelectedProduct && period == 1" v-html="periodPrice + `/{$MGLANG->absoluteT('LagomOrderForm','domain', 'firstPeriodShort')}`"></span>
                                                <span class="search-result-period" v-else v-html="currency.prefix + periodPrice + (layoutSettings.displayPriceSuffix ? (' ' + currency.suffix) : '') + `/` + period + `{$MGLANG->absoluteT('LagomOrderForm','domain', 'periodShort')}`"></span>
                                            </span>
                                            <span v-html="currency.prefix + domainDiscountPrice + (layoutSettings.displayPriceSuffix ? (' ' + currency.suffix) : '') + `/{$MGLANG->absoluteT('LagomOrderForm','domain', 'firstPeriodShort')}`"></span>
                                        </span>
                                        <span v-html="periodPrice" v-else></span>
                                        <span class="search-result-period" v-if="!isFreeForSelectedProduct && period == 1 && !domainDiscountPrice" v-html="`/{$MGLANG->absoluteT('LagomOrderForm','domain', 'firstPeriodShort')}`"></span>
                                        <span class="search-result-period" v-else-if="!isFreeForSelectedProduct && !domainDiscountPrice" v-html="`/` + period + `{$MGLANG->absoluteT('LagomOrderForm','domain', 'periodShort')}`"></span>
                                    </div>
                                    <button type="button" class="btn btn-primary-faded btn-lg min-w-115 has-loader" :class="{ 'm-t-2x': !periodPrice }" @click="addDomain(selectedRegType)" >
                                        <span class="btn-text" v-if="!spinner" v-html="getSearchButtonTitleByType(selectedRegType)"></span>
                                        <div class="btn-loader" v-if="spinner">
                                            <div class="spinner spinner-sm">
                                                <div class="rect1"></div>
                                                <div class="rect2"></div>
                                                <div class="rect3"></div>
                                                <div class="rect4"></div>
                                                <div class="rect5"></div>
                                            </div>
                                        </div>
                                    </button>
                                </div>
                            </div>
                            <div class="search-result search-result--danger" v-if="searchedError !== false">
                                <div class="search-result-actions">
                                    <i class="search-result-icon ls ls-close"></i>
                                    <p class="search-result-message">
                                        {* The provided domain <b v-html="domainName"></b> is not available.</p> *}
                                        {* <span v-html="getResultMessageByActionType()"></span> *}

                                        <span v-if="domainSld" v-html="searchedError" ></span>
                                        <span v-else v-html="`{$MGLANG->absoluteT('LagomOrderForm','domain', 'result', 'empty_name')}`"></span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            {*      AFTER SEARCH SPINNER  *}
        </div>
        {*    ADDITIONAL DOMAIN CONFIG *}
        <div class="section-body" v-if="isDomainSelected && domainType !== 'renew'">
            <div class="panel panel-domain-incart">
                <div class="panel-body">
                    <div class="domain-incart">
                        <div class="domain-incart-body">
                            <i class="domain-incart-icon lm lm-globe-alt"></i>
                            <p class="domain-incart-message" v-if="selectedRegType === 'register'">{$MGLANG->absoluteT('LagomOrderForm','domain','config_type', 'registration')}: <b v-html="selectedDomain"></b></p>
                            <p class="domain-incart-message"  v-else-if="selectedRegType === 'transfer'">{$MGLANG->absoluteT('LagomOrderForm','domain','config_type', 'transfer')}: <b v-html="selectedDomain"></b></p>
                            <p class="domain-incart-message"  v-else >{$MGLANG->absoluteT('LagomOrderForm','domain','config_type', 'domain')}: <b v-html="selectedDomain"></b></p>
                        </div>
                        <div class="domain-incart-actions">
                            <a class="btn btn-primary-faded btn-sm" v-on:click="changeDomainName(showPopover)">{$MGLANG->absoluteT('LagomOrderForm','domain','domain_change')}</a>
                            <div class="domain-incart-popover popover popover-confirmation bottom fade in" v-if="popoverIsVisible">
                                <div class="arrow"></div>
                                <div class="popover-title">
                                    <i class="ls ls-info-circle"></i> {$MGLANG->absoluteT('LagomOrderForm','domain','note')}
                                </div>
                                <div class="popover-content">
                                    {$MGLANG->absoluteT('LagomOrderForm','domain','erase_settings')}
                                </div>
                                <div class="popover-actions">
                                    <button class="btn btn-xs btn-primary-faded" v-on:click="changeDomainName(false)">{$MGLANG->absoluteT('LagomOrderForm','domain','confirm')}</button>
                                    <button class="btn btn-xs btn-default" v-on:click="hidePopover()">{$MGLANG->absoluteT('LagomOrderForm','domain','cancel')}</button>
                                    <label class="checkbox checkbox-custom checkbox-sm">
                                        <input type="checkbox" name="popoverNotShowAgain" class="" v-model="popoverNotShowAgain">
                                        <span class="checkbox-styled"></span>
                                        <div class="check-content">{$MGLANG->absoluteT('LagomOrderForm','domain','doNotShowAgain')}</div>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-body form-flex" v-if="isPeriodSelectVisible()">
                    <div class="form-group form-group-sm" v-if="Object.keys(availablePeriods).length && !isFreeForSelectedProduct">
                        <label>{$MGLANG->absoluteT('LagomOrderForm','domain','domain_reg_perio')}:</label>
                        <select class="form-control" v-model="period">
                            <option v-for="(value, year) in availablePeriods" :value="year">
                                <span v-if="value[selectedRegType] == 0" v-html="$store.getters['cartStore/getZeroPrice']('domainsPrices') + '/' + year + ` {$MGLANG->absoluteT('LagomOrderForm','domain', 'years')}`"></span>
                                <span v-else v-html="getPeriodOptions(value) + '/' + year + ` {$MGLANG->absoluteT('LagomOrderForm','domain', 'years')}`"></span>
                            </option>
                        </select>
                    </div>
                    <template v-for="(field, index) in registerFields">
                        <component :is="field.type" :key="field.idKey ? field.idKey : field.id" :field="field" :data="registerFieldsFormData" @change="registerFieldUpdated"></component>
                    </template>
                    <template v-for="(field, index) in customFields">
                        <component :is="field.type" :key="field.idKey ? field.idKey : field.id" :field="field" :data="customFieldsFormData" @change="customFieldUpdated"></component>
                    </template>

                    <div class="panel-nameservers" v-if="domainServerNamespacesAvailable && !selectedProduct">
                        <h4 class="panel-title">{$MGLANG->absoluteT('LagomOrderForm','domain','domainnameservers')} </h4>
                        <p class="panel-desc">{$MGLANG->absoluteT('LagomOrderForm','domain','cartnameserversdesc')}</p>
                        <template v-for="(field, index) in domainServerNamespaces">
                            <component :is="field.type" :key="field.idKey ? field.idKey : field.id" :field="field" :data="domainServerNamespacesFormData" :value="field.value"></component>
                        </template>
                    </div>
                </div>

            </div>
        </div>
    </div>
</script>