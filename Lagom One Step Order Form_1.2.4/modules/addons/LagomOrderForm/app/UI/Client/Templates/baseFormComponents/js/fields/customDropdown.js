const customDropdown = {
    template: '#t-mg-one-page-custom-field-dropdown-input',
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
                if(val[this.field.id] != this.value){
                    this.updateValue(val[this.field.id], true);
                }
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
        customFields: {
            get() {
                return this.$store.getters['cartStore/getCustomFieldsFormData']()
            }
        }
    },
    created() {
        let self = this;
        self.$nextTick(() => {
            self.interactive = true;
            if (self.field.options) {
                self.value = Object.keys(self.field.options)[0];
                self.data[self.field.id] = self.value
            }
            const value = Object.entries(this.customFields).find(el => el[0] == this.field.id)
            if (value && value[1]) {
                self.data[value[0]] = value[1]
            }
        });
        mgEventHandler.on('PreCompleteOrder', null, function (id, params) {
            if(self.isDestructed === true){
                return;
            }
            // self.requireValidator();
            // self.$forceUpdate();
        });

        mgEventHandler.on('RefreshAlertState', null, function () {
            self.isValidField               = true;
            self.fieldValidationMessages    = null;
        });
        this.updateValue(this.data[this.field.id], false);
    },
    destroyed(){
        this.isDestructed = true;
    },
    methods: {
        updateValue(value, valid)
        {
            this.value = value;
        },
        requireValidator() {
            if (this.field.required === false) {
                return;
            }

            let result = pageOrderRequiredValidator(this.field.id, this.value);
            mgPageOrderCustomFieldValidatorCallback(this, result);
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
        },
        getTranslatedMessage(name) {
            let langs = pageOrderStore.getters['cartStore/getLang']();
            return mgPageLang.getTranslation([name], langs) ? mgPageLang.sprintf(mgPageLang.translate(name, {'name': name},name)) : name
        },
    }
};