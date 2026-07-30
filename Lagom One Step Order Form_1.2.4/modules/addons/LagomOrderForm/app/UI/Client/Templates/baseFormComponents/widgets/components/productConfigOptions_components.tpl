<script type="text/x-template" id="t-mg-one-page-product-conf-opt-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
    <div class="section" :class="[{ 'section--full-width': !showNumber}]" v-if="isVisible">
        <div class="section-body">
            <v-form class="section-config-options" :schema="configurableOptions" :data="formData" v-bind:cycle="billingCycle"></v-form>
        </div>
    </div>
</script>