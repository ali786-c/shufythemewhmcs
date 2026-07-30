const customCheckbox = {
    template: '#t-mg-one-page-custom-field-checkbox-input',
    props: {
        field: {
            type: Object,
            required: true
        },
        data: null,
    },
    data: function () {
        return {
            isValidField: true,
            fieldValidationMessages: null,
            isDestructed: false,
            value: null,
            interactive: false,
            supportedValue: null,
        }
    },
    watch: {
        value: function (value) {
            let supportedValue = value === true ? 'on' : '';
            this.field.value = supportedValue
            this.$set(this.data,this.field.id, supportedValue)
            this.updateValue(supportedValue, true);
        },
    },
    created() {
        let  self = this;
        this.$nextTick(() => {
            const value = Object.entries(this.customFields).find(el => el[0] == this.field.id)
            if (value && value[1]) {
                this.value = value[1]
            }
        })
        // self.value = self.data[self.field.id] ? self.data[self.field.id] : null;
        mgEventHandler.on('PreCompleteOrder', null, function (id, params) {
            if(self.isDestructed){
                return;
            }
            self.validateField(self.data[self.field.id]);
            // self.requireValidator();
            // self.$forceUpdate();
        });

        mgEventHandler.on('RefreshAlertState', null, function () {
            self.isValidField               = true;
            self.fieldValidationMessages    = null;
        });
    },
    destroyed(){
        this.isDestructed = true;
    },
    computed: {
        userDetails: {
            get() {
                return this.$store.getters['cartStore/getClient']()
            }
        },
        layoutSettings: {
            get() {
                return this.$store.getters['cartStore/getLayoutSettings']();
            }
        },
        customFields: {
            get() {
                return this.$store.getters['cartStore/getCustomFieldsFormData']()
            }
        }
    },
    methods: {
        requireValidator() {
            if (this.field.required === false) {
                return;
            }

            let result = pageOrderRequiredValidator(this.field.id, this.data.value);
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
                if(result === true && this.field.value)
                {
                    this.isValidField = true;
                    this.fieldValidationMessages = null;
                    pageOrderStore.commit('cartStore/popValidateError', this.field.name);
                }else{
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
                this.data[this.field.id] = this.value;
            }
            this.requireValidator();
        },
        getTranslatedMessage(name) {
            let langs = pageOrderStore.getters['cartStore/getLang']();
            return mgPageLang.getTranslation([name], langs) ? mgPageLang.sprintf(mgPageLang.translate(name, {'name': name},name)) : name
        },
    }
};