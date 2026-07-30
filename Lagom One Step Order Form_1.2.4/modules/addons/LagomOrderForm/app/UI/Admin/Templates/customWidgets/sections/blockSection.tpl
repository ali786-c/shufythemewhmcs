<div class="lu-block">
    {foreach from=$rawObject->getFieldComponents() item=field }
        {$field->getHtml()}
    {/foreach}
</div>
