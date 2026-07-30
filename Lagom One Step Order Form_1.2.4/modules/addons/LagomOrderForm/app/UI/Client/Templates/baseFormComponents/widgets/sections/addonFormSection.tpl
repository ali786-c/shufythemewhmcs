<script type="text/x-template" id="t-mg-one-page-addon-section-field">
    <div class="row row-eq-height row--addons">
        <template v-for="field in field.fields">
            <component :is="field.type" :field="field" :data.sync="data" :key="field.id"></component>
        </template>
    </div>
</script>