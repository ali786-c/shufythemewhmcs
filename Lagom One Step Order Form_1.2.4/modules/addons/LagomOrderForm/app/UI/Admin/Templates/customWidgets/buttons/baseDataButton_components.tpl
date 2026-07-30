<script type="text/x-template" id="t-mg-data-button-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
        :component_data="component_data"

>
    <button type="button" class="lu-btn lu-btn--success" {foreach $htmlAttributes as $aValue} {$aValue@key}="{$aValue}" {/foreach}>
        <span class="lu-btn__text">{if  $rawObject->getRawTitle()} {$rawObject->getRawTitle()} {else} {$MGLANG->T('button', $rawObject->getTitle())} {/if}</span>
    </button>

</script>