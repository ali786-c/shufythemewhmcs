<script type="text/x-template" id="t-mg-one-page-slider-input-field">
    <div :id="fieldId" class="panel panel--main has-slider" :class="[
        { 'section section--config-options' : (showNumber && field.isFirstInGroup) || (showNumber && field.groupSection.single_section != 'on')},
        { 'panel--first' : field.isFirstInGroup},
        { 'panel--section' : field.groupSection.single_section != 'on' || !Object.keys(field.groupSection).length}
        ]">
        <div class="section-number" v-if="(showNumber && field.isFirstInGroup) || (showNumber && field.groupSection.single_section != 'on')">X</div>
        <div class="section-header" :class="[{ 'section-header--tooltip': field.isFirstInGroup && field.groupSection.section_description_type == 'tooltip'}]" v-if="field.isFirstInGroup && field.groupSection.single_section == 'on'">
            <h2 class="section-title" v-html="field.groupSection.section_title"></h2>
            <i data-toggle="tooltip" :title="`<div class='tooltip-inner--lg'>` + field.groupSection.section_description + `</div>`" data-html="true" class="lm lm-info section-tooltip" v-if="field.groupSection.section_description_type == 'tooltip'"></i>
            <p class="section-desc fghfgh" v-html="field.groupSection.section_description" v-if="field.groupSection.section_description_type == 'default' && field.groupSection.section_description"></p>
        </div>
        <div class="section-header panel-header" v-else-if="field.groupSection.single_section != 'on' || !Object.keys(field.groupSection).length" :class="[{ 'section-header--tooltip': field.descriptionType == 'tooltip' && field.description}]">
            <h2 class="section-title" v-html="details.optionname"></h2>
            <div class="panel-range-select" v-if="(field.groupSection.single_section != 'on' || !Object.keys(field.groupSection).length) && !dataOptions.isUnlimited">
                <button class="panel-range-btn panel-range-btn--decrease" @click="updateSlider('decrease')">
                    <inline-svg :src="sysURL + '/modules/addons/LagomOrderForm/templates/client/default/assets/img/templates/12x12-minus.svg'"/>
                </button>
                <input type="number" @keyup="updateSlider('checktyping')" :min="dataOptions.minValue" :max="dataOptions.maxValue" v-model="inputValue" @input="(inputValue >= dataOptions.minValue && inputValue <= dataOptions.maxValue) ? updateSlider() : ''">
                <button class="panel-range-btn panel-range-btn--increase" @click="updateSlider('increase')">
                    <inline-svg :src="sysURL + '/modules/addons/LagomOrderForm/templates/client/default/assets/img/templates/12x12-plus.svg'"/>
                </button>
            </div>
            <i data-toggle="tooltip" :title="`<div class='tooltip-inner--lg'>` + field.description + `</div>`" data-html="true" class="lm lm-info section-tooltip" v-if="field.descriptionType == 'tooltip' && field.description"></i>
            <p class="section-desc" v-html="field.description" v-if="field.descriptionType == 'default' && field.description"></p>
        </div>
        <div class="panel-header" v-if="field.groupSection.single_section == 'on'">
            <h5 class="panel-title" v-html="details.optionname" v-if="field.groupSection.single_section == 'on'"></h5>
            <i data-toggle="tooltip" :title="`<div class='tooltip-inner--lg'>` + field.description + `</div>`" data-html="true" class="lm lm-info section-tooltip" v-if="field.descriptionType == 'tooltip' && field.description"></i>
            <div class="panel-range-select" v-if="!dataOptions.isUnlimited">
                <button class="panel-range-btn panel-range-btn--decrease" @click="updateSlider('decrease')">
                    <inline-svg :src="sysURL + '/modules/addons/LagomOrderForm/templates/client/default/assets/img/templates/12x12-minus.svg'"/>
                </button>
                <input type="number" @keyup="updateSlider('checktyping')" :min="dataOptions.minValue" :max="dataOptions.maxValue" v-model="inputValue" @input="(inputValue >= dataOptions.minValue && inputValue <= dataOptions.maxValue) ? updateSlider() : ''">
                <button class="panel-range-btn panel-range-btn--increase" @click="updateSlider('increase')">
                    <inline-svg :src="sysURL + '/modules/addons/LagomOrderForm/templates/client/default/assets/img/templates/12x12-plus.svg'"/>
                </button>
            </div>
            <p class="panel-desc" v-html="field.description" v-if="field.descriptionType == 'default' && field.description"></p>
        </div>

        <div class="range-slider-container" v-if="visible && dataOptions.maxValue > 1 && !dataOptions.isUnlimited" :class="[
            { 'range-slider-container--no-price' : dataOptions.pricePerOne == '0.00' && (field.hideZeroPrices || layoutSettings.configurableOptionsPrices == 'hide') && details.options[0].setupFee == '0.00'}
        ]">
            <div class="range-slider-container-left" :class="[{ 'range-slider-container-left--setup-fee': details.options[0].setupFee > 0 && ((currencyPrefix || currencyPrefix == '') && (dataOptions.pricePerOne == '0.00' && !field.hideZeroPrices) || dataOptions.pricePerOne != '0.00') },{ 'mb-5' : field.hideZeroPrices || layoutSettings.configurableOptionsPrices == 'hide'}]">
                <div class="range-slider-container-slider" data-range-slider :id="fieldId+'-slider'"></div>
            </div>
            <div class="range-slider-container-right" v-show="(dataOptions.pricePerOne == '0.00' && !field.hideZeroPrices && layoutSettings.configurableOptionsPrices != 'hide') || dataOptions.pricePerOne != '0.00' || details.options[0].setupFee > 0">
                <div class="range-slider-container-price">
                    <span class="range-slider-container-prefix" v-if="getPrice() && (dataOptions.pricePerOne != '0.00' || (dataOptions.pricePerOne == '0.00' && !field.hideZeroPrices && layoutSettings.configurableOptionsPrices != 'hide'))">
                        {$MGLANG->absoluteT('LagomOrderForm','configurableOptions','quantity','price')}
                    </span>
                    <span class="range-slider-container-prefix" v-else-if="getSetupFee(true)">
                        {$MGLANG->absoluteT('LagomOrderForm','product', 'setupFee')}
                    </span>
                    <input type="hidden" :name="field.name" data-range-input :value='inputValue'>
                    <span class="range-slider-container-value" v-show="(currencyPrefix || currencyPrefix == '') && (dataOptions.pricePerOne == '0.00' && !field.hideZeroPrices && layoutSettings.configurableOptionsPrices != 'hide') || dataOptions.pricePerOne != '0.00' || details.options[0].setupFee > 0">
                        <span v-if="product.paytype === 'free'" v-html="`{$MGLANG->absoluteT('LagomOrderForm','Free')}`"></span>
                        <div v-else>
                            <span v-html="getPrice()" v-if="getPrice() && (dataOptions.pricePerOne != '0.00' || (dataOptions.pricePerOne == '0.00' && !field.hideZeroPrices && layoutSettings.configurableOptionsPrices != 'hide'))"></span>
                            <span v-html="getSetupFee(true)" v-else-if="getSetupFee(true)"></span>
                        </div>
                    </span>
                    <span v-if="product.paytype !== 'free' && getPrice() && (dataOptions.pricePerOne != '0.00' || (dataOptions.pricePerOne == '0.00' && !field.hideZeroPrices && layoutSettings.configurableOptionsPrices != 'hide'))">
                        <span class="text-wrap" v-if="details.options[0].setupFee > 0" v-html="getSetupFee()"></span>
                        <span class="text-wrap" v-if="getSetupFee()" v-html="' {$MGLANG->absoluteT('LagomOrderForm','product', 'setupFee')}'"></span>
                    </span>
                </div>
            </div>
        </div>

        <div class="panel panel-form" v-else-if="visible && dataOptions.isUnlimited">
            <div class="panel-body">
                <div class="input-group--qty" :class="{ 'input-group': details.selectedoption.length < 117 }">
                    <div class="input-container input-container-qty">
                        <button class="panel-range-btn panel-range-btn--decrease" @click="updateSlider('decrease')">
                            <inline-svg :src="sysURL + '/modules/addons/LagomOrderForm/templates/client/default/assets/img/templates/12x12-minus.svg'"/>
                        </button>
                        <input type="number" :name="field.name" ref="qtyInput" v-model="inputValue" :min="dataOptions.minValue" @input="(inputValue >= dataOptions.minValue && inputValue <= dataOptions.maxValue) ? updateSlider() : ''" class="form-control form-control-qty">

                        <button class="panel-range-btn panel-range-btn--increase" @click="updateSlider('increase')">
                            <inline-svg :src="sysURL + '/modules/addons/LagomOrderForm/templates/client/default/assets/img/templates/12x12-plus.svg'"/>
                        </button>
                    </div>
                    <div class="range-slider-container-right" :class="[{ 'mt-2': details.selectedoption.length < 117 === false}]" v-show="(dataOptions.pricePerOne == '0.00' && !field.hideZeroPrices && layoutSettings.configurableOptionsPrices != 'hide') || dataOptions.pricePerOne != '0.00' || details.options[0].setupFee > 0">
                        <div class="range-slider-container-price">
                            <span class="range-slider-container-prefix" v-if="getPrice() && (dataOptions.pricePerOne != '0.00' || (dataOptions.pricePerOne == '0.00' && !field.hideZeroPrices && layoutSettings.configurableOptionsPrices != 'hide'))">
                                {$MGLANG->absoluteT('LagomOrderForm','configurableOptions','quantity','price')}
                            </span>
                            <span class="range-slider-container-prefix" v-else-if="getSetupFee(true)">
                                {$MGLANG->absoluteT('LagomOrderForm','product', 'setupFee')}
                            </span>
                            <input type="hidden" :name="field.name" data-range-input :value='inputValue'>
                            <span class="range-slider-container-value" v-show="(currencyPrefix || currencyPrefix == '') && (dataOptions.pricePerOne == '0.00' && !field.hideZeroPrices && layoutSettings.configurableOptionsPrices != 'hide') || dataOptions.pricePerOne != '0.00' || details.options[0].setupFee > 0">
                                <span v-if="product.paytype === 'free'" v-html="`{$MGLANG->absoluteT('LagomOrderForm','Free')}`"></span>
                                <div v-else>
                                    <span v-html="getPrice()" v-if="getPrice() && (dataOptions.pricePerOne != '0.00' || (dataOptions.pricePerOne == '0.00' && !field.hideZeroPrices && layoutSettings.configurableOptionsPrices != 'hide'))"></span>
                                    <span v-html="getSetupFee(true)" v-else-if="getSetupFee(true)"></span>
                                    {* <span v-if="details.options[0].recurring == 0 && field.hideZeroPrices"></span> *}
                                    {* <span v-else-if="details.options[0].recurring == 0" v-html="$store.getters['cartStore/getZeroPrice']('configurableOptionsPrices')" class="text-wrap"></span> *}
                                    {* <span v-html="getPrice()" class="text-wrap" v-else-if="((details.options[0].recurring == 0 && !field.hideZeroPrices) || details.options[0].recurring != 0) && product.paytype !== 'free'"></span> *}
                                    {* <span v-else-if="getPrice() == false && details.options[0].setupFee" v-html="getSetupFee(true)"></span> *}
                                </div>
                            </span>
                            <span v-if="product.paytype !== 'free' && getPrice() && (dataOptions.pricePerOne != '0.00' || (dataOptions.pricePerOne == '0.00' && !field.hideZeroPrices && layoutSettings.configurableOptionsPrices != 'hide'))">
                                <span class="text-wrap" v-if="details.options[0].setupFee > 0" v-html="getSetupFee()"></span>
                                <span class="text-wrap" v-if="getSetupFee()" v-html="' {$MGLANG->absoluteT('LagomOrderForm','product', 'setupFee')}'"></span>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</script>
