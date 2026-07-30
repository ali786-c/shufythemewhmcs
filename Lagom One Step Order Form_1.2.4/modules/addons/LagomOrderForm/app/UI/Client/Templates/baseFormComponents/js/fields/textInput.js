/**
 * Input field
 * @type {{template: string, props: {field: {required: boolean}, data: {required: boolean}}}}
 */
const textInput = {
    template: '#t-mg-one-page-text-input-field',
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