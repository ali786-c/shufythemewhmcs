<script type="text/x-template" id="t-mg-tile-radio-buttons-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
        :name="name"
        :active_value='active_value'
>
    <div class="lu-row" :id="component_id">
        <template v-for="button in tileButtons">
            <div class="lu-col-sm-6 lu-col-md-3 lu-col-lg-2" v-if="button.isVisible">
                <div class="lu-widget lu-widget--settings" :class="[(button.isDisabled === true ? 'is-disabled' : ''), (button.value === activeTileButton ? 'is-active' : '')]" >
                    <span class="check-sign" v-if="button.value === activeTileButton"><i class="ls ls-check"></i></span>
                    <div class="lu-widget__media" @click="activeTile(button.value, button.isDisabled)">
                        <div class="lu-widget__content" >
                            <img :src="button.imagePath">
                        </div>
                    </div>
                </div>
                <h6 v-html="button.title" v-if="button.isAvailable"></h6>
                <h6 v-else>{literal}{{button.title}} {/literal}<span class="lu-label lu-label--sm lu-label--outline lu-label--primary">{$MGLANG->T('Soon')}</span></h6>
            </div>
        </template>
        <input type="hidden" :name="name" :value="activeTileButton">
    </div>

</script>
