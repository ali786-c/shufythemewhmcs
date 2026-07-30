<script type="text/x-template" id="t-mg-one-page-form-field">
    <div class="VueForm">
        <template v-for="field in schema.fields">
            <component :is="field.type" :key="field.id" :field="field" :data.sync="data"></component>
        </template>
    </div>
</script>