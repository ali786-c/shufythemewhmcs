<div class="lu-widget">
    {foreach from=$rawObject->getFieldComponents() item=field }
        {$field->getHtml()}
    {/foreach}
</div>
