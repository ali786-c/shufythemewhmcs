const stantaloneProductAddon = {
    template: '#t-mg-one-page-standalone-addon-field',
    props: {
        field: {
            type: Object,
            required: true
        },
        data: {
            required: true
        },

    },
    data: function () {
        return {
            selected: false,
            loader: false,
        }
    },
    watch: {
        billingCycle: {
            handler(val) {
                if (this.visible === false) {
                    this.removeAddon();
                }
            },
        },
        selectedAddons: {
            handler(val) {
                if( !val )
                {
                    this.selected = false;
                    return;
                }
                this.selected = (val.filter(addon => addon['addonid'] == this.field.id).length == 0) ? false : true;
            },
            deep: true,
        },
    },
    created(){
        this.selected = !(this.data.length == 0 && this.data.filter(addon => addon['addonid'] == this.field.id).length == 0);
    },
    computed: {
        productId:{
            get(){
                return this.$store.getters['cartStore/getSelectedProductId']();
            }
        },
        billingCycle: {
            get() {
                return this.$store.getters['cartStore/getSelectedProductCycle']();
            }
        },
        visible: {
            get() {
                return  this.field.billingCycles || this.isFree;
            }
        },
        isFree:{
            get(){
                return  this.field.billingcycle === 'free';
            }
        },
        selectedAddons:{
            get(){
                return this.data;
            },
            deep: true
        },
        isBlockedPage: {
            get() {
                return this.$store.getters['cartStore/getBlockedEvents']()['fullPage'] > 1;
            }
        },
        pricing:{
            get(){
                if(this.field.billingCycles[this.billingCycle] != undefined) {
                    return this.field.billingCycles[this.billingCycle];
                }
                return Object.values(this.field.billingCycles)[0];
            }
        },
        layoutSettings: {
            get() {
                return this.$store.getters['cartStore/getLayoutSettings']();
            }
        },
        currency: {
            get() {
                return this.$store.getters['cartStore/getSelectedCurrency']();
            },
        },
        isDiscountCenterOn: {
            get() {
                return this.$store.getters['cartStore/getLayoutSettings']().isDiscountCenterOn;
            }
        },
    },
    methods: {
        addAddon: function () {
            if(this.isBlockedPage) {
                return;
            }
            this.loader = true;
            this.$store.dispatch('cartStore/addProductAddon', {id: this.field.id })
                .then(response => { this.loader = false; });
        },
        removeAddon: function () {
            if(this.isBlockedPage) {
                return;
            }
            this.loader = true;
            this.$store.dispatch('cartStore/deleteProductAddon', {id: this.field.id})
                .then(response => { this.loader = false; });
        },
        getFormattedPrice(price) {
            return formatPrice.getFormattedPrice(price, this.currency.format)
        },
        getAddonRegularPrice() {
            if (!this.field.pricings || !this.field.pricings[this.currency.id]) return
            return this.field.pricings[this.currency.id][this.billingCycle] &&  this.field.pricings[this.currency.id].hasOwnProperty(this.billingCycle)
                ? this.field.pricings[this.currency.id][this.billingCycle].price : this.field.pricings[this.currency.id][Object.keys(this.field.pricings[this.currency.id])[0]].price
        },
        getAddonDiscountPrice() {
            return this.field.billingCycles[this.billingCycle] ? this.field.billingCycles[this.billingCycle].discountPrice : false
        },
        getAddonRegularSetupFee() {
            if (this.billingCycle) {
                return this.currency.prefix + this.getFormattedPrice(this.getAddonRawSetupFee()) + (this.layoutSettings.displayPriceSuffix ? (' ' + this.currency.suffix) : '')
            }
        },
        getAddonDiscountSetupFee() {
            return this.field.billingCycles[this.billingCycle] ? this.field.billingCycles[this.billingCycle].discountSetupFee : false
        },
        getAddonRawDiscountSetupFee() {
            return this.field.billingCycles[this.billingCycle] ? this.field.billingCycles[this.billingCycle].rawDiscountSetupFee : false
        },
        getAddonRawSetupFee() {
            if (!this.field.pricings || !this.field.pricings[this.currency.id]) return
            if (this.billingCycle) {
                return this.field.pricings[this.currency.id][this.billingCycle] ? this.field.pricings[this.currency.id][this.billingCycle].rawSetupFee
                    : this.field.pricings[this.currency.id][Object.keys(this.field.pricings[this.currency.id])[0]].rawSetupFee
            }
        },
        getAddonShortBillingCycle() {
            if (!this.field.pricings || !this.field.pricings[this.currency.id]) return
            return this.field.pricings[this.currency.id][this.billingCycle] && this.field.pricings[this.currency.id].hasOwnProperty(this.billingCycle)
                ? this.field.pricings[this.currency.id][this.billingCycle].shortlyCycleSlashed : this.field.pricings[this.currency.id][Object.keys(this.field.pricings[this.currency.id])[0]].shortlyCycleSlashed
        },
        getAddonFinalSetupFee() {
            const discountSetupFee = this.getAddonDiscountSetupFee()
            return discountSetupFee ? discountSetupFee : this.getAddonRegularSetupFee()
        },
        getAddonFinalPrice() {
            const discountPrice = this.getAddonDiscountPrice()
            return discountPrice ? discountPrice : this.getAddonRegularPrice()
        },
    },
};