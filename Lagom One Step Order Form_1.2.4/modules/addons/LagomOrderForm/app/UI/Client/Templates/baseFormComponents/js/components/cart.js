/**
 * Cart Component
 */
mgJsComponentHandler.addDefaultComponent('mg-one-page-cart', {
    template: '#t-mg-one-page-cart',
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
            data: {},
            code: null,
            tos: null,
            tosIsValid: true,
            captchaCode: null,
            promoEnabled: false,
            promoDescription: '',
            priceBeforePromo: '',
            showErrorBox: false,
        }
    },
    watch: {
        isVisible: function (value) {
            this.setRequestedPromoCode()
            if (value === false)
            {
                return;
            }
            
            if (!this.tosIsValid)
            {
                this.tosIsValid = true;
            }

            if (this.$store.getters['cartStore/getBillingDetailsErrors']())
            {
                this.$store.commit('cartStore/setBillingDetailsErrors', false)
            }
            
            var self = this;
            this.$nextTick(function () {
                /** render add event in payments section  */
                renderCheckBox('cart-component', function (val) {
                    self.tos = val;
                    self.setTos(self.tos);
                }, function (val) {
                    self.tos = null;
                    self.setTos(self.tos);
                });
                
                if (this.showNumber == true)
                {
                    renderSectionIndex();
                }
                
                //todo move to dedicated function
                self.sticky = document.querySelectorAll('[data-fixed-actions]');
                if (self.sticky[0] !== undefined)
                {
                    let hash = self.sticky[0].attributes.href.value;
                    self.target = document.querySelectorAll(hash);
                    if (self.sticky.length)
                    {
                        window.setTimeout(function () {
                            self.targetVisibility();
                        }, 500)
                        this.stickySidebar();
                    }
                }
                window.onbeforeunload = function () {
                    window.scrollTo(0,0);
                };
            });
        },
        tos: function (value) {
            let self = this;
            self.$store.dispatch('cartStore/updateTermOfService', value)
            self.requireValidator();
        },
        orderFields: function(value) {
            if(this.orderFields.length) {
                this.orderFields.map(singleField => {
                    if(!this.data[singleField.id]) {
                        this.data[singleField.id] = singleField
                        if(this.data[singleField.id].type == 'dropdown') {
                            //select first option from dropdown
                            this.data[singleField.id].value = this.data[singleField.id].extra[0]
                        }
                        else if(this.data[singleField.id].type == 'inputText') {
                            this.data[singleField.id].value = ''
                        }
                        else {
                            this.data[singleField.id].value = null
                        }
                    }
                })
            }
        }
    },
    computed: {
        renewalsLength: {
            get()
            {
                if (Object.keys(this.cart.renewals).length > 0)
                {
                    return Object.keys(this.cart.renewals).length
                }
            }
        },
        onlyDomains: {
            get()
            {
                return this.cartDomains && this.cart.products.length == 0;
            }
        },
        showNumber: {
            get()
            {
                return this.$store.getters['cartStore/shouldShowNumber']();
            }
        },
        promo: {
            get()
            {
                let promoType = ' '
                if (this.cart.promo)
                {
                    this.promoEnabled = true
                    if (this.cart.promo.type == 'Price Override')
                    {
                        promoType += this.cart.promo.type
                    } else
                    {
                        promoType = ''
                    }
                    if (this.layoutSettings.displayPriceSuffix && this.currency.suffix)
                    {
                        if (this.cart.promo.type == 'Percentage')
                        {
                            this.promoDescription = this.cart.promo.value + '% ' + this.cart.promo.recurring
                        } else
                        {
                            this.promoDescription = this.currency.prefix + this.cart.promo.discount.numeric + ' ' + this.currency.suffix + promoType + ' ' + this.cart.promo.recurring
                        }
                        
                    } else
                    {
                        if (this.cart.promo.type == 'Percentage')
                        {
                            this.promoDescription = this.cart.promo.value + '% ' + this.cart.promo.recurring
                        }
                        this.promoDescription = this.currency.prefix + this.cart.promo.discount.numeric
                    }
                }
                return (this.cart.promo && this.cart.promo.code) ? this.cart.promo : false;
            }
        },
        cartRecurringPrices: {
            get()
            {
                return this.cart !== undefined && this.cart.additionalPriceData !== undefined && this.cart.additionalPriceData.recurringPrices !== undefined
            }
        },
        promoCodeErrorMessage:{
            get(){
                return this.$store.getters['cartStore/getPromoCodeErrorMessage']();
            }
        },
        cart: {
            get()
            {
                let cartSummary = this.$store.getters['cartStore/getCartSummary']();
                if (!cartSummary.promo && cartSummary.total)
                {
                    this.priceBeforePromo = cartSummary.total.numeric
                }
                return cartSummary
            }
        },
        isVisible: {
            get()
            {
                return this.$store.getters['cartStore/isVisible']('cart')
            }
        },
        spinner: {
            get()
            {
                return this.$store.getters['cartStore/getSpinners']()['cart'];
            }
        },
        cartDomains: {
            get()
            {
                return this.cart && this.cart.domains;
            }
        },
        isOrdering: {
            get()
            {
                return this.$store.getters['cartStore/getSpinners']()['ordering'];
            }
        },
        tosEnabled: {
            get()
            {
                return this.$store.getters['cartStore/getComponentsConfiguration']()['tosEnabled'];
            }
        },
        tosLink: {
            get()
            {
                return this.$store.getters['cartStore/getComponentsConfiguration']()['tosLink'];
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
        isCaptchaOn: {
            get()
            {
                if (!this.captcha.setting) {
                    return false;
                }

                return (this.captcha.setting === 'on' || (this.captcha.setting === 'offloggedin' && !(this.$store.getters['cartStore/getClient']()['id'] > 0 )))
                    && this.captcha.forms['checkoutCompletion'] === true;
            }
        },
        isCaptchaConfirmed: {
            get() {
                return this.$store.getters['cartStore/getCaptchaConfirmation']();
            }
        },
        paymentGateway: {
            get() {
                return this.$store.getters['cartStore/getSelectedPaymentGateway']();
            }
        },
        promoAlert: {
            get()
            {
                let alerts = this.$store.getters['cartStore/getAlert']();
                return alerts && alerts.promo ? alerts.promo : false;
            }
        },
        isButtonBlocked: {
            get()
            {
                return !(this.cartDomains.length > 0 || this.cart.addons.length > 0 || this.cart.domains.length > 0 || this.cart.products.length > 0 || Object.keys(this.cart.renewals).length > 0 || this.cart.upgrades.length > 0);
            }
        },
        layoutSettings: {
            get()
            {
                return this.$store.getters['cartStore/getLayoutSettings']();
            }
        },
        currency: {
            get()
            {
                return this.$store.getters['cartStore/getSelectedCurrency']();
            },
        },
        cartErrors: {
            get() {
                return this.$store.getters['cartStore/getValidateErrors']();
            }
        },
        isDiscountCenterOn: {
            get() {
                return this.$store.getters['cartStore/getLayoutSettings']().isDiscountCenterOn
            }
        },
        isPromoVisible: {
            get() {
                return this.layoutSettings.choosePromotionInputPlacement == 'orderSummary' ? true : false

            }
        },
        isPromoCodeInOrderSummary: {
            get() {
                return this.layoutSettings.choosePromotionInputPlacement == 'orderSummary' ? true : false

            }
        },
        orderFields:{
            get(){
                return this.$store.getters['cartStore/getOrderFields']();
            }
        },
        requestedPromoCode:{
            get(){
                return this.$store.getters['cartStore/getRequestedPromoCode']();
            }
        },
        showSummaryFooter: {
            get() {
                return this.tosEnabled || ((this.layoutSettings.orderFieldsLocation == 'orderSummaryBox' || !this.layoutSettings.orderFieldsLocation) && this.orderFields.length)
            }
        }
    },
    created()
    {
        var self = this;
        mgEventHandler.on('PreCompleteOrder', null, function () {
            self.requireValidator();
            Object.keys(self.data).forEach(function(key) {
                self.requireOrderFieldsValidator(self.data[key]);
                self.$forceUpdate();
            })
        });

        mgEventHandler.on('RefreshAlertState', null, function () {
            self.tosIsValid = true;
        });
    },
    updated: function () {
        setInterval(() => {
            this.showErrorBox = $(".alert.alert-danger.alert-sm:visible").not('#tosCheckboxAlert').not('#validationErrorPanel').not('.promoAlert').length
        },2000)
        if (!this.spinner)
        {
            this.scrollContent = document.querySelectorAll('.summary-content.content-scroll');
            
            if (this.scrollContent.length)
            {
                let that = this;
                setTimeout(function () {
                    let height = that.scrollContent[0].offsetHeight;
                    if (height > 160)
                    {
                        that.scrollContent[0].classList.add('has-scroll');
                    } else
                    {
                        that.scrollContent[0].classList.remove('has-scroll');
                    }
                }, 1)
            }
        }
        this.$nextTick(() => {
            this.addScrollToErrorBoxEvent(1000)
        })

    },
    methods: {
        addPromo: function () {
            if (this.isBlockedPage)
            {
                return;
            }
            this.$store.dispatch('cartStore/addPromocode', {code: this.code});
        },
        removePromo: function () {
            if (this.isBlockedPage)
            {
                return;
            }
            this.$store.dispatch('cartStore/removePromocode');
        },
        removeItem: function (type, value)
        {
            switch (type)
            {
                case 'renew':
                    this.$store.dispatch('cartStore/removeDomainRenew', {id: value});
                    break;
                default:
                    return;
            }
            
        },
        setTos: function (value) {
            this.$store.dispatch('cartStore/updateTermOfService', value)
        },
        enablePromocode: function () {
            let self = this;
            this.promoEnabled = true;
        },
        confirmOrder: function () {
            if (this.isBlockedPage) {
                return;
            }
            if (this.$captchaIsOn('checkoutCompletion')){
                this.$captchaCheck('checkoutCompletion').then(this.completeOrder);
            } else {
                this.completeOrder();
            }
        },
        validateCaptcha: function () {
            const self = this;
            /* set captcha details */
            captchaHelper.captchaComponent = this.$parent.$refs.captcha;
            captchaHelper.captchaType = 'checkoutCompletion';
            captchaHelper.onSuccessCallback = function (data) {
                self.completeOrder()
            };
            
            captchaHelper.initCaptcha();
        },
        completeOrder: function () {
            this.$store.dispatch('cartStore/clearValidateErrors')
            this.$store.dispatch('cartStore/completeOrder', {});
        },
        stickySidebar: function () {
            $(window).on('scroll', (event) => this.targetVisibility(event));
        },
        targetVisibility: function () {
            if (this.isOnScreen())
            {
                this.onScreen();
            } else
            {
                this.outScreen();
            }
        },
        isOnScreen: function () {
            let element = this.target[0];
            let position = element.getBoundingClientRect();
            if (position.bottom <= window.innerHeight)
            {
                return true;
            }
        },
        onScreen: function () {
            this.sticky[0].classList.remove("is-fixed");
        },
        outScreen: function () {
            this.sticky[0].classList.add("is-fixed");
        },
        requireValidator: function () {
            let fieldId = 'tos';
            
            if (this.tosEnabled && this.$store.getters['cartStore/getTermOfServiceValue']() !== true)
            {
                this.tosIsValid = false;
                this.$store.commit('cartStore/pushValidateError', {id: fieldId, error: 'Term of Service is required.'});
                return;
            }
            this.tosIsValid = true;
            this.$store.commit('cartStore/popValidateError', fieldId);
        },
        requireOrderFieldsValidator(field) {
            if (field.required === 'off') {
                return;
            }

            let result = pageOrderRequiredValidator(field.id, this.data[field.id].value);
            mgPageOrderCustomFieldValidatorCallback(field, result);
        },
        decodeHtml(html) {
            const txt = document.createElement("textarea");
            txt.innerHTML = html;
            return txt.value;
        },
        getFormattedDomainPremium(domainWithPrefix) {
            const domain = domainWithPrefix.split(this.currency.suffix)[0]
            return this.layoutSettings.displayPriceSuffix && this.currency.suffix ? domain + ' ' + this.currency.suffix : domain
        },
        updateDataValue(event, fieldId, option, index){
            //update data object
            this.data[fieldId].value = option;

            delete this.data[fieldId]
            this.data = {
                ...this.data
            }
            this.data[fieldId] = this.orderFields[index]
            this.data[fieldId].value = option
            this.requireOrderFieldsValidator(this.data[fieldId]);
            this.$store.dispatch('cartStore/updateOrderFields', Object.values(this.data).filter(item => item.value))
        },
        isValid(field) {
            return field.isValidField;
        },
        getRawDomainPrice(price, period) {
            return price.replace(period, '')
        },
        addScrollToErrorBoxEvent(timeout) {
                $("#checkout").click(() => {
                    const box = $(".alert.alert-danger.alert-sm:visible").not('#validationErrorPanel')
                    if (box.length) {
                        $('html, body').animate({
                            scrollTop: box.offset().top - 300
                        }, timeout);
                    }
                    setTimeout(() => {
                        $('html, body').stop(true,true);
                    }, timeout)
                });
        },
        setRequestedPromoCode() {
            if (this.requestedPromoCode) {
                this.$store.dispatch('cartStore/addPromocode', {code: this.requestedPromoCode})
                this.code = this.requestedPromoCode
            }
        },
        getTotalRecurringPrices() {
            return this.cart.additionalPriceData.recurringPrices
        },
        getFormattedPrice(price) {
            return formatPrice.getFormattedPrice(price, this.currency.format)
        },
        getCartOriginalPrice() {
            let price = parseFloat(this.cart.original.subtotal.numeric) + parseFloat(this.cart.taxtotal.numeric) + parseFloat(this.cart.taxtotal2.numeric)
            if (this.cart.gatewayCharge) {
                price += this.cart.gatewayCharge.numeric
            }
            return this.getFormattedPrice(price)
        },
        getCartPrice() {
            let price = parseFloat(this.cart.subtotal.numeric) + parseFloat(this.cart.taxtotal.numeric) + parseFloat(this.cart.taxtotal2.numeric)
            if (this.cart.gatewayCharge) {
                price += this.cart.gatewayCharge.numeric
            }
            return this.getFormattedPrice(price)
        },
        getProductPrice(product) {
            if (product.billingcycle !== 'onetime') {
               return product['pricing']['baseprice']['prefixed'] + (this.layoutSettings.displayPriceSuffix ? (' ' + this.currency.suffix) : '') + '/' + product.shortbillingcyclefriendly
            }
            return product['pricing']['baseprice']['prefixed'] + (this.layoutSettings.displayPriceSuffix ? (' ' + this.currency.suffix) : '')
        },
        getConfigOptionPrice(conf) {
            if (conf.recurring.numeric !== '0.00') {

                return conf.friendlyprice
            }
            return conf.recurring.prefixed
        },
        getDomainPrice(domain) {
            return domain.totaltoday.prefixed + (this.layoutSettings.displayPriceSuffix ? (' ' + this.currency.suffix) : '') + domain.friendlyperiod
        },
        getAddonPrice(addon) {
            if (addon.recurring.numeric == 0) {
                return this.$store.getters['cartStore/getZeroPrice']('addonsPrices') + (addon.setup.prefixed ?  (' + ' + addon.setup.prefixed + (this.layoutSettings.displayPriceSuffix ? (' ' + this.currency.suffix) : '')) : '')
            }
            return addon.recurring.prefixed + (this.layoutSettings.displayPriceSuffix ? (' ' + this.currency.suffix) : '') + addon.friendlypricelower + (addon.setup.prefixed ?  (' + ' + addon.setup.prefixed + (this.layoutSettings.displayPriceSuffix ? (' ' + this.currency.suffix) : '')) : '')
        },
        getDomainZeroValue()
        {
            return this.$store.getters['cartStore/getZeroPrice']('domainsPrices')
        }
    },
});
