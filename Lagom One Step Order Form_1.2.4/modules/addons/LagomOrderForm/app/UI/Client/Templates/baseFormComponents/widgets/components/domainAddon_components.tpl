<script type="text/x-template" id="t-mg-one-page-domain-addons-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
    <div class="section" :class="[{ 'section--full-width': !showNumber}]" v-if="isVisible">
        <div class="section-number" v-if="showNumber">X</div>
        <div class="section-header">
            <h2 class="section-title">{$MGLANG->absoluteT('LagomOrderForm','domain','section', 'title', 'addon')}</h2>
        </div>
        <div class="section-body">
            <div class="row row-eq-height row-eq-height-md m-b-neg-16 m-b-neg-2x row--addons">
                <template v-for="addon in availableAddons">
                    <domain-addon :key="addon.id" :field="addon" :data.sync="addons"></domain-addon>
                </template>
            </div>
        </div>
    </div>
</div>
</script>