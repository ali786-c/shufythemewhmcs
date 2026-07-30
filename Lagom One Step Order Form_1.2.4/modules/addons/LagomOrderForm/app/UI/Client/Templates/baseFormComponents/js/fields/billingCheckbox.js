const billingCheckbox = {
    template: '#t-mg-one-page-billing-checkbox-input',
    props: {
        field: {
            type: Object,
            required: true
        },
        data: null
    },
    data: function () {
        return {
            supportedValue: null,
            isValidField: true,
            fieldValidationMessages: null,
            isDestructed: false,
            value: false,
        }
    },
    watch: {
        value: function (value) {
            let supportedValue = value === true ? 'on' : '';
            this.$set(this.data,this.field.name, supportedValue)
            this.updateValue(supportedValue, true);
        },
    },
    created() {
        var self = this;
        mgEventHandler.on('PreCompleteOrder', null, function (id, params) {
            if (self.isDestructed) {
                return;
            }
            self.validateField(self.data[self.field.name]);
        });

        mgEventHandler.on('RefreshAlertState', null, function () {
            self.isValidField               = true;
            self.fieldValidationMessages    = null;
        });

    },
    destroyed() {
        this.isDestructed = true;
    },
    computed: {
        userDetails: {
            get() {
                return this.$store.getters['cartStore/getClient']()
            }
        },
    },

    methods: {
        requireValidator() {
            if (this.field.required === false) {
                return;
            }

            let result = pageOrderRequiredValidator(this.field.name, this.data.value);
            mgPageOrderCustomFieldValidatorCallback(this, result);
        },
        updateValue(value, validateField) {
            if (validateField === true) {
                this.validateField(value);
            }

            this.supportedValue = value;
        },
        validateField(value) {
            for (const [key, validatorName] of Object.entries(this.field.validators)) {

                if (typeof window[validatorName] !== "function") {
                    console.log('validator not found: ' + validatorName);
                    return;
                }

                var result = window[validatorName](this.field.name, value);
                if((this.userDetails.id > 0 && !$('input#firstname:visible').length) || result === true)
                {
                    this.isValidField = true;
                    this.fieldValidationMessages = null;
                    pageOrderStore.commit('cartStore/popValidateError', this.field.name);
                }else if (this.field.required) {
                    this.isValidField= false;
                    this.fieldValidationMessages = result;
                    pageOrderStore.commit('cartStore/pushValidateError', {id: this.field.name, error: result});
                    break;
                }
            }
        },
        getValidationMessage() {
            return this.fieldValidationMessages;
        },
        isValid() {
            return this.isValidField;
        },
        updateDataValue(){
            if(this.interactive){
                this.data[this.field.name] = this.value;
            }
            this.requireValidator();
        },
    }
};