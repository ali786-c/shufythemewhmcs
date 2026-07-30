const passwordInput = {
    template: '#t-mg-one-page-password-input-field',
    computed: {
        visible: {
            get(){
                return this.field.billingCycles[this.billingCycle] !== undefined;
            }

        },
        details: {
            get(){
                return this.field.billingCycles[this.billingCycle];
            }
        },
        billingCycle: {
            get() {
                return this.$store.getters['cartStore/getSelectedConfigurationFields']('formData')['billingCycle']['billingcycle']['value']
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