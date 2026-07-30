<mg-component-body-{$elementId|strtolower}
        component_id='{$elementId}'
        component_namespace='{$namespace}'
        component_index='{$rawObject->getIndex()}'
        img="{$rawObject->getImage()}"
        title="{if  $rawObject->getRawTitle()} {$rawObject->getRawTitle()} {else} {$MGLANG->T('button', $rawObject->getTitle())} {/if}"
></mg-component-body-{$elementId|strtolower}>

