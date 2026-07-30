<script type="text/x-template" id="t-mg-one-page-billing-text-area-field">
    <div class="col-sm-6">
        <div class="form-group" :class="{ 'has-error': isValid() == false }">
            <label :for="field.id" class="control-label">
                <span v-html="field.label"></span>
                {* <span class="required" v-if="field.required">*</span> *}
                <span class="control-label-info" v-if="!field.required" v-html="'{$MGLANG->absoluteT('LagomOrderForm','orderForm','optional')}'"></span>
            </label>
            <textarea :name="field.name" rows="4" v-model="value" class="form-control" @change="updateDataValue()"></textarea>
            <span class="help-block" v-html="field.description"></span>
            <div class="alert alert-danger alert-sm" v-if="isValid() == false" v-html="getValidationMessage()"></div>
        </div>
    </div>
</script>