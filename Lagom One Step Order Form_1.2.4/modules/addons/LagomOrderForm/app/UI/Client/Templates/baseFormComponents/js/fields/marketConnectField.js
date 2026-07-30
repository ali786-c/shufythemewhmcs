const marketConnect = {
    template: '#t-mg-one-page-market-connect-field',
    props: {
        field: {
            type: Object,
            required: true},
        data: {
            required: true
        },
    },
    data: function () {
        return {
            selected: false,
            addedId: null,
            selectedOption: null,
            loader: false,
        }
    },
    updated() {
        setTimeout(() => {
            if (this.selectedOption) {
                this.activeOptions.forEach(opt => {
                   if (opt.id === this.selectedOption.id) {
                       this.selectedOption = opt
                   }
                } )
            }
        },1000)
    },
    watch: {
        billingCycle: {
            handler(val) {
                if(this.activeOptions.filter(addon => addon['id'] === this.addedId).length === 0){
                    this.removeAddon();
                }
            },
        },
        selectedAddons:{
            handler(val) {
                //TODO: Usunąc przed relkiem
                // alert('Jak komuś wywaliło to piszcie do jakub.po@modulesgarden.com')
                if(val.filter(addon => addon['addonid'] == this.addedId).length == 0) {
                    this.selected = false;
                }else{
                    this.selected = true;
                }
            },
            deep: true
        },
        currency() {
            if (this.selectedOption) {
                this.activeOptions.forEach(opt => {
                    if (opt.id === this.selectedOption.id) {
                        this.selectedOption = opt
                    }
                } )
            }
        }
    },
    computed: {
        activeOptions:{
            get(){
                const self = this;

                return this.field.options.filter(option => {

                    let optionPackages = option.packages;
                    if (typeof optionPackages == 'object') {
                        optionPackages = Object.values(optionPackages);
                    }
                    return option.pricing.billingCycles[Object.keys(option.pricing.billingCycles)[0]] !== undefined
                        && Object.values(option.pricing.billingCycles).filter(item => item.rawPrice !== -1).length
                        && optionPackages.findIndex(id => id == self.productId) !== -1 || option.billingcycle === 'free';
                });
            }
        },
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
        svgRaw: {
            get() {
                return this.field.svgRaw;
            }
        },
        icon: {
            get() {
                return this.field.path + this.field.icon + '.' + this.field.extension;
            }
        },
        visible: {
            get() {
                return this.activeOptions.length > 0;
                // return this.field.billingCycles[this.billingCycle] != undefined;
            }
        },
        selectedAddons:{
            get(){
                return [];
                //return this.$store.getters['cartStore/getSelectedConfigurationFields']('formData')['addons']['addons'];
            }
        },
        showNumber:{
            get(){
                return this.$store.getters['cartStore/shouldShowNumber']();
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
    },
    components: {
    },
    created(){
        let self = this;
        this.renderOptions();
        this.initOptions()
    },
    methods: {
        addAddon: function (option) {
            if(this.isBlockedPage){
                return;
            }
            let self = this;
            self.loader = true;
            self.removeAddon().then(() => {
                self.$store.dispatch('cartStore/addProductAddon', {id: option.id}).then(response => {
                    self.loader = false;
                    self.selected = true;
                    self.data.push(option.id);
                    self.addedId = option.id;
                    self.selectedOption = option;
                    self.renderOptions();
                });
            });
        },
        initOptions() {
            if(this.data) {
                this.data.map(singleAddon => {
                    let selectedAddon = this.activeOptions.find(option => option.id == singleAddon.addonid)
                    if(selectedAddon) {
                        this.loader = false
                        this.selected = true
                        this.addedId = selectedAddon.id
                        this.selectedOption = selectedAddon
                        this.renderOptions();
                    }
                })
            }
        },
        changeAddon: function (option) {

            if(this.isBlockedPage){
                return;
            }
            let self = this;
            self.loader = true;
            self.$store.dispatch('cartStore/changeProductAddon', {id: option.id, current_id: self.addedId})
                .then(response => {
                    self.loader             = false;
                    self.selected           = true;
                    self.data.push(option.id);
                    self.addedId            = option.id;
                    self.selectedOption      = option;
                    self.renderOptions();
                });
        },
        removeAddon: async function () {
            if(this.isBlockedPage){
                return;
            }
            let self = this;
            self.selected = false;
            if (self.addedId == null) {
                return;
            }
            var index = self.data.indexOf(self.addedId);

            if (index !== -1) {
                self.selected = false;
                self.data.splice(index, 1)
            }
            self.nameLabel = null;
            self.renderOptions();
            self.$store.dispatch('cartStore/deleteProductAddon', {id: self.addedId}).then(response => {
                // self.loader = false;
            });
        },
        addAddonById: function(id) {

            if(id == -1){
                this.removeAddon();
                return;
            }

            let addon = this.activeOptions.filter(addon => addon.id == id);

            if(addon[0] == undefined) {
                return;
            }

            if(this.selected)
            {
                this.changeAddon(addon[0]);
            }else{
                this.addAddon(addon[0]);
            }


        },
        renderOptions: function(){
            var self = this;

            this.$nextTick(function () {
                /** render add event in payments section  */
                renderCheckBox(
                    self.field.id,
                    function(val){

                        if(val !== 'true')
                        {
                            self.addAddonById(val);
                        }

                    },
                    function(val){});
            });
        },
        getOptionPriceWithCycle: function(option){
            let selectedOption = option.pricing.billingCycles[this.billingCycle];
            if (typeof selectedOption == 'undefined' || selectedOption.rawPrice === -1) {
                Object.values(option.pricing.billingCycles).forEach(item => {
                    if (item.rawPrice !== -1) {
                        selectedOption = item
                    }
                })
            }
            return selectedOption ?  selectedOption.price
                +  '/' + selectedOption.shortbillingcyclefriendlylower : this.currency.prefix
                + formatPrice.getFormattedPrice(0, this.currency.format)
                + (this.layoutSettings.displayPriceSuffix ? (' ' + this.currency.suffix) : '');
        },
        getOptionPrice: function(option){
            return option.pricing.billingCycles[Object.keys(option.pricing.billingCycles)[0]].price
        },
    },
};
