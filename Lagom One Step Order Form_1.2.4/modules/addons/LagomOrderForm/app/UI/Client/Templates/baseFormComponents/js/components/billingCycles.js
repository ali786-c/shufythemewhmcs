mgJsComponentHandler.addDefaultComponent('mg-one-page-billing-cycles', {
    template: '#t-mg-one-page-billing-cycles',
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
        vForm: vForm,
    },
    data: function () {
        return {
            showLoaderOnCycle: null,
            selectedBillingCycle: null,
            isPageLoading: false,
            chosenItem: 0,
        }
    },
    watch: {
        isVisible: function(value){
            this.$nextTick(function () {
                if(this.showNumber == true || this.$store.state.cartStore.pageType === 'bottom' && this.$store.state.cartStore.formType === 'twoSteps'){
                    renderSectionIndex();
                }
            });
        },
    },
    beforeUpdate: function() {
        // this.selectedBillingCycle = this.$store.getters['cartStore/getSelectedProductCycle']()
    },
    updated: function() {
        if(!this.isPageLoading) {
            this.isPageLoading = true
            this.selectedBillingCycle = this.productCycle
        } else {
            this.selectedBillingCycle =  this.$store.getters['cartStore/getSelectedProductCycle']();
        }
    },
    mounted: function() {
        this.selectedBillingCycle = this.$store.getters['cartStore/getSelectedProductCycle']();
    },
    computed: {
        isVisible: {
            get() {
                this.showLoaderOnCycle = null;
                return this.$store.getters['cartStore/isVisible']('configurations') && this.isShowBillingCycleComponent() && this.isRecurringProduct === true;
            }
        },
        showNumber: {
            get() {
                return this.$store.getters['cartStore/shouldShowNumber']();
            }
        },
        billingCycles: {
            get () {
                return this.$store.getters['cartStore/getBillingCycles']();
            }
        },
        isDiscountCenterOn: {
            get() {
                return this.$store.getters['cartStore/getLayoutSettings']().isDiscountCenterOn
            }
        },
        cart: {
            get () {
                return this.$store.getters['cartStore/getCartSummary']()
            }
        },
        spinner: {
            get() {
                return this.$store.getters['cartStore/getSpinners']()['cart'];
            }
        },
        orderSettings: {
            get(){
                return this.$store.getters['cartStore/getWhmcsOrderSettings']();
            }
        },
        isBillingCycleLoading: {
            get(){
                if(this.spinner){
                    return false;
                }
            },
        },
        isRecurringProduct:{
            get(){
                return this.cart !== undefined &&
                    this.cart.products !== undefined &&
                    this.cart.products[0] !== undefined &&
                    this.cart.products[0].billingcycle !== 'free' &&
                    this.cart.products[0].billingcycle !== 'onetime';
            }
        },
        isBlockedPage:{
            get(){
                return this.$store.getters['cartStore/getBlockedEvents']()['fullPage'] > 1;
            }
        },
        productCycle:{
            get(){
                setTimeout(() => {
                    return this.$store.getters['cartStore/getSelectedProductCycle']()
                } , 1)
            }
        },
        currency: {
            get() {
                return this.$store.getters['cartStore/getSelectedCurrency']();
            },
        },
        layoutSettings: {
            get() {
                return this.$store.getters['cartStore/getLayoutSettings']();
            }
        },
        isOneStep:{
            get(){
                return this.$store.getters['cartStore/isOneStep']();
            }
        },
    },
    methods: {
        setBillingCycle: function(cycle) {
            if(this.isBlockedPage){
                return;
            }
            if(cycle == this.selectedBillingCycle) {
                return
            }
            let that = this;
            this.chosenItem = cycle
            this.showLoaderOnCycle = cycle
            this.$store.dispatch('cartStore/changeBillingCycle', cycle)
                .then(response => {
                    that.selectedBillingCycle = cycle;
                })
        },
        isShowBillingCycleComponent: function()
        {
            if(this.billingCycles === undefined)
            {
                return false;
            }
            return Object.keys(this.billingCycles).length > 1;
        },
        getBillingCyclesWithDiscountCenterPrices: function ()
        {
            let cycles = this.$store.getters['cartStore/getBillingCycles']()
            if (!cycles.discountPricing) {
                delete cycles.discountPricing
                return cycles;
            }
            return cycles.discountPricing;
        },
        getTranslatedMessage(cycle) {
            return mgPageLang.sprintf(mgPageLang.translate(['cycle'], {'cycle': cycle}), cycle)
        },
        getClass() {
                this.isBillingCycleActive()
                const className = this.showNumber ? `col-md-6 col-lg-${this.layoutSettings.billingCycleColumnQuantity} ` +  (Object.keys(this.billingCycles).length == 3 ? `col-xl-4` : ``) : (`col-md-6 col-lg-${this.layoutSettings.billingCycleColumnQuantity} ` + (Object.keys(this.billingCycles).length == 3 ? `col-xl-4` : ``));
                return !isNaN(parseInt(this.layoutSettings.billingCycleColumnQuantity)) ? className : `col-sm-6 col-md-4`
        },
        getFormattedPrice(price) {
            return formatPrice.getFormattedPrice(price, this.currency.format)
        },
        isBillingCycleActive() {
            const boxes = document.querySelectorAll('.panel-billingcycle.checked')
            return boxes.length
        },
        getCurrencySuffixIfSet() {
            return (this.layoutSettings.displayPriceSuffix ? (' ' + this.currency.suffix) : '');
        },
        isLoading(cycle) {
            return (this.showLoaderOnCycle === cycle) && !((this.chosenItem !== 0 && this.selectedBillingCycle === cycle) || (this.chosenItem === 0 && this.selectedBillingCycle === cycle))
        },
        isSelected(cycle) {
           return ((this.chosenItem !== 0 && this.selectedBillingCycle === cycle) || (this.chosenItem === 0 && this.selectedBillingCycle === cycle)) || this.chosenItem === 0 && !this.isBillingCycleActive() && cycle === Object.values(this.billingCycles)[0].id
        },
    }

});