/**
 * Ip Log Component
 */
 mgJsComponentHandler.addDefaultComponent('mg-one-page-ip-log', {
    template: '#t-mg-one-page-ip-log',
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
        }
    },
    watch:{

    },
    computed: {
        isVisible: {
            get(){
                return this.layoutSettings.hideIpAddressBox !== true;
            }
        },
        ipAddress: {
            get(){
                return this.$store.getters['cartStore/getIpAddress']();
            }
        },
        showNumber:{
            get(){
                return this.$store.getters['cartStore/shouldShowNumber']();
            }
        },
        layoutSettings:{
            get(){
                return this.$store.getters['cartStore/getLayoutSettings']();
            }
        },
    },
});
