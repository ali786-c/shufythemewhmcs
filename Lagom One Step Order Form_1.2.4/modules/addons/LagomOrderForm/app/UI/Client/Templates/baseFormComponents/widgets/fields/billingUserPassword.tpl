<script type="text/x-template" id="t-mg-one-page-billing-user-password-field">
    <div class="col-sm-6" :class="progressBar.inputFrameClass">
        <div :id="'div-'+field.id" class="form-group" :class="{ 'has-error' : !isValidField }">
            <div class="password-content password-content-top password-content-group">
                <label :for="field.id" v-html="field.label"></label>
                <div class="progress" :id="'passwordStrengthBar-' + field.id" style="display: none;">
                    <div class="progress-bar" :class="progressBar.statusClass"
                            role="progressbar" aria-valuenow="0" aria-valuemin="0"
                            aria-valuemax="100" :style="progressBar.styles">
                        <span class="sr-only">{$MGLANG->absoluteT('LagomOrderForm','form','field','password','rating')}</span>
                    </div>
                </div>
                <span class="text-small text-lighter password-content-text">
                    <span id="passwordStrengthTextLabel">
                        {$MGLANG->absoluteT('LagomOrderForm','form','field','password','at_least')}
                    </span>
                    <i data-toggle="tooltip" title="{$MGLANG->absoluteT('LagomOrderForm','orderForm', 'passwordTooltip')}" data-html="true" class="ls ls-info-circle">
                    </i>
                </span>
            </div>
            <div class="input-password-strenght">
                <form autocomplete="off">
                    <input type="password" class="form-control" :name="field.name" :id="field.name" v-model="value">
                </form>
            </div>
            <div class="password-content">
                <button type="button" class="btn btn-default btn-sm generate-password" data-targetfields="inputNewPassword1,inputNewPassword2" @click="showModal()">
                    <i class="ls ls-refresh"></i>{$MGLANG->absoluteT('LagomOrderForm','billing_details','fields','generate','password')}
                </button>
            </div>
            <div class="alert alert-danger alert-sm" v-if="!isValidField" v-html="'{$MGLANG->absoluteT('addonCA','order', 'mainContainer', 'LagomOrderForm', 'clientArea', 'scripts', 'fieldIsRequired')}'"></div>
        </div>
    </div>
</script>