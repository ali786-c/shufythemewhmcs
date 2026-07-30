<script type="text/x-template" id="t-mg-tile-standalone-button-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
        :img="img"
        :title="title"

>
<div class="lu-col-xxl-2 lu-col-xl-3 lu-col-md-4 lu-col-sm-6">
    <a data-toggle="lu-modal" class="lu-widget lu-widget--big lu-widget--gateway" :class="(imagePath ? 'has-overlay' : '')">
        <div class="lu-widget__media" {foreach $htmlAttributes as $aValue} {$aValue@key}="{$aValue}" {/foreach}>
            <div  :class="(imagePath ? 'lu-widget__overlay' : '')">
                <div class="lu-widget__content" id="{$rawObject->getId()}">
                    <div class="lu-msg lu-msg--sm">
                        <div class="lu-msg__icon lu-i-c--bordered-dash">
                            <span class="lu-i-c lu-zmdi lu-i-c-2x lu-zmdi-image-alt lu-text-default"></span>
                        </div>
                        <div class="lu-msg__body">
                            <div class="lu-msg__title lu-type-8">{$MGLANG->absoluteT('button', 'clickToAssign')}</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="lu-widget__content" v-if="imagePath">
                <img :src="imagePath" :alt="title"/>
            </div>
        </div>
    </a>
    <h6 v-html="title"></h6>
</div>

</script>