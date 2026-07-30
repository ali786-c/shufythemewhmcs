
/**
 * Configurations Component
 */
mgJsComponentHandler.addDefaultComponent('mg-one-page-domain-addons', {
    template: '#t-mg-one-page-domain-addons',
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
            'data':  null,
            supportedRegTypes: ['register', 'transfer'],
        }
    },
    components:{
        domainAddon: domainAddon
    },
    watch:{
        'isVisible': function(value){
            this.$nextTick(function () {
                if(this.showNumber == true){
                    renderSectionIndex();
                }
            });
        },
    },
    computed: {
        isVisible: {
            get () {
                return this.$store.getters['cartStore/isVisible']('domains')
                    && this.$store.getters['cartStore/isDomainSelected']()
                    && this.supportedRegTypes.indexOf(this.selectedRegType) !== -1
                    && this.availableAddons
                    && this.availableAddons.length > 0;
            }
        },
        selectedRegType: {
            get() {
                let regType = this.$store.getters['cartStore/getDomainRegistrationType']();
                return regType ? regType : 'register';
            }
        },
        showNumber:{
            get(){
                return this.$store.getters['cartStore/shouldShowNumber']();
            }
        },
        availableAddons: {
            get(){
                let addons = this.$store.getters['cartStore/getDomainSchemaAddons']();
                return addons ? addons.filter(addon => addon.enabled === true) : null;
            }
        },
        formData:{
            get(){
                return this.$store.getters['cartStore/getDomainAddonsFormData']()
            }
        },
        addons:{
            get(){
                return this.$store.getters['cartStore/getDomainAddonsFormData']()
            }
        },
        isBlockedPage: {
            get() {
                return this.$store.getters['cartStore/getBlockedEvents']()['fullPage'] > 1;
            }
        },
    },
    methods: {
        updateFormData: function(){
            const self = this;
            if(self.isBlockedPage){
                return;
            }
            return this.$store.dispatch('cartStore/updateDomainAddons', this.formData)
        }
    }
});