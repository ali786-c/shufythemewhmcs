const billingPassword = {
    template: '#t-mg-one-page-billing-password-field',
    components: {},
    props: {
        field: {
            type: Object,
            required: true
        },
        data: null
    },
    data: function () {
        return {
            value: null,
            isValidated: true,
            fieldValidationMessages: null,
            isDestructed: false,
            isValidField: true,
            isMatched: true,
            password: null,
        }
    },
    watch: {
        value: {
            handler(val) {
                this.updateValue(val, true)
            },
            deep: true
        },
    },
    computed: {
        userDetails: {
            get() {
                return this.$store.getters['cartStore/getClient']()
            }
        },
    },
    created() {
        var self = this;
        mgEventHandler.on('PreCompleteOrder', null, function (id, params) {
            if (self.isDestructed) {
                return;
            }
        });
        mgEventHandler.on('RefreshAlertState', null, function () {
            self.isValidField               = true;
            self.fieldValidationMessages    = null;
        });
        this.$nextTick(function () {
            const checkout = document.getElementById('checkout')
            if (checkout) {
                document.getElementById('checkout').addEventListener('click', () => {
                    if (this.areRegisterDetailsVisible()) {
                        self.validateField(self.value)
                    }
                })
            }
        });
    },
    destroyed() {
        this.isDestructed = true;
    },
    methods: {
        updateValue(value, valid) {
            if (valid === true) {
                this.validateField(value);
            }
            this.password = $('#password').val();
            this.isMatched = !(this.field.name === 'password2' && this.password !== value);
            this.$set(this.data, this.field.name, this.value)
        },
        validateField(value) {
            this.isValidField = !(!value && (this.field.required || this.field.name === 'password2'));
        },
        getValidationMessage() {
            return this.fieldValidationMessages;
        },
        changeValue(){
            this.$set(this.data, this.field.name, this.value);
            this.updateValue(this.value, true);
        },
        forcePassword(){
            this.value = $('#'+this.field.id).val();
            this.$set(this.data, this.field.name, this.value);
            this.updateValue(this.value, true);
        },
        areRegisterDetailsVisible() {
            return $('#phonenumber:visible').length
        },
    }
};