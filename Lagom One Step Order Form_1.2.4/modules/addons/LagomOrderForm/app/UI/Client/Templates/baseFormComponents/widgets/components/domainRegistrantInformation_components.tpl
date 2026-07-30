<script type="text/x-template" id="t-mg-one-page-domain-registrant-information-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
    <div class="section" :class="[{ 'section--full-width': !showNumber}]" v-if="isVisible">
        <div class="section-number" v-if="showNumber">X</div>
        <div class="section-header">
            <h2 class="section-title">{$MGLANG->absoluteT('LagomOrderForm','registrantInformation','section', 'title', 'registrantInformation')}</h2>
        </div>
        <div class="section-body">
            <div class="panel panel-form">
                <div class="panel-body">
                        <p>{$MGLANG->absoluteT('LagomOrderForm','registrantInformation','section', 'description')}</p>
                        <select name="contact" id="inputDomainContact" class="form-control " v-model="domainContact.contact">
                            <option value="">{$MGLANG->absoluteT('LagomOrderForm','registrantInformation','options', 'contacts', 'default')}</option>
                            <option :value="contact.id" v-for="contact in userDetails.contacts" v-html="contact.firstname +' '+ contact.lastname"></option>
                            <option value="addingnew">
                                {$MGLANG->absoluteT('LagomOrderForm','registrantInformation','options', 'contacts', 'add')}
                            </option>
                        </select>
                </div>
                <div class="panel-body" v-if="newContactSection">
                        <h6>{$MGLANG->absoluteT('LagomOrderForm','orderForm', 'personalInformation')}</h6>
                        <div class="row row-sm">
                            <div v-for="field in getPersonalInformationFields()" class="col-sm-6" v-if="!layoutSettings.hideBillingDetails.includes(field)">
                                <div class="form-group" :class="{ 'has-error': isValid(field) == false }"">
                                    <label
                                           class="control-label" v-html="getTranslatedMessage(field)"></label>
                                    <span class="control-label-info float-right" v-if="optionalFields.includes(field)">{$MGLANG->absoluteT('LagomOrderForm','orderForm','optional')}</span>
                                    <input v-if="field === 'phonenumber'" type="tel" name="domaincontactphonenumber" id="domaincontactphonenumber" class="form-control"
                                           v-model="domainContact.phonenumber">
                                    <input v-else type="tel" :name="field" :id="field" class="form-control"
                                       v-model="domainContact[field]">
                                    <div class="alert alert-danger alert-sm" v-if="isValid(field) == false"
                                         v-html="getValidationMessage(field)"></div>
                                </div>
                            </div>
                        </div>

                    <h6 class="m-t-16 m-t-2x">{$MGLANG->absoluteT('LagomOrderForm','orderForm','billingAddress')}</h6>
                    <div class="row row-sm">
                        <div v-for="field in getBillingAddressFields()" class="col-sm-6" v-if="!layoutSettings.hideBillingDetails.includes(field)">
                            <div v-if="field === 'country'">
                                <div class="form-group" :class="{ 'has-error': isValid('country') == false }">
                                    <label class="control-label"
                                           for="country">{$MGLANG->absoluteT('LagomOrderForm','orderForm','country')}</label>
                                    <select name="domaincontactcountry" id="domaincontactcountry" class="form-control"
                                            v-model="domainContact.country" >
                                        <option v-for="(option, index) in countries" :value="index"
                                                v-html="option.name"></option>
                                    </select>
                                </div>
                            </div>
                            <div v-else-if="field === 'state'">
                                <div class="form-group" :class="{ 'has-error': isValid('state') == false }" v-if="!layoutSettings.hideBillingDetails.includes('state')">
                                    <label for="inputState" class="control-label">
                                        {$MGLANG->absoluteT('LagomOrderForm','orderForm','state')}
                                        <span class="control-label-info" v-if="optionalFields.includes('state')">{$MGLANG->absoluteT('LagomOrderForm','orderForm','optional')}</span>
                                    </label>
                                    <div v-if="selectedStates.length > 0">
                                        <select name="state" id="state" v-model="domainContact.state"
                                                @change="estimateTax()" class="form-control">
                                            <option v-for="(state, index) in selectedStates" :value="state"
                                                    v-html="state"></option>
                                        </select>
                                    </div>
                                    <div v-else>
                                        <input type="text" name="state" id="state" class="form-control"
                                               required="required" v-model="domainContact.state"
                                               @change="estimateTax()"
                                        >
                                    </div>
                                    <div class="alert alert-danger alert-sm" v-if="isValid('state') == false"
                                         v-html="getValidationMessage('state')"></div>
                                </div>
                            </div>
                            <div v-else>
                                <div v-if="!layoutSettings.hideBillingDetails.includes(field)">
                                    <div class="form-group" :class="{ 'has-error': isValid(field) == false }">
                                        <label class="control-label" v-html="getTranslatedMessage(field)"></label>
                                        <span class="control-label-info float-right" v-if="optionalFields.includes(field)">{$MGLANG->absoluteT('LagomOrderForm','orderForm','optional')}</span>
                                        <input type="text" :name="field" :id="field" class="form-control"
                                               v-model="domainContact[field]" >
                                        <div class="alert alert-danger alert-sm" v-if="isValid(field) == false"
                                             v-html="getValidationMessage(field)"></div>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</script>