const billingUserPassword = {
    template: '#t-mg-one-page-billing-user-password-field',
    props: {
        field: {
            type: Object,
            required: true
        },
        data: null
    },
    data: function () {
        return {
            progressBar: {
                styles: {
                    width: '0px'
                },
                statusClass: '',
                inputFrameClass: ''
            },
            value: null,
            generatedPassword: null,
            pwLength: 8,
            isValidField: true,
            fieldValidationMessages: null,
            password: null,
        }
    },
    computed: {
        userDetails: {
            get() {
                return this.$store.getters['cartStore/getClient']()
            }
        },
    },
    userExist: {
        get() {
            return !!this.userDetails.id;
        }
    },
    created() {
        var self = this;
        mgEventHandler.on('PreCompleteOrder', null, function (id, params) {
            if (self.isDestructed) {
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
    watch:{
        value: function(value){
            this.passwordStrength(this.value);
            if(!value) {
                this.isValidField = false
            }
            else {
                this.isValidField = true
            }
        },
    },
    methods:{
        passwordStrength: function(password){
            password = password ? password : '';
            if(typeof window.langPasswordWeak === 'undefined'){
                window.langPasswordWeak = mgPageLang.translate('weak');
            }
            if(typeof window.langPasswordModerate === 'undefined'){
                window.langPasswordModerate = mgPageLang.translate('moderate');
            }
            if(typeof window.langPasswordStrong === 'undefined'){
                window.langPasswordStrong = mgPageLang.translate('strong');
            }
            if(typeof window.tooShort === 'undefined'){
                window.langPasswordTooShort = mgPageLang.translate('passwordTooShort');
            }

            var pwStrengthErrorThreshold = 50;
            var pwStrengthWarningThreshold = 75;
            var pwlength = (password.length > 1) ? password.length : 2;
            if (pwlength > 5) pwlength = 5;
            var numnumeric = password.replace(/[0-9]/g, "");
            var numeric = (password.length - numnumeric.length);
            if (numeric > 3) numeric = 3;
            var symbols = password.replace(/\W/g, "");
            var numsymbols = (password.length - symbols.length);
            if (numsymbols > 3) numsymbols = 3;
            var numupper = password.replace(/[A-Z]/g, "");
            var upper = (password.length - numupper.length);
            if (upper > 3) upper = 3;
            var pwstrength = ((pwlength * 10) - 20) + (numeric * 10) + (numsymbols * 15) + (upper * 10);
            if (pwstrength < 0) pwstrength = 0;
            if (pwstrength > 100) pwstrength = 100;

            if(pwstrength !== 0 && pwstrength < 20){
                pwstrength = 20;
            }

            this.progressBar.styles.width = pwstrength + '%';

            if(pwlength < 4){
                $('#passwordStrengthBar-inputNewPassword').hide();
                this.progressBar.statusClass = '';
                this.progressBar.inputFrameClass = '';
                jQuery("#passwordStrengthTextLabel").html(langPasswordTooShort);
            }
            else if(pwstrength < pwStrengthErrorThreshold) {
                $('#passwordStrengthBar-inputNewPassword').show();
                this.progressBar.statusClass = 'progress-bar-danger';
                this.progressBar.inputFrameClass = 'has-error has-error-pw';
                jQuery("#passwordStrengthTextLabel").html(langPasswordWeak)
            }
            else if (pwstrength < pwStrengthWarningThreshold) {
                $('#passwordStrengthBar-inputNewPassword').show();
                this.progressBar.statusClass = 'progress-bar-warning';
                this.progressBar.inputFrameClass = 'has-warning has-warning-pw';
                jQuery("#passwordStrengthTextLabel").html(langPasswordModerate)
            }
            else {
                $('#passwordStrengthBar-inputNewPassword').show();
                this.progressBar.statusClass = 'progress-bar-success';
                this.progressBar.inputFrameClass = 'has-success has-success-pw';
                jQuery("#passwordStrengthTextLabel").html(langPasswordStrong)
            }
        },
        showModal(){
            const self = this;
            this.generatedPassword = null;
            this.pwLength = 8;
            // $('#'+this.field.id+'modalGeneratePassword').modal();
            $('#modalGeneratePassword').modal();
            $('#modalGeneratePassword .btn[type=submit]').trigger('click')
            $('#modalGeneratePassword').attr('data-targetfields','password,inputNewPassword2');
            $('#btnGeneratePasswordInsert').on('click', function(e){
                self.value = $('#password').val();
                $('#inputNewPassword2').trigger("change");
                $("#inputNewPassword2")[0].dispatchEvent(new Event('forcePassword'))
                self.updateValue();
            })
        },
        updateValue(){
            this.$set(this.data, this.field.name, this.value);
            if (this.value !== null) this.password = this.value
            if ($('[name="password2"]').parent().hasClass('has-success-pw')) {
                this.data['password2'] = this.password
            }

        },
        validateField(value) {
            this.passwordStrength(value);
            if (value) {
                pageOrderStore.commit('cartStore/popValidateError',{id: "inputNewPassword"})
            }
            if(!value && !this.userDetails.id) {
                this.isValidField = false
                pageOrderStore.commit('cartStore/pushValidateError',{id: this.field.id});
            }
            else {
                this.updateValue()
                this.isValidField = true
                pageOrderStore.commit('cartStore/popValidateError',{id: this.field.id});
            }
        }
    },
};