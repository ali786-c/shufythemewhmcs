
/**
 * Domain Registrant Component
 */
mgJsComponentHandler.addDefaultComponent('mg-one-page-domain-registrant-information', {
    template: '#t-mg-one-page-domain-registrant-information',
    props:{
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
    data: function () {
        return {
            domainContactOldData: {},
            domainContact:{
                contact: null,
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
                // code: null,
                country: null,
                postcode: null,
                showStateElement: false,
            },
            selectedStates: [],
            fieldValidators: {
                firstname: ['pageOrderRequiredValidator'],
                lastname: ['pageOrderRequiredValidator'],
                email: ['pageOrderRequiredValidator', 'pageOrderEmailValidator'],
                callingCode: ['pageOrderRequiredValidator', 'pageOrderNumberValidator'],
                phonenumber: ['pageOrderRequiredValidator'],
                address1: ['pageOrderRequiredValidator'],
                city: ['pageOrderRequiredValidator'],
                state: ['pageOrderRequiredValidator'],
                postcode: ['pageOrderRequiredValidator'],
                country: ['pageOrderRequiredValidator'],
            },
            fieldValidationMessages: {},
            isValidField: {},
            interactiveMode: false,
        }
    },
    created(){
        const self = this;
        mgEventHandler.on('PreCompleteOrder', null, function (id, params) {
            if(self.isVisible !== true || self.newContactSection !== true){
                return;
            }
            self.validateAllFields();
            self.$forceUpdate();
        });

        mgEventHandler.on('RefreshAlertState', null, function () {
            self.isValidField               = {};
            self.fieldValidationMessages    = {};
        });
    },
    watch:{
        isVisible: function(value){
            this.$nextTick(function () {
                if(this.showNumber == true){
                    renderSectionIndex();
                }
            });

            if(value === true){
                this.initDetails();
                this.setCountryIfEmpty();
                this.$nextTick(() => {this.interactiveMode = true;})
            }else{
                this.$nextTick(() => {this.interactiveMode = false;})
            }
        },
        countries: function(val){
            this.setCountryIfEmpty();
        },
        newContactSection: function(){
            const self = this;
            self.$nextTick(function(){
                self.initCountryCodeInput();
            })
        },
        domainContact: {
            handler(details){
                if(!this.interactiveMode) {
                    return false;
                }
                this.checkPersonalDetailsIsValid(details);
                this.$store.dispatch('cartStore/updateDomainContactDetails', { details });
            },
            deep: true,
        },
        'domainContact.phonenumber': {
            handler(val) {
                if(val){
                    this.domainContact.phonenumber = val.replace(/\s+/g, '').replace(/[^0-9]/gi, '');
                }

            },
            deep: true
        },
        'domainContact.country': {
            handler(val) {
                this.selectedStates = this.$store.getters['cartStore/getStatesByCountryCode'](val)
            },
            deep: true
        },
    },
    computed: {
        isVisible: {
            get () {
                return this.$store.getters['cartStore/isVisible']('domains')
                    && (this.selectedRegType === 'transfer' || this.selectedRegType === 'register');
            }
        },
        showNumber:{
            get(){
                return this.$store.getters['cartStore/shouldShowNumber']();
            }
        },

        layoutSettings: {
            get()
            {
                return this.$store.getters['cartStore/getLayoutSettings']();
            }
        },
        taxEnabled: {
            get() {
                const taxEnabled = this.$store.getters['cartStore/getComponentsConfiguration']()['taxFieldEnabled'];
                return this.layoutSettings.hideVAT !== undefined ? taxEnabled && !this.layoutSettings.hideVAT.includes(this.domainContact.country) : taxEnabled;
            }
        },
        isBlockedPage: {
            get() {
                return this.$store.getters['cartStore/getBlockedEvents']()['fullPage'] > 1;
            }
        },
        newContactSection: {
            get(){
                return this.domainContact.contact === 'addingnew'
            }
        },
        countries: {
            get() {
                return this.$store.getters['cartStore/getCountries']()
            }
        },
        taxAsVat: {
            get() {
                return this.$store.getters['cartStore/getComponentsConfiguration']()['taxAsVat'];
            }
        },
        userDetails: {
            get() {
                return this.$store.getters['cartStore/getClient']()
            }
        },
        userExist:{
            get(){
                return !!this.userDetails.id;
            }
        },
        defaultCountry: {
            get(){
                return this.$store.getters['cartStore/getDefaultCountry']();
            }
        },
        optionalFields: {
            get() {
                return this.$store.getters['cartStore/getBillingDetailsOptionalFields']();
            }
        },
        selectedRegType: {
            get()
            {
                let regType = this.$store.getters['cartStore/getDomainRegistrationType']();
                return regType ? regType : 'register';
            }
        },
    },
    methods: {
        setCountryIfEmpty(){
            const self = this;
            if(!self.domainContact.country){
                self.$nextTick(function(){
                    self.domainContact.country = this.defaultCountry;
                })
            }
        },
        initCountryCodeInput(){
            const self = this;
            self.interactiveMode = false;
            self.setCallingCode(this.findCountry(self.domainContact.country).callingCode);
            LagomOrderFormTelInput(function(countryData){
                self.setCallingCode(countryData.dialCode);
            });
            self.$nextTick(() => {self.interactiveMode = true});
        },
        setCallingCode(value){
            // this.personalDetails.callingCode = value
            this.domainContact['country-calling-code-phonenumber'] = value;
            this.domainContact['callingCode'] = value;
        },
        findCountry: function (code) {
            if (this.countries[code]) {
                return this.countries[code];
            }
            return "";
        },
        estimateTax(){
            let details = {state: this.domainContact.state, country: this.domainContact.country};
            this.$store.dispatch('cartStore/updateDomainContactCountryDetails', {details: details});
        },

        checkPersonalDetailsIsValid(data) {
            for (const [key, value] of Object.entries(data)) {

                if ((this.domainContactOldData[key] == undefined && value) ||
                    (this.domainContactOldData[key] !== undefined && this.domainContactOldData[key] !== value)) {
                    this.validateField(key, value);
                    this.domainContactOldData[key] = value;
                }
            }
        },
        isValid(name) {
            if (this.isValidField[name] !== undefined && this.isValidField[name] == false) {
                return false;
            }

            return true;
        },
        getValidationMessage(name) {
            if (this.fieldValidationMessages[name] == undefined) {
                return 'invalid field data';
            }

            return this.fieldValidationMessages[name];
        },
        validateAllFields() {
            for (const [key, value] of Object.entries(this.domainContact)) {
                this.validateField(key, value);
            }
        },
        validateField(name, value) {

            if (this.fieldValidators[name] == undefined) {
                this.isValidField[name] = true;
                return;
            }

            for (const [key, validatorName] of Object.entries(this.fieldValidators[name])) {

                if (typeof window[validatorName] !== "function") {
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
        },
        initDetails(){
            const details = this.$store.getters['cartStore/getDomainContactDetails']();
            if(details) {
                this.domainContact = details;
            }
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
        getTranslatedMessage(name) {
            return mgPageLang.translate(name)
        },
    }
});