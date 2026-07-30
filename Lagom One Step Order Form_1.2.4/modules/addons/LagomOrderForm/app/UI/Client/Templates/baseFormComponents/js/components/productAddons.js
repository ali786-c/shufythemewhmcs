mgJsComponentHandler.addDefaultComponent('mg-one-page-product-addons', {
    template: '#t-mg-one-page-product-addons',
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
            formData: {},
            interactive: true,
            visibleAddonsCount: 0,
        }
    },
    watch: {
        isVisible: function (value) {
            this.$nextTick(function () {
                if (this.showNumber == true) {
                    renderSectionIndex();
                }
            });
        },
        stateFormData: {
            handler(formData){
                this.updateComponentFormData(formData);
            },
            deep: true,
        },
        formData: {
            handler(formData){
            },
            deep: true,
        },
    },
    computed: {
        showNumber: {
            get() {
                return this.$store.getters['cartStore/shouldShowNumber']();
            }
        },
        isVisible:{
            get() {
                if(!this.addons || !this.addons.fields){
                    return false;
                }
                
                if(!this.$store.getters['cartStore/isVisible']('configurations') ){
                    return false;
                }

                return true;
            }
        },
        stateFormData: {
            get() {
                return this.$store.getters['cartStore/getProductAddonsFormData']();
            }
        },
        addons:{
            get(){
                return this.$store.getters['cartStore/getProductAddons']();
            }
        },
        isBlockedPage: {
            get() {
                return this.$store.getters['cartStore/getBlockedEvents']()['fullPage'] > 1;
            }
        },
        billingCycle: {
            get () {
                return this.$store.getters['cartStore/getSelectedProductCycle']();
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
    mounted() {
    },
    methods: {
        updateComponentFormData(formData){
            this.interactiveMode    = false;
            this.formData           = formData;
            this.$nextTick(() => {
                this.interactiveMode    = true;
            });
            this.visibleAddonsCount = $('.panel-addon').length
        },
        getFormattedPrice(price) {
            formatPrice.getFormattedPrice(price, this.currency.format)
        },
    }
});