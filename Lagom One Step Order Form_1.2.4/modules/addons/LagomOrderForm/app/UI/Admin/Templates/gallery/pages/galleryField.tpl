<div class="lu-row">
    <div class="lu-col-md-12"  id="{$elementId}">
        <mg-component-body-{$elementId|strtolower}
                component_id='{$elementId}'
                component_namespace='{$namespace}'
                component_index='{$rawObject->getIndex()}'
                gallery_path='{$rawObject->getGalleryPath()}'
                remove_button_namespace='{$rawObject->getRemoveButtonNamespace()}'
                remove_button_id='{$rawObject->getRemoveButtonId()}'
                modal_button_namespace='{$rawObject->getModalButtonNamespace()}'
                modal_button_id='{$rawObject->getModalButtonId()}'
        ></mg-component-body-{$elementId|strtolower}>
    </div>
</div>