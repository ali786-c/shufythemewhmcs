const billingDropdown = {
    template: '#t-mg-one-page-billing-dropdown-field',
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
            test: 'nyullll'
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

        self.$nextTick(() => {
            self.interactive = true;

            self.value = Object.keys(self.field.options)[0];
            self.data[self.field.name] = self.value
        });
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

        this.updateValue(this.data[this.field.name], false);
    },
    destroyed(){
        this.isDestructed = true;
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
            for (const [key, validatorName] of Object.entries(this.field.validators)) {

                if (typeof window[validatorName] !== "function"){
                    console.log('validator not found: ' + validatorName);
                    return;
                }

                var result = window[validatorName](name, value);
                // if(this.userDetails.id > 0 || result === true)
                // {
                //     this.isValidField = true;
                //     this.fieldValidationMessages = null;
                // }else{
                //     this.isValidField = false;
                //     this.fieldValidationMessages = result;
                //     break;
                // }
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
            let self = this;
            if(this.interactive){
                this.data[this.field.name] = this.value;
            }
        },
    }
};