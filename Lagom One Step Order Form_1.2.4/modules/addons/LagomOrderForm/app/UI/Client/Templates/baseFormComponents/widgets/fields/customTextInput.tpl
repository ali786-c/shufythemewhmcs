<script type="text/x-template" id="t-mg-one-page-custom-field-text-input">
    <div class="col-md-6">
        <div class="form-group" :class="{ 'has-error': isValid() == false }">
            <label class="control-label">
                <span v-html="getTranslatedMessage(field.label)"></span>
                <span class="control-label-info" v-if="!field.required" v-html="'{$MGLANG->absoluteT('LagomOrderForm','orderForm','optional')}'"></span>
                <span class="control-label-info" v-else-if="layoutSettings.customFieldsRequired" v-html="'{$MGLANG->absoluteT('LagomOrderForm','orderForm','required')}'"></span>
            </label>
            <input class="form-control" type="text" v-model="value" :id="field.id" autocomplete="off" :placeholder="field.placeholder" @change="updateDataValue()">
            <span class="help-block" v-html="getTranslatedMessage(field.description)"></span>
            <div class="alert alert-danger alert-sm" v-if="!isValidField" v-html="getValidationMessage()"></div>
        </div>
    </div>
</script>