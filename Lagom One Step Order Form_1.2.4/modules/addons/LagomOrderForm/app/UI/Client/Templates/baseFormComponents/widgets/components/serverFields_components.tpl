<script type="text/x-template" id="t-mg-one-page-product-server-fields-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
    <div class="section section--server-fields" v-if="isVisible" :class="[{ 'section--full-width': !showNumber}]">
        <div class="section-number" v-if="showNumber">X</div>
        <div class="section-header">
            <h2 class="section-title">{$MGLANG->absoluteT('LagomOrderForm','serverFields','section','title')}</h2>
        </div>
        <div class="section-body">
            <div class="panel panel-form">
                <div class="panel-body">
                    <v-form :schema="serverFields" :data="formData" class="row"></v-form>
                </div>
            </div>
        </div>
    </div>
</script>