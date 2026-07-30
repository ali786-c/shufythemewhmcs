<script type="text/x-template" id="t-mg-one-page-market-connect-field">
    <div :class="[
        { 'col-lg-6 field-sm' : showNumber},
        { 'col-lg-12' : !showNumber}
    ]">
        <div class="panel panel-addon has-icon panel-main-addon" v-if="visible" :class="{ checked: selected}" :id="field.id">
            <div class="panel-body">
                <h5 class="panel-title" v-html="field.title"></h5>
                <p class="panel-desc" v-html="field.description"></p>
                {*            *}
                <div class="panel-actions dropdown" v-if="!selected || loader">
                    <button class="btn btn-sm btn-primary-faded has-loader" :class="{ 'is-loading' : loader}" data-toggle="dropdown" >
                        <span class="btn-text">{$MGLANG->absoluteT('LagomOrderForm','marketConnector','addons','order','add')}</span>
                        <i class="ls ls-caret" v-if="!loader"></i>
                        <div class="btn-loader" v-if="loader">
                            <div class="spinner spinner-sm" >
                                <div class="rect1"></div>
                                <div class="rect2"></div>
                                <div class="rect3"></div>
                                <div class="rect4"></div>
                                <div class="rect5"></div>
                            </div>
                        </div>
                    </button>
                    <ul class="dropdown-menu">
                        <li>
                            <a class="radio" key="-1">
                                <label class="radio-label" :class="{ 'checked' : !selected && !loader}">
                                    <input type="radio" class="icheck-control" name="-1" value="-1" v-if="!selected && !loader" checked>
                                    <input type="radio" class="icheck-control" name="-1" value="-1" v-else>
                                    <div class="text">{$MGLANG->absoluteT('LagomOrderForm','marketConnector','addons','order','option', 'none')}</div>
                                </label>
                            </a>
                        </li>
                        <li v-for="(option, indexOpt) in activeOptions" >
                            <a class="radio">
                                <label class="radio-label">
                                    <input type="radio" class="icheck-control" :value="option.id" :name="field.id">
                                    <div class="text" v-html="option.addonName"></div>
                                    <span class="price price-addon" v-if="option.paytype == 'recurring'" v-html="getOptionPriceWithCycle(option)"></span>
                                    <span class="price price-addon" v-else-if="option.paytype == 'onetime'" v-html="getOptionPrice(option) + ` {$MGLANG->absoluteT('LagomOrderForm','oneTime')}`"></span>
                                    <span class="price price-addon" v-else-if="option.paytype == 'free'" v-html="`{$MGLANG->absoluteT('LagomOrderForm','addon','market-connect','free')}`"></span>
                                </label>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="panel-actions" v-if="selected && !loader">
                    <div class="btn-group">
                        <button href="#" class="btn btn-sm btn-primary" data-toggle="dropdown">
                            <span class="btn-text" v-if="selectedOption.paytype == 'recurring'" v-html="selectedOption.addonName + ' - ' + getOptionPriceWithCycle(selectedOption)"></span>
                            <span class="btn-text" v-else-if="selectedOption.paytype == 'onetime'" v-html="selectedOption.addonName + ' - ' + getOptionPrice(selectedOption) + ` {$MGLANG->absoluteT('LagomOrderForm','oneTime')}`"></span>
                            <span class="btn-text" v-else-if="selectedOption.paytype == 'free'" v-html="`{$MGLANG->absoluteT('LagomOrderForm','addon','market-connect','free')}`"></span>
                            <i class="ls ls-caret"></i>
                        </button>
                        <button type="button" class="btn btn-sm btn-primary btn-icon" v-on:click="removeAddon()"><i class="ls ls-close"></i></button>
                        <ul class="dropdown-menu">
                            <li>
                                <a class="radio" key="-1">
                                    <label class="radio-label">
                                        <input type="radio" class="icheck-control" name="-1" value="-1">
                                        <div class="text">{$MGLANG->absoluteT('LagomOrderForm','marketConnector','addons','order','option', 'none')}</div>
                                    </label>
                                </a>
                            </li>
                            <li v-for="(option, indexOpt) in activeOptions" >
                                <a class="radio" :key="option.id">
                                    <label class="radio-label">
                                        <input type="radio" class="icheck-control" :name="field.id" :value="option.id" v-if="option.id == addedId" checked>
                                        <input type="radio" class="icheck-control" :name="field.id" :value="option.id" v-else>
                                        <div class="text" v-html="option.addonName"></div>
                                        <span class="price price-addon" v-if="option.paytype == 'recurring'" v-html="getOptionPriceWithCycle(option)"></span>
                                        <span class="price price-addon" v-else-if="option.paytype == 'onetime'" v-html="getOptionPrice(option) + ` {$MGLANG->absoluteT('LagomOrderForm','oneTime')}`"></span>
                                    </label>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>    
            </div>
            <div class="panel-icon" v-if="svgRaw" v-html="svgRaw"></div>
            <div class="panel-icon" v-else>
                <img :src="field.path + field.icon + '.png'"  alt="">
            </div>
            {* <div class="panel-icon">
                <inline-svg :src="icon"/>
            </div> *}
            <span class="check-sign"><i class="ls ls-check"></i></span>
        </div>
    </div>
</script>