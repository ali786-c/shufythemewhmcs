<script type="text/x-template" id="t-mg-one-page-radion-input-field">
    <div class="panel panel--main has-radio" v-if="visible" :id="fieldId" :class="[
        { 'section section--config-options' : (showNumber && field.isFirstInGroup) || (showNumber && field.groupSection.single_section != 'on')},
        { 'panel--first' : field.isFirstInGroup},
        { 'panel--section' : field.groupSection.single_section != 'on' || !Object.keys(field.groupSection).length},
        { 'panel--addonBox-section' : (field.groupSection.single_section == 'on' || Object.keys(field.groupSection).length) && field.displayType == 'addonBox'}
    ]">
        <div class="section-number" v-if="(showNumber && field.isFirstInGroup) || (showNumber && field.groupSection.single_section != 'on')">X</div>
        <div class="section-header" :class="[{ 'section-header--tooltip': field.isFirstInGroup && field.groupSection.section_description_type == 'tooltip'}]" v-if="field.isFirstInGroup && field.groupSection.single_section == 'on'">
            <h2 class="section-title" v-html="field.groupSection.section_title"></h2>
            <i data-toggle="tooltip" :title="`<div class='tooltip-inner--lg'>` + field.groupSection.section_description + `</div>`" data-html="true" class="lm lm-info section-tooltip" v-if="field.groupSection.section_description_type == 'tooltip'"></i>
            <p class="section-desc" v-html="field.groupSection.section_description" v-if="field.groupSection.section_description_type == 'default' && field.groupSection.section_description"></p>
        </div>
        <div class="panel-header" v-else-if="!field.isFirstInGroup && field.groupSection.single_section == 'on' && field.displayType != 'addonBox'" :class="[{ 'section-header--tooltip': field.isFirstInGroup && field.groupSection.section_description_type == 'tooltip'}]">
            <h5 class="panel-title" v-html="field.details.optionname"></h5>
            <i data-toggle="tooltip" :title="`<div class='tooltip-inner--lg'>` + field.description + `</div>`" data-html="true" class="lm lm-info section-tooltip" v-if="field.descriptionType == 'tooltip' && field.description"></i>
            <p class="panel-desc" v-html="field.description" v-if="field.descriptionType == 'default' && field.description && field.displayType != 'addonBox'"></p>
        </div>
        <div class="section-header" v-else-if="field.displayType != 'addonBox' || field.displayType == 'addonBox' && field.groupSection.single_section != 'on'" :class="[{ 'section-header--tooltip': field.descriptionType == 'tooltip' && field.description}]">
            <h2 class="section-title" v-html="field.details.optionname"></h2>
            <i data-toggle="tooltip" :title="`<div class='tooltip-inner--lg'>` + field.description + `</div>`" data-html="true" class="lm lm-info section-tooltip" v-if="field.descriptionType == 'tooltip' && field.description"></i>
            <p class="section-desc" v-html="field.description" v-if="field.descriptionType == 'default' && field.description && field.displayType != 'addonBox'"></p>
        </div>

        <div class="panel-header" v-if="field.isFirstInGroup && field.groupSection.single_section == 'on' && field.displayType != 'addonBox'">
            <h5 class="panel-title" v-html="field.details.optionname"></h5>
            <i data-toggle="tooltip" :title="`<div class='tooltip-inner--lg'>` + field.description + `</div>`" data-html="true" class="lm lm-info section-tooltip" v-if="field.descriptionType == 'tooltip' && field.description"></i>
            <p class="panel-desc" v-html="field.description" v-if="field.descriptionType == 'default' && field.description"></p>
        </div>

        {* show tabs if more than 2 groups *}
        <div class="tab-nav tab-nav--section tab-nav--domain" data-nav-tabs-container ref="tabSliderContainer" v-if="field.groups.length > 0 && field.displayType != 'osBox'">
            <div class="nav-arrow nav-arrow--left nav-arrow--hidden">
                <a href="#" class="nav-link" data-scrollnav="-250">
                    <i class="ls ls-arrow-left"></i>
                </a>
            </div>
            <ul class="nav nav-tabs nav-lg  m-b-3x" data-nav ref="tabSlider">
                <li class="nav-item" v-for="(group, groupIndex) in field.groups" :class="{ active: group.id == getGroupId()}" :href="'#'+group.id"  v-on:click="changeGroup($event, group, groupIndex)" v-if="Object.keys(group.suboptions).length && group.enable">
                    <a class="nav-link" href="nav-link" >
                        <img class="nav-img" :src="group.image" v-if="group.image"/>
                        <input type="radio" :name="'group.name' + group.id" :id="'group.id' + group.id">
                        <span v-html="group.name"></span>
                        <i data-toggle="tooltip" :title="`<div class='tooltip-inner--lg'>` + group.description + `</div>`" data-html="true" class="lm lm-info section-tooltip section-tooltip--sm" v-if="group.description"></i>
                    </a>
                </li>
            </ul>
            <div class="nav-arrow nav-arrow--right nav-arrow--hidden">
                <a href="#" class="nav-link" data-scrollnav="250">
                    <i class="ls ls-arrow-right"></i>
                </a>
            </div>
        </div>
        <div class="row row-eq-height row-eq-height-xs row--osBox" v-if="field.displayType == 'osBox' && field.groups.length">
            <div
                v-if="field.groups && opt.enable"
                v-for="(opt, index) in field.groups"
                :value="index"
                :class="[
                    { 'col-sm-6 col-md-4 col-xl-3' : showNumber},
                    { 'col-sm-6 col-md-4' : !showNumber},
                ]">
                <div class="panel panel-check panel--osBox dropdown" data-toggle="dropdown" :class="{ 'checked' : isBoxSelected && opt.id == activeGroup}">
                    <div class="panel-body check">
                        <span class="check-sign"><i class="ls ls-check"></i></span>
                        <div class=" panel-icon check-icon"  v-if="opt.image">
                            <img :src="opt.image"/>
                        </div>
                        <h6 class="panel-title" v-html="opt.name"></h6>
                        <p class="panel-desc" v-html="opt.description" v-if="opt.description"></p>
                        <div class="panel-actions">
                            <button class="btn">
                                <span class="btn-text">
                                    <div v-if="activeGroup == opt.id">
                                        <span v-if="activeGroup == opt.id && selectedOption.nameonly" v-html="selectedOption.nameonly"></span>
                                        <span v-else v-html="field.details.selectedname"></span>
                                        <strong v-html="' - ' + getOptionPrice(selectedOption)"></strong>
                                    </div>
                                    <span v-else>{$MGLANG->absoluteT('LagomOrderForm','section','configOptions','selectVersion')}</span>
                                    <span v-if="selectedOption && selectedOption.setup && activeGroup == opt.id" v-html="getOptionSetupFee(selectedOption) + ' {$MGLANG->absoluteT('LagomOrderForm','product', 'setupFee')}'"></span>
                                </span>
                                <b class="ls ls-caret"></b>
                            </button>
                            <ul class="dropdown-menu">
                                <li v-for="suboption in opt.suboptions">
                                    <a class="radio">
                                        <label class="radio-label"   @click="changeOption($event, suboption, opt.id)" :class="{ 'checked': data[field.id] == suboption.id && opt.id == activeGroup}" :style="[
                            { 'background-color' : suboption.overrideColor ? '#' + suboption.color : 'transparent'},
                            ]">
                                            <div class="radio-styled">
                                                <ins class="iCheck-helper"></ins>
                                            </div>
                                            <div class="d-flex flex-row">
                                                <div class="text" v-if="suboption.nameonly" v-html="suboption.nameonly"></div>
                                                <div class="text" v-else v-html="getNameBySuboptionRawName(suboption.rawName)"></div>
                                                <span class="ml-1" v-html="getOptionPrice(suboption)"></span>
                                                <span class="w-100 text-right" v-if="suboption.setup" v-html="getOptionSetupFee(suboption) + ' {$MGLANG->absoluteT('LagomOrderForm','product', 'setupFee')}'"></span>
                                            </div>

                                        </label>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div
                v-for="(opt, index) in getAllSuboptions()"
                :value="index"
                :class="[
                    { 'col-sm-6 col-md-4 col-xl-3' : showNumber},
                    { 'col-sm-6 col-md-4' : !showNumber},
                ]"
                v-if="!field.groups"
                >
                <div class="panel panel-check panel--osBox" :class="{ 'checked' : opt.id == value}">
                    <div class="panel-body check">
                        <span class="check-sign"><i class="ls ls-check"></i></span>
                        <div class=" panel-icon check-icon"  v-if="opt.image">
                            <img :src="opt.image"/>
                        </div>
                        <h6 class="panel-title" v-html="opt.nameonly"></h6>
                        <p class="panel-desc" v-html="opt.description" v-if="opt.description"></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row row-eq-height row-eq-height-xs" data-inputs-container :class="{ 'row-sm' :  layoutSettings.templates && layoutSettings.templates.lagom && layoutSettings.templates.lagom.active_style != 'modern'}" v-else-if="field.displayType == 'packageBox' && field.groups.length && filteredGroup.length">
            <div
                v-for="(opt, index) in getFilteredSuboptions()"
                :value="index"
                :class="[
                    { 'col-sm-6 col-md-4 col-xl-3' : showNumber},
                    { 'col-sm-6 col-md-4' : !showNumber}
                ]">
                <div class="package package-sm" :class="[
                        { 'package-selected' : isSelected(opt.id)},
                    ]"
                    @click="changeOption($event, opt, filteredGroup[0].id)" :style="[
                            { 'background-color' : opt.overrideColor ? '#' + opt.color : 'transparent'},
                            ]">
                    <div class="package-icon" v-if="opt.image">
                        <img :src="opt.image" alt=""/>
                    </div>
                    <div class="package-header">
                        <span class="check-sign"><i class="ls ls-check"></i></span>
                        <h3 class="package-name package-title" v-html="opt.nameonly"></h3>
                        <div class="package-price" v-if="(opt.fullprice == '0.00' && !field.hideZeroPrices) || opt.fullprice != '0.00'">
                            <div class="price" :class="[ { 'price-sm': isOneStep } ]">
                                <div class="price-amount">
                                    <span v-html="getOptionPrice(opt)"></span>
                                </div>
                            </div>
                        </div>
                        <div class="price-setup-fee" v-if="opt.setup" v-html="getOptionSetupFee(opt) + ' {$MGLANG->absoluteT('LagomOrderForm','product', 'setupFee')}'"></div>
                    </div>
                    <div class="package-body" v-if="opt.description">
                        <div class="package-content">
                            <ul class="package-features" v-html="opt.description"></ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row row-eq-height row-eq-height-xs" data-inputs-container :class="{ 'row-sm' :  layoutSettings.templates && layoutSettings.templates.lagom && layoutSettings.templates.lagom.active_style != 'modern'}" v-else-if="field.displayType == 'packageBox'">
            <div
                v-for="(opt, index) in getFilteredSuboptions()"
                :value="index"
                :class="[
                    { 'col-sm-6 col-md-4 col-xl-3' : showNumber},
                    { 'col-sm-6 col-md-4' : !showNumber}
                ]">
                <div class="package package-sm" :class="[
                        { 'package-selected' : isSelected(opt.id)},
                    ]"
                    @click="changeOption($event, opt, opt.id)" :style="[
                            { 'background-color' : opt.overrideColor ? '#' + opt.color : 'transparent'},
                            ]">
                    <div class="package-icon" v-if="opt.image">
                        <img :src="opt.image" alt=""/>
                    </div>
                    <div class="package-header">
                        <span class="check-sign"><i class="ls ls-check"></i></span>
                        <h3 class="package-name package-title" v-html="opt.nameonly"></h3>
                        <div class="package-price" v-if="(opt.fullprice == '0.00' && !field.hideZeroPrices) || opt.fullprice != '0.00'">
                            <div class="price" :class="[ { 'price-sm': isOneStep } ]">
                                <div class="price-amount">
                                    <span v-html="getOptionPrice(opt)"></span>
                                </div>
                            </div>
                        </div>
                        <div class="price-setup-fee" v-if="opt.setup != '0.00'" v-html="currency.prefix + getFormattedPrice(opt.setup) + (layoutSettings.displayPriceSuffix ? (' ' + currency.suffix) : '')"></div>
                    </div>
                    <div class="package-body" v-if="opt.description">
                        <div class="package-content">
                            <ul class="package-features" v-html="opt.description"></ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row row-eq-height row-eq-height-xs" data-inputs-container :class="{ 'row-sm' :  layoutSettings.templates && layoutSettings.templates.lagom && layoutSettings.templates.lagom.active_style != 'modern'}" v-else-if="field.displayType == 'addonBox'">
            <div class="col-lg-12">
                <div class="panel panel-addon panel--addonBox" :class="[
                    { 'panel-addon--has-image has-icon': field.image},
                    { 'panel--no-body' : (field.descriptionType == 'tooltip' && field.groupSection.single_section != 'on') || (field.descriptionType == 'default' && !field.description && field.groupSection.single_section != 'on')},
                    { 'panel--no-image' : !field.image}
                    ]">
                    {* hide panel body if description is tooltip and single section is disabled*}
                    <div class="panel-body" v-if="field.groupSection.single_section == 'on' || (field.descriptionType == 'default' && field.description)" :class="[
                        { 'panel-body--tooltip' : field.descriptionType == 'tooltip' && field.description}
                    ]">
                        <h4 class="panel-title" v-html="field.details.optionname" v-if="field.groupSection.single_section == 'on'"></h4>
                        <i data-toggle="tooltip" :title="`<div class='tooltip-inner--lg'>` + field.description + `</div>`" data-html="true" class="lm lm-info section-tooltip section-tooltip--sm" v-if="field.descriptionType == 'tooltip' && field.description"></i>
                        <p class="panel-desc" v-html="field.description" v-if="field.descriptionType == 'default' && field.description"></p>
                    </div>
                    <div class="panel-icon" v-if="field.image" :class="[
                    { 'panel-icon--default': field.illustrationType == 'default'},
                    { 'panel-icon--icon': field.illustrationType == 'iconType'},
                    { 'panel-icon--illustration': field.illustrationType == 'illustrationType'},
                    { 'panel-icon--illustration-small': field.illustrationType == 'illustrationSmallType'}
                    ]">
                        <img :src="field.image"  alt="">
                    </div>
                    <div class="panel-options" :class="[
                        { 'panel-options--no-image': !field.image},
                    ]">
                        <div class="panel-actions">
                            <div class="check check-custom"
                                v-for="(opt, index) in getAllSuboptions()"
                                :value="index"
                            >
                                <label class="radio-label" @click="changeOption($event, opt)" :style="[
                            { 'background-color' : opt.overrideColor ? '#' + opt.color : 'transparent'},
                            ]">
                                    <input :id="opt.id" type="radio" :name="opt.nameonly + '-' + opt.id" class="" :value="opt.id" v-model="value">
                                    <div class="radio-styled"></div>
                                    {* <input type="radio" class="icheck-control" :value="opt.id" v-model="value" :name="opt.nameonly + '-' + opt.id"/> *}
                                    <div class="check-content">
                                        <span class="check-title" v-html="opt.nameonly" v-if="opt.nameonly"></span>
                                        <div class="check-subtitle" v-if="(opt.fullprice == '0.00' && !field.hideZeroPrices) || opt.fullprice != '0.00' || opt.setup > 0">
                                            <span v-html="getOptionPrice(opt)"></span>
                                            <span v-if="opt.setup" v-html="getOptionSetupFee(opt) + ' {$MGLANG->absoluteT('LagomOrderForm','product', 'setupFee')}'"></span>
                                        </div>
                                        <div class="check-description" v-if="opt.description" v-html="opt.description"></div>
                                    </div>
                                    <div class="check-icon" v-if="opt.image">
                                        <img :src="opt.image" :alt="opt.description">
                                    </div>
                                </label>
                            </div>
                        </div>
                    </div>
                    <span class="check-sign"><i class="ls ls-check"></i></span>
                </div>
            </div>
        </div>
        <div v-else-if="filteredGroup.length" class="row row-eq-height row-eq-height-xs" data-inputs-container :class="{ 'row-sm' :  layoutSettings.templates && layoutSettings.templates.lagom && layoutSettings.templates.lagom.active_style != 'modern'}" >
            <div
                v-for="opt in getFilteredSuboptions()"
                :class="[
                    { 'col-sm-6 col-md-4 col-xl-3' : showNumber},
                    { 'col-sm-6 col-md-4' : !showNumber}
                ]"
                >
                <div class="panel panel-check" :class="{ checked: isSelected(opt.id)}" data-virtual-input @click="changeOption($event, opt, filteredGroup[0].id)" :style="[
                            { 'background-color' : opt.overrideColor ? '#' + opt.color : 'transparent'},
                            ]">
                    <div class="check check-custom">
                        <span class="check-sign" v-if="isSelected(opt.id)">
                            <i class="ls ls-check"></i>
                        </span>
                        <label >
                            <input v-if="isSelected(opt.id)" :id="opt.id" type="radio" :name="opt.nameonly + '-' + opt.id" class="" :value="opt.id" v-model="value" checked>
{*                            <input v-else :id="opt.id" type="radio" :name="opt.nameonly + '-' + opt.id" class="" :value="opt.id" v-model="value">*}
                            <div class="radio-styled" :class="{ 'checked': isSelected(opt.id)}"></div>
                            {* <input type="radio" class="icheck-control" :value="opt.id" v-model="value" :name="opt.nameonly + '-' + opt.id"/> *}
                            <div class="check-content">
                                <h6 class="check-title" v-if="!String(opt.nameonly).includes(',')" v-html="opt.nameonly"></h6>
                                <h6 class="check-title check-title--box" v-else v-for="row in getNameRows(opt.nameonly)" v-html="row.trim()"></h6>
                                <p class="check-subtitle" v-if="(opt.fullprice == '0.00' && !field.hideZeroPrices) || opt.fullprice != '0.00' || opt.setup > 0">
                                    <span v-html="getOptionPrice(opt)"></span>
                                <span v-if="opt.setup" v-html="getOptionSetupFee(opt) + ' {$MGLANG->absoluteT('LagomOrderForm','product', 'setupFee')}'"></span>
                                </p>
                                <div class="check-description" v-if="opt.description" v-html="opt.description"></div>
                            </div>
                            <div class="check-icon" v-if="opt.image">
                                <img :src="opt.image" :alt="opt.description">
                            </div>
                        </label>
                    </div>
                </div>
            </div>
        </div>
        <div v-else class="row row-eq-height row-eq-height-xs" data-inputs-container :class="{ 'row-sm' :  layoutSettings.templates && layoutSettings.templates.lagom && layoutSettings.templates.lagom.active_style != 'modern'}" >
            <div
                v-for="(opt, index) in details.options"
                :value="index"
                :class="[
                    { 'col-sm-6 col-md-4 col-xl-3' : showNumber},
                    { 'col-sm-6 col-md-4' : !showNumber}
                ]" >
                <div class="panel panel-check" :class="{ checked: isSelected(opt.id)}" data-virtual-input>
                    <div class="check check-custom">
                        <span class="check-sign" v-if="isSelected(opt.id)">
                            <i class="ls ls-check"></i>
                        </span>
                        <label @click="changeOption($event, opt)" :style="[
                            { 'background-color' : opt.overrideColor ? '#' + opt.color : 'transparent'},
                            ]">
                            <input :id="opt.id" type="radio" :name="opt.nameonly + '-' + opt.id" class="" :value="opt.id" v-model="value">
                            <div class="radio-styled"></div>
                            {* <input type="radio" class="icheck-control" :value="opt.id" v-model="value" :name="opt.nameonly + '-' + opt.id"/> *}
                            <div class="check-content">
                                <h6 class="check-title" v-if="!String(opt.nameonly).includes(',')" v-html="opt.nameonly"></h6>
                                <h6 class="check-title check-title--box" v-else v-for="row in getNameRows(opt.nameonly)" v-html="row.trim()"></h6>
                                <p class="check-subtitle" v-if="(opt.fullprice == '0.00' && !field.hideZeroPrices) || opt.fullprice != '0.00' || opt.setup > 0">
                                    <span v-html="getOptionPrice(opt)"></span>
                                <span v-if="opt.setup" v-html="getOptionSetupFee(opt) + ' {$MGLANG->absoluteT('LagomOrderForm','product', 'setupFee')}'"></span>
                                </p>
                                <div class="check-description" v-if="opt.description" v-html="opt.description"></div>
                            </div>
                            <div class="check-icon" v-if="opt.image">
                                <img :src="opt.image" :alt="opt.description">
                            </div>
                        </label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</script>