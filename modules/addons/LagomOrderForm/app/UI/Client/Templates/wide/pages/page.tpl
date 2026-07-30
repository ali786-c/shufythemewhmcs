<mg-component-body-{$elementId|strtolower}
        component_id='{$elementId}'
        component_namespace='{$namespace}'
        component_index='{$rawObject->getIndex()}'
        init_details='{$rawObject->getInitDetails()}'
></mg-component-body-{$elementId|strtolower}>
<div class="main-header preloaded">
    <div class="container">
        <div class="main-header-content">
            <div class="header-lined">
                <h1 id="newOrderHeader" class="main-header-title">{$MGLANG->absoluteT('order_new_product')}</h1>
            </div>
            {if $rawObject->getElementById('currencyComponent')}
                {$rawObject->insertElementById('currencyComponent')}
            {/if}
        </div>
    </div>
    {if $rawObject->getElementById('groupsComponent')}
        {$rawObject->insertElementById('groupsComponent')}
    {/if}
</div>
<div class="main-body preloaded">
    {if $rawObject->getElementById('loaderComponent')}
        {$rawObject->insertElementById('loaderComponent')}
    {/if}
    <div class="container">
        <div class="main-grid">
            <div class="main-content full-width"> 
                {foreach from=$rawObject->getOrganisedComponentsIds() key=name item=id}
                    {if $rawObject->getElementById($id)}
                        {$rawObject->insertElementById($id)}
                    {/if}
                {/foreach}

                {foreach from=$rawObject->getComponentFields() key=name item=id}
                    {if $rawObject->getElementById($id)}
                        {$rawObject->insertElementById($id)}
                    {/if}
                {/foreach}
            </div>
        </div>
    </div>
</div>