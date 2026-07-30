const billingTextInput = {
    template: '#t-mg-one-page-billing-text-field',
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
        data: {
            handler(val, old){
                if(val[this.field.name] != this.value){
                    this.updateValue(val[this.field.name], true);
                }
            },
            deep: true
        },
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
    created(){
        var self = this;
        self.$nextTick(() => {
            self.isValidField = true;
        });
        mgEventHandler.on('PreCompleteOrder', null, function(id, params){
            if(self.isDestructed){
                return;
            }
            // self.requireValidator();
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
    computed: {
        userDetails: {
            get() {
                return this.$store.getters['cartStore/getClient']()
            }
        },
    },
    methods:{
        requireValidator() {
            if (this.field.required === false) {
                return;
            }

            let result = pageOrderRequiredValidator(this.field.name, this.data.value);
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
    
                    if((self.userDetails.id > 0 && !$('input#firstname:visible').length) || result === true)
                    {
                        self.isValidField = true;
                        self.fieldValidationMessages = null;
                        pageOrderStore.commit('cartStore/popValidateError', this.field.name.id);
                    }else if (this.field.required)  {
                        self.isValidField= false;
                        self.fieldValidationMessages = result;
                        pageOrderStore.commit('cartStore/pushValidateError',{id: this.field.id, error: result});
                        break;
                    }
                }
            }

        },
        getValidationMessage()
        {
            return this.fieldValidationMessages;
        },
        isValid()
        {
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