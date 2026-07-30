/**
 * Cart Component
 */
mgJsComponentHandler.addDefaultComponent('mg-one-page-marketing-email', {
    template: '#t-mg-one-page-marketing-email',
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
            value: null,
            interactiveMode: false,
        }
    },
    watch:{
        isVisible: function(value) {
            if (value === false) {
                return;
            }
            this.initValue(this.$store.getters['cartStore/getMarketingEmailsValue']());
            this.$nextTick(() => {this.interactiveMode = true;})
        },
        value: function(value) {
            if(!this.interactiveMode) {
                return false;
            }
            let marketingEmail = (value == true || value == '1') ? '1' : '';
            this.$store.dispatch('cartStore/updateMarketingEmail', {marketingEmail});
        }
    },
    computed: {
        isChecked:{
            get(){
                return this.value === true;
            }
        },
        showNumber:{
            get(){
                return this.$store.getters['cartStore/shouldShowNumber']();
            }
        },
        isVisible: {
            get () {
                return this.$store.getters['cartStore/isVisible']('cart') &&
                    this.$store.getters['cartStore/getComponentsConfiguration']()['marketingEmailEnabled'] === true &&
                    this.$store.getters['cartStore/getClient']().exist !== true;
            }
        },
        description:{
            get(){
                return this.$store.getters['cartStore/getComponentsConfiguration']()['marketingEmailDescription']
            }
        },
    },
    methods:{
        initValue(value){
            this.value = value;
        }
    }
});
