const billingLink = {
    template: '#t-mg-one-page-billing-link-field',
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
                this.updateValue(value, true)
            }
        },
    },
    created(){
        var self = this;
        mgEventHandler.on('PreCompleteOrder', null, function(id, params){
            if(self.isDestructed){
                return;
            }
            self.validateField(self.value);
        });

        mgEventHandler.on('RefreshAlertState', null, function () {
            self.isValidField               = true;
            self.fieldValidationMessages    = null;
        });

        this.$nextTick(function () {
            if (this.field.required) {
                document.getElementById('checkout').addEventListener('click', () => {
                    self.validateField(self.value)
                })
            }
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
    },
    methods:{
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
            if (!this.field.required || (this.userDetails.id > 0 && !$('input#firstname:visible').length)) {
                    pageOrderStore.commit('cartStore/popValidateError', this.field.id)
                    this.isValidField = true
                    this.fieldValidationMessages = null
                    this.data[this.field.name] = this.value
            } else if (!value) {
                this.isValidField= false;
                this.fieldValidationMessages = this.field.validators[1];
                pageOrderStore.commit('cartStore/pushValidateError',{id: this.field.id, error: this.field.validators[1]});
            } else if (!value.match(/^(http(s)?:\/\/)[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$/)) {
                this.isValidField= false;
                this.fieldValidationMessages = this.field.validators[0];
                pageOrderStore.commit('cartStore/pushValidateError',{id: this.field.id, error: this.field.validators[0]});
            } else {
                pageOrderStore.commit('cartStore/popValidateError', this.field.id)
                this.isValidField = true
                this.fieldValidationMessages = null
                this.data[this.field.name] = this.value
            }
        },
        getValidationMessage()
        {
            return mgPageLang.translate(this.fieldValidationMessages, '');
        },
        isValid()
        {
            return this.isValidField;
        },
        updateDataValue(){
            if(this.interactive){
                this.data[this.field.name] = this.value;
            }
        },
    }
};