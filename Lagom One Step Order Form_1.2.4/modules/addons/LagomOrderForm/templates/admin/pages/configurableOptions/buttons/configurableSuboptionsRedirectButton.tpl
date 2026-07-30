<a {foreach $htmlAttributes as $aValue} {$aValue@key}="{$aValue}" {/foreach}
    {if $rawObject->isRawTitle()}
        title="{$rawObject->getRawTitle()}"
    {elseif $rawObject->getTitle()}
        title="{$MGLANG->T('button', $rawObject->getTitle())}"
    {/if}
    class="{$rawObject->getClasses()}"

    :disabled="dataRow.{$rawObject->getDisableColumnName()} == '{$rawObject->getDisableColumnValue()}'"
    >
    {if $rawObject->getIcon()}
        <i class="{$rawObject->getIcon()}"></i>
    {/if}

    {if $rawObject->isShowTitle()}
        <span class="lu-btn__text">
            {if $rawObject->isRawTitle()}
                {$rawObject->getRawTitle()}
            {elseif $rawObject->getTitle()}
                {$MGLANG->T('button', $rawObject->getTitle())}
            {/if}
        </span>
    {/if}
</a>