const customPasswordnput = {
    template: '#t-mg-one-page-custom-field-password-input',
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
        }
    },
    created() {
        const self = this;
        self.value = self.data[self.field.name] ? self.data[self.field.name] : (self.data[self.field.id] ? self.data[self.field.id] : null);
        self.$nextTick(() => {self.interactive = true;});
        mgEventHandler.on('PreCompleteOrder', null, function (id, params) {
            if(self.isDestructed === true){
                return;
            }
            self.requireValidator();
            self.$forceUpdate();
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
        layoutSettings: {
            get() {
                return this.$store.getters['cartStore/getLayoutSettings']();
            }
        },
    },
    watch: {
        data: {
            handler(formData){
                // this.interactive = false;
                // this.value = this.data[this.field.id] ? this.data[this.field.id] : null;
                // this.$nextTick(() => {this.interactive = true;});
            },
            deep: true,
        },
    },
    methods: {
        requireValidator() {
            if (this.field.required === false) {
                return;
            }

            let result = pageOrderRequiredValidator(this.field.name, this.value);
            mgPageOrderCustomFieldValidatorCallback(this, result);
        },
        updateValue(value, valid)
        {
            if(valid === true){
                this.validateField(value);
            }

            this.value = value;
        },
        validateField(value)
        {
            let self = this;
            if(this.field.required) {
                for (const [key, validatorName] of Object.entries(this.field.validators)) {

                    if (typeof window[validatorName] !== "function"){
                        console.log('validator not found: ' + validatorName);
                        return;
                    }

                    var result = window[validatorName](self.field.name, value);

                    if(self.userDetails.id > 0 || result === true)
                    {
                        self.isValidField = true;
                        self.fieldValidationMessages = null;
                        // pageOrderStore.commit('cartStore/popValidateError', this.field.name.id);
                    }else{
                        self.isValidField= false;
                        self.fieldValidationMessages = result;
                        // pageOrderStore.commit('cartStore/pushValidateError',{id: this.field.id, error: result});
                        break;
                    }
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