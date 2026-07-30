<div class="lu-widget__content">
    <h5>{$rawObject->getTitle()}</h5>
    {foreach from=$rawObject->getFieldComponents() item=field }
        {$field->getHtml()}
    {/foreach}
</div>