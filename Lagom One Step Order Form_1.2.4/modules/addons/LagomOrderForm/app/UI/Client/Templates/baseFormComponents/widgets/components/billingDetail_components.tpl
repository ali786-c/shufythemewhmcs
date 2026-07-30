<script type="text/x-template" id="t-mg-one-page-billing-details-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>

    <div class="section section--billing-details" :class="[{ 'section--full-width': !showNumber}]" v-if="isVisible && !$store.state.cartStore.areAvailableAddons && !isAddonPage">
        <div class="section-number" v-if="showNumber">X</div>
        <div class="section-header">
            <h2 class="section-title">{$MGLANG->absoluteT('LagomOrderForm','section','title','billingdetails')}</h2>
        </div>

        <div class="section-body" id="billing-details-component">

            {*USER WITH SUB ACCOUNTS *}
            <div class="panel-group panel-group-condensed m-b-0"  id="customerBillingAccounts" data-inputs-container v-if="showCustTypeDetails" :class="[{ 'panel-group-condensed-full-width' : showNumber}]">
                <div class="panel panel-check panel-default panel--no-border panel--billing" data-virtual-input v-for="(user) in userAccounts" v-if="user.email" :class="[{ 'checked' : user.id == accountId}, { 'disabled' : user.permissions.length && !user.permissions.includes('order') }]" >
                    <div class="panel-heading check" :style="[ user.permissions.length && !user.permissions.includes('order') ? { 'pointer-events': 'none'} : '' ]">
                        <label v-on:click="initUpdateRequest()">
                            <input class="icheck-control" type="radio" name="account_id" id="account_id"
                                   v-model="accountId" :value="user.id">
                            <div class="check-content d-flex align-center">
                                <span v-html="user.firstname + ' ' + user.lastname"></span>
                            </div>
                            <div class="label label-default account-select-label" v-if="user.permissions.length && !user.permissions.includes('order')">
                                {$MGLANG->absoluteT('LagomOrderForm','noPermission')}
                            </div>
                            <span class="check-icon" v-else>
                                <span class="label label-info" v-if="currencies[user.currency - 1]"  v-html="currencies[user.currency - 1].code">
                                </span>
                            </span>
                        </label>
                    </div>
                    <div class="panel-collapse collapse" :class="[(user.id == accountId ) ? 'in': '']" data-input-collapse="" role="tabpanel">
                        <div class="panel-body">
                            <address>
                                <span class="address-item" v-html="user.email"></span> <br>
                                <span class="address-item" v-html="user.address1"></span><span class="address-item" v-if="user.address2"  v-html="','+user.address2"></span><br>
                                <span class="address-item" v-html="user.city"></span><span class="address-item" v-html="','+user.postcode"></span><br>
                                <span class="address-item" v-html="user.state"></span> <br>
                                <span class="address-item" v-html="user.country"></span> <br>
                                <span class="address-item" v-html="user.phonenumber"></span>
                            </address>
                        </div>
                    </div>
                </div>
                <div class="panel panel-check panel-default panel--no-border panel--billing" data-virtual-input v-if="showCustTypeDetails" v-bind:class="[('new' == accountId ) ? 'checked': '']">
                    <div class="panel-heading check">
                        <label v-on:click="initUpdateRequest()">
                            <input class="icheck-control" type="radio" name="account_id" id="account_id"
                                   v-model="accountId" value="new"">
                            <div class="check-content">
                                <span>{$MGLANG->absoluteT('LagomOrderForm','orderForm','createAccount')}</span>
                            </div>
                        </label>
                    </div>
                    <div class="panel-collapse collapse"
                         v-bind:class="[('new' == accountId ) ? 'in': '']" data-input-collapse
                         role="tabpanel">
                        <div class="panel-body">
                            {if $rawObject->buttonsExists()}
                                <div class="social-login social-wide m-b-8">
                                    <p class="small text-center text-muted social-description">{$MGLANG->absoluteT('LagomOrderForm','social','description')}</p>
                                    <div class="d-flex justify-center social-container providerPreLinking">
                                        <div class="social-signin-btns">
                                            {foreach from=$rawObject->getButtons() key=buttonKey item=buttonValue}
                                                {if $buttonKey == 'googleAuth'}
                                                    <div class="google-button-login"></div>
                                                {else}
                                                    {$buttonValue->getRegisterButton()}
                                                {/if}
                                            {/foreach}
                                        </div>
                                    </div>
                                </div>
                                <div class="providerLinkingFeedback"></div>
                                <div class="login-divider">
                                    <span></span>
                                    <span>{$MGLANG->absoluteT('LagomOrderForm','social','or')}</span>
                                    <span></span>
                                </div>
                            {/if}
                            <h6 class="m-t-2x">{$MGLANG->absoluteT('LagomOrderForm','orderForm', 'personalInformation')}</h6>
                            <div class="row row-sm">
                                <div v-for="field in getPersonalInformationFields()" class="col-sm-6" v-if="!layoutSettings.hideBillingDetails.includes(field)">
                                    <div class="form-group" :class="{ 'has-error': isValid(field) == false }" >
                                        <label class="control-label">
                                            <span v-html="getTranslatedMessage(field)"></span>
                                            <span class="control-label-info" v-if="optionalFields.includes(field)">{$MGLANG->absoluteT('LagomOrderForm','orderForm','optional')}</span>
                                        </label>
                                        <input type="text" :name="field" :id="field" class="form-control"
                                               v-model="personalDetails[field]">
                                        <div class="alert alert-danger alert-sm" v-if="isValid(field) == false"
                                             v-html="getValidationMessage(field)"></div>
                                    </div>
                                </div>
                            </div>
                            <h6 class="m-t-16 m-t-2x">{$MGLANG->absoluteT('LagomOrderForm','orderForm','billingAddress')}</h6>
                            <div class="row row-sm">
                                <div v-for="field in getBillingAddressFields()" class="col-sm-6" v-if="!layoutSettings.hideBillingDetails.includes(field)">
                                    <div class="form-group" :class="{ 'has-error': isValid('country') == false }" v-if="field === 'country'">
                                        <label class="control-label" for="country">
                                            {$MGLANG->absoluteT('LagomOrderForm','orderForm','country')}
                                            <span class="control-label-info" v-if="!fieldValidatorsRegister.country">{$MGLANG->absoluteT('LagomOrderForm','orderForm','optional')}</span>
                                        </label>
                                        <select name="country" id="inputCountry" class="form-control"
                                                v-model="personalDetails.country"
                                                @change="estimateTax()">
                                            <option v-for="(option, index) in countries" :value="index"
                                                    v-html="option.name"></option>
                                        </select>
                                    </div>
                                    <div v-else-if="field === 'state'">
                                        <div class="form-group" :class="{ 'has-error': isValid('state') == false }" v-if="!layoutSettings.hideBillingDetails.includes('state')">
                                            <label for="inputState" class="control-label">
                                                {$MGLANG->absoluteT('LagomOrderForm','orderForm','state')}
                                                <span class="control-label-info" v-if="optionalFields.includes('state')">{$MGLANG->absoluteT('LagomOrderForm','orderForm','optional')}</span>
                                            </label>
                                            <div v-if="selectedStates.length > 0">
                                                <select name="state" id="state" v-model="personalDetails.state"
                                                        @change="estimateTax()" class="form-control">
                                                    <option v-for="(state, index) in selectedStates" :value="state"
                                                            v-html="state"></option>
                                                </select>
                                            </div>
                                            <div v-else>
                                                <input type="text" name="state" id="state" class="form-control"
                                                       required="required" v-model="personalDetails.state"
                                                       @change="estimateTax()"
                                                >
                                            </div>
                                            <div class="alert alert-danger alert-sm" v-if="isValid('state') == false"
                                                 v-html="getValidationMessage('state')"></div>
                                        </div>
                                    </div>
                                    <div class="form-group" :class="{ 'has-error': isValid(field) == false }" v-else-if="!layoutSettings.hideBillingDetails.includes(field)">
                                        <label class="control-label">
                                            <span v-html="getTranslatedMessage(field)"></span>
                                            <span class="control-label-info" v-if="optionalFields.includes(field)">{$MGLANG->absoluteT('LagomOrderForm','orderForm','optional')}</span>
                                        </label>
                                        <input type="text" :name="field" :id="field" class="form-control"
                                               v-model="personalDetails[field]">
                                        <div class="alert alert-danger alert-sm" v-if="isValid(field) == false"
                                             v-html="getValidationMessage(field)"></div>
                                    </div>
                                </div>
                            </div>
                            <div v-if="formSchema != undefined">
                                <template v-for="(field, index) in additionalFields">
                                    <component :is="field.fieldType" :key="field.id" :field="field"
                                               :data.sync="formData"></component>
                                </template>
                            </div>

                        </div>
                    </div>
                </div>
                {* END OF ADD USER *}
            </div>
            {*IF USER EXISTS *}
            <div class="panel panel-form" v-if="showClientDetails">
                <div class="panel-body">
                    <h4 class="address-heading" v-if="personalDetails.companyname"
                        v-html="personalDetails.companyname"></h4>
                    <address>
                        <span class="address-item" v-html="personalDetails.firstname"></span> <span class="address-item" v-html="personalDetails.lastname"></span><br/>
                        <span class="address-item" v-html="personalDetails.email"></span> <br/>
                        <span class="address-item" v-html="personalDetails.address"></span>
                        <span class="address-item" v-if="personalDetails.address2"
                              v-html="'<br>' + personalDetails.address2"></span><br/>
                        <span class="address-item" v-html="personalDetails.city"></span>, <span class="address-item" v-html="personalDetails.postcode"></span><br/>
                        <span class="address-item" v-html="personalDetails.state"></span><br/>
                        <span class="address-item" v-html="personalDetails.country"></span><br/>
                        <span class="address-item"
                              v-if="personalDetails.tax_id">{$MGLANG->absoluteT('LagomOrderForm','field', 'tax_id')}<span
                                    v-html="personalDetails.tax_id"></span></span><br v-if="personalDetails.tax_id"/>
                        <span class="address-item" v-html="personalDetails.phonenumber"></span>
                    </address>
                    <div class="hidden">
                        <input type="hidden" name="user_type" id="inputCustType" v-model="personalDetails.exist">
                        <input type="hidden" name="firstname" v-model="personalDetails.firstname">
                        <input type="hidden" name="lastname" v-model="personalDetails.lastname">
                        <input type="hidden" name="companyname" v-model="personalDetails.companyname">
                        <input type="hidden" name="address1" v-model="personalDetails.address1">
                        <input type="hidden" name="address2" v-model="personalDetails.address2">
                        <input type="hidden" name="city" v-model="personalDetails.city">
                        <input type="hidden" name="state" v-model="personalDetails.state">
                        <input type="hidden" name="postcode" v-model="personalDetails.postcode">
                        <input type="hidden" name="country" v-model="personalDetails.country">
                        <input type="hidden" name="email" v-model="personalDetails.email">
                        <input type="hidden" name="phonenumber" v-model="personalDetails.phonenumber">
                        <input type="hidden" name="tax_id" id="inputTaxId" v-model="personalDetails.tax">
                    </div>
                </div>
            </div>

            {*IF ! USER EXISTS USER *}
            <div class="panel-group panel-group-condensed m-b-0" id="loginOrNewUser" data-inputs-container :class="[{ 'panel-group-condensed-full-width' : showNumber}]"
                 v-if="!userExist">
                {*LOGIN USER *}
                <div  class="panel panel-check panel-default panel--no-border panel--billing" v-bind:class="[('loginOption' == selectedSection ) ? 'checked': '']" data-virtual-input>
                    <div class="panel-heading check" >
                        <label v-on:click="initUpdateRequest()">
                            <input value="loginOption" class="icheck-control" type="radio" name="user_type"
                                   id="user_user" v-model="selectedSection">
                            <div class="check-content">
                                <span>{$MGLANG->absoluteT('LagomOrderForm','orderForm','existingCustomerLogin')}</span>
                            </div>
                        </label>
                    </div>
                    <div class="panel-collapse collapse"
                         v-bind:class="[('loginOption' == selectedSection ) ? 'in': '']" data-input-collapse
                         role="tabpanel">
                        <div class="panel-body">
                            <div class="alert m-b-16 alert--full-width" :class='alertType' v-if="showError" v-html="error"></div>
                            {* SOCIAL FIELDS *}
                            {if $rawObject->buttonsExists()}
                                <div class="social-login social-wide m-b-8">
                                    <p class="small text-center text-muted social-description">{$MGLANG->absoluteT('LagomOrderForm','social','description')}</p>
                                    <div class="d-flex justify-center social-container providerPreLinking">
                                        <div class="social-signin-btns">
                                            {foreach from=$rawObject->getButtons() key=buttonKey item=buttonValue}
                                                {if $buttonKey == 'googleAuth'}
                                                    <div class="google-button-login"></div>
                                                {else}
                                                    {$buttonValue->getRegisterButton()}
                                                {/if}
                                            {/foreach}
                                        </div>
                                    </div>
                                </div>
                                <div class="providerLinkingFeedback"></div>
                                <div class="login-divider">
                                    <span></span>
                                    <span>{$MGLANG->absoluteT('LagomOrderForm','social','or')}</span>
                                    <span></span>
                                </div>
                            {/if}
                            {* END OF SOCIAL FIELDS *}
                            <div class="inline-form flex-column-sm">
                                <div :id="registerDetailsVisible ? 'email': ''" class="inline-form-element w-100" :class="{ 'has-error': !loginDetails.email && fieldValidatorsLogin.email.length && fieldValidationMessages.email && selectedSection == 'loginOption' }">
                                    <label for="loginemail" class="control-label">
                                        {$MGLANG->absoluteT('LagomOrderForm','loginemail')}
                                    </label>
                                    <input type="text" name="loginemail" id="loginemail"
                                           v-model="loginDetails.email" class="form-control" @keyup.enter="loginUser()" @change="updateLoginDetails">
                                    <div class="alert alert-danger alert-sm" v-if="!loginDetails.email && fieldValidatorsLogin.email.length && fieldValidationMessages.email && selectedSection == 'loginOption'"
                                         v-html="'{$MGLANG->absoluteT('addonCA','order', 'mainContainer', 'LagomOrderForm', 'clientArea', 'scripts', 'fieldIsRequired')}'"></div>
                                </div>
                                <div :id="registerDetailsVisible ? 'password': ''" class="inline-form-element w-100" :class="{ 'has-error': fieldValidatorsLogin.password.length && fieldValidationMessages.password && selectedSection == 'loginOption' }">
                                    <label for="loginpassword"
                                           class="control-label">{$MGLANG->absoluteT('LagomOrderForm','loginpassword')}</label>
                                    <input type="password" name="loginpassword" id="loginpassword"
                                           v-model="loginDetails.password" class="form-control" @keyup.enter="loginUser()" @change="updateLoginDetails">
                                    <div class="alert alert-danger alert-sm" v-if="fieldValidatorsLogin.password.length && fieldValidationMessages.password && selectedSection == 'loginOption'"
                                         v-html="'{$MGLANG->absoluteT('addonCA','order', 'mainContainer', 'LagomOrderForm', 'clientArea', 'scripts', 'fieldIsRequired')}'"></div>
                                </div>
                                <div class="inline-form-element m-r-0">
                                    <label class="control-label hidden-sm hidden-xs">&nbsp;</label>
                                    <button type="button" class="btn btn-block btn-primary" @click="loginUser()" :class="{ 'btn-recaptcha btn-recaptcha-invisible' : captcha.type =='invisible'}">
                                        <span class="btn-text"
                                              v-if="!isLogging">{$MGLANG->absoluteT('LagomOrderForm','loginbutton')}</span>
                                        <div class="btn-loader">
                                            <div class="spinner spinner-light spinner-sm" v-if="isLogging">
                                                <div class="rect1"></div>
                                                <div class="rect2"></div>
                                                <div class="rect3"></div>
                                                <div class="rect4"></div>
                                                <div class="rect5"></div>
                                            </div>
                                        </div>
                                    </button>
                                </div>
                            </div>

                            <div v-if="backupCodeEnabled">
                                <form method="post" id="2faForm" onsubmit="mgPreventEventHelper(event)"  @keyup.enter="loginUserPreventEvent($event)">
                                    <div class="form-group">
                                        <label for="code">{$MGLANG->absoluteT('LagomOrderForm','twoFactorAuth','required', 'description')}</label>
                                        <input type="text" name="code" class="form-control"
                                               placeholder="{$MGLANG->absoluteT('LagomOrderForm','twoFactorAuth','required', 'placeholder')}">
                                        <input type="hidden" name="backupcode" class="form-control"
                                               value="true">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                {* END OF LOGIN USER *}
                {* ADD USER *}
                <div  class="panel panel-check panel-default panel--no-border panel--billing" v-bind:class="[('registerOption' == selectedSection ) ? 'checked': '']" data-virtual-input>
                    <div class="panel-heading check">
                        <label v-on:click="initUpdateRequest()">
                            <input value="registerOption" class="icheck-control" type="radio" name="user_type"
                                   id="guest_user" v-model="selectedSection">
                            <div class="check-content">
                                <span v-if="!userExist">{$MGLANG->absoluteT('LagomOrderForm','orderForm','createAccount')}</span>
                                <span v-else>{$MGLANG->absoluteT('LagomOrderForm','orderForm','personalInformation')}</span>
                            </div>
                        </label>
                    </div>

                    <div class="panel-collapse collapse"
                         v-bind:class="[('registerOption' == selectedSection ) ? 'in': '']" data-input-collapse
                         role="tabpanel">
                        <div class="panel-body">
                            {* SOCIAL FIELDS *}
                            {if $rawObject->buttonsExists()}
                                <div id="providerLinkingMessages" class="hidden">
                                    <p class="providerLinkingMsg-preLink-init_failed">

                                        <span class="provider-name"></span> {$MGLANG->absoluteT('remoteAuthn','unavailable')}
                                    </p>
                                    <p class="providerLinkingMsg-preLink-connect_error">
                                        <strong>{$MGLANG->absoluteT('remoteAuthn','error')}</strong> {$MGLANG->absoluteT('remoteAuthn','connectError')}
                                    </p>
                                    <p class="providerLinkingMsg-preLink-complete_sign_in">
                                        {$MGLANG->absoluteT('remoteAuthn','completeSignIn')}
                                    </p>
                                    <p class="providerLinkingMsg-preLink-2fa_needed">
                                        {$MGLANG->absoluteT('remoteAuthn','redirecting')}
                                    </p>
                                    <p class="providerLinkingMsg-preLink-linking_complete">
                                        <strong>{$MGLANG->absoluteT('remoteAuthn','success')}</strong> {$MGLANG->absoluteT('remoteAuthn','accountNowLinked')}
                                    </p>
                                    <p class="providerLinkingMsg-preLink-login_to_link-signin-required">
                                        <strong>{$MGLANG->absoluteT('remoteAuthn','linkInitiated')}</strong> {$MGLANG->absoluteT('remoteAuthn','oneTimeAuthRequired')}
                                    </p>
                                    <p class="providerLinkingMsg-preLink-login_to_link-registration-required">
                                        <strong>{$MGLANG->absoluteT('remoteAuthn','linkInitiated')}</strong> {$MGLANG->absoluteT('remoteAuthn','completeRegistrationForm')}
                                    </p>
                                    <p class="providerLinkingMsg-preLink-checkout-new">
                                        <strong>{$MGLANG->absoluteT('remoteAuthn','linkInitiated')}</strong> {$MGLANG->absoluteT('remoteAuthn','completeNewAccountForm')}
                                    </p>
                                    <p class="providerLinkingMsg-preLink-other_user_exists">
                                        <strong>{$MGLANG->absoluteT('remoteAuthn','error')}</strong> {$MGLANG->absoluteT('remoteAuthn','linkedToAnotherClient')}
                                    </p>
                                    <p class="providerLinkingMsg-preLink-already_linked">
                                        <strong>{$MGLANG->absoluteT('remoteAuthn','error')}</strong> {$MGLANG->absoluteT('remoteAuthn','alreadyLinkedToYou')}
                                    </p>
                                    <p class="providerLinkingMsg-preLink-default">
                                        <strong>{$MGLANG->absoluteT('remoteAuthn','error')}</strong> {$MGLANG->absoluteT('remoteAuthn','connectError')}
                                    </p>
                                </div>
                                <div class="social-login social-wide m-t-0">
                                    <p class="small text-center text-muted social-description">{$MGLANG->absoluteT('LagomOrderForm','social','description')}</p>
                                    <div class="d-flex justify-center social-container providerPreLinking">
                                        <div class="social-signin-btns">
                                            {foreach from=$rawObject->getButtons() key=buttonKey item=buttonValue}
                                                {if $buttonKey == 'googleAuth'}
                                                    <div class="google-button-register"></div>
                                                {else}
                                                    {$buttonValue->getRegisterButton()}
                                                {/if}
                                            {/foreach}
                                        </div>
                                    </div>
                                </div>
                                <div class="providerLinkingFeedback"></div>
                                <div class="login-divider">
                                    <span></span>
                                    <span>{$MGLANG->absoluteT('LagomOrderForm','social','or')}</span>
                                    <span></span>
                                </div>
                            {/if}
                            {* END OF SOCIAL FIELDS *}
                            <h6>{$MGLANG->absoluteT('LagomOrderForm','orderForm', 'personalInformation')}</h6>
                            <form autocomplete="off">
                                <div class="row row-sm">
                                    <div v-for="field in getPersonalInformationFields()" class="col-sm-6" v-if="!layoutSettings.hideBillingDetails.includes(field)">
                                        <div class="form-group" :class="{ 'has-error': isValid(field) == false }">
                                            <label class="control-label">
                                                <span v-html="getTranslatedMessage(field)"></span>
                                                <span class="control-label-info" v-if="optionalFields.includes(field)">{$MGLANG->absoluteT('LagomOrderForm','orderForm','optional')}</span>
                                            </label>
                                            <input type="text" :name="field" :id="field" class="form-control"
                                                   v-model="personalDetails[field]">
                                            <div class="alert alert-danger alert-sm" v-if="isValid(field) == false"
                                                 v-html="getValidationMessage(field)"></div>
                                        </div>
                                    </div>
                                </div>
                                <h6 class="m-t-16 m-t-2x">{$MGLANG->absoluteT('LagomOrderForm','orderForm','billingAddress')}</h6>
                                <div class="row row-sm">
                                    <div v-for="field in getBillingAddressFields()" v-if="!layoutSettings.hideBillingDetails.includes(field)" class="col-sm-6">
                                        <div class="form-group" :class="{ 'has-error': isValid('country') == false }" v-if="field === 'country'">
                                            <label class="control-label" for="country">
                                                {$MGLANG->absoluteT('LagomOrderForm','orderForm','country')}
                                                <span class="control-label-info" v-if="!fieldValidatorsRegister.country">{$MGLANG->absoluteT('LagomOrderForm','orderForm','optional')}</span>
                                            </label>
                                            <select name="country" id="inputCountry" class="form-control"
                                                    v-model="personalDetails.country"
                                                    @change="estimateTax()">
                                                <option v-for="(option, index) in countries" :value="index"
                                                        v-html="option.name"></option>
                                            </select>
                                        </div>
                                            <div class="form-group" :class="{ 'has-error': isValid('state') == false }" v-else-if="field === 'state' && !layoutSettings.hideBillingDetails.includes('state')">
                                                <label for="inputState" class="control-label">
                                                    {$MGLANG->absoluteT('LagomOrderForm','orderForm','state')}
                                                    <span class="control-label-info" v-if="optionalFields.includes('state')">{$MGLANG->absoluteT('LagomOrderForm','orderForm','optional')}</span>
                                                </label>
                                                <div v-if="selectedStates.length > 0">
                                                    <select name="state" id="state" v-model="personalDetails.state"
                                                            @change="estimateTax()" class="form-control">
                                                        <option v-for="(state, index) in selectedStates" :value="state"
                                                                v-html="state"></option>
                                                    </select>
                                                </div>
                                                <div v-else>
                                                    <input type="text" name="state" id="state" class="form-control"
                                                           required="required" v-model="personalDetails.state"
                                                           @change="estimateTax()"
                                                    >
                                                </div>
                                                <div class="alert alert-danger alert-sm" v-if="isValid('state') == false"
                                                     v-html="getValidationMessage('state')"></div>
                                            </div>
                                        <div  class="form-group" :class="{ 'has-error': isValid(field) == false }" v-else-if="!layoutSettings.hideBillingDetails.includes(field)">
                                            <label class="control-label">
                                                <span v-html="getTranslatedMessage(field)"></span>
                                                <span class="control-label-info" v-if="optionalFields.includes(field)">{$MGLANG->absoluteT('LagomOrderForm','orderForm','optional')}</span>
                                            </label>
                                            <input type="text" :name="field" :id="field" class="form-control"
                                                   v-model="personalDetails[field]">
                                            <div class="alert alert-danger alert-sm" v-if="isValid(field) == false"
                                                 v-html="getValidationMessage(field)"></div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <form autocomplete="off">
                                <div v-if="!userExist">
                                    <div v-if="formSchema != undefined">
                                        <template v-for="(field, index) in additionalFields">
                                            <component :is="field.fieldType" :key="field.id" :field="field"
                                                    :data.sync="formData"></component>
                                        </template>
                                    </div>
                                </div>
                                <div v-if="isMarketingOptInVisible">
                                    <h6 class="m-t-16 m-t-2x">
                                        {$MGLANG->absoluteT('LagomOrderForm','marketing','section','title')}
                                    </h6>
                                    <div class="row check marketing-emails checkbox-custom" >
                                        <label class="col-12" :class="{ 'checked has-checkbox': marketingOptInValue }">
                                            <input value="on" name="tos" id="tos" v-model="personalDetails.marketingoptin"  type="checkbox" class="">
                                            <div class="checkbox-styled"></div>
                                            <div class="check-content">
                                                {$MGLANG->absoluteT('LagomOrderForm','marketing','receive_offers')}
                                            </div>
                                        </label>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                {* END OF ADD USER *}
            </div>
        </div>

        <div class="modal fade" id="backupCodeModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><i
                                    class="lm lm-close"></i></button>
                        <h3 class="modal-title">{$MGLANG->absoluteT('LagomOrderForm','login', 'modal', 'backupcode', 'title')}</h3>
                    </div>
                    <div class="modal-body">

                        <div class="logincontainer-body">
                            <div class="alert alert-success text-center">
                                <div class="alert-body">
                                    {$MGLANG->absoluteT('LagomOrderForm','login', 'modal', 'backupcode', 'description')|html_entity_decode}

                                </div>
                            </div>
                            <h4 class="text-center">{$MGLANG->absoluteT('LagomOrderForm','login', 'modal', 'backupcode', 'newCode')}</h4>
                            <div class="alert alert-success text-center">
                                <div class="alert-body" v-html="backupCode">
                                </div>
                            </div>
                            <p class="text-lighter text-center text-small">{$MGLANG->absoluteT('LagomOrderForm','login', 'modal', 'backupcode', 'treatBackup')}</p>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default"
                                @click="closeModal()">{$MGLANG->absoluteT('LagomOrderForm','login', 'modal', 'backupcode', 'close')}</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="twoFactorForce">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><i
                                    class="lm lm-close"></i></button>
                        <h3 class="modal-title">{$MGLANG->absoluteT('LagomOrderForm','login', 'modal', 'twofact','enable', 'title')}</h3>
                    </div>
                    <div class="modal-body" id="twoFaForceContent">
                    </div>
                </div>
            </div>
        </div>
        <div class="modal modal-info fade" id="2fa-modal">
            <div class="modal-dialog" >
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="lm lm-close"></i></button>
                        <h3 class="modal-title">{$MGLANG->absoluteT('LagomOrderForm','twoFactorAuth', 'required', 'title')}</h3>
                    </div>
                    <div class="modal-body">
                        <p>{$MGLANG->absoluteT('LagomOrderForm','twoFactorAuth', 'required', 'description')}</p>
                        <div class="fa-container" id="2fa-container" ></div>
                        <p>{$MGLANG->absoluteT('LagomOrderForm','2fa', 'backupcode', 'description')}
                            <span>
                                <a href="#">{$MGLANG->absoluteT('LagomOrderForm','2fa', 'backupcode', 'button', 'login')}</a>
                            </span>
                        </p>

                    </div>
                    <div class="modal-footer d-flex">
                        <button class="btn btn-primary" type="submit" form="2faForm">
                            <span class="btn-text" v-if="!showTwoFaLoader">{$MGLANG->absoluteT('LagomOrderForm','twoFactorAuth', 'required', 'login')}</span>
                            <div class="btn-loader" v-else>
                                <div class="spinner spinner-sm">
                                    <div class="rect1"></div>
                                    <div class="rect2"></div>
                                    <div class="rect3"></div>
                                    <div class="rect4"></div>
                                    <div class="rect5"></div>
                                </div>
                            </div>
                        </button>
                        <button type="button" class="btn btn-d$efault" @click="cancelTwoFaModal()">{$MGLANG->absoluteT('LagomOrderForm','groups', 'modal', 'change', 'close')}</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</script>
{foreach from=$rawObject->getButtons() key=buttonKey item=buttonValue}
    {if $buttonKey == 'googleAuth'}
        <div class="googleBtn" style="display: none;">{$buttonValue->getRegisterButton()}</div>
    {/if}
{/foreach}