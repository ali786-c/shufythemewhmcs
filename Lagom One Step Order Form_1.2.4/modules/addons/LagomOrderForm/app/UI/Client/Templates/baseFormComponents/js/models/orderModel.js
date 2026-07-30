const orderModel = {

    request: {},
    addParam(key, value) {
        this.request[key] = encodeURIComponent(value);
    },
    clearParams(){
        this.request = {};
    },
    buildRequest(state) {
        //clear params state firstly
        this.clearParams();

        this.addParam('token', csrfToken);
        this.addParam('submit', 'true');
        this.addParam('ajax', 'true');

        /**
         * personal details
         */
        let personalDetails = state.getters['cartStore/getAppBillingDetails']();
        const postcodeInput = $('input[name="postcode"]:visible')
        this.addParam('firstname', (personalDetails.firstname ? personalDetails.firstname : ''));
        this.addParam('lastname', (personalDetails.lastname ? personalDetails.lastname : ''));
        this.addParam('companyname', (personalDetails.companyname ? personalDetails.companyname : ''));
        this.addParam('email', (personalDetails.email ? personalDetails.email : ''));
        this.addParam('address1', (personalDetails.address1 ? personalDetails.address1 : ''));
        this.addParam('address2', (personalDetails.address2 ? personalDetails.address2 : ''));
        this.addParam('city', (personalDetails.city ? personalDetails.city : ''));
        this.addParam('state', (personalDetails.state ? personalDetails.state : ''));
        this.addParam('postcode', (postcodeInput.length ? postcodeInput.val() : personalDetails.postcode));
        this.addParam('country', (personalDetails.country ? personalDetails.country : ''));
        this.addParam('phonenumber', (personalDetails.phonenumber ? personalDetails.phonenumber : ''));
        this.addParam('tax_id', (personalDetails.tax_id ? personalDetails.tax_id : ''));
        this.addParam('marketingoptin', (personalDetails.marketingoptin ? personalDetails.marketingoptin : ''));

        /**
         * login details
         */
        let userDetails = state.getters['cartStore/getClient']();
        let loginDetails = state.getters['cartStore/getLoginDetails']();
        let authType = state.getters['cartStore/getAuthOption']();
        if (!(userDetails.exist === true)) {
            this.addParam('loginemail', (loginDetails.email ? loginDetails.email : ''));
            this.addParam('loginpassword', (loginDetails.password ? loginDetails.password : ''));
            this.addParam('country-calling-code-phonenumber', personalDetails.callingCode);
        }

        let accountId = state.getters['cartStore/getAccountId']();
        /**
         * account type
         */

        if(accountId === 'new'){
            this.addParam('custtype', 'add');
        }else{
            this.addParam('custtype', (userDetails.exist === true || authType == 'loginOption' ? 'existing' : 'new'));
        }

        /**
         *
         * add account ID
         */
        if(accountId && accountId !== ""){
            this.addParam('account_id', accountId);
        } else {
            this.addParam('account_id', "new");
        }

        /**
         *
         * apply credits
         */
        let applyCredits = state.getters['cartStore/getApplyCreditsStatus']()
        this.addParam('applycredit', applyCredits ? '1' : '');

        /**
         * payment method
         */

        let paymentMethod = state.getters['cartStore/getSelectedPaymentGateway']();
        this.addParam('paymentmethod', paymentMethod ? paymentMethod : 'banktransfer');

        /**
         *
         * additional billing fields (custom fields and passwords)
         */
        let billingFields = state.getters['cartStore/getLocalBillingDetails']();

        for (var obj in billingFields) {
            this.addParam(obj, (billingFields[obj] ? billingFields[obj] : ''));
        }

        /**
         * used credit card info (new or id if existing)
         */

        this.addParam('ccinfo', state.getters['cartStore/getCcInfo']());
        this.addParam('ccdescription', state.getters['cartStore/getCcDescription']());


        /**
         * notes
         */
        let notes = state.getters['cartStore/getNotesValue']();
        this.addParam('notes', notes ? notes : '');

        /**
         *
         * domain contact details
         */
        let domainContact = state.getters['cartStore/getDomainContactDetails']();

        if (domainContact.contact !== null && domainContact.contact > 0) {
            this.addParam('contact', domainContact.contact);
        } else if (domainContact.contact === 'addingnew') {
            this.addParam('contact', domainContact.contact);
            this.addParam('domaincontactfirstname', domainContact.firstname);
            this.addParam('domaincontactlastname', domainContact.lastname);
            this.addParam('domaincontactemail', domainContact.email);
            this.addParam('country-calling-code-domaincontactphonenumber', domainContact.callingCode);
            this.addParam('domaincontactphonenumber', domainContact.phonenumber);
            this.addParam('domaincontactcompanyname', domainContact.companyname);
            this.addParam('domaincontacttax_id', domainContact.tax_id);
            this.addParam('domaincontactaddress1', domainContact.address1);
            this.addParam('domaincontactaddress2', domainContact.address2);
            this.addParam('domaincontactcity', domainContact.city);
            this.addParam('domaincontactstate', domainContact.state);
            this.addParam('domaincontactpostcode', postcodeInput.length ? postcodeInput.val() : domainContact.postcode);
            this.addParam('domaincontactcountry', domainContact.country);
        }

        if (state.getters['cartStore/getComponentsConfiguration']()['marketingEmailEnabled'] === true) {
            let marketingopt = state.getters['cartStore/getMarketingEmailsValue']();
            this.addParam('marketingoptin', marketingopt ? marketingopt : '');
        }

        /**
         * term of service value
         */
        if (state.getters['cartStore/getTermOfServiceValue']() === true) {
            this.addParam('accepttos', 'true');
        }
    },
    addGatewayParams(gatewayFormData) {
        for (var obj in gatewayFormData) {
            this.addParam(obj, (gatewayFormData[obj] ? gatewayFormData[obj] : ''));
        }
    },
    getRequestDetails() {
        return Object.keys(this.request).map(key => key + '=' +  this.request[key]).join('&');
    },
    getRequest() {
        return this.request
    }
};