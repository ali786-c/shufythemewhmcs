<script type="text/x-template" id="t-mg-one-page-domain-renew-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
    <div v-if="isVisible" class="section m-t-1x" :class="[{ 'section--full-width': !showNumber}]">
        <div v-if="hasDomains()">
            {* START*}
            <div class="search-group">
                <div class="search-field">
                    <i class="search-field-icon lm lm-search"></i>
                    <form autocomplete="off">
                        <input type="text" id="table-search" class="form-control" placeholder="{$MGLANG->absoluteT('Search')}"  v-model="searchedWord">
                    </form>
                </div>
            </div>
            <div class="box box-domain-renewals panel">
                <ul class="domain-renewals-list list-group">
                    <li class="list-group-item" v-for="(domain, index) in renewDomains">
                        <div class="content">
                            <i class="lm lm-globe-alt"></i>
                            <span class="domain" v-html="domain.domain"></span>
                            <span class="label label-primary" v-if="domain.beforeRenewLimitDays && domain.daysUntilExpiry > domain.beforeRenewLimitDays" v-html="getTransletedExpireStatus('maximum_advance', domain.beforeRenewLimitDays)"></span>
                            <span class="label label-success" v-else-if="domain.daysUntilExpiry > 0" v-html="getTransletedExpireStatus('expire_in', domain.daysUntilExpiry)"></span>
                            <span class="label label-warning" v-else-if="domain.daysUntilExpiry < 0 && !domain.pastGracePeriod" v-html="getTransletedExpireStatus('expired_ago', domain.daysUntilExpiry)"></span>
                            <span class="label label-danger" v-else v-html="getTransletedExpireStatus('has_been_expired', domain.daysUntilExpiry)"></span>
                        </div>
                        <div class="actions" v-if="domain.eligibleForRenewal < 0 && Object.keys(domain.renewalOptions).length || !domain.pastGracePeriod && Object.keys(domain.renewalOptions).length">
                            <div  class="dropdown is-left" data-dropdown-select>
                                <div class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="true">
                                    <input name="renewDomainCycle" id="renewDomainCycle" type="hidden" data-dropdown-select-value :value="domain.selectedRenewal ? domain.renewalOptions[domain.selectedRenewal].friendlyPricePeriod : domain.renewalOptions[Object.keys(domain.renewalOptions)[0]].friendlyPricePeriod">
                                    <div class="dropdown__selected-option">
                                        <span data-dropdown-select-value-view v-html="domain.selectedRenewal ? domain.renewalOptions[domain.selectedRenewal].friendlyPricePeriod : domain.renewalOptions[Object.keys(domain.renewalOptions)[0]].friendlyPricePeriod"></span>
                                        <b class="ls ls-caret"></b>
                                    </div>
                                </div>
                                <div class="dropdown-menu dropdown-menu-search pull-right ps">
                                    <div class="dropdown-menu-items" data-dropdown-select-list>
                                        <div
                                                v-for="option in domain.renewalOptions"
                                                class="dropdown-menu-item"
                                                @click="selectRenewalOption(option, domain.renewalOptions, domain)"
                                                :data-value="option.rawPeriod"
                                                :class="
                                            { 'active': domain.selectedRenewal == option.rawPeriod || (!domain.selectedRenewal && option.friendlyPricePeriod == domain.renewalOptions[Object.keys(domain.renewalOptions)[0]].friendlyPricePeriod) }"
                                        >
                                            <a class="" href="javascript:void(0)" v-html="option.friendlyPricePeriod"></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="btn-group" v-if="selectedDomains.hasOwnProperty(domain.id)">
                                <button class="btn btn-sm btn-primary"  @click="renewDomain(domain.id)">
                                    {$MGLANG->absoluteT('LagomOrderForm','domain','renew','selected')}
                                </button>
                                <button type="button" class="btn btn-sm btn-primary btn-icon" v-on:click="removeDomain(domain.id)"><i class="ls ls-close"></i></button>
                            </div>
                            <button v-else type="button" class="btn btn-primary-faded btn-sm has-loader" :class="[{ 'is-loading' : loader && domain.id == loaderId}, { 'invisible' : domain.beforeRenewLimitDays && domain.daysUntilExpiry > domain.beforeRenewLimitDays}]" :domain-target-id="domain.id" @click="renewDomain(domain.id)" >
                                <span class="btn-text">{$MGLANG->absoluteT('LagomOrderForm','domain','renew','add')}</span>
                                <div class="btn-loader" v-if="loader && domain.id == loaderId">
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
                    </li>
                    <div class="load-more" v-if="visibleDomains <= domains.length && visibleDomains <= renewDomains.length" @click="loadMoreDomains()">
                        <i class=" ls ls-refresh"></i>
                        <span>{$MGLANG->absoluteT('LagomOrderForm','domain','result','loadMore')}</span>
                    </div>
                </ul>
            </div>
            {* box jeśli wyszukiwarka zwróci null *}
            <div class="message message-danger message-lg message-no-data no-renew" v-if="renewDomains.length == 0">
                <div class="message-icon">
                    <i class="lm lm-close"></i>
                </div>
                <h3 class="message-text message-title">{$MGLANG->absoluteT('norecordsfound')}</h3>
            </div>
            {* END *}
        </div>
    </div>
</script>