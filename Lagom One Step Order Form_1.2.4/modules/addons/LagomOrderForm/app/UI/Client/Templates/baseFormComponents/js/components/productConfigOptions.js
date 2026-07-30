mgJsComponentHandler.addDefaultComponent('mg-one-page-product-conf-opt', {
    template: '#t-mg-one-page-product-conf-opt',
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
                if(!this.interactiveMode){
                    return;
                }
                this.updateConfigOptions(formData);
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
        billingCycle: {
            get() {
                return this.$store.getters['cartStore/getSelectedProductCycle']();
            }
        },
        isVisible: {
            get() {
                return this.$store.getters['cartStore/isVisible']('configurations') && this.configurableOptions !== undefined && this.configurableOptions.fields;
            }
        },
        configurableOptions: {
            get(){
                let configOptions = this.$store.getters['cartStore/getProductConfigurableOptions']();
                let groupIndex = null;
                if(configOptions.fields) {
                    configOptions.fields.map((singleField, singleFieldIndex) => {
                        if(singleField.groupSection.config_group_id != groupIndex) {
                            groupIndex = singleField.groupSection.config_group_id
                            singleField.isFirstInGroup = true
                        }
                        else {
                            singleField.isFirstInGroup = false
                        }
                    })
                }
                return configOptions
            }
        },
        showNumber: {
            get() {
                return this.$store.getters['cartStore/shouldShowNumber']();
            }
        },
        stateFormData: {
            get() {
                return this.$store.getters['cartStore/getConfigurableOptionsFormData']();
            }
        },
        isBlockedPage: {
            get() {
                return this.$store.getters['cartStore/getBlockedEvents']()['fullPage'] > 1;
            }
        },
        groupSettings: {
            get() {
                return this.$store.getters['cartStore/getGroupSection']();
            }
        }
    },
    methods: {
        updateComponentFormData(formData){
            this.interactiveMode    = false;
            this.formData           = formData;
            this.$nextTick(() => {
                this.interactiveMode    = true;
            });
        },
        updateConfigOptions(data){
            this.$store.dispatch('cartStore/updateConfigurableOptions', {configOptions: data});
        }
    }
});