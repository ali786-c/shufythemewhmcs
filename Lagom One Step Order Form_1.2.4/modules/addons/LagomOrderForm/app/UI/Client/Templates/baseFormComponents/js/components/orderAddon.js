mgJsComponentHandler.addDefaultComponent('mg-one-page-order-addon', {
    template: '#t-mg-one-page-order-addon',
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
            'data': null,
            availableAddons: [],
            addonToModal: null,
            selectedProduct: null,
            selectedCycle: null,
            // selectedAddon: null,
            searchedWord: null,
            isSectionVisible: null,
        }
    },

    computed: {
        showNumber:{
            get(){
                return this.$store.getters['cartStore/shouldShowNumber']();
            }
        },
        isVisible: {
            get () {
                if (this.$store.getters['cartStore/isVisible']('addons')) {
                    this.isSectionVisible = true;
                    return true;
                }
                this.isSectionVisible = false;
                return false
            }
        },
        addons:{
            get(){
                let addons = this.$store.getters['cartStore/getGroupProducts']()
                return this.isVisible ? addons : [];
            }
        },
        currency:{
            get(){
                return this.$store.getters['cartStore/getSelectedCurrencyId']()
            }
        },
        selectedCurrency: {
            get()  {
                    return this.$store.getters['cartStore/getSelectedCurrency']();
                },
            },
        isBlockedPage: {
            get() {
                return this.$store.getters['cartStore/getBlockedEvents']()['fullPage'] > 1;
            }
        },
        selectedAddons: {
            get() {
                return this.$store.getters['cartStore/getSelectedAddons']()
            }
        },
        isDiscountCenterOn: {
            get() {
                return this.$store.getters['cartStore/getLayoutSettings']().isDiscountCenterOn
            }
        },
        layoutSettings: {
            get() {
                return this.$store.getters['cartStore/getLayoutSettings']();
            }
        },
    },
    watch:{
        isVisible: function(value){
            this.$nextTick(function () {
                if(this.showNumber == true){
                    renderSectionIndex();
                }
            });
        },
        addons: function()
        {
            this.updateAddonArray();
        },
        searchedWord: function()
        {
            this.updateAddonArray();
        },
        availableAddons: function() {
           this.$store.commit('cartStore/setAvailableAddons', {data: this.availableAddons.length, isSectionVisible: this.isSectionVisible})
        }
    },
    methods: {
        addAddon: function () {
            let self = this;
            if(self.isBlockedPage){
                return;
            }
            if(self.selectedProduct === null){
                return;
            }
            $('#orderAddonModal').modal('hide');
            this.$store.dispatch('cartStore/orderAddon', {addonId: this.addonToModal.id, productId: this.selectedProduct, cycle: this.selectedCycle})
                .then(()=>{
                self.selectedProduct = null;
            });
        },
        openModalAddon: function(addon){
            this.addonToModal = addon;
            this.selectedProduct = addon.hostings[0].hostingId
            //select first cycle
            if (addon.paytype !== 'free') {
                this.selectedCycle = addon.pricings[this.currency][Object.keys(addon.pricings[this.currency])[0]].id
            }

        },
        updateAddonArray: function(){

            let self = this;
            self.availableAddons = [];

            self.addons.forEach(function(addon, index){
                if(self.searchedWord !== null && addon.name.toLowerCase().indexOf(self.searchedWord.toLowerCase()) === -1){
                    return;
                }
                self.availableAddons.push(addon);
            });

        },
        closeModalAddon: function(){
            $('#orderAddonModal').modal('hide');
            this.addonToModal = null;
            this.selectedProduct = null;

        },
        hasSelectedAddon: function(id){
            return !!this.selectedAddons.find(addon => addon.id == id);
        },
        isAddonAvailable: function(addon){
            return addon.paytype === 'free' || (addon.pricings && addon.pricings[this.currency])
        },
        removeAddon: function (id) {
            this.$store.dispatch('cartStore/deleteAddon', {id: id})
        },
        getFormattedPrice(price) {
            return formatPrice.getFormattedPrice(price, this.selectedCurrency.format)
        },
        getAddonRegularPrice(addon)
        {
            return addon.pricings[this.currency][this.getAddonCycle(addon)].price
        },
        getAddonShortPeriod(addon)
        {
            return addon.pricings[this.currency][this.getAddonCycle(addon)].shortlyCycleSlashed
        },
        getAddonDiscountPrice(addon)
        {
            return addon.pricings[this.currency][this.getAddonCycle(addon)].discountPrice
        },
        getAddonRawSetupFee(addon)
        {
            return addon.pricings[this.currency][this.getAddonCycle(addon)].rawSetupFee
        },
        getAddonRegularSetupFee(addon)
        {
            return addon.pricings[this.currency][this.getAddonCycle(addon)].setupFee
        },
        getAddonDiscountSetupFee(addon)
        {
            return addon.pricings[this.currency][this.getAddonCycle(addon)].discountSetupFee
        },
        getAddonFinalPrice(addon)
        {
            const discountPrice = this.getAddonDiscountPrice(addon)
            return discountPrice ?  discountPrice + this.getAddonShortPeriod(addon) : this.getAddonRegularPrice(addon) + this.getAddonShortPeriod(addon)
        },
        getAddonFinalSetupFee(addon)
        {
            const discountSetupFee = this.getAddonDiscountSetupFee(addon)
            return discountSetupFee ?  discountSetupFee  : this.getAddonRegularSetupFee(addon)
        },
        getModalAddonPrice(pricing)
        {
            return pricing.discountPrice ? pricing.discountPrice : pricing.price
        },
        getAddonCycle(addon)
        {
            let cycle = Object.keys(addon.pricings[this.currency])[0]
            if (this.addonToModal && this.addonToModal.id === addon.id && this.selectedCycle){
                cycle = this.selectedCycle
            }
            return cycle
        }
    }

});
