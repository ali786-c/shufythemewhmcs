
 mgJsComponentHandler.addDefaultComponent('mg-one-page-promo-code', {
    template: '#t-mg-one-page-promo-code',
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
            promoEnabled: false,
            promoDescription: '',
            priceBeforePromo: '',
            code: null,
        }
    },
    watch:{
        isVisible: function(value) {
            this.$nextTick(function () {
                if(this.showNumber == true){
                    renderSectionIndex();
                }
            });
            if (value === false) {
                return;
            }
            this.setRequestedPromoCode()
            this.promoEnabled = true;
        },

    },
    computed: {

        layoutSettings: {
            get() {
                return this.$store.getters['cartStore/getLayoutSettings']();
            }
        },
        currency: {
            get()
            {
                return this.$store.getters['cartStore/getSelectedCurrency']();
            },
        },
        sysURL: {
            get() {
                return this.$store.state.cartStore.moduleSettings.mainEndpoint
            }
        },
        isVisible: {
            get() {
                return (this.layoutSettings.choosePromotionInputPlacement != 'orderSummary' && this.$store.getters['cartStore/isVisible']('promocode')) ? true : false
            }
        },
        cart: {
            get()
            {
                return this.$store.getters['cartStore/getCartSummary']()
            }
        },
        pageType: {
            get()
            {
                return this.$store.getters['cartStore/getPageType']()
            }
        },
        getSPage: {
            get(){
                return this.$store.getters['cartStore/getSPage']();
            }
        },
        isOneStep: {
            get()
            {
                return this.$store.getters['cartStore/isOneStep']()
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
        promoAlert: {
            get()
            {
                let alerts = this.$store.getters['cartStore/getAlert']();
                return alerts && alerts.promo ? alerts.promo : false;
            }
        },
        showNumber:{
            get(){
                return this.$store.getters['cartStore/shouldShowNumber']();
            }
        },
        requestedPromoCode:{
            get(){
                return this.$store.getters['cartStore/getRequestedPromoCode']();
            }
        },
        promoCodeErrorMessage:{
            get(){
                return this.$store.getters['cartStore/getPromoCodeErrorMessage']();
            }
        },
    },
    methods:{
        enablePromocode: function () {
            let self = this;
            this.promoEnabled = true;
        },
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
        decodeHtml(html) {
            const txt = document.createElement("textarea");
            txt.innerHTML = html;
            return txt.value;
        },
        setRequestedPromoCode() {
            if (this.requestedPromoCode) {
                this.$store.dispatch('cartStore/addPromocode', {code: this.requestedPromoCode})
                this.code = this.requestedPromoCode
            }
        }
    }
});
