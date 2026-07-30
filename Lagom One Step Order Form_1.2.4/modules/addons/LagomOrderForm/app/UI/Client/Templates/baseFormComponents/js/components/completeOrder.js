mgJsComponentHandler.addDefaultComponent('mg-one-page-complete-order', {
    template: '#t-mg-one-page-complete-order',
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
    components: {
    },
    data: function () {
        return {};
    },
    computed: {
        isVisible:{
            get(){
                return this.$store.getters['cartStore/isVisible']('complete');
            }
        },
        redirectionType:{
            get(){
                return this.$store.getters['cartStore/getCompleteOrderDetails']()['redirectionType'];
            }
        },
        status:{
            get(){
                return this.$store.getters['cartStore/getCompleteOrderDetails']()['status'];
            }
        },
        orderId: {
            get() {
                return this.$store.getters['cartStore/getCompleteOrderDetails']()['number'];
            }
        },
        invoiceId: {
            get() {
                return this.$store.getters['cartStore/getCompleteOrderDetails']()['invoiceId'];
            }
        },
        redirectButton:{
            get(){
                return this.$store.getters['cartStore/getCompleteOrderDetails']()['redirectButton'];
            }
        },
        isBlockedPage: {
            get() {
                return this.$store.getters['cartStore/getBlockedEvents']()['fullPage'] > 1;
            }
        },
    },
    watch: {
        redirectButton: function(value){

            if(value === false){
                return;
            }

            if(this.redirectionType === 'gateway'){
                setTimeout("autoSubmitFormByContainer('frmPayment')", 5000);
            }

        }
    },
});