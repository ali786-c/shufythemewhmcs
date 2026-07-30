const billingTextArea = {
    template: '#t-mg-one-page-billing-text-area-field',
    components:{
    },
    props: {
        field: {
            type: Object,
            required: true
        },
        data: null
    },
    data: function(){
        return {
            value: null,
            isValidField: true,
            fieldValidationMessages: null,
            isDestructed: false,
        }
    },
    watch:{
        value: {
            handler(value){
                this.$set(this.data, this.field.name, value);
                this.updateValue(value, true)
                if (this.field.required) {
                    this.validateField(value)
                }
            }
        },
    },
    computed: {
        userDetails: {
            get() {
                return this.$store.getters['cartStore/getClient']()
            }
        },
    },
    created(){
        var self = this;
        mgEventHandler.on('PreCompleteOrder', null, function(id, params){
            if(self.isDestructed){
                return;
            }
            self.requireValidator();
            self.validateField(self.value);
        });

        mgEventHandler.on('RefreshAlertState', null, function () {
            self.isValidField               = true;
            self.fieldValidationMessages    = null;
        });

        this.updateValue(this.data[this.field.name], false);
    },
    destroyed(){
        this.isDestructed = true;
    },
    methods:{
        requireValidator() {
            if (this.field.required === false) {
                return;
            }

            let result = pageOrderRequiredValidator(this.field.name, this.data.value);
            mgPageOrderCustomFieldValidatorCallback(this, result);
        },
        updateValue(value, valid) {
            if(valid === true) {
                this.validateField(value);
            }
        },
        validateField(value)
        {
            for (const [key, validatorName] of Object.entries(this.field.validators)) {
                if (typeof window[validatorName] !== "function"){
                    console.log('validator not found: ' + validatorName);
                    return;
                }
                let result = window[validatorName](this.field.name, value);

                if((this.userDetails.id > 0 && !$('input#firstname:visible').length) || result === true)
                {
                    pageOrderStore.commit('cartStore/popValidateError', this.field.id);
                    this.isValidField = true;
                    this.fieldValidationMessages = null;
                }else if (this.field.required){
                    this.isValidField= false;
                    this.fieldValidationMessages = result;
                    pageOrderStore.commit('cartStore/pushValidateError',{id: this.field.id, error: result});
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
            // this.requireValidator();
        },
    }
};