mgJsComponentHandler.addDefaultComponent('mg-one-page-global-error', {
    template: '#t-mg-one-page-global-error',
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
    data: function () {
        return {
        }
    },
    computed: {
        isVisible: {
            get() {
                return this.$store.getters['cartStore/isVisible']('globalError');
            }
        },
        error:{
            get(){
                return this.$store.getters['cartStore/getApiError']();
            }
        }
    },
    methods: {}
});