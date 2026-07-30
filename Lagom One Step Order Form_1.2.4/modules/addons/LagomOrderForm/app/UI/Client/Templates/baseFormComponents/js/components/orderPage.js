var  pageOrderStore = {};
mgJsComponentHandler.addDefaultComponent('mg-one-page-order', {
    template: '#t-mg-one-page-order',
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
        init_details:{
        },
    },
    data: function () {
        return {
        }
    },
    created() {
        const settings = JSON.parse(this.init_details);
        cartStore.modules.route = eval(settings.routeType);
        
        pageOrderStore = this.$store;
        pageOrderStore.registerModule('cartStore', cartStore);
        pageOrderStore.dispatch('cartStore/init', this.getSettings(settings));
    },
    computed:{
        isBlockedPage: {
            get() {
                return this.$store.getters['cartStore/getBlockedEvents']()['fullPage'] > 1;
            }
        },
    },
    methods: {
        getMainEndpoint: function() {
            // return window.location.href.split("index.php")[0]
        },
        getSettings: function (iniParams) {
            return {
                settings: {
                    requestParams: {
                        loadData: this.component_id,
                        namespace: this.component_namespace,
                        index: this.component_index
                    },
                    moduleSettings: {
                        apiEndpoint: iniParams['mainEndpoint'] + iniParams['apiUrl'],
                        mainEndpoint: iniParams['mainEndpoint']
                    },
                    sPage: iniParams['sPage'],
                    baseUrl: iniParams['pageUri'],
                    pageType: iniParams['pageType'],
                    formType: iniParams['formType'],
                    componentsConfiguration: iniParams['componentsConfiguration'],
                    orderDetails: iniParams['orderDetails'],
                }
            };
        }
    },
});