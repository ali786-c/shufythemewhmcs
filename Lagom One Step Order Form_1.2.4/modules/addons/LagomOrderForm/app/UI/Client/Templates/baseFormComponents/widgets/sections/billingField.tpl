<script type="text/x-template" id="t-mg-one-page-billing-section-field">
    <div v-if="field.fields">
        <h6 class="m-t-16 m-t-2x" v-if="field.label" v-html="field.label"></h6>
        <div class="row row-sm">
            <template v-for="(field, index) in field.fields">
                <component :is="field.fieldType" :key="field.id" :field="field" :data.sync="data"></component>
            </template>
        </div>
    </div>
</script>