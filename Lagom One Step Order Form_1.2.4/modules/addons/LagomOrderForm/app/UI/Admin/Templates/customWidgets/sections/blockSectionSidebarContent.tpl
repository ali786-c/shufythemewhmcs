<div class="lu-block__sidebar lu-block__sidebar--lg">
    <div class="lu-widget">
        {if $rawObject->isShowTitle()}
        <div class="lu-widget__header">
            <div class="lu-widget__top lu-top">
                <div class="lu-top__title"> {if $rawObject->isRawTitle()}{$rawObject->getRawTitle()}{elseif $rawObject->getTitle()}{$MGLANG->T($rawObject->getTitle())}{/if}</div>
            </div>
        </div>
        {/if}
        <div class="lu-widget__body">
            <div class="lu-widget__content">
                <div class="{$rawObject->getContentClasses()}">
                    {foreach from=$rawObject->getFieldComponents() item=field }
                        {$field->getHtml()}
                    {/foreach}

                </div>
            </div>
        </div>
        {if $rawObject->getActionButtons()}
            <div class="lu-widget__actions lu-widget__actions--raised">
                {foreach from=$rawObject->getActionButtons() item=button }
                    {$button->getHtml()}
                {/foreach}

            </div>
        {/if}
    </div>
</div>