const checkboxInput = {
    template: '#t-mg-one-page-checkbox-input-field',
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
    computed: {
        visible: {
            get(){
                return this.field.billingCycles[Object.keys(this.field.billingCycles)[0]] !== undefined;
                // return this.field.billingCycles[this.billingCycle] !== undefined;
            }
        },
        product: {
            get() {
                return this.$store.getters['cartStore/getSelectedProductDetails']();
            }
        },
        details: {
            get(){
                const details = this.field.billingCycles[Object.keys(this.field.billingCycles)[0]]
                if (this.oldProduct.id !== this.product.id) {
                    this.value = false
                    this.oldProduct = this.product
                }
                return details;
                // return this.field.billingCycles[this.billingCycle];
            }
        },
        billingCycle: {
            get() {
                return this.$store.getters['cartStore/getSelectedProductCycle']();
            }
        },
        currency: {
            get(){
                return this.$store.getters['cartStore/getSelectedCurrency']();
            }
        },
        option:{
            get(){
                return this.details.options !== undefined ? this.details.options[0] : undefined;
            }
        },
        fieldId:{
            get(){
                return 'mg-page-order-config-opt-' + this.field.id;
            }
        },
        showNumber:{
            get(){
                return this.$store.getters['cartStore/shouldShowNumber']();
            }
        },
        layoutSettings: {
            get() {
                return this.$store.getters['cartStore/getLayoutSettings']();
            }
        },
        groupSettings: {
            get() {
                return this.$store.getters['cartStore/getGroupSection']();
            }
        }
    },
    data: function(){
        return{
            value: null,
            interactive: false,
            oldProduct: false,
        }
    },
    watch:{
        value:function(val){
            if(!this.interactive){
                return;
            }
            val = (val === true || val === 'on') ? '1' : '';
            this.data[this.field.id] = val;
        }
    },
    mounted(){
        if(this.data[this.field.id] == 'yes') {
            this.data[this.field.id] = '1'
            this.field.value = 1
        }
        else {
            this.data[this.field.id] = ''
            this.field.value = 0
        }
        if(!this.data[this.field.id]) {
            this.data[this.field.id] = this.field.value
        }
        // this.value = (this.data.value === true || this.data.value === 'on' || this.data.value === '1' || this.data[this.field.id] == 1) ? true : false;
        //this.renderOptions();
        this.$nextTick(() => {
            this.value = (this.data.value === true || this.data.value === 'on' || this.data.value === '1' || this.data[this.field.id] == 1) ? true : false;
            this.interactive = true;

        })
    },
    methods:{
        renderOptions: function(){
        },
        getFormattedPrice(price) {
           return formatPrice.getFormattedPrice(price, this.currency.format)
        },
        getNameRows(name) {
            const separator = ','
            return name.includes(separator) ? name.split(separator) : name
        },
    }
};