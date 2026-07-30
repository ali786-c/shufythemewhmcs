/**
 * Cart Component
 */
mgJsComponentHandler.addDefaultComponent('mg-one-page-order-fields', {
    template: '#t-mg-one-page-order-fields',
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
            value: '',
            data: {},
            interactive: true,
        }
    },
    created() {
        let self = this;
        mgEventHandler.on('PreCompleteOrder', null, function (id, params) {
            Object.keys(self.data).forEach(function(key) {
                self.requireValidator(self.data[key]);
                self.$forceUpdate();
            })
        });
    },
    watch:{
        isVisible: function(value) {
            this.$nextTick(function () {
                if(this.showNumber == true){
                    renderSectionIndex();
                }
            });
        },
        orderFields: function(value) {
            if(this.orderFields.length) {
                this.orderFields.map(singleField => {
                    if(!this.data[singleField.id]) {
                        this.data[singleField.id] = singleField
                        if(this.data[singleField.id].type == 'dropdown') {
                            //select first option from dropdown
                            this.data[singleField.id].value = this.data[singleField.id].extra[0]
                        }
                        else if(this.data[singleField.id].type == 'inputText') {
                            this.data[singleField.id].value = ''
                        }
                        else {
                            this.data[singleField.id].value = null
                        }
                    }
                })
            }
        }
    },
    computed: {
        selectedProduct:{
            get(){
                return this.$store.getters['cartStore/getSelectedProductId']();
            }
        },
        orderFields:{
            get(){
                return this.$store.getters['cartStore/getOrderFields']();
            }
        },
        currency: {
            get() {
                return this.$store.getters['cartStore/getSelectedCurrency']();
            },
        },
        isVisible: {
            get() {
                return this.$store.getters['cartStore/getOrderFields']().length
            }
        },
        showNumber: {
            get() {
                return this.$store.getters['cartStore/shouldShowNumber']();
            }
        },
        layoutSettings: {
            get() {
                return this.$store.getters['cartStore/getLayoutSettings']();
            }
        },
        getSPage: {
            get(){
                return this.$store.getters['cartStore/getSPage']();
            }
        },
        isOneStep: {
            get()
            {
                return this.$store.getters['cartStore/isOneStep']()
            }
        },
    },
    methods:{
        requireValidator(field) {
            if (field.required === 'off') {
                return;
            }

            let result = pageOrderRequiredValidator(field.id, this.data[field.id].value);
            mgPageOrderCustomFieldValidatorCallback(field, result);
        },
        updateDataValue(event, fieldId, option, index){
            //update data object
            if(this.interactive){
                this.data[fieldId].value = option;
            }
            delete this.data[fieldId]
            this.data = {
                ...this.data
            }
            this.data[fieldId] = this.orderFields[index]
            this.data[fieldId].value = option
            this.requireValidator(this.data[fieldId]);
            this.$store.dispatch('cartStore/updateOrderFields', Object.values(this.data).filter(item => item.value))
        },
        isValid(field) {
            return field.isValidField;
        },
        parseHTML(html) {
            return $.parseHTML(html)
        }
    },
});
