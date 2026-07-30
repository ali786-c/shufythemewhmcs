<script type="text/x-template" id="t-mg-one-page-product-addon-section">
    <div class="row row-eq-height row--addons" v-if="field.fields[0] !== undefined" :class="[
        { 'm-l-0 m-r-0' : showNumber },
        { 'm-b-neg-24 m-b-neg-3x' :layoutSettings.templates && layoutSettings.templates.lagom && layoutSettings.templates.lagom.active_style != 'modern' },
        { 'm-b-neg-24 m-b-neg-3x' : layoutSettings.templates && layoutSettings.templates.lagom && layoutSettings.templates.lagom.active_style == 'modern' }
        ]">
        <template v-for="field in field.fields">
            <component :is="field.type" :field="field" :data.sync="data" :key="field.id"></component>
        </template>
    </div>
</script>