mgJsComponentHandler.addDefaultComponent('mg-one-page-product-custom-fields', {
    template: '#t-mg-one-page-product-custom-fields',
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
            interactiveMode: false,
            formData: {},
        }
    },
    watch: {
        isVisible: function(value){
            this.$nextTick(function () {
                if(this.showNumber == true){
                    renderSectionIndex();
                }
            });
        },
        formData: {
            handler(formData){
                if(!(this.interactiveMode === true)){
                    return;
                }
                this.updateCustomFields(formData);
            },
            deep: true,
        },
        stateFormData: {
            handler(formData){
                this.updateComponentFormData(formData);
            },
            deep: true,
        },
    },
    computed: {
        isVisible: {
            get() {
                return this.$store.getters['cartStore/isVisible']('configurations') &&
                    this.customFields !== undefined &&
                    this.customFields.fields &&
                    this.customFields.fields.length > 0;
            }
        },
        customFields: {
            get() {
                return this.$store.getters['cartStore/getProductCustomFields']();
            }
        },
        showNumber: {
            get() {
                return this.$store.getters['cartStore/shouldShowNumber']();
            }
        },
        isBlockedPage: {
            get() {
                return this.$store.getters['cartStore/getBlockedEvents']()['fullPage'] > 1;
            }
        },
        billingCycle: {
            get() {
                return this.$store.getters['cartStore/getSelectedProductCycle']();
            }
        },
        stateFormData: {
            get() {
                return this.$store.getters['cartStore/getCustomFieldsFormData']();
            }
        },
    },
    methods: {
        updateComponentFormData(formData){
            this.interactiveMode    = false;
            this.formData           = formData;
            this.$nextTick(() => {
                this.interactiveMode    = true;
            });
        },
        updateCustomFields(formData){
            this.$store.dispatch('cartStore/updateCustomFields', {customFields: formData});
        }
    }
});