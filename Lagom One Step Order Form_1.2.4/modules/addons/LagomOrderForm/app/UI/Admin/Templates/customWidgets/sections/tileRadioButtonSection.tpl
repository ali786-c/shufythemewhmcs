<div class="lu-widget__content">
        {if $rawObject->isShowTitle()} <h5> {if $rawObject->isRawTitle()}{$rawObject->getRawTitle()}{elseif $rawObject->getTitle()}{$MGLANG->T($rawObject->getTitle())}{/if}</h5> {/if}
    <mg-component-body-{$elementId|strtolower}
            component_id='{$elementId}'
            component_namespace='{$namespace}'
            component_index='{$rawObject->getIndex()}'
            tile_buttons_encoded='{$rawObject->getTileButtonComponentsArray(true)}'
            name='{$rawObject->getName()}'
            active_value='{$rawObject->getValue()}'
    ></mg-component-body-{$elementId|strtolower}>
    <div class="lu-form-feedback lu-form-feedback--icon" hidden="hidden">
    </div>
</div>