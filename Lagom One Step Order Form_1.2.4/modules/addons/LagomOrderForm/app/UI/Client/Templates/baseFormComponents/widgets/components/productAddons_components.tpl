<script type="text/x-template" id="t-mg-one-page-product-addons-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
    <div class="section section--addons" :class="[{ 'section--full-width': !showNumber}]" v-if="isVisible">
        <div class="section-number" v-if="showNumber">X</div>
        <div class="section-header">
            <h2 class="section-title">{$MGLANG->absoluteT('LagomOrderForm','adons','section','title')}</h2>
        </div>
        <div class="section-body">
            <v-form :schema="addons" :data="formData" v-bind:cycle="billingCycle"></v-form>
        </div>
    </div>
</script>