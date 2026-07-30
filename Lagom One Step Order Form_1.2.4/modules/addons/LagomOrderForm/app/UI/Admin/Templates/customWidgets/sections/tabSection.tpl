<div class="lu-col-md-12">
    {if $rawObject->haveInternalAlertMessage()}
        <div class="lu-alert {if $rawObject->getInternalAlertSize() !== ''}lu-alert--{$rawObject->getInternalAlertSize()}{/if} lu-alert--{$rawObject->getInternalAlertMessageType()} lu-alert--faded modal-alert-top">
            <div class="lu-alert__body">
                {if $rawObject->isInternalAlertMessageRaw()|unescape:'html'}{$rawObject->getInternalAlertMessage()}{else}{$MGLANG->T($rawObject->getInternalAlertMessage())|unescape:'html'}{/if}
            </div>
        </div>
    {/if}
    {foreach from=$rawObject->getFieldComponents() item=field }
        {$field->getHtml()}
    {/foreach}
</div>