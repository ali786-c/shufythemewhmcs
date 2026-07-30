<script type="text/x-template" id="t-mg-one-page-billing-password-field">
    <div class="col-sm-6">
        <div class="form-group" :class="[
            { 'has-error' : !isValidField || (!isMatched && password && isValidField) },
            { 'has-success' : isValidField && isMatched && value }
            ]" >
            <label :for="field.id" class="control-label">
                <span v-html="field.label"></span>
            </label>
            <form autocomplete="off">
                <input type="password" :name="field.name" :id="field.id" class="form-control" v-model="value" v-on:forcePassword="forcePassword()">
            </form>
            <div class="alert alert-danger alert-sm" v-if="!isValidField" v-html="'{$MGLANG->absoluteT('addonCA','order', 'mainContainer', 'LagomOrderForm', 'clientArea', 'scripts', 'fieldIsRequired')}'"></div>
            <p class="alert alert-danger alert-sm" id="nonMatchingPasswordResult" v-if="!isMatched && password && isValidField">{$MGLANG->absoluteT('LagomOrderForm','billing_details', 'password', 'do_not_match')}</p>
        </div>
    </div>
</script>