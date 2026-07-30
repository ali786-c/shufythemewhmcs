<script type="text/x-template" id="t-mg-one-page-custom-field-text-area-input">
    {* <div class="row"> *}
    <div class="col-md-6">
        <div class="form-group" :class="{ 'has-error': isValid() == false }">
            <label class="control-label">
                <span v-html="getTranslatedMessage(field.label)"></span>
                <span class="control-label-info" v-if="!field.required" v-html="'{$MGLANG->absoluteT('LagomOrderForm','orderForm','optional')}'"></span>
                <span class="control-label-info" v-else-if="layoutSettings.customFieldsRequired" v-html="'{$MGLANG->absoluteT('LagomOrderForm','orderForm','required')}'"></span>
            </label>
            <textarea :name="field.name" rows="4" v-model="value" :placeholder="field.placeholder" class="form-control" :id="field.id" @change="updateDataValue()"></textarea>
            <span class="help-block" v-html="getTranslatedMessage(field.description)"></span>
            <div class="alert alert-danger alert-sm" v-if="!isValidField" v-html="getValidationMessage()"></div>
        </div>
    </div>
    {* </div> *}
</script>