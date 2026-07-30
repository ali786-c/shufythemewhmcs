/**
 * Captcha Component
 */
mgJsComponentHandler.addDefaultComponent('mg-one-page-alert', {
    template: '#t-mg-one-page-alert',
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
    watch: {
        message: function(val){
            if(!val|| val === null){
                return;
            }
            this.$nextTick(() => {
                let element = document.getElementById('pageOrderAlert');
                if (element !== null && element !== undefined) {
                    element.scrollIntoView();
                }
            })
        },
    },
    computed: {
        isVisible: {
            get() {
                return this.message && this.$store.getters['cartStore/isVisible']('alert') && this.message !== null;
            }
        },
        orderDetails:{
            get(){
                return this.$store.getters['cartStore/getCompleteOrderDetails']();
            }
        },
        message:{
            get(){
                return this.orderDetails.message;
            }
        }
    },
    created() {
    },
    methods: {
        decodeHtml(html) {
            const txt = document.createElement("textarea");
            txt.innerHTML = html;
            return txt.value;
        },
    },
});
