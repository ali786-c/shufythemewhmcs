<script type="text/x-template" id="t-mg-one-page-domain-tlds-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
    <div class="section" :class="[{ 'section--full-width': !showNumber}]" v-if="isVisible">
        <div class="section-number" v-if="showNumber">X</div>
        <div class="section-header has-toolbar">
            <h2 class="section-title">{$MGLANG->absoluteT('LagomOrderForm','domains','section', 'title', 'tlds')}</h2>
            <div class="section-toolbar">
                <form autocomplete="off">
                    <div class="tld-filters">
                        <span class="tld-filters-label">{$MGLANG->absoluteT('view')}:</span>
                        <select id="tldGroupSelect" multiple="multiple" class="form-control input-sm custom-multiselect selectized" v-model="selectedGroup" v-if="groupSelectVisibility">
                            <option v-for="option in groups" :value="option.name" v-html="option.name">
                            </option>
                        </select>
                    </div>
                </form>
                <div class="search-group search-group--tld">
                    <div class="search-field search-field-sm">
                        <i class="search-field-icon lm lm-search"></i>
                        <form autocomplete="off">
                            <input type="text" id="table-search" class="form-control input-sm" placeholder="{$MGLANG->absoluteT('search')}" v-model="searchedWord">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="section-body" >
            <div class="tld-pricing data-container tld-table table-container" v-if="tldToShow.length > 0">
                <table class="table table-list">
                    <thead>
                        <tr class="tld-pricing-header">
                            <th>
                                {$MGLANG->absoluteT('LagomOrderForm','domains','tlds','domains')}
                            </th>
                            <th>
                                {$MGLANG->absoluteT('LagomOrderForm','domains','tlds','domainsregister')}
                            </th>
                            <th>
                                {$MGLANG->absoluteT('LagomOrderForm','domains','tlds','domainstransfer')}
                            </th>
                            <th>
                                {$MGLANG->absoluteT('LagomOrderForm','domains','tlds','domainsrenew')}
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="tld-row"  v-for="tld in tldToShow" v-if="tld['pricing'] && tld['pricing'][currencyId]">
                            <td>
                                <strong class="tld-name" v-html="tld.extension"></strong>
                                <span class="label label-info" v-if="tld.group === 'sale'">{$MGLANG->absoluteT('LagomOrderForm','domains','tlds','sale')}</span>
                                <span class="label label-success" v-if="tld.group === 'new'">{$MGLANG->absoluteT('LagomOrderForm','domains','tlds','new')}</span>
                                <span class="label label-danger" v-if="tld.group === 'hot'">{$MGLANG->absoluteT('LagomOrderForm','domains','tlds','hot')}</span>
                            </td>
                            <td>
                                <span class="tld-label">{$MGLANG->absoluteT('LagomOrderForm','domains','tlds','register')}</span>
                                <span class="tld-price" v-if="getTldFirstPeriod(tld, 'domainregister', 'price')">
                                    <span v-html="getTldFirstPeriod(tld, 'domainregister', 'price')"></span>
                                    <small v-if="/\d/.test(getTldFirstPeriod(tld, 'domainregister', 'price'))" class="text-lighter" v-html="getTldFirstPeriod(tld, 'domainregister', 'period')"></small>
                                </span>
                                <small v-else>{$MGLANG->absoluteT('LagomOrderForm','domains','tlds','period', 'notAvailable')}</small>
                            </td>
                            <td>
                                <span class="tld-label">{$MGLANG->absoluteT('LagomOrderForm','domains','tlds','transfer')}</span>
                                <span class="tld-price" v-if="getTldFirstPeriod(tld, 'domaintransfer', 'price')">
                                    <span v-html="getTldFirstPeriod(tld, 'domaintransfer', 'price')"></span>
                                    <small v-if="/\d/.test(getTldFirstPeriod(tld, 'domaintransfer', 'price'))" class="text-lighter" v-html="getTldFirstPeriod(tld, 'domaintransfer', 'period')"></small>
                                </span>
                                <small v-else>{$MGLANG->absoluteT('LagomOrderForm','domains','tlds','period', 'notAvailable')}</small>
                            </td>
                            <td>
                                <span class="tld-label">{$MGLANG->absoluteT('LagomOrderForm','domains','tlds','renew')}</span>
                                <span class="tld-price" v-if="getTldFirstPeriod(tld, 'domainrenew', 'price')">
                                    <span v-html="getTldFirstPeriod(tld, 'domainrenew', 'price')"></span>
                                    <small v-if="/\d/.test(getTldFirstPeriod(tld, 'domainrenew', 'price'))" class="text-lighter" v-html="getTldFirstPeriod(tld, 'domainrenew', 'period')"></small>
                                </span>
                                <small v-else>{$MGLANG->absoluteT('LagomOrderForm','domains','tlds','period', 'notAvailable')}</small>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="tld-pagination" v-if="tldToShow.length > 0">
                    <div class="tld-pagination__entries">
                        <span v-html="mgPageLang.translate('show')"></span>
                        <div class="tld-pagination__wrapper">
                            <select class="form-control form-control-sm" name="pagination-entries" id="pagination-entries" @change="changeSelect">
                                <option value="10" selected>10</option>
                                <option value="20">20</option>
                                <option value="30">30</option>
                            </select>
                            <div class="selectdiv"></div>
                        </div>
                        <span v-html="mgPageLang.translate('entries')"></span>
                    </div>
                    <div id="tld-pagination" class="tld-pagination__pages"></div>
                </div>
            </div>
            <div class="message message-danger message-lg message-no-data no-tlds" v-if="searchedWord != null && searchedWord != '' && tldToShow.length == 0">
                <div class="message-icon">
                    <i class="lm lm-close"></i>
                </div>
                <h3 class="message-title message-text">{$MGLANG->absoluteT('LagomOrderForm','domains','tlds','noResult')}</h3>
            </div>
            <div class="message message-danger message-lg message-no-data no-tlds" v-else-if="groups && groups.length > 0 && selectedGroup.length == 0">
                <div class="message-icon">
                    <i class="lm lm-close"></i>
                </div>
                <h3 class="message-title message-text">{$MGLANG->absoluteT('LagomOrderForm','domains','tlds','noCategory')}</h3>
            </div>
        </div>
    </div>
</script>