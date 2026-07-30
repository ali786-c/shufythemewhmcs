const captchaPlugin = {
    install: function (Vue, options) {
        Vue.prototype.$captchaIsOn = function(type){
            const settings = this.$store.getters['cartStore/getCaptchaSettings']();
            return settings.forms[type] && (this.captcha.setting === 'on' || (this.captcha.setting === 'offloggedin' && !(this.$store.getters['cartStore/getClient']()['id'] > 0)));
        }
        Vue.prototype.$captchaCheck = function(type){
            return new Promise((resolve, reject) => {
                const settings = this.$store.getters['cartStore/getCaptchaSettings']();
                
                if (!settings.setting || (settings.setting == 'offloggedin' && this.$store.getters['cartStore/getClient']()['id'])) {
                    resolve();
                    return;
                }
                if (settings.type === 'recaptcha' && typeof grecaptcha !== 'undefined') {
                    grecaptcha.reset()
                }

                captchaHelper.captchaType = type;
                captchaHelper.onSuccessCallback = resolve;
                captchaHelper.onFailCallback = reject;
                if (settings.type === 'invisible')
                {
                    const self = this;
                    captchaHelper.callbackEvent = function(){
                        self.$store.dispatch('cartStore/confirmCaptcha', {
                            token: csrfToken,
                            code: document.getElementById('g-recaptcha-response').value,
                            type: captchaHelper.captchaType
                        }).then(response => {
                            captchaHelper.runSuccessCallback(response)
                            grecaptcha.reset()
                            $('#captchaContainerModal').modal('hide')
                            $('#captchaContainerModal').html('')
                        });
                    };
                }
                captchaHelper.initCaptcha();
            });
        }
    },
}