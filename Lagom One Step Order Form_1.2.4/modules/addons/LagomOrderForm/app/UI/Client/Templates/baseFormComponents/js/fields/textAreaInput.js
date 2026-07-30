const textareaInput = {
    template: '#t-mg-one-page-textarea-input-field',
    computed: {
        visible: {
            get(){
                return this.field.billingCycles[Object.keys(this.field.billingCycles)[0]] !== undefined;
                // return this.field.billingCycles[this.billingCycle] !== undefined;
            }
        },
        details: {
            get(){
                return this.field.billingCycles[Object.keys(this.field.billingCycles)[0]];
                // return this.field.billingCycles[this.billingCycle];
            }
        },
        billingCycle: {
            get() {
                return this.$store.getters['cartStore/getSelectedProductCycle']();
            }
        },
    },
    props: {
        field: {
            type: Object,
            required: true
        },
        data: {
            type: Object,
            required: true
        }
    },
};