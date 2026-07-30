<script type="text/x-template" id="t-mg-one-page-checkbox-input-field">
    <div class="panel panel--main has-checkbox" v-if="visible" :id="fieldId" :class="[
        { 'section section--config-options' : (showNumber && field.isFirstInGroup) || (showNumber && field.groupSection.single_section != 'on')},
        { 'panel--first' : field.isFirstInGroup},
        { 'panel--section' : field.groupSection.single_section != 'on' || !Object.keys(field.groupSection).length}
        ]">
        <div class="section-number" v-if="(showNumber && field.isFirstInGroup) || (showNumber && field.groupSection.single_section != 'on')">X</div>
        <div class="section-header" :class="[{ 'section-header--tooltip': field.isFirstInGroup && field.groupSection.section_description_type == 'tooltip'}]" v-if="field.isFirstInGroup && field.groupSection.single_section == 'on'">
            <h2 class="section-title" v-html="field.groupSection.section_title"></h2>
            <i data-toggle="tooltip" :title="`<div class='tooltip-inner--lg'>` + field.groupSection.section_description + `</div>`" data-html="true" class="lm lm-info section-tooltip" v-if="field.groupSection.section_description_type == 'tooltip'"></i>
            <p class="section-desc" v-html="field.groupSection.section_description" v-if="field.groupSection.section_description_type == 'default' && field.groupSection.section_description"></p>
        </div>
        <div class="panel-header" v-else-if="!field.isFirstInGroup && field.groupSection.single_section == 'on'">
            <h5 class="panel-title" v-html="details.optionname" ></h5>
            <i data-toggle="tooltip" :title="`<div class='tooltip-inner--lg'>` + field.description + `</div>`" data-html="true" class="lm lm-info section-tooltip" v-if="field.descriptionType == 'tooltip' && field.description"></i>
            <p class="panel-desc" v-html="field.description" v-if="field.descriptionType == 'default' && field.description"></p>
        </div>
        <div class="section-header" v-else :class="[{ 'section-header--tooltip': field.descriptionType == 'tooltip' && field.description}]">
            <h2 class="section-title" v-html="details.optionname"></h2>
            <i data-toggle="tooltip" :title="`<div class='tooltip-inner--lg'>` + field.description + `</div>`" data-html="true" class="lm lm-info section-tooltip" v-if="field.descriptionType == 'tooltip' && field.description"></i>
            <p class="section-desc" v-html="field.description" v-if="field.descriptionType == 'default' && field.description"></p>
        </div>
        <div class="panel-header" v-if="field.isFirstInGroup && field.groupSection.single_section == 'on'">
            <h5 class="panel-title" v-html="field.details.optionname"></h5>
            <i data-toggle="tooltip" :title="`<div class='tooltip-inner--lg'>` + field.description + `</div>`" data-html="true" class="lm lm-info section-tooltip" v-if="field.descriptionType == 'tooltip' && field.description"></i>
            <p class="panel-desc" v-html="field.description" v-if="field.descriptionType == 'default' && field.description"></p>
        </div>
        {* <h5 class="panel-title" v-html="details.optionname"></h5> *}
        <div class="row row-eq-height row-eq-height-xs" data-inputs-container>
            <div
                v-for="(opt, index) in details.options"
                :value="index"
                :class="[
                    { 'col-sm-6 col-md-4 col-xl-3' : showNumber},
                    { 'col-sm-6 col-md-4' : !showNumber}
                ]">

                <div class="panel panel-check panel-check--checkbox" :class="{ checked: value}" data-virtual-input>
                    <div class="check">
                        <span class="check-sign" v-if="value">
                            <i class="ls ls-check"></i>
                        </span>
                        <label>
                            <div class="checkbox-styled" :class="{ checked: value}">
                                <input class="icheck-control" type="checkbox" :value="opt.id" v-model="value" :name="field.name"/>
                            </div>
                            <div class="check-content">
                                <h6 v-if="!String(opt.nameonly).includes(',')" v-html="opt.nameonly"></h6>
                                <h6 class="check-title check-title--box" v-else v-for="row in getNameRows(opt.nameonly)" v-html="row.trim()"></h6>
                                 <p class="check-subtitle" v-if="product.paytype === 'free'"  v-html="`{$MGLANG->absoluteT('LagomOrderForm','Free')}`"></p>
                                 <span v-else-if="field.hideZeroPrices && opt.recurring == 0"></span>
                                 <p class="check-subtitle" v-else-if="opt.recurring == 0"  v-html="$store.getters['cartStore/getZeroPrice']('configurableOptionsPrices')"></p>
                                <p class="check-subtitle" v-else-if="(opt.recurring == '0.00' && !field.hideZeroPrices) || opt.recurring != '0.00'" v-html="currency.prefix + getFormattedPrice(opt.recurring) + (layoutSettings.displayPriceSuffix ? (' ' + currency.suffix) : '')"></p>
                                <div v-if="product.paytype !== 'free'">
                                    <p class="check-subtitle" v-if="opt.setupFee > 0" v-html="' + ' + currency.prefix + getFormattedPrice(opt.setupFee) + (layoutSettings.displayPriceSuffix ? (' ' + currency.suffix) : '') + ' {$MGLANG->absoluteT('LagomOrderForm','product', 'setupFee')}'"></p>
                                </div>
                            </div>
                        </label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</script>