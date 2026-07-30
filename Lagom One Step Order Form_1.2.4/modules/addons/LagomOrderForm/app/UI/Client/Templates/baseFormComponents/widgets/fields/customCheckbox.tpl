<script type="text/x-template" id="t-mg-one-page-custom-field-checkbox-input">
    <div class="col-md-6">
        <div class="form-group" :class="{ 'has-error has-checkbox': isValid() == false }">
            <label class="checkbox checkbox-custom">
                <input type="checkbox" v-model="value" :id="field.id" @change="updateDataValue()">
                <div class="checkbox-styled"></div>
                <span v-html="getTranslatedMessage(field.label)"></span>
                <span class="control-label-info" v-if="!field.required" v-html="'{$MGLANG->absoluteT('LagomOrderForm','orderForm','optional')}'"></span>
                <span class="control-label-info" v-else-if="layoutSettings.customFieldsRequired" v-html="'{$MGLANG->absoluteT('LagomOrderForm','orderForm','required')}'"></span>
            </label>
            <span class="help-block"  v-html="getTranslatedMessage(field.description)"></span>
            <div class="alert alert-danger alert-sm" v-if="!isValidField" v-html="getValidationMessage()"></div>
        </div>
    </div>
</script>