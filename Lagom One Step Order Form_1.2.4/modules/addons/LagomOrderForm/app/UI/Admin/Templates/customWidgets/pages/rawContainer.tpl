    {foreach from=$rawObject->getFieldComponents() item=field }
        {$field->getHtml()}
    {/foreach}