/**
 * Payment Methods Component
 */
mgJsComponentHandler.addDefaultComponent('mg-one-page-payment-methods', {
    template: '#t-mg-one-page-payment-methods',
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
            selectedGateway: null,
            applyCredit: 0,
            ccinfo: 'new',
            cardInfo: 'new',
            ccvInputVisible: false,
            gatewayModel: null,
            ccinfoId: null,
            cccvv: null,
            cccvvError: false,
            interactiveMode: true,
            selectedCardId: null,
            stripeErrors: {},
            ccDescription: null,
        }
    },
    watch: {
        isVisible: function(value){
            if(value === false){
                return;
            }
            this.$nextTick(function () {
                this.renderGatewayCheckbox();
                if(this.showNumber == true){
                    renderSectionIndex();
                }
                this.updateSelectedGatewayIfDoesNotExists();
            });
        },
        selectedGateway: {
            handler(newValue, oldValue) {

                    let self = this;
                    const object = this.getGatewayByName(newValue)
                    self.updateSelectedGateway(object);
                    self.setCardInfo('new')
                    self.$nextTick(async function () {
                        if(self.interactiveMode === true){
                            await self.$store.dispatch('cartStore/changePaymentGateway',{gateway: newValue});
                        }
                        this.interactiveMode = true;
                        await self.$store.dispatch('cartStore/gatewayHooks/runHookOnGatewaySelect').then(() => {
                            const availableCards = self.getAvailableCreditCards(self.gatewayModel);
                            if(availableCards && availableCards.length > 0){
                                self.setCardInfo('existing');
                                let card = availableCards.find(card => !card.isExpired)
                                if(card){
                                    self.enableCard(null);
                                    self.enableCard(card.id, self.gatewayModel.gatewayKey);
                                }
                            }
                        });
                    })
            },
            deep: true
        },
        applyCredit: {
            handler(newValue, oldValue) {
                this.updateApplyCredit(newValue);
                this.renderGatewayCheckbox();
            },
            deep: true
        },
        ccDetailsVisible: {
            handler(newValue, oldValue) {
                if(!newValue){
                    return;
                }
                this.$nextTick(async function () {
                    await this.$store.dispatch('cartStore/gatewayHooks/runHookOnGatewaySelect');
                })
            },
            deep: true
        },
        ccinfo: {
            handler(value, oldValue) {
                this.$store.dispatch('cartStore/updateCreditCardInfo', value);
                this.$nextTick(() => {
                    this.$store.dispatch('cartStore/gatewayHooks/runHookOnChangeCreditCard', {ccinfo: value, ccdescription: this.ccDescription});
                })
            },
            deep: true
        },
        personalDetails: function(value){
            if(this.isVisible && value.defaultgateway && !this.selectedGateway){
                this.selectedGateway = value.defaultgateway;
            }
        },
        paymentGateways: function(gateways){
            if(gateways.length === 0 ){
                this.selectedGateway    = null;
                this.gatewayModel       = null;
                return;
            }

            if(this.selectedGateway){
                const gateway = gateways.find(gateway => gateway.gatewayKey == this.selectedGateway)
                if(!gateway && gateways){
                    this.selectedGateway = gateways[0].gatewayKey;
                }
            }

        }
    },
    created() {
        const self = this;
        mgEventHandler.on('PreCompleteOrder', null, function (id, params) {
            self.validateCcvField();
            self.$forceUpdate();
        });
        mgEventHandler.on('RefreshAlertState', null, function () {
            self.cccvvError = false;
        });
    },
    computed:{
        isAddonPage: {
            get(){
                return this.$store.getters['cartStore/getSPage']() == 'addons';
            }
        },
        showNumber:{
            get(){
                return this.$store.getters['cartStore/shouldShowNumber']();
            }
        },
        showPaymentGateways: {
            get(){
                return (this.$store.getters['cartStore/getApplyCreditsStatus']() != '1' || this.furtherPayment)
                    && this.paymentGateways !== null;
            }
        },
        isVisible: {
            get(){
                return this.$store.getters['cartStore/isVisible']('paymentMethods') && this.countAvailableGateways() > 0;
            }
        },
        personalDetails:{
            get(){
                return this.$store.getters['cartStore/getClient']()
            }
        },
        paymentGateways: {
            get () {
                let gateways = this.$store.getters['cartStore/getPaymentGateways']();
                if(gateways.length) {
                    gateways.sort((a,b) => a.order - b.order)
                    if (this.currency) {
                        gateways = Object.assign(...Object.keys(gateways)
                            .filter( key => gateways[key].supportedCurrencies && gateways[key].supportedCurrencies.includes(this.currency.code) || gateways[key].supportedCurrencies && !gateways[key].supportedCurrencies.length )
                            .map( key => ({ [key]: gateways[key] }) ) );
                    }
                    let paymentGateways = []
                    Object.entries(gateways).forEach(gateway => {
                        if (this.isAvailableGateway(gateway[1])) {
                            paymentGateways.push(gateway[1])
                        }
                    })
                    return paymentGateways
                }
               return []
            }
        },
        personalDetailsValid:{
            get(){
                return this.personalDetails !== null && this.personalDetails !== undefined && this.personalDetails.credit !== undefined && this.personalDetails.credit.numeric > 0
            }
        },
        amount: {
            get(){
                if(this.furtherPayment){
                    return this.getFormattedPrice(this.personalDetails.credit.numeric)
                }

                let total = this.$store.getters['cartStore/getCartSummary']();
                return this.getFormattedPrice(total.total.numeric)
            }
        },
        furtherPayment:{
            get(){
                return parseFloat(this.personalDetails.credit.numeric) < parseFloat(this.$store.getters['cartStore/getCartSummary']().total.numeric);
            }
        },
        availableCreditCards:{
            get(){
                return this.personalDetails['cards'] !== undefined ? this.personalDetails['cards'] : false;
            }
        },
        ccDetailsVisible:{
            get(){
                return (this.cardInfo == 'new' || this.availableCreditCards == false)  ? true : false;
            }
        },
        isBlockedPage: {
            get() {
                return this.$store.getters['cartStore/getBlockedEvents']()['fullPage'] > 1;
            }
        },
        group: {
            get(){
                return this.$store.getters['cartStore/getCurrentGroup']();
            }
        },
        showCcvInput:{
            get(){
                let isCcvInputShown = this.cardInfo == 'existing' && this.ccinfo != 'new' && this.gatewayModel && this.gatewayModel.type === 'CC' && this.gatewayModel.remote === false;
                if(isCcvInputShown) {
                    this.ccinfo = this.selectedCardId
                }
                if (this.gatewayModel && this.gatewayModel.showInput && this.cardInfo === 'existing') {
                    return true;
                }
                return isCcvInputShown;
            }
        },
        layoutSettings: {
            get()
            {
                return this.$store.getters['cartStore/getLayoutSettings']();
            }
        },
        currency: {
            get() {
                return this.$store.getters['cartStore/getSelectedCurrency']();
            },
        },
    },
    methods:{
        setCardInfo(value){
            this.cardInfo = value;
            if(value == 'new') {
                this.ccinfo =  value;
            }
            else {
                this.ccinfo =  this.selectedCardId;
            }
        },
        getFormattedPrice(price) {
            return this.currency.prefix + formatPrice.getFormattedPrice(price, this.currency.format) + (this.layoutSettings.displayPriceSuffix ? (' ' + this.currency.suffix) : '')
        },
        updateSelectedGateway(gateway){
            this.gatewayModel = gateway;
            if (gateway && gateway.charge) {
                this.$store.commit('cartStore/setGatewayChargeFlag', gateway.charge.isChargeable);
            }
        },
        updateSelectedGatewayIfDoesNotExists: function(){

            if(!this.selectedGateway && this.$store.getters['cartStore/getSelectedPaymentGateway']()){
                this.interactiveMode = false;
                this.selectedGateway = this.$store.getters['cartStore/getSelectedPaymentGateway']()
            }
            else if(!this.selectedGateway && Object.values(this.paymentGateways)[0]){
                this.selectedGateway = this.personalDetails.defaultgateway ? this.personalDetails.defaultgateway : Object.values(this.paymentGateways)[0].gatewayKey;
            }
        },
        updateApplyCredit(applyCredits){
            this.$store.dispatch('cartStore/applyCredits', {applyCredits});
        },
        enableCard(cardId, gatewayKey) {
            this.ccinfo = cardId;
            this.selectedCardId = cardId
            if(gatewayKey){
                this.ccinfoId = gatewayKey + '_' + cardId;
            }else{
                this.ccinfoId = cardId;
            }
        },
        renderGatewayCheckbox() {
            var self = this;
            /** render add event in payments section  */
            renderCheckBox('payment-gateway-component', function(val){
                self.selectedGateway = val;
            }, function(val){});
            /** render add event in credits section  */
            renderCheckBox('payment-credits-component', function(val){
                self.applyCredit = val;
            }, function(val){});
        },
        getAvailableCreditCards: function(gateway){
            if(gateway && gateway.remote === true){
                return this.getGatewayCreditCards(gateway.gatewayKey);
            }else{
                return this.getCCCards();
            }
        },
        getGatewayByName: function(name){
            if(typeof this.paymentGateways !== 'object'){
                return null;
            }
            for (const [index, model] of Object.entries(this.paymentGateways)){
                if(model.gatewayKey === name){
                    return model;
                }
            }
            return null;
        },
        getDisabledGateways() {
            return this.group.disabledgateways ? this.group.disabledgateways.split(',') : []
        },
        getGatewayCreditCards: function(name){
            if(Array.isArray(this.availableCreditCards)){
                return this.availableCreditCards.filter(card => card.gateway === name);
            }
            return null;
        },
        getCCCards: function (){
            if(Array.isArray(this.availableCreditCards)){
                return this.availableCreditCards.filter(card => card.gateway == '');
            }
            return null;
        },
        validateCcvField: function(){
            if (this.selectedGateway === 'stripe') {
                this.$store.dispatch('cartStore/updateCreditCardDescription', this.ccDescription);
                if ($('#mg-stripe-cc').hasClass('StripeElement--invalid')) {
                    pageOrderStore.commit('cartStore/pushValidateError', {id: 'mg-stripe-cc', error: result});
                    this.stripeErrors.cc = true;
                } else {
                    pageOrderStore.commit('cartStore/popValidateError', 'mg-stripe-cc');
                    this.stripeErrors.cc = false;
                }
                if ($('#mg-stripe-expiry').hasClass('StripeElement--invalid')) {
                    pageOrderStore.commit('cartStore/pushValidateError', {id: 'mg-stripe-expiry', error: result});
                    this.stripeErrors.expiry = true;
                } else {
                    pageOrderStore.commit('cartStore/popValidateError', 'mg-stripe-expiry');
                    this.stripeErrors.expiry = false;
                }
                if ($('#mg-stripe-cardcvv').hasClass('StripeElement--invalid')) {
                    pageOrderStore.commit('cartStore/pushValidateError', {id: 'mg-stripe-cardcvv', error: result});
                    this.stripeErrors.cardcvv = true;
                } else {
                    pageOrderStore.commit('cartStore/popValidateError', 'mg-stripe-cardcvv');
                    this.stripeErrors.cardcvv = false;
                }
            }
            if(this.showCcvInput === false || this.cardInfo === 'new'){
                return;
            }
            let useCCInput = document.getElementById('useFullCreditOnCheckout')
            var result = window['pageOrderRequiredValidator']('cccvv', this.cccvv);
            if (result === true || (useCCInput && useCCInput.value)) {
                pageOrderStore.commit('cartStore/popValidateError', 'cccvv');
                this.cccvvError = false;
            }
            else if (useCCInput) {
                pageOrderStore.commit('cartStore/pushValidateError', {id: 'cccvv', error: result});
                this.cccvvError = result;
            }
        },
        countAvailableGateways: function(){
          let count = 0;
            for (const [index, model] of Object.entries(this.paymentGateways)){
                if(this.isAvailableGateway(model)){
                    count++;
                }
            }
            return count;
        },
        isAvailableGateway: function(gateway){
            return !(this.group && this.getDisabledGateways() && this.getDisabledGateways().indexOf(gateway.gatewayKey) !== -1);
        },
        getTranslatedMessage: function(message, replace){
            return mgPageLang.translate([message], replace);
        },
        isChecked(condition) {
            return condition ? 'gateway-checked' : null;
        }
    },
});