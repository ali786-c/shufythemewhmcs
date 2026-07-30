const domainText = {
    template: '#t-mg-one-page-domain-text-field',
    props: {
        field: {
            required: true
        },
        data: {
            required: true
        },
    },
    data: function () {
        return {
            value: null,
            isValidField: true,
            fieldValidationMessages: null,
            isDestructed: false,
            interactive: false,
        }
    },
    created()
    {
        // this.initDisplayName();
        // this.initValue();
        
        // const self = this;
        // mgEventHandler.on('PreCompleteOrder', null, function (id, params) {
        //     if(Object.keys(self.$store.state.cartStore.settings.domain.schema.registerFields).length) {
        //         self.validateField(self.value);
        //     }
        // });

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
    watch: {
        value: function(val){
            if(this.data[this.field.id] !== this.value){
                this.$set(this.data,this.field.id,this.value)
            }
        }
    },
    methods: {
        initDisplayName()
        {
            this.displayName = this.displayName === null ? this.name : this.displayName;
        },
        initValue()
        {
            if (this.data[this.field.id])
            {
                this.value = this.data[this.field.id];
            } else
            {
                this.$set(this.data, this.field.id, this.value)
            }
        },
        isValid()
        {
            return this.isValidField;
        },
        getValidationMessage()
        {
            return this.fieldValidationMessages;
        },
        updateValue(value, valid)
        {
            if (valid === true)
            {
                this.validateField(value);
            }
            
            this.value = value;
        },
        validateField(value)
        {
            let self = this;
            const validators = this.field.validators ? Object.entries(this.field.validators) : [];
            if (this.field.required)
            {
                for (const [key, validatorName] of validators)
                {
                    
                    if (typeof window[validatorName] !== "function")
                    {
                        console.log('validator not found: ' + validatorName);
                        return;
                    }
                    
                    var result = window[validatorName](self.field.name, value);
                    
                    if (result === true)
                    {
                        self.isValidField = true;
                        self.fieldValidationMessages = null;
                        pageOrderStore.commit('cartStore/popValidateError', this.field.name.id);
                    }
                    else
                    {
                        self.isValidField = false;
                        self.fieldValidationMessages = result;
                        pageOrderStore.commit('cartStore/pushValidateError', {id: this.field.id, error: result});
                        break;
                    }
                }
            }
        },
        change(value){
            this.$emit('change', {
                id: this.field.id,
                field: this.field.name,
                value: this.value
            });
        },
        requireValidator() {
            if (this.field.required === false) {
                return;
            }

            let result = pageOrderRequiredValidator(this.field.name, this.value);
            mgPageOrderCustomFieldValidatorCallback(this, result);
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
    },
    computed: {
        registerFields: {
            get()
            {
                return this.$store.getters['cartStore/getDomainSchemaRegisterFields']();
            }
        },
    }
};
