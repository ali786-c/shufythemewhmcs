<script type="text/x-template" id="t-mg-one-page-domain-text-field">
    <div class="form-group" :class="{ 'has-error': isValid() == false }">
        <label v-html="getTranslatedMessage(field.displayName)"></label>
        <div class="form-group__wrapper">
            <input type="text" class="form-control" :id="field.id" v-model="value" @change="change">
            <div class="alert alert-danger alert-sm" v-if="isValid() == false" v-html="getValidationMessage()"></div>
        </div>
    </div>
</script>