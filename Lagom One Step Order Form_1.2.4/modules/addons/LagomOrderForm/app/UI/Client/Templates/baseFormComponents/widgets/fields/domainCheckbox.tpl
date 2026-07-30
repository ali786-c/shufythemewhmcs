<script type="text/x-template" id="t-mg-one-page-domain-checkbox-field">
    <div class="form-group" :id="field.id" :class="{ 'has-error': isValid() == false }">
        <label v-html="getTranslatedMessage(field.displayName)"></label>
        <div class="form-group__wrapper">
            <label class="checkbox checkbox-custom">
                <input type="checkbox" class="icheck-control" v-model="value" @change="change" :id="field.id">
                <div class="checkbox-styled"></div>
                <div v-html="getTranslatedMessage(field.description)"></div>
            </label>
            <div class="alert alert-danger alert-sm" v-if="!isValidField" v-html="getValidationMessage()"></div>
        </div>
    </div>
</script>