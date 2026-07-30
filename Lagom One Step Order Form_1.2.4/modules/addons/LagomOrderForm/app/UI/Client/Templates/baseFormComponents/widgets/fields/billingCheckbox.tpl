<script type="text/x-template" id="t-mg-one-page-billing-checkbox-input">
    <div class="col-sm-6">
        <div class="form-group" :class="{ 'has-error has-checkbox': isValid() == false }" :id="field.id+'_section'">
            <label :for="field.id" class="checkbox checkbox-custom">
                <input class="" type="checkbox" :name="field.name" :id="field.id" v-model="value">
                <div class="checkbox-styled"></div>
                <span v-html="field.label"></span>
            </label>
            <span class="help-block" v-html="field.description" v-if="field.description"></span>
            <div class="alert alert-danger alert-sm" v-if="isValid() == false" v-html="getValidationMessage()"></div>
        </div>
    </div>
</script>
