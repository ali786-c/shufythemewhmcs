const customLinkInput = {
    template: '#t-mg-one-page-custom-field-link-input',
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
    watch:{
        data: {
            handler(val, old){
                // if(val[this.field.name] != this.value){
                //     this.updateValue(val[this.field.name], true);
                // }
            },
            deep: true
        },
    },
    computed: {
        layoutSettings: {
            get() {
                return this.$store.getters['cartStore/getLayoutSettings']();
            }
        },
    },
    created() {
        let self = this;
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
            if(valid === true)
            {
                this.validateField(value);
            }

            this.value = value;
        },
        validateField(value)
        {
            let self = this;
            for (const [key, validatorName] of Object.entries(this.field.validators)) {

                if (typeof window[validatorName] !== "function"){
                    console.log('validator not found: ' + validatorName);
                    return;
                }

                var result = window[validatorName](self.field.name, value);
                if(result === true && this.value)
                {
                    // pageOrderStore.commit('cartStore/popValidateError', this.field.id);
                    this.isValidField = true;
                    this.fieldValidationMessages = null;
                }else{
                    this.isValidField = false;
                    this.fieldValidationMessages = result;
                    // pageOrderStore.commit('cartStore/pushValidateError',{id: this.field.id, error: result});
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