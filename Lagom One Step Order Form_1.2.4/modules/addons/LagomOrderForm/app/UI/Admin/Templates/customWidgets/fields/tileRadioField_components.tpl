<script type="text/x-template" id="t-mg-tile-radio-field-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
        :name="name"
        :active_value="active_value"
        :form_name="form_name"
        :form_data="form_data"
>

<div class="lu-tab-pane" id="tabExistingIcons">
    <div class="lu-preloader-container lu-preloader-container--full-screen lu-preloader-container--overlay" v-if="loading">
        <div class="lu-preloader lu-preloader--sm"></div>
    </div>
    <div class="lu-row lu-row--sm lu-neg-m-b-2x" v-else>
        <div class="lu-col-sm-3" v-for="(item, index) in items" {foreach $htmlAttributes as $aValue} {$aValue@key}="{$aValue}" {/foreach} >
                <a 
                    class="lu-widget lu-widget--sm lu-widget--gateway has-overlay" 
                    :class="(isSelected(item.id) === true ? 'is-active' : '')"
                    v-if="isSelectable">
                    <div class="lu-widget__overlay lu-widget__overlay--danger" v-if="!isSelected(item.id) && selected.length == 0 && !item.hasOwnProperty('isActive')">
                        <div class="lu-widget__content">
                            <div class="lu-msg lu-msg--sm">
                                <div class="lu-msg__icon">
                                    <span class="lu-zmdi lu-zmdi-delete"></span>
                                </div>
                                <div class="lu-msg__body">
                                    {$MGLANG->absoluteT('addonAA','gateways','removeIconModal','remove','title')}
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="lu-widget__media" :id="item.attrId">
                        <img :src="item.img" :alt="item.name"/>
                    </div>
                </a>
            <div class="lu-widget lu-widget--sm lu-widget--gateway" :class="(isSelected(item.id) === true ? 'is-active' : '')" v-else>
                <div class="lu-widget__media" :id="item.attrId">
                    <img :src="item.img" :alt="item.name"/>
                </div>
            </div>
        </div>
        <input type="hidden" :name="form_name + '['+ index + ']'" v-for="(item,index) in selected" :value="item" v-if="isMultiple">
        <input type="hidden" :name="form_name" v-for="(item,index) in selected" :value="item" v-else>
    </div>
</div>

</script>
