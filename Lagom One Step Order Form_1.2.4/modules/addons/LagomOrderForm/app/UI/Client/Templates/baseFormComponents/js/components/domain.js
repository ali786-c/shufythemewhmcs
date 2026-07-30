/**
 * Domains Component
 */
 mgJsComponentHandler.addDefaultComponent('mg-one-page-domains', {
    template: '#t-mg-one-page-domains',
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
    data: function () {
        return {
            domainSld: null,
            domainTld: null,
            subdomain: null,
            domainName: null,
            searchedType: null,
            suggestionLimit: 10,
            suggestionCount: 0,
            period: 1,
            spotlightLimit: 5,
            showPopover: true,
            popoverIsVisible: false,
            popoverIsRequired: true,
            popoverNotShowAgain: false,
            field: {
                id: 'domainName',
                name: 'domain',
            },
            isValidField: true,
            fieldValidationMessages: null,
            searchedDomain: null,
            interactiveDomainFormMode: false,
            localFormData: {
                addons: {},
                servers: {},
                customFields: {},
                registerFields: {},
            },
            selectedType: null,
            recaptchaCounter: 0,
            isInvalidDomain: false,
            isDomainEmpty: false,
            tmpDomainName: '',
            selectedTld: null ,
            searchedWord: '',
            tldToShow: [],
            domainDiscountPrice: false,
            isSliderMoving: false,
            ownDomainFlag: false,
            shortestPeriod: false,
            subdomainInput: false,
            subdomainError: '',
        }
    },
    components: {
        customFieldTextInput: domainText,
        customFieldCheckboxInput: domainCheckbox,
        customFieldDropdownInput: domainDropdown,
        customFieldDisplayInput: domainDisplay,
    },
    created()
    {
        const self = this;
        mgEventHandler.on('PreCompleteOrder', null, function (id, params) {
            let domainSearched = typeof self.isDomainSelected == 'object' ? self.isDomainSelected.domain : self.isDomainSelected
            let result = productRequiresDomain(self.field.name, domainSearched);
            if(self.isVisible) {
                if (result === true) {
                    pageOrderStore.commit('cartStore/popValidateError', self.field.name);
                    self.isValidField = true;
                    self.fieldValidationMessages = false;
                } else {
                    pageOrderStore.commit('cartStore/pushValidateError', {id: self.field.name, error: result});
                    self.fieldValidationMessages = result;
                    self.isValidField = false
                }
            }

        });
        
        mgEventHandler.on('RefreshAlertState', null, function () {
            self.isValidField = true;
            self.fieldValidationMessages = null;
        });
    },
    watch: {
        domainToSearch: function(value){
            if(!value && value == this.domainName) {
                return;
            }

            this.domainName = value;
            this.searchDomain();
        },
        group: function() {
            if (this.searchDetails) {
                this.ownDomainFlag = true;
            }

        },
        regTypes: function (value) {
            let self = this;
            let [type] = Object.keys(value);
            this.selectedType = this.selectedRegType
            if (!value[this.selectedRegType] && type !== 'renew')
            {
                this.setType(type);
            }
            return value
        },
        selectedProduct() {
            if (Object.keys(this.regTypes).includes('subdomain') && Array.isArray(this.productSubdomain)) {
                this.subdomain = this.productSubdomain[0]
            }
            if (this.isDomainSelected && this.selectedRegType === 'subdomain') {
                this.$store.dispatch('cartStore/removeDomain', {domain: this.selectedDomain});
            }

        },
        currencyId() {
            if (this.domainName) {
                this.searchDomain()
            }
        },
        isVisible: function (value) {
            $(this.$refs.inputFocus).tooltip('hide')
            this.domainName = this.$store.getters['cartStore/getDomainToSearch']();
            this.$nextTick(function () {
                if (this.tlds[0] && !this.selectedTld) {
                    this.selectedTld = this.tlds[0] ? this.tlds[0].extension : null
                }

                this.domainTld = this.selectedTld
                this.tldToShow = this.tlds
                if (this.showNumber == true)
                {
                    renderSectionIndex();
                }
                if(value) {
                    this.isSliderMoving = false
                    this.handleNavTouchScroll(this.$refs.tabSlider, this.$refs.tabSliderContainer)
                }
            });
        },
        formData: {
            handler(formData)
            {
                if (!this.isDomainSelected || !this.interactiveDomainFormMode)
                {
                    return false;
                }
                if (Array.isArray(formData.servers)
                    || formData.servers !== null && ['function', 'object'].includes(typeof formData.servers)) {
                    Object.keys(formData.servers).forEach(key => {
                        const input = document.getElementById(key);
                        if (input) {
                            formData.servers[key] = input.value
                        }
                    });
                }
                this.$store.dispatch('cartStore/updateDomain', {formData: formData})
                setTimeout(() => this.customFields = this.$store.getters['cartStore/getDomainCustomFields'](), 1000)
            },
            deep: true
        },
        stateFormData: {
            handler(formData)
            {
                this.interactiveDomainFormMode = false;
                this.localFormData = formData;
                this.$nextTick(() => {
                    this.interactiveDomainFormMode = true;
                })
            },
            deep: true,
        },
        domainOwn: function (newValue) {
            if (newValue !== undefined && newValue[0] !== undefined && newValue[0].status === 'true')
            {
                let domain = this.convertDomainName();
                this.$store.commit('cartStore/setSelectedDomain', domain)
                this.$store.dispatch('cartStore/removeDomains')
                this.addDomain(this.selectedRegType)
            } else if (newValue !== undefined && newValue.error !== undefined)
            {
                console.log('WHMCS validation errror ' + newValue.error)
                //TODO add error handling
            } else
            {
                //TODO add error handling
            }
        },
        period: function (value) {
            if(value) {
                this.changePeriod(this.selectedRegType, value)
            }
        },

        domainSubdomain: function(newValue) {
            if (newValue !== undefined && newValue[0] !== undefined && newValue[0].status)
            {
                this.addDomain(this.selectedRegType)
            } else if (newValue !== undefined && newValue.error !== undefined)
            {
                console.log('WHMCS validation errror ' + newValue.error)
                this.subdomainError = newValue.error
                //TODO add error handling
            } else
            {
                this.subdomainError = ''
                //TODO add error handling
            }
        },
        searchedWord: function(val){
            this.reloadTlds();
        },
        isDomainSelected: function() {
            $(this.$refs.inputFocus).tooltip('hide')
        },
        isSearchVisible: function() {
            $(this.$refs.inputFocus).tooltip('hide')
        }
    },
    computed: {
        showNumber: {
            get()
            {
                return this.$store.getters['cartStore/shouldShowNumber']();
            }
        },
        currencyId: {
            get() {
                return this.$store.getters['cartStore/getSelectedCurrencyId']()
            }
        },
        getSPage: {
            get(){
                return this.$store.getters['cartStore/getSPage']();
            }
        },
        domainToSearch: {
            get(){
                return this.$store.getters['cartStore/getDomainToSearch']();
            }
        },
        userDetails: {
            get() {
                return this.$store.getters['cartStore/getClient']()
            }
        },

        isCaptchaOn: {
            get()
            {
                return this.captcha.forms.domainChecker && (this.captcha.setting === 'on' || (this.captcha.setting === 'offloggedin' && this.$store.getters['cartStore/getClient']()['id'] > 0));
            }
        },
        isVisible: {
            get()
            {
                return this.$store.getters['cartStore/isVisible']('domains');
            }
        },
        isSearchVisible: {
            get()
            {
                const selectedProduct = this.$store.getters['cartStore/getSelectedProductDetails']();
                if (!selectedProduct) return this.$store.getters['cartStore/isDomainSectionAvailableComponent']('search') && !this.$store.getters['cartStore/getGroupProducts']().length
                return selectedProduct.showdomainoptions && selectedProduct.type !== 'other'
            }
        },
        regTypes: {
            get()
            {
                let domainsRegTypes = this.$store.getters['cartStore/getDomainRegTypes']();
                const selectedProduct = this.$store.getters['cartStore/getSelectedProductDetails']();

                if (selectedProduct && selectedProduct.subdomain == '')
                {
                    this.subdomainInput = domainsRegTypes.subdomain
                    delete domainsRegTypes.subdomain;
                } else if (this.subdomainInput) {
                    domainsRegTypes.subdomain = this.subdomainInput
                }
                if (this.userDetails.id) {
                    this.layoutSettings.domainElements = this.layoutSettings.domainElementsForUser
                }
                return this.layoutSettings.domainElements && this.layoutSettings.domainElements.length
                    ? this.getSortedElementsBySettings(domainsRegTypes) : domainsRegTypes;
            }
        },
        spotlights: {
            get()
            {
                let spotlights = this.$store.getters['cartStore/getDomainSpotlights']()[this.selectedRegType];
                if (!spotlights)
                {
                    return [];
                }

                let payType = (this.selectedProductDetails && this.selectedProductDetails.paytype == 'onetime') ?
                    this.selectedProductDetails.paytype :
                    this.$store.getters['cartStore/getSelectedProductCycle']();

                spotlights.map(singleSpotlight => {
                    singleSpotlight.isFreeWithSelectedProduct = this.selectedProductDetails
                        && this.selectedProductDetails.freedomaintlds
                        && this.selectedProductDetails.freedomainpaymentterms.includes(payType)
                        && this.selectedProductDetails.freedomaintlds.includes(singleSpotlight.tld);
                    if (this.layoutSettings.displayPriceSuffix) {
                        singleSpotlight.registerPriceFormated = singleSpotlight.register;
                        singleSpotlight.transferPriceFormated = singleSpotlight.transfer;

                        if (singleSpotlight.newRegisterPrice) {
                            singleSpotlight.newRegisterPriceFormatted = singleSpotlight.newRegisterPrice;
                        }
                    } else {
                        singleSpotlight.registerPriceFormated = singleSpotlight.registerPrefixed;
                        singleSpotlight.transferPriceFormated = singleSpotlight.transferPrefixed;

                        if (singleSpotlight.newRegisterPrice) {
                            singleSpotlight.newRegisterPriceFormatted = singleSpotlight.newRegisterPrice;
                        }
                    }
                    singleSpotlight.formattedPeriod = singleSpotlight.period > 1 ?
                        singleSpotlight.period + mgPageLang.translate(['domain', 'firstPeriodShortPlural'], {}) :
                        mgPageLang.translate(['domain', 'firstPeriodShort'], {});

                })
                return spotlights !== undefined && this.spotlightLimit !== 999 ? spotlights.slice(0, this.spotlightLimit) : spotlights;
            }
        },
        availableMoreSpotlights: {
            get()
            {
                let spotlights = this.$store.getters['cartStore/getDomainSpotlights']()[this.selectedRegType];
                return this.spotlightLimit && spotlights !== undefined && spotlights.length > spotlights.slice(0, this.spotlightLimit).length;
            }
        },
        availableLessSpotlights: {
            get()
            {
                var spotlights = this.$store.getters['cartStore/getDomainSpotlights']()[this.selectedRegType];
                return this.spotlightLimit === 999 && spotlights !== undefined && spotlights.length > spotlights.slice(0, 5).length;
            }
        },
        domainSuggested: {
            get()
            {
                let records = this.$store.getters['cartStore/getDomainInfoByType']('suggestions');
                if (records !== undefined)
                {
                    this.suggestionCount = Object.keys(records).length;
                    return Object.entries(records).slice(0, this.suggestionLimit).map(entry => entry[1]);
                } else
                {
                    return records;
                }
            }
        },
        domainSearched: {
            get()
            {
                return this.$store.getters['cartStore/getDomainInfoByType']('domain')
            }
        },
        domainSpotlight: {
            get()
            {
                return this.$store.getters['cartStore/getDomainInfoByType']('spotlight')
            }
        },
        domainTransfer: {
            get()
            {
                return this.$store.getters['cartStore/getDomainInfoByType']('transfer')
            }
        },
        domainOwn: {
            get()
            {
                return this.$store.getters['cartStore/getDomainInfoByType']('owndomain')
            }
        },
        domainSubdomain: {
            get()
            {
                return this.$store.getters['cartStore/getDomainInfoByType']('subdomain')
            }
        },
        domainExtensions: {
            get()
            {
                return this.$store.getters['cartStore/getTldExtensions']()
            }
        },
        selectedRegType: {
            get()
            {
                let regType = this.$store.getters['cartStore/getDomainRegistrationType']();
                return regType ? regType : 'register';
            }
        },
        searchPlaceholder: {
            get()
            {
                return this.regTypes[this.selectedRegType] ? this.regTypes[this.selectedRegType].searchPlaceholder : '';
            }
        },
        productSubdomain: {
            get()
            {
                if (this.selectedProductDetails && this.selectedProductDetails.subdomain)
                {
                    const subdomains = this.selectedProductDetails.subdomain.split(',');
                    if (subdomains.length > 0 && this.domainName) {
                        if (!this.domainName.includes('.') && !this.subdomain) {
                            this.subdomain = subdomains[0];
                        } else if (this.domainName.includes('.')) {
                            const domainTlds = this.domainName.split('.')
                            let domainTld = ''
                            for (let i = 1; i < domainTlds.length; i++) {
                                domainTld += '.' + domainTlds[i]
                            }
                            if (subdomains.includes(domainTld)) {
                                this.subdomain = domainTld
                            }
                        }
                    }
                    return subdomains;
                }
                return [];
            }
        },
        periodPrice: {
            get()
            {
                this.getDiscountDomainPrice()
                if (this.isFreeForSelectedProduct)
                {
                    return true
                }
                if (!this.shortestPeriod) return null
                this.period = this.shortestPeriod.period
                return this.shortestPeriod[this.selectedRegType]
            }
        },
        isFreeForSelectedProduct: {
            get()
            {
                const freeDomainTlds = this.selectedProductDetails ? this.selectedProductDetails.freedomaintlds.map(tld => tld.slice(1)) : []
                const domainTld = this.$store.getters['cartStore/getDomainInfoByType']('domain')[0].tld;

                let payType = (this.selectedProductDetails && this.selectedProductDetails.paytype == 'onetime') ?
                    this.selectedProductDetails.paytype :
                    this.$store.getters['cartStore/getSelectedProductCycle']();


                return this.selectedProductDetails.freedomaintlds ? freeDomainTlds.includes(domainTld) &&
                    this.selectedProductDetails.freedomainpaymentterms.includes(payType) : false
            }

        },
        searchDetails: {
            get()
            {
                let self = this
                if (this.searchSpinner)
                {
                    return false;
                }
                if (this.searchedType !== this.selectedRegType)
                {
                    return false;
                }
                if (!pageOrderIsObjectEmpty(this.domainSearched))
                {
                    return this.domainSearched;
                }
                if (!pageOrderIsObjectEmpty(this.domainTransfer))
                {
                    return this.domainTransfer;
                }
                if (this.domainOwn && !this.ownDomainFlag)
                {
                    return this.domainOwn;
                }
                if (!pageOrderIsObjectEmpty(this.domainSubdomain))
                {
                    return this.domainSubdomain;
                }
                return false;
            }
        },
        searchedError: {
            get()
            {
                const self = this;
                let isValid = true;
                if (self.searchDetails === false)
                {
                    return false;
                }
                if (self.searchDetails.error)
                {
                    return self.searchDetails.error;
                }
                if (self.selectedRegType == 'register')
                {
                    isValid = self.isRegisterValid();
                }
                if (self.selectedRegType == 'transfer')
                {
                    isValid = self.isTransferValid();
                }
                if (self.selectedRegType == 'subdomain')
                {
                    this.setType(this.selectedRegType)
                    isValid = self.isSubdomainValid();
                    if (this.subdomainError) {
                        isValid = this.subdomainError
                    }
                }
                if (self.selectedRegType == 'own')
                {
                    isValid = self.isOwnValid();
                }
                return isValid === true ? false : isValid;
            }
        },
        legacyStatusError: {
            get()
            {
                return (this.domainTransfer !== undefined && this.domainTransfer[0] !== undefined && this.domainTransfer[0].legacyStatus == 'error') ||
                    (this.domainSearched !== undefined && this.domainSearched[0] !== undefined && this.domainSearched[0].legacyStatus == 'error') ||
                    (this.domainOwn !== undefined && this.domainOwn.error !== undefined)
            }
        },
        searchSpinner: {
            get()
            {

                return this.$store.getters['cartStore/getSpinners']()['domainSearchSpinner'];
            }
        },
        spinner: {
            get()
            {
                return this.$store.getters['cartStore/getSpinners']()['domainAddSpinner'];
            }
        },

        /** domain configuration */
        showPeriods: {
            get()
            {
                return true;
            }
        },
        isDomainSelected: {
            get()
            {
                return this.$store.getters['cartStore/isDomainSelected']();
            },
        },
        selectedDomain: {
            get()
            {
                return this.$store.getters['cartStore/getDomainName']();
            }
        },
        availablePeriods: {
            get()
            {
                const domainInfo = this.$store.getters['cartStore/getDomainInfoByType']('domain')
                if (domainInfo[0]) {
                    this.shortestPeriod = domainInfo[0].shortestPeriod
                }
                if (domainInfo !== undefined
                    && domainInfo[0] !== undefined
                    && domainInfo[0].pricing)
                {
                    let items = Object.fromEntries(
                        Object.entries(
                            domainInfo[0].pricing)
                            .filter(([key, value]) => (value[this.selectedRegType] !== undefined))
                    );
                    if (this.selectedType === 'transfer') {
                        Object.entries(items[Object.keys(items)[0]]).forEach(item => {
                            if (item[1] !== -1) {
                                items[Object.keys(items)[0]][item[0]] = item[1].toString().replace(/[^0-9.|,]/g, '')
                            }
                        })
                    }
                    return items;
                }

                return [];
            }
        },
        domainAdditionalFields: {
            get()
            {
                return this.availablePeriods || this.customFields || this.domainServerNamespacesFormData;
            }
        },
        domainServerNamespaces: {
            get()
            {
                return this.$store.getters['cartStore/getDomainSchemaServerNamespaces']();
            }
        },
        domainServerNamespacesAvailable: {
            get()
            {
                return this.domainServerNamespaces && Object.keys(this.domainServerNamespaces).length > 0;
            }
        },

        customFields: {
            get()
            {
                return this.$store.getters['cartStore/getDomainCustomFields']();
            }
        },
        registerFields: {
            get()
            {
                return this.$store.getters['cartStore/getDomainSchemaRegisterFields']();
            }
        },
        stateFormData: {
            get()
            {
                let selectedProduct = this.$store.getters['cartStore/getSelectedProductId']();
                let productDetails = this.$store.getters['cartStore/getSelectedProductDetails']();

                if (selectedProduct && productDetails)
                {
                    if (productDetails.showdomainoptions == 1) {
                        this.$store.commit('cartStore/showComponent', 'domains', {root: true});
                    } else {
                        this.$store.commit('cartStore/hideComponent', 'domains', { root: true });
                    }
                }
                return this.$store.getters['cartStore/getDomainForm']();
            }
        },
        formData: {
            get()
            {
                return this.localFormData;
            }
        },
        domainServerNamespacesFormData: {
            get()
            {
                return this.formData.servers ? this.formData.servers : {};
            }
        },
        customFieldsFormData: {
            get()
            {
                return this.formData.customFields ? this.formData.customFields : {};
            }
        },
        registerFieldsFormData: {
            get()
            {
                return this.formData.registerFields ? this.formData.registerFields : {};
            }
        },
        isBlockedPage: {
            get()
            {
                return this.$store.getters['cartStore/getBlockedEvents']()['fullPage'] > 1;
            }
        },
        captcha: {
            get()
            {
                return this.$store.getters['cartStore/getCaptchaSettings']();
            }
        },
        currency: {
            get()
            {
                return this.$store.getters['cartStore/getSelectedCurrency']();
            }
        },
        layoutSettings: {
            get()
            {
                return this.$store.getters['cartStore/getLayoutSettings']();
            }
        },
        selectedProductDetails: {
            get()
            {
                return this.$store.getters['cartStore/getSelectedProductDetails']();
            }
        },
        selectedProduct:{
            get(){
                return this.$store.getters['cartStore/getSelectedProductId']();
            }
        },
        tlds:{
            get()
            {
                return this.$store.getters['cartStore/getTldExtensions']()
            }
        },
        domainType: {
            get() {
               return this.$store.getters['cartStore/getDomainRegistrationType']();
            }
        },
        isIDNActive: {
            get() {
                return this.$store.getters['cartStore/isIDNDomainsActive']();
            }
        },
        group: {
            get() {
                return this.$store.getters['cartStore/getSelectedGroupId']();
            }
        },
    },
    methods: {
        requireValidator()
        {
            if (!this.isVisible)
            {
                mgPageOrderCustomFieldValidatorCallback(this, true);
                return;
            }

            if (!this.isDomainSelected)
            {
                let result = pageOrderRequiredValidator(this.field.name, '');
                mgPageOrderCustomFieldValidatorCallback(this, result);
            }
            else
            {
                mgPageOrderCustomFieldValidatorCallback(this, false);
            }
        },
        changeType(event, type)
        {
            if (Object.keys(this.regTypes).includes('subdomain') && Array.isArray(this.productSubdomain)) {
                this.subdomain = this.productSubdomain[0]
            }
            event.preventDefault();
            let self = this;
            if(!this.isSliderMoving) {
                if (type != this.selectedRegType)
                {
                    self.searchDetails = false
                    self.searchedDomain = ''
                }

                if (this.isBlockedPage)
                {
                    return;
                }
                this.selectedType = type;
                this.searchedWord = ''
                this.selectedTld = this.tlds[0] ? this.tlds[0].extension : null
                this.setType(type);
            }
        },
        setType(type)
        {
            this.$store.dispatch('cartStore/setDomainRegistrationType', type);
        },
        showMoreSpotlights()
        {
            this.spotlightLimit = 999;
        },
        showLessSpotlights()
        {
            this.spotlightLimit = 5;
        },
        setSeparateDomainName: function () {
            this.searchedDomain = this.domainName;
            let name = this.domainName.split('.');
            this.domainSld = name[0];
            delete name[0];
            const domainTld = name.join('.')
            if (domainTld && this.tlds.filter(e => e.extension === domainTld).length > 0 && (this.selectedType === 'register' || this.selectedType === 'transfer')) {
                this.changeTld(domainTld)
            }
        },
        searchDomain: function(){

            if (!this.domainName)
            {
                this.isDomainEmpty = true;
                $(this.$refs.inputFocus).tooltip('show')
                return
            }
            this.domainName = this.domainName.trim().replace('www.', '');
            if (!this.isIDNActive && !this.domainName.match(/^((?!-))(xn--)?[a-z0-9][a-z0-9-_]{0,61}[a-z0-9]{0,1}\.(xn--)?([a-z0-9\-]{1,61}|[a-z0-9-]{1,30}\.[a-z]{2,})$/i) && !this.domainName.match(/^[a-z0-9]+$/i))  {
                this.isInvalidDomain = true;
                return;
            }
            if (this.selectedTld) {
                this.tmpDomainName = this.domainName + this.selectedTld;
            }
            else {
                this.tmpDomainName = this.domainName.includes('.') ? this.domainName : this.domainName
            }
            this.isInvalidDomain = false;
            const domainCheckerType = 'domainChecker';
            if (this.$captchaIsOn(domainCheckerType) && !this.$store.getters['cartStore/getCaptchaConfirmation']()){
                this.$captchaCheck(domainCheckerType).then(this.loadDomainInformation);
            } else {
                this.loadDomainInformation()
            }
        },
        loadDomainInformation: function () {
            this.searchedType = this.selectedRegType;
            this.isValidField = true;
            this.fieldValidationMessages = null
            switch (this.selectedRegType)
            {
                case 'register':
                    this.loadWhmcsDomainInformation('domain');
                    this.loadWhmcsDomainInformation('spotlight');
                    this.loadWhmcsDomainInformation('suggestions');
                    break;
                case 'transfer':
                    this.loadWhmcsDomainInformation('transfer');
                    break;
                case 'subdomain':
                    this.loadWhmcsDomainInformation('subdomain');
                    break;
                default:
                    this.loadWhmcsDomainInformation('owndomain');
                    //Add redirect to configuration
                    break;
            }
        },
        loadWhmcsDomainInformation: function (type) {
            let domainToCheck = undefined
            if (this.domainName)
            {
                this.setSeparateDomainName();
            }
            if(this.selectedType == 'register' || this.selectedType == 'transfer') {
                if(this.domainTld) {
                    domainToCheck = this.domainSld + this.domainTld
                }
                else if(this.tlds[0]){
                    domainToCheck = this.domainSld + (this.selectedTld ? this.selectedTld : this.tlds[0].extension);
                }
            }
            else if (this.selectedType === 'own') {
                domainToCheck = this.domainName
            }
            else if (this.domainTld) {
                domainToCheck = this.domainSld + this.domainTld
            } else {
                domainToCheck = this.domainSld
            }


            if (type === 'subdomain')
            {
                this.selectedTld = this.subdomain;
                domainToCheck = this.domainSld + this.subdomain;
            }
            const data = {
                type: type,
                domain: domainToCheck,
                token: csrfToken,
                sld: this.domainSld,
                tld: this.selectedTld,
                a: 'checkDomain',
            };
            this.$store.dispatch('cartStore/loadDomainInformation', data)
        },
        convertDomainName: function () {//prepareAndGetDomainName
            let glue = (this.domainTld.indexOf('.') === 0) ? '' : '.';

            return this.domainSld + glue + this.domainTld;
        },
        addDomain: function (type) {

            if (type === 'own')
            {
                return this.addOwn();
            }
            if(type != 'own' && type != 'subdomain') {
                if (this.isBlockedPage)
                {
                    return;
                }
            }
            let domain = this.getDomainByType(type);
            this.$store.dispatch('cartStore/addDomain', {
                'type': type,
                'domain': domain.domainName,
                'year': this.period,
            })
        },
        changePeriod: function (type, period)
        {
            if (type === 'own')
            {
                return this.addOwn();
            }
            if (this.isBlockedPage)
            {
                return;
            }
            let domain = this.getDomainByType(type);
            this.$store.dispatch('cartStore/changePeriod', {
                'type': type,
                'domain': domain.domainName,
                'year': this.period,
            })
        },
        getDomainByType: function (type) {
            switch (type)
            {
                case 'subdomain':
                    return this.domainSubdomain[0];
                case 'register':
                    return this.domainSearched[0];
                case 'transfer':
                    return this.domainTransfer[0];
            }
        },
        changeDomainName: function (showPopover) {
            let self = this;

            // if(this.selectedRegType == 'own') {
            //     this.searchDetails = false
            // }
            if (this.isBlockedPage)
            {
                return;
            }
            if (showPopover === true && self.popoverIsRequired === true)
            {
                self.popoverIsVisible = true;
            } else
            {
                self.hidePopover();
                if (self.popoverNotShowAgain === true)
                {
                    self.popoverIsRequired = false;
                }
                self.searchDetails = false
                self.domainOwn = []
                self.$store.dispatch('cartStore/removeDomain', {domain: this.selectedDomain});
            }
            this.domainOwn = []
        },
        hidePopover: function () {
            this.popoverIsVisible = false;
        },
        addToCart: function (type, domain) {
            if (this.isBlockedPage)
            {
                return;
            }
            if (!domain.pricing[this.period])
            {
                this.period = Object.keys(domain.pricing)[0];
            }
            this.$store.commit('cartStore/updateSearchedDomainInformation', domain)
            this.$store.dispatch('cartStore/addDomain', {
                'type': type,
                'domain': domain.domainName,
                'year': this.period
            })

        },
        addOwn: function () {
            // if (this.isBlockedPage)
            // {
            //     return;
            // }
            this.setSeparateDomainName();
            this.$store.dispatch('cartStore/addDomain', {'type': this.selectedRegType, 'domain': this.domainName})
        },
        loadMoreSuggestions: function () {
            this.suggestionLimit += 10;
        },
        checkDomainIsFree: function (domainName) {
            let cart = this.$store.getters['cartStore/getCartSummary']();

            if (cart !== undefined && cart.domains !== undefined && Object.keys(cart.domains).length > 0)
            {
                Object.keys(cart.domains).forEach(function (key) {
                    if (cart.domains[key].domain === domainName)
                    {
                        return false;
                    }
                });
            }
            return true;
        },
        getResultMessage: function (domain, message) {
            return mgPageLang.sprintf(mgPageLang.translate([message]), domain);
        },
        getResultMessageByActionType: function () {

            if (this.selectedRegType == 'register')
            {
                return mgPageLang.sprintf(mgPageLang.translate(['cartcongratsdomainavailable'], {}), '<b>' + this.domainSearched[0].domainName + '</b>');
            }
            if (this.selectedRegType == 'transfer')
            {
                return mgPageLang.sprintf(mgPageLang.translate(['domain_eligeble_for_transfer'], {}), '<b>' + this.domainTransfer[0].domainName + '</b>');
            }
            if (this.selectedRegType == 'own')
            {
                return mgPageLang.sprintf(mgPageLang.translate(['domain_allowed_to_use'], {}), '<b>' + this.searchedDomain + '</b>');
            }
            if (this.selectedRegType == 'subdomain')
            {
                return mgPageLang.sprintf(mgPageLang.translate(['cartcongratsdomainavailable'], {}), '<b>' + this.searchedDomain + this.subdomain + '</b>');
            }
            // return mgPageLang.sprintf(mgPageLang.translate([message]), domain);
            return 'success'
        },
        isRegisterValid: function () {
            if (this.domainSearched === undefined || this.domainSearched[0] === undefined)
            {
                return '<p></p>' + mgPageLang.sprintf(mgPageLang.translate(['orderForm', 'searchResult', 'domainIsNotValid'], {}), '<b>' + this.searchedDomain + '</b>');
            }

            if (this.domainSearched[0].isValidDomain == 'false')
            {
                return '<p></p>' + mgPageLang.sprintf(mgPageLang.translate(['orderForm', 'searchResult', 'domainIsNotValid'], {}), '<b>' + this.searchedDomain + '</b>');
            }

            if (this.domainSearched[0].isAvailable == "false" || this.domainSearched[0].isAvailable === false || this.domainSearched[0].isRegistered == true || this.domainSearched[0].preferredTLDNotAvailable == 'true')
            {
                let domain = this.domainSearched[0] ? this.domainSearched[0].domainName : this.domainName

                if (this.domainSearched[0].originalUnavailableDomain) {
                    domain = this.domainSearched[0].originalUnavailableDomain
                }
                return '<p></p>' + mgPageLang.sprintf(mgPageLang.translate(['orderForm', 'searchResult', 'domainIsNotAvailable'], {}), '<b>' + domain + '</b>');
            }

            return true;
        },
        isTransferValid: function ()
        {
            let domain = this.domainSearched[0] ? this.domainSearched[0].domainName : this.domainName

            if (!this.layoutSettings.showDropdownWithTLDs && this.domainSearched[0].originalUnavailableDomain) {
                domain = this.domainSearched[0].originalUnavailableDomain
            }

            if (this.domainSearched[0] === undefined || (this.domainSearched[0] && this.domainSearched[0].shortestPeriod.transfer.includes("-1"))) {
                return '<p></p>' + mgPageLang.sprintf(mgPageLang.translate(['orderForm', 'searchResult', 'domainIsNotAvailable'], {}), '<b>' + domain + '</b>');
            }

            if (this.domainTransfer === undefined || this.domainTransfer[0] === undefined || this.domainTransfer[0].isValidDomain == 'false' || !this.domainTransfer[0].shortestPeriod || !this.domainTransfer[0].shortestPeriod.transfer)
            {
                return mgPageLang.sprintf(mgPageLang.translate(['orderForm', 'searchResult', 'domainIsNotValid'], {}), '<b>' + domain + '</b>');
            }

            if (this.domainTransfer[0].isAvailable != 'false' || this.domainTransfer[0].isRegistered != 'true')
            {
                return mgPageLang.sprintf(mgPageLang.translate(['orderForm', 'searchResult', 'domain_transfer_not_registered'], {}), '<b>' + domain + '</b>');
            }
            return true;
        },
        isSubdomainValid: function ()
        {
            if (this.domainSubdomain === undefined || this.domainSubdomain[0] === undefined || this.domainSubdomain[0].status === 'false')
            {
                return '<p></p>' + mgPageLang.sprintf(mgPageLang.translate(['orderForm', 'searchResult', 'domainIsNotAvailable'], {}), '<b>' + this.domainSld + this.domainTld + this.subdomain + '</b>');
            }
            return true;
        },
        getSearchButtonTitleByType: function (actionType) {
            return mgPageLang.translate(['add', 'button', actionType]);
        },
        isOwnValid: function () {
            if (this.domainOwn === undefined || this.domainOwn[0] === undefined || this.domainOwn[0].status === 'false')
            {
                return '<p></p>' + mgPageLang.sprintf(mgPageLang.translate(['orderForm', 'searchResult', 'domainIsNotAvailable'], {}), '<b>' + this.searchedDomain + '</b>');
            }
            return true;
        },
        selectSpotlight: function (tld) {
            let self = this;
            if (!self.domainName) {
                self.domainName = tld
            } else if (!self.domainName.includes('.')) {
                self.domainName += tld;
            } else {
                const splitDomain = self.domainName.split('.')
                self.domainName = splitDomain[0] + tld
            }
            setTimeout(function () {
                self.$refs.inputFocus.focus();
                self.$refs.inputFocus.setSelectionRange(0, 0);
            }, 10)

        },
        changeSubdomain: function (selectedSubdomain) {
            this.$el.querySelector('.tab-pane .dropdown').classList.remove('open')
            this.subdomain = selectedSubdomain
            this.domainName = '';
            this.domainSld = '';
            this.searchedDomain = '';
            this.isDomainSelected = false
            this.selectedDomain = false
            this.searchDetails.length = 0;
        },
        validateCaptcha: function () {
            const self = this;
            captchaHelper.captchaType = 'domainChecker';
            captchaHelper.onSuccessCallback = function (data) {
                self.loadDomainInformation()
            };

            if (self.captcha.type === 'invisible')
            {
                self.validateInvisibleCaptcha()
            }
        },
        validateInvisibleCaptcha: function () {
            this.$store.dispatch('cartStore/confirmCaptcha', {
                token: csrfToken,
                code: document.getElementById('g-recaptcha-response').value,
                type: captchaHelper.captchaType
            }).then(response => {
                captchaHelper.runSuccessCallback(response)
                grecaptcha.reset()
                $('#captchaContainerModal').modal('hide')
                $('#captchaContainerModal').html('')
                grecaptcha.execute()
            });
        },
        getFormattedPrice(price) {
            return formatPrice.getFormattedPrice(price, this.currency.format)
        },
        customFieldUpdated(field){
            this.formData.customFields[field.id] = field.value;
        },
        registerFieldUpdated(field){
            this.formData.registerFields[field.id] = field.value;
        },
        changeTld(tld) {
            this.selectedTld = tld
            this.domainTld = tld
        },
        reloadTlds: function(){
            let self = this;
            self.tldToShow = [];
            for (const [index, tld] of Object.entries(self.tlds)) {

                if(self.searchedWord !== null && tld.extension.indexOf(self.searchedWord) === -1){
                    continue;
                }
                self.tldToShow.push(tld)
            }
        },
        getDiscountDomainPrice() {
            const discountValueName = 'new_' + this.selectedRegType
            this.domainDiscountPrice = this.availablePeriods[Object.keys(this.availablePeriods)[0]] && this.availablePeriods[Object.keys(this.availablePeriods)[0]][discountValueName] && this.availablePeriods[Object.keys(this.availablePeriods)[0]][discountValueName] !== -1 && !this.isFreeForSelectedProduct ? this.getFormattedPrice(this.availablePeriods[Object.keys(this.availablePeriods)[0]][discountValueName]) : false
        },
        decodeHtml(html) {
            var txt = document.createElement("textarea");
            txt.innerHTML = html;
            return txt.value;
        },
        getSearchBoxClasses() {
            return [
                { 'search-box-default' : this.layoutSettings.templates && this.layoutSettings.templates.lagom && this.layoutSettings.templates.lagom.style_settings && this.layoutSettings.templates.lagom.style_settings.group && this.layoutSettings.templates.lagom.style_settings.group.elements.styles.search.value == 'default' },
                { 'search-box-primary' : this.layoutSettings.templates && this.layoutSettings.templates.lagom && this.layoutSettings.templates.lagom.style_settings && this.layoutSettings.templates.lagom.style_settings.group && this.layoutSettings.templates.lagom.style_settings.group.elements.styles.search.value == 'primary' },
                { 'search-box-secondary' : this.layoutSettings.templates && this.layoutSettings.templates.lagom && this.layoutSettings.templates.lagom.style_settings && this.layoutSettings.templates.lagom.style_settings.group && this.layoutSettings.templates.lagom.style_settings.group.elements.styles.search.value == 'secondary' },
                { 'search-box-primary' : (this.layoutSettings.templates && this.layoutSettings.templates.lagom && this.layoutSettings.templates.lagom.style_settings && this.layoutSettings.templates.lagom.style_settings.group && !this.layoutSettings.templates.lagom.style_settings.group.elements.styles.search.value) || !this.layoutSettings.templates || !this.layoutSettings.templates.lagom.style_settings },
                { 'box-search-domain--results': this.searchDetails || this.searchSpinner },
                { 'tld-dropdown' : this.selectedRegType == 'subdomain' && this.productSubdomain.length > 0 },
            ]
        },
        getSpotlightClasses() {
            return [
                { 'open' : this.availableLessSpotlights },
                { 'spotlight-list--full-width' : this.showNumber },
                { 'spotlight-list--less' : !this.availableMoreSpotlights && !this.availableLessSpotlights},
                { 'hidden' : this.spotlights.length == 0}
            ]
        },
        getSpotlightDiscountData(spotlight) {
            let data = {save: null, discount: null}
            if (this.selectedType === 'transfer' && spotlight.newTransferPrice &&  spotlight.newTransferPrice !== -1) {
                data.save = spotlight.transferPriceFormated + `/` + spotlight.formattedPeriod
                data.discount = this.currency.prefix + this.getFormattedPrice(spotlight.newTransferPrice) + `/` + spotlight.formattedPeriod
            } else if (spotlight.newRegisterPrice && spotlight.newRegisterPrice !== -1) {
                data.save = spotlight.registerPriceFormated + `/` + spotlight.formattedPeriod
                data.discount = this.currency.prefix + this.getFormattedPrice(spotlight.newRegisterPriceFormatted) + (this.layoutSettings.displayPriceSuffix ? (' ' + this.currency.suffix) : '') + `/` + spotlight.formattedPeriod
            }
            return data
        },
        getSpotlightPrice(spotlight) {
            let price = this.selectedType === 'transfer' ? spotlight.transferPriceFormated : spotlight.registerPriceFormated
            return !/\d/.test(price) ? price :  price + `/` + spotlight.formattedPeriod
        },
        isPeriodSelectVisible() {
           return (Object.keys(this.availablePeriods).length && !this.isFreeForSelectedProduct) || this.registerFields.length || this.customFields.length || (this.domainServerNamespacesAvailable && !this.selectedProduct) || (this.registerFields.eppCode !== undefined && this.registerFields.eppCode.id)
        },
        getPeriodOptions(value) {
            if (this.layoutSettings.isDiscountCenterOn) {
                if (value['new_'+this.selectedRegType] && value['new_'+this.selectedRegType] !== -1) {
                    return this.currency.prefix + this.getFormattedPrice(value['new_'+this.selectedRegType]) + (this.layoutSettings.displayPriceSuffix ? (' ' + this.currency.suffix) : '');
                }
            }
            const price = (this.currency.format === 1 || this.currency.format === 4 || (this.currency.format === 2 && this.availablePeriods[this.period][this.selectedRegType] < 1000)) ? this.getFormattedPrice(value[this.selectedRegType]) : value[this.selectedRegType]
            return this.currency.prefix + price + (this.layoutSettings.displayPriceSuffix ? (' ' + this.currency.suffix) : '')
        },
        getSpotlightValueForProductFreeDomain(spotlight) {
            if (this.selectedType === 'transfer') {
                return spotlight.transferPriceFormated
            }
            return spotlight.registerPriceFormated
        },
        getSortedElementsBySettings(domainsRegTypes) {
            let elements = {}

            this.layoutSettings.domainElements.forEach(element => {
                if (domainsRegTypes[element]) {
                    elements[element] = domainsRegTypes[element]
                }
            })
            if (domainsRegTypes.renew) {
                elements.renew = domainsRegTypes.renew
            }
            return elements
        },
        getZeroValue() {
            return this.$store.getters['cartStore/getZeroPrice']('domainsPrices')
        }

    }
});
function myCallback() {}
window.nvisibleCallback = myCallback;
