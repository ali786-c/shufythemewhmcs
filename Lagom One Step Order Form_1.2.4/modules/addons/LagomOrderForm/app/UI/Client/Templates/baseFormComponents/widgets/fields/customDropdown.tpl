<script type="text/x-template" id="t-mg-one-page-custom-field-dropdown-input">
    {* <div class="row"> *}
    <div class="col-md-6">
        <div class="form-group" :class="{ 'has-error': isValid() == false }">
            <label class="control-label">
                <span v-html="getTranslatedMessage(field.label)"></span>
                <span class="control-label-info" v-if="!field.required" v-html="'{$MGLANG->absoluteT('LagomOrderForm','orderForm','optional')}'"></span>
                <span class="control-label-info" v-else-if="layoutSettings.customFieldsRequired" v-html="'{$MGLANG->absoluteT('LagomOrderForm','orderForm','required')}'"></span>
            </label>
            <select class="form-control" :type="field.type" :name="field.name" :id="field.id" v-model="value" @change="updateDataValue()">
                <option v-for="(value, index) in field.options" :value="index" v-html="getTranslatedMessage(value)"></option>
            </select>
            <span class="help-block" v-html="getTranslatedMessage(field.description)"></span>
            <div class="alert alert-danger alert-sm" v-if="!isValidField" v-html="getValidationMessage()"></div>
        </div>
    </div>
    {* </div> *}
</script>