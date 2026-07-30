<script type="text/x-template" id="t-mg-one-page-product-custom-fields-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
    <div class="section section--custom-fields" :class="[{ 'section--full-width': !showNumber}]" v-if="isVisible">
        <div class="section-number" v-if="showNumber">X</div>
        <div class="section-header">
            <h2 class="section-title">{$MGLANG->absoluteT('LagomOrderForm','customFields','section','title')}</h2>
        </div>
        <div class="section-body">
            <div class="panel panel-form panel--billing">
                <div class="panel-body">
                    <form autocomplete="off">
                        <v-form :schema="customFields" :data="formData" v-bind:cycle="billingCycle" class="row row-eq-height row--addons"></v-form>
                    </form>
                </div>
            </div>   
        </div>
    </div>
</script>