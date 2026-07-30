<script type="text/x-template" id="t-mg-one-page-billing-dropdown-field">
    <div class="col-sm-6">
        <div class="form-group" :class="{ 'has-error': isValid() == false }">
            <label :for="field.id" class="control-label">
                <span v-html="field.label"></span>
                <span class="control-label-info" v-if="!field.required" v-html="'{$MGLANG->absoluteT('LagomOrderForm','orderForm','optional')}'"></span>
                {* <span class="required" v-if="field.required">*</span> *}
            </label>
            <select class="form-control" :type="field.type" :name="field.name" :id="field.id" v-model="value" @change="updateDataValue()">
                <option v-for="(value, index) in field.options" :value="index" v-html="value"></option>
            </select>
            <span class="help-block" v-html="field.description"></span>
        </div>
    </div>
</script>