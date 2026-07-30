mgJsComponentHandler.addDefaultComponent('mg-one-page-currency', {
    template: '#t-mg-one-page-currency',
    data: function () {
        return {
            currency: null,
            popoverIsVisible: false,
            popoverIsRequired: true,
            popoverNotShowAgain: false,
            currencyToPopover: null,
        }
    },
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
    computed: {
        isVisible: {
            get () {
                return this.$store.getters['cartStore/isVisible']('currency') &&
                    this.$store.getters['cartStore/getClient']().exists !== true &&
                    Object.keys(this.currencies).length > 0
                    && this.layoutSettings.hideCurrencySelector !== 'hide'
                    && !(Object.keys(this.currencies).length === 1 && this.layoutSettings.hideCurrencySelector === 'on');
            }
        },
        currencies:{
            get(){
                return this.$store.getters['cartStore/getCurrencies']() ;
            }
        },
        layoutSettings: {
            get(){
                return this.$store.getters['cartStore/getLayoutSettings']();
            }
        },
        selectedCurrency:{
            get(){
                return this.$store.getters['cartStore/getSelectedCurrency']()
            }
        },
        isBlockedPage: {
            get() {
                return this.$store.getters['cartStore/getBlockedEvents']()['fullPage'] > 1;
            }
        },
    },
    methods:{
        changeCurrency: function(currency, showPopover){
            if(this.isBlockedPage){
                return;
            }
            if(showPopover === true && this.popoverNotShowAgain === false)
            {
                this.currencyToPopover = currency;
                this.showPopover();
            }else{
                this.currencyToPopover = null;
                this.hidePopover();
                this.$store.dispatch('cartStore/changeCurrency', {currency});
            }
        },
        showPopover()
        {
            this.popoverIsVisible = true;
        },
        hidePopover()
        {
            this.popoverIsVisible = false;
        }
    }
});
