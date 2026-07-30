
mgJsComponentHandler.addDefaultComponent('mg-one-page-billing-details', {
    template: '#t-mg-one-page-billing-details',
    props: {
        component_id: {
            type: String,
            required: true,
        },
        component_namespace: {
            type: String,
            required: true,
        },
        component_index: {
            type: String,
            required: true,
        },
    },
    components: {
        billingSectionField: billingSectionField,
    },
    data: function () {
        return {
            alreadyRegister: false,
            selectedStates: [],
            selectedSection: 'registerOption',
            loginMessage: null,
            registerMessage: null,
            invalidLoginDetails: false,
            loginDetails: {
                email: null,
                password: null,
            },
            personalDetailsOldData: {},
            isValidField: {},
            fieldValidatorsRegister: {
                firstname: ['pageOrderRequiredValidator'],
                lastname: ['pageOrderRequiredValidator'],
                email: ['pageOrderRequiredValidator', 'pageOrderEmailValidator'],
                callingCode: ['pageOrderNumberValidator'],
                phonenumber: ['pageOrderRequiredValidator'],
                address1: ['pageOrderRequiredValidator'],
                city: ['pageOrderRequiredValidator'],
                state: ['pageOrderRequiredValidator'],
                postcode: ['pageOrderRequiredValidator'],
                country: ['pageOrderRequiredValidator'],
                password: [],
                password2: ['pageOrderRequiredValidator'],
            },
            fieldValidatorsLogin: {
                email: ['pageOrderRequiredValidator', 'pageOrderEmailValidator'],
                password: ['pageOrderRequiredValidator']
            },
            personalDetails: {
                firstname: null,
                lastname: null,
                email: null,
                callingCode: null,
                phonenumber: null,
                companyname: null,
                tax_id: null,
                address1: null,
                address2: null,
                city: null,
                state: null,
                country: null,
                password: null,
                password2: null,
                postcode: null,
                marketingoptin: null,
            },
            fieldValidationMessages: {},
            billingErrors: false,
            error: null,
            showError: false,
            twoStep: false,
            alertType: 'alert-danger',
            backupCodeEnabled: false,
            backupCode: null,
            accountId: null,
            blockUpdateAccount: false,
            interactiveMode: false,
            marketingOptInValue: null,
            formData: {},
            showTwoFaLoader: false,
            loginData: null,
            registerDetailsVisible: true,
            googleButtons: null,
            marketingEmailRequest: true,
            initialUpdateBillingRequest: true,
        }
    },
    updated() {
        this.$nextTick(() => {
            this.setMarketingEmail()
            this.moveGoogleButtons()
            if ($('script[src="https://js.hcaptcha.com/1/api.js"]').length === 0 && this.layoutSettings.captchaFormProtection
            && this.layoutSettings.captchaType === "hCaptcha") {
                this.createScript('https://js.hcaptcha.com/1/api.js')
            }

        })
    },
    watch: {
        isVisible: function (value) {
            if (value === false) {
                return;
            }
            this.initVisibleComponent();
            this.setDefaultMarketingOptValue();
        },
        registerDetailsVisible: function () {
            this.areRegisterDetailsVisible()
        },
        showCustTypeDetails: function(val){
            if(val === true){
                const self = this;
                if(self.userDetails.id){
                    self.accountId = self.userDetails.id;
                }
                self.$nextTick(() => {
                    renderCheckBox('customerBillingAccounts',
                        function (val) {self.accountId = val;},() => {});
                })
            }
        },
        'personalDetails.firstname': {
            handler(val) {
                this.validateField('firstname', val)
            },
            deep: true
        },
        'personalDetails.lastname': {
            handler(val) {
                this.validateField('lastname', val)
            },
            deep: true
        },
        'personalDetails.email': {
            handler(val) {
                this.validateField('email', val)
            },
            deep: true
        },
        'personalDetails.country': {
            handler(val) {
                this.personalDetails.country = this.personalDetails.country ? this.personalDetails.country : this.defaultCountry;
                this.selectedStates = this.$store.getters['cartStore/getStatesByCountryCode'](val)
                this.validateField('country', val)
            },
            deep: true
        },
        'personalDetails.companyname': {
            handler(val) {
                this.validateField('companyname', val)
            },
            deep: true
        },
        'personalDetails.address1': {
            handler(val) {
                this.validateField('address1', val)
            },
            deep: true
        },
        'personalDetails.address2': {
            handler(val) {
                this.validateField('address2', val)
            },
            deep: true
        },
        'personalDetails.city': {
            handler(val) {
                this.validateField('city', val)
            },
            deep: true
        },
        'personalDetails.state': {
            handler(val) {
                this.validateField('state', val)
            },
            deep: true
        },
        'personalDetails.postcode': {
            handler(val) {
                this.validateField('postcode', val)
            },
            deep: true
        },
        'personalDetails.phonenumber': {
            handler(val) {
                this.personalDetails.phonenumber = val
                this.validateField('phonenumber', val)
            },
            deep: true
        },
        'loginDetails.email': {
            handler(val) {
                this.validateField('loginemail', val)
            },
            deep: true
        },
        'loginDetails.password': {
            handler(val) {
                this.validateField('password', val)
            },
            deep: true
        },
        formData: {
            handler(details){
                if(details.password) {
                    this.personalDetails.password = details.password
                }
                else {
                    this.personalDetails.password = null
                }
                if(details.password2) {
                    this.personalDetails.password2 = details.password2
                }
                else {
                    this.personalDetails.password2 = null
                }
                this.$store.dispatch('cartStore/updateBillingDetailsLocal', details);
            },
            deep: true
        },
        userDetails: function (newValue) {
            if(typeof newValue === 'object' && newValue.twoFactorStep === true){
                this.loadTwoFactorForm();
            } else if (typeof newValue === "object" && newValue.id !== undefined) {
                this.updatePersonalDetails();
            }
        },
        personalDetails: {
            handler(details) {
                this.debounce(this.propagateBillingDetails, 500)(details);
            },
            deep: true
        },
        countries: function(val){
            this.setCountryIfEmpty();
        },
        accountId: function(val){
            if (this.isBlockedPage) {
                return;
            }
            if (this.loginData === null) {this.loginData = this.personalDetails}

            if(val === 'new')
            {
                this.clearPersonalDetails()
            }

            this.$store.dispatch('cartStore/updateAccountId', { val });
        },
        marketingOptInValue: function(value)
        {
            if( !this.interactiveMode )
            {
                return false;
            }
            let marketingEmail = (value === true || value === '1') ? '1' : '';
            this.$store.dispatch('cartStore/updateMarketingEmail', { marketingEmail });
        },
    },
    computed: {
        isAddonPage: {
            get(){
                return this.$store.getters['cartStore/getSPage']() == 'addons';
            }
        },
        showNumber: {
            get() {
                return this.$store.getters['cartStore/shouldShowNumber']();
            }
        },
        formSchema: {
            get() {
                return this.$store.getters['cartStore/getBillingDetailsSchema']();
            }
        },
        orderSettings: {
            get(){
                return this.$store.getters['cartStore/getWhmcsOrderSettings']();
            }
        },
        additionalFields: {
            get() {
                return this.formSchema && this.formSchema.additional ? this.formSchema.additional : [];
            }
        },
        optionalFields: {
            get() {
                return this.$store.getters['cartStore/getBillingDetailsOptionalFields']();
            }
        },
        isVisible: {
            get() {
                return this.$store.getters['cartStore/isVisible']('billingDetails');
            }
        },
        isChecked: {
            get() {
                return this.value === true;
            }
        },
        isMarketingOptInShowNumber: {
            get() {
                return this.$store.getters['cartStore/shouldShowNumber']();
            }
        },
        isMarketingOptInVisible: {
            get() {
                return this.$store.getters['cartStore/isVisible']('cart') &&
                    this.$store.getters['cartStore/getComponentsConfiguration']()['marketingEmailEnabled'] &&
                    this.$store.getters['cartStore/getClient']().exist !== 1;
            }
        },
        marketingOptInDescription: {
            get() {
                return this.$store.getters['cartStore/getComponentsConfiguration']()['marketingEmailDescription']
            }
        },
        countries: {
            get() {
                return this.$store.getters['cartStore/getCountries']()
            }
        },
        states: {
            get() {
                return this.$store.getters['cartStore/getStatesByCountryCode'](this.personalDetails.country)
            }
        },
        userDetails: {
            get() {
                return this.$store.getters['cartStore/getClient']()
            }
        },
        isLogging: {
            get() {
                return this.$store.getters['cartStore/getSpinners']()['logging'] > 1;
            }
        },
        layoutSettings: {
            get() {
                return this.$store.getters['cartStore/getLayoutSettings']();
            }
        },
        taxEnabled: {
            get() {
                const taxEnabled = this.$store.getters['cartStore/getComponentsConfiguration']()['taxFieldEnabled'];
                return this.layoutSettings.hideVAT !== undefined ? taxEnabled &&  !this.layoutSettings.hideVAT.includes(this.personalDetails.country) : taxEnabled;
            }
        },
        taxAsVat: {
            get() {
                return this.$store.getters['cartStore/getComponentsConfiguration']()['taxAsVat'];
            }
        },
        isBlockedPage: {
            get() {
                return this.$store.getters['cartStore/getBlockedEvents']()['fullPage'] > 1;
            }
        },
        isBlockedLogin: {
            get() {
                return this.$store.getters['cartStore/getBlockedEvents']()['logging'] > 1;
            }
        },
        captcha: {
            get() {
                return this.$store.getters['cartStore/getCaptchaSettings']();
            }
        },
        isCaptchaOn: {
            get() {
                return this.captcha.setting === 'on' && this.captcha.forms['login'] === true;
            }
        },
        userAccounts: {
            get() {
                return this.userDetails.accounts;
            }
        },
        userExist: {
            get() {
                return !!this.userDetails.id;
            }
        },
        showClientDetails: {
            get() {
                return this.userExist && this.userDetails.isMultiAccountSupported !== true;
            }
        },
        showCustTypeDetails: {
            get() {
                return this.userDetails.isMultiAccountSupported === true;
            }
        },
        marketingEmails: {
            get() {
                return this.$store.getters['cartStore/getMarketingEmailsValue']();
            }
        },
        currency: {
            get() {
                return this.$store.getters['cartStore/getSelectedCurrency']();
            },
        },
        currencies: {
            get() {
                return this.$store.getters['cartStore/getCurrencies']();
            }
        },
        cartErrors: {
            get() {
                return this.$store.getters['cartStore/getValidateErrors']();
            }
        },
        defaultCountry: {
            get(){
                return this.$store.getters['cartStore/getDefaultCountry']();
            }
        },
        isCaptchaConfirmed: {
            get() {
                return this.$store.getters['cartStore/getCaptchaConfirmation']();
            }
        },
    },
    created() {
        this.createScript(whmcsBaseUrl + '/assets/js/StatesDropdown.js')
        this.onCreationFunction();
    },

    methods: {
        propagateBillingDetails(details){

            if(!this.interactiveMode /*|| this.userExist*/) {
                return;
            }
            this.$store.dispatch('cartStore/updateBillingDetails', {details});
        },
        initVisibleComponent(){
            var self = this;
            this.$nextTick(function () {
                /** render add event in payments section  */
                renderCheckBox('loginOrNewUser',
                    function (val) {
                        /* protection before checkbox in form */
                        if (val == 'loginOption' || val == 'registerOption') {
                            self.selectedSection = val;
                        }
                    }, () => {});

                renderCheckBox('customerBillingAccounts',
                    function (val) {
                        if(isNaN(parseInt(val))) {
                            self.selectedSection = 'registerOption'
                            self.accountId = 'new';
                        }
                        else {
                            self.selectedSection = 'loginOption'
                            self.accountId = val;
                        }
                    },() => {});
                /** add login button event */
                self.initSsoButtons();
                if (this.showNumber == true) {
                    renderSectionIndex();
                }

                this.initCountryCodeInput();
                this.$nextTick(() => {

                    this.interactiveMode = true
                })
            });

            //update account id by session id
            if(this.userDetails.id && this.selectedSection == 'loginOption'){
                this.accountId = this.userDetails.id;
            }

            if(!isNaN(parseInt(this.accountId))) {
                self.selectedSection = 'loginOption'
            }
            //this.$nextTick(() => {this.interactiveMode = true})
        },
        initUpdateRequest(){

            this.updatePersonalDetails();
        },
        onCreationFunction(){

            const self = this;
            mgEventHandler.on('PreCompleteOrder', null, function (id, params) {
                self.checkPersonalDetailsIsValid(self.personalDetails)
                self.validateAllFields();
                self.$forceUpdate();
            });
            mgEventHandler.on('ReloadBillingDetails', null, () => {
                if( self.userExist )
                {
                    return;
                }
                self.$store.dispatch('cartStore/updateBillingDetails', {details:self.personalDetails});
            });

            mgEventHandler.on('RefreshAlertState', null, function () {
                self.refreshValidationFields();
                self.$forceUpdate();
            });
            self.initOAuthHandler();
        },
        setCountryIfEmpty(){
            const self = this;
            if(!self.personalDetails.country){
                self.$nextTick(function(){
                    self.personalDetails.country = this.defaultCountry;
                })
            }
        },
        initCountryCodeInput(){
            const self = this;
            self.setCallingCode(self.findCountry(self.personalDetails.country).callingCode);
            LagomOrderFormTelInput(function(countryData){
                self.setCallingCode(countryData.dialCode);
            });
        },
        setCallingCode(value){
            if (value) {
                this.personalDetails.callingCode = value
                this.personalDetails['country-calling-code-phonenumber'] = value;
            }
        },
        updatePersonalDetails() {
            this.interactiveMode = false;
            let personalDetails = this.userDetails;

            if(this.accountId === 'new')
            {
                this.personalDetails.accountId = this.accountId;
                this.personalDetails.account_id = this.accountId;
                // this.clearPersonalDetails();
            }
            else if (personalDetails !== undefined && personalDetails.id > 0) {
                this.selectedStates = this.$store.getters['cartStore/getStatesByCountryCode'](personalDetails.country);
                this.personalDetails.accountId = personalDetails.id;
                this.personalDetails.account_id = personalDetails.id;
                this.personalDetails.credit = personalDetails.credit;
                this.personalDetails.firstname = personalDetails.firstname;
                this.personalDetails.lastname = personalDetails.lastname;
                this.personalDetails.email = personalDetails.email;
                this.personalDetails.callingCode = this.personalDetails.callingCode;
                this.personalDetails.phonenumber = this.personalDetails.phonenumber
                this.personalDetails.companyname = personalDetails.companyname;
                this.personalDetails.marketingoptin = personalDetails.marketingoptin;
                this.personalDetails.address = personalDetails.address1;
                this.personalDetails.address2 = personalDetails.address2;
                this.personalDetails.city = personalDetails.city;
                this.personalDetails.password = personalDetails.password
                // this.personalDetails.state = this.findStateIndex(personalDetails.state);
                this.personalDetails.state = personalDetails.state
                this.personalDetails.postcode = personalDetails.postcode;
                this.personalDetails.country = this.showCustTypeDetails === true ? personalDetails.country : this.findCountryNameByCode(personalDetails.country);
                this.selectedGateway = personalDetails.defaultgateway;
            }
            this.$nextTick(() => {this.interactiveMode = true});
        },
        findStateIndex: function (stateName) {
            for (var index in this.selectedStates) {
                if (this.selectedStates[index] == stateName) {
                    return index;
                }
            }
            return "";
        },
        findCountryNameByCode: function (code) {
            if (this.countries[code]) {
                return this.countries[code].name;
            }
            return "";
        },
        findCountry: function (code) {
            if (this.countries[code]) {
                return this.countries[code];
            }
            return "";
        },
        loginUserPreventEvent(event){
            event.preventDefault();
            return this.loginUser();
        },
        loginUser: function () {
            let self = this;

            if (this.isBlockedPage || this.isBlockedLogin) {
                return;
            }

            this.validateAllFields()

            $('#2fa-modal').modal('hide')
            $('.modal-backdrop').remove();
            self.showTwoFaLoader = false
            if(this.twoStep === true){
                return this.loginTwoStep();
            }
            this.doLogin();

            return null;
        },
        validateCaptcha: function () {
            const self = this;
            /* set captcha details */
            captchaHelper.captchaType = 'login';
            captchaHelper.onSuccessCallback = function(data){
                self.loginUser()
            };

            captchaHelper.initCaptcha();
        },
        doLogin: function () {
            let self = this;
            this.invalidLoginDetails = false;
            this.showError = false;
            this.$store.dispatch('cartStore/loginUser', {
                'login': this.loginDetails,
            }).then(response =>  {
                this.parseResponse(response)
            });
        },
        getUserAfterLogin() {
            this.alreadyRegister = false;
        },
        parseResponse: function (data) {

            if (data.status == "error") {
                if(data.message){
                    this.displayLoginAlert(data.message, 'alert-danger');
                }else{
                    this.displayLoginAlert(mgPageLang.translate(['loginDetails', 'error', 'loginincorrect'], {}), 'alert-danger');
                }
                return;
            }

            if(!data.settings)
            {
                this.$store.dispatch('cartStore/errorLog', {message: 'Login response, data not available'});
                return null;
            }
            data = data.settings;

            if(data.twoFactor !== undefined && data.twoFactor.redirect === true && data.twoFactor.url) {
                return this.redirectToUrl(data.twoFactor.url);
            }

            //todo update for force
            // if(data.twoFactor !== undefined && data.twoFactor.twoFactorForce === true){
            //     return this.twoFactorForceContent(data.twoFactor);
            // }

            if(data.twoFactor !== undefined && data.twoFactor.isAwaiting === false && data.twoFactor.backupCode){
                this.showBackupCodeModal(data.twoFactor.backupCode);
            }

            if(data.twoFactor !== undefined && data.twoFactor.isAwaiting === true){
                return this.runTwoFactorStep(data.twoFactor);
            }
            else if (this.userDetails.id) {
                this.getUserAfterLogin();
                // $('input[id="guest_user"]').iCheck('check');
            }
        },
        loginTwoStep: function(){
            let formData = $('#2faForm').serializeArray();
            let params = {
                'type': '2faauth'
            };
            formData.forEach((item, index) => {
                let name = item.name;
                params[name] = item.value;
            });

            this.$store.dispatch('cartStore/loginUser', params).then(response => this.parseResponse(response));
        },
        loadTwoFactorForm: function(){
            this.$store.dispatch('cartStore/twoFactorForm').then(response => {
                if (response.status === 'success' && response.twoFactor !== undefined && response.twoFactor.isAwaiting === true){
                    this.runTwoFactorStep(response.twoFactor);
                }
            });
        },
        runTwoFactorStep: function(data){
            const self = this;
            if(data.error && data.error !== false ){
                self.displayLoginAlert(data.error, 'alert-danger');
            }else{
                self.showError  = false;
                self.error      = false;
            }

            self.twoStep = true;
            self.$nextTick(() => {
                self.showTwoFaModal()
                self.appendTwoFactorContainer(data.html);
            });
        },
        showTwoFaModal() {
            $('#2fa-modal').modal('show');
        },
        cancelTwoFaModal() {
            $('#2fa-modal').modal('hide');
        },
        appendTwoFactorContainer(html){
            const self = this;

            let form = $(html).find('form')
            if(form.length === 0){
                html = '<form>'+html+'</form>'
            }
            $(html)

            let container = $('#2fa-container');
            container.empty();
            container.append(html);
            $(container).find('input').attr('placeholder', 'Enter 2FA Code')

            form = container.find('form');
            form.attr('id', '2faForm');
            form.find('[type=submit]').remove();
            $(form).submit(function(e){
                e.preventDefault();
                self.showTwoFaLoader = true;

                self.loginUser();
            });
        },
        useBackupCode(event){
            event.preventDefault();
            this.backupCodeEnabled = true;
        },
        initSsoButtons() {
            if (typeof window['startGoogleApp'] === "function") {
                startGoogleApp();
            }
        },
        initOAuthHandler: function () {
            const self = this
            mgOAuthService.initOAuthHandler(this.oAuthCallback)
        },
        setDefaultMarketingOptValue: function () {
            if (this.marketingOptInValue === null) {
                configuration = this.$store.getters['cartStore/getComponentsConfiguration']();
                this.marketingOptInValue = configuration ? !configuration['marketingEmailRequire'] : false;
            }
            this.$store.dispatch('cartStore/updateMarketingEmail', this.marketingOptInValue );
        },
        oAuthCallback: function (params) {
            switch (params.result) {
                case 'logged_in':
                    this.$store.dispatch('cartStore/loadUserData');
                    break;
                case 'linking_complete':
                    break;
                case 'login_to_link':
                    if(this.selectedSection === 'loginOption'){
                        this.displayLoginAlert(mgPageLang.translate(['loginDetails', 'error', 'loginToLinkAccount'], {}), 'alert-info');
                    }else{
                        this.personalDetails.email      = params.remote_account.email
                        this.personalDetails.firstname  = params.remote_account.firstname
                        this.personalDetails.lastname   = params.remote_account.lastname
                    }
                    break;
                case '2fa_needed':
                    break;
                case 'other_user_exists':
                    this.displayLoginAlert(mgPageLang.translate(['loginDetails', 'error', 'orderUserExists'], {}), 'alert-danger');
                    break;
                case 'already_linked':
                    this.displayLoginAlert(mgPageLang.translate(['loginDetails', 'error', 'alreadyLinked'], {}), 'alert-info');
                    break;
                case 'not_authorized':
                    this.displayLoginAlert(mgPageLang.translate(['loginDetails', 'error', 'notAuthorized'], {}), 'alert-danger');
                    break;
            }
        },
        isValid(name) {
            if (this.isValidField[name] !== undefined && this.isValidField[name] == false) {
                return false;
            }

            return true;
        },
        checkPersonalDetailsIsValid(data) {
            for (const [key, value] of Object.entries(data)) {

                if ((this.personalDetailsOldData[key] == undefined && value) ||
                    (this.personalDetailsOldData[key] !== undefined && this.personalDetailsOldData[key] !== value)) {
                    this.validateField(key, value);
                    this.personalDetailsOldData[key] = value;
                }
            }
        },
        getTranslatedMessage(name) {
            return mgPageLang.translate(name)
        },
        validateField(name, value) {
            if (this.optionalFields && this.optionalFields.includes(name)) return
            let errorsCounter = 0;
            let validFieldObj = this.isValidField
            if(this.selectedSection === 'loginOption' || (this.accountId && !$('#email:visible').length)) {
                if (this.fieldValidatorsLogin[name] == undefined) {
                    this.isValidField[name] = true;
                    return;
                }
                for (const [key, validatorName] of Object.entries(this.fieldValidatorsLogin[name])) {
                    if (typeof window[validatorName] !== "function") {
                        // console.log('validator not found: ' + validatorName);
                        return;
                    }
                    var result = window[validatorName](name, value);

                    if (this.userExist === true || result === true) {
                        this.isValidField[name] = true;
                        this.fieldValidationMessages[name] = null;
                        pageOrderStore.commit('cartStore/popValidateError', name);
                    } else {
                        pageOrderStore.commit('cartStore/pushValidateError', {id: name, error: result});
                        this.isValidField[name] = !!value;
                        this.fieldValidationMessages[name] = result;
                        break;
                    }
                }
            }
            else {
                if(this.fieldValidatorsRegister[name] == undefined) {
                    this.isValidField[name] = true;
                    return;
                }
                for (const [key, validatorName] of Object.entries(this.fieldValidatorsRegister[name])) {

                    if (typeof window[validatorName] !== "function") {
                        // console.log('validator not found: ' + validatorName);
                        return;
                    }

                    var result = window[validatorName](name, value);
                    if (result === true) {
                        this.isValidField[name] = true;
                        this.fieldValidationMessages[name] = null;
                        pageOrderStore.commit('cartStore/popValidateError', name);
                    } else {
                        pageOrderStore.commit('cartStore/pushValidateError', {id: name, error: result});
                        this.isValidField[name] = false;
                        this.fieldValidationMessages[name] = result;
                        break;
                    }
                }
            }

            Object.values(validFieldObj)
                .filter(key => {
                    if (!key) {
                        errorsCounter++;
                    }
                });
            if(errorsCounter) {
                this.billingErrors = true
            }
            else {
                this.billingErrors = false;
            }
            //this.$store.commit('cartStore/setBillingDetailsErrors', this.billingErrors)
        },
        refreshValidation(name){
            this.isValidField[name] = true;
            this.fieldValidationMessages[name] = false;
        },
        getValidationMessage(name) {

            let counter = 0;
            if (this.fieldValidationMessages[name] == undefined) {
                return 'invalid field data';
            }

            let filtered = this.fieldValidationMessages
            Object.values(filtered)
                .filter(key => {
                    if (key !== null) {
                        counter++;
                    }
                });

            this.fieldErrors = counter;


            return this.fieldValidationMessages[name];
        },
        validateAllFields() {
            this.refreshValidationFields();
            this.areRegisterDetailsVisible();
            if( this.selectedSection === 'registerOption' && !$('#account_id').parent().hasClass('checked'))
            {
                for( const [key, value] of Object.entries(this.personalDetails) )
                {
                    this.validateField(key, value);
                }
            }
            else if( this.selectedSection === 'loginOption')
            {
                for( const [key, value] of Object.entries(this.loginDetails) )
                {
                    this.validateField(key, value);
                }
            }

            this.$store.commit('cartStore/setLocalDetails', {name: 'authOption', details: this.selectedSection});
        },
        refreshValidationFields() {
            for (const [key, value] of Object.entries(this.personalDetails)) {
                this.refreshValidation(key);
            }
        },
        showBackupCodeModal(code){
            this.backupCode = code;
            $('#backupCodeModal').modal({ backdrop: 'static', keyboard: false });
        },
        closeModal() {
            $('#backupCodeModal').modal('hide');
            this.backupCode = null;
        },
        redirectToUrl(url){
            this.$store.dispatch('cartStore/redirectUrl', {url: url});
        },
        estimateTax(){
            let details = {state: this.personalDetails.state, country: this.personalDetails.country};
            this.$store.dispatch('cartStore/updateBillingCountryDetails', {details: details});
        },
        updateBillingAccount(id){
            if(this.$store.getters['cartStore/isBillingAccountsSupported']() === false){
                return;
            }

            if(this.accountId == id) {
                return;
            }

            this.$store.dispatch('cartStore/updateBillingAccount', {id: id});
        },
        updateLoginDetails(){
            this.$store.commit('cartStore/setLocalDetails', {name: 'loginDetails', details: this.loginDetails});
        },
        displayLoginAlert(error, type){
            this.showError  = true;
            this.error      = error;
            this.alertType = type
        },
        initValue(value){
            this.value = value;
        },
        getPersonalInformationFields()
        {
            const defaultOptions = ['firstname', 'lastname', 'email', 'phonenumber']
            return this.getAllFields(defaultOptions, 'personalInformationOrder')
        },
        getBillingAddressFields()
        {
            const defaultOptions = ['companyname', 'country', 'address1', 'address2', 'city', 'state', 'postcode']
            if (this.taxEnabled) {
                defaultOptions.push('tax_id')
            }
            return this.getAllFields(defaultOptions, 'billingAddressOrder')
        },
        getAllFields(defaultOptions, sectionName)
        {
            if (this.layoutSettings[sectionName]) {
                let options = this.layoutSettings[sectionName]
                defaultOptions.forEach(opt => {
                    if (!options.includes(opt)) {
                        options.push(opt)
                    }
                })
                return options
            }
            return defaultOptions
        },
        clearPersonalDetails()
        {
            for(let detail in this.personalDetails)
            {
                this.personalDetails[detail] = null;
            }
        },
        setMarketingEmail() {
            if (this.marketingEmailRequest) {
                this.personalDetails.marketingoptin = !this.orderSettings.EmailMarketingRequireOptIn
                this.marketingEmailRequest = false
            }
        },
        areRegisterDetailsVisible() {
            this.registerDetailsVisible = $('#loginOrNewUser > div.panel.panel-check.panel-default.panel--no-border.panel--billing:nth-of-type(2)').hasClass('checked')
        },
        moveGoogleButtons() {
            const googleBtn = $('.googleBtn')
            if (googleBtn.length) {
                this.googleButtons = googleBtn
            }
            const login = document.querySelector('.google-button-login')
            const register = document.querySelector('.google-button-register')

            if (this.googleButtons  && this.googleButtons.length === 2 && login && register) {
                login.insertAdjacentElement('beforebegin', this.googleButtons[0])
                register.insertAdjacentElement('beforebegin', this.googleButtons[1])
                this.googleButtons.css('display', 'block')
            }
        },
        createScript(src) {
            var htmlScriptElement = document.createElement("script")
            htmlScriptElement.setAttribute("src",src)
            document.body.appendChild(htmlScriptElement)
        }
    }
});