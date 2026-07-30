/**
 * Captcha Helper
 * @type {{onFailCallback: {}, onSuccessCallback: {}}}
 */
const captchaHelper ={
    captchaType: 'login',
    initializedCallbacks: false,
    captchaComponent: null,

    callbackEvent: function(){},
    onSuccessCallback: function(response){
    },
    onFailCallback: function(error){},
    initCaptcha: function(){
        this.initializeRecaptchaCallbacks();

        const modal = $('#captchaContainerModal');

        if (modal.length) {
            modalForCaptcha = $('#captchaContainerModal');
            if (typeof modalForCaptcha != 'undefined' && modalForCaptcha.hasClass("modalForHCaptcha")) {
                this.initHCaptcha();
            }
            modalForCaptcha.modal();
        } else {
            this.captchaType = 'invisible';
            this.initInvisibleCaptcha();
        }
    },
    sleep: function(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    },
    initInvisibleCaptcha: async function(){
        if (typeof grecaptcha === "undefined")
        {
            await this.sleep(100);
            this.initInvisibleCaptcha();
        } else {
            if(typeof grecaptcha.execute !== "function") {
                await this.sleep(100);
                this.initInvisibleCaptcha();
            } else {
                grecaptcha.execute()
            }
        }
    },
    initHCaptcha: async function(){
        if (typeof window.hcaptcha == 'undefined') {
            console.log("Failed hCaptcha script load");
        } else {
            window.hcaptcha.render('hCaptchaDiv');
        }
    },
    confirmCaptcha: function() {
        this.captchaComponent.confirm();
    },
    initializeRecaptchaCallbacks: function(){
        if(!this.initializedCallbacks){
            const self = this;
            jQuery(".g-recaptcha").each(function (t, e) {
                var n = jQuery(e),
                    i = n.closest("form"),
                    r = i.find(".btn-recaptcha"),
                    o = n.attr("id").substring(1);
                let callbackName = o + "Callback";
                //override callback function
                window[callbackName] = self.callbackEvent;
            });
            this.initializedCallbacks = true;
        }
    },
    runSuccessCallback: function(response){
        this.onSuccessCallback(response);
    }
};
/**
 * Captcha Component
 */

const captchaComponent = {
    template: '#t-mg-one-page-captcha',
    props: {
        component_id: {
            type: String,
            required: true,
        },
        component_namespace: {
            type: String,
            required: true,
        },
        component_index: {
            type: String,
            required: true,
        },
    },
    data: function () {
        return {
            'data': null,
            captchaCode: null,
            error: null,
            recaptchaFullInitialized: false,
            recaptchaKeyInitialized: false,
            recaptchaType: null,
        }
    },
    watch: {
        isVisible: function (value) {
        },
    },
    computed: {
        captcha:{
            get(){
                return this.$store.getters['cartStore/getCaptchaSettings']();
            }
        },
        isSpinning:{
            get(){
                return this.$store.getters['cartStore/getSpinners']()['captcha'];
            }
        },
        isBlockedCaptcha: {
            get() {
                return this.$store.getters['cartStore/getBlockedEvents']()['captcha'] > 1;
            }
        },
        isVisible:{
            get(){
                return this.captcha.setting === 'on' || (this.captcha.setting === 'offloggedin' && !this.userDetails.id)
            }
        },
        userDetails: {
            get() {
                return this.$store.getters['cartStore/getClient']()
            }
        },
        captchaType:{
            get(){
                let self = this
                if(this.captcha.type) {
                    self.$nextTick(() => {
                        self.initCaptcha()
                    })
                    return this.captcha.type;
                }
                else {
                    return 'recaptcha';
                }
            }
        },
    },
    created() {
    },
    methods: {
        confirmCaptcha(event){
            event.preventDefault();
            this.confirm();
        },
        confirm(){
            const self = this;
            self.error = null;
            if(self.isBlockedCaptcha){
                return false;
            }
            if(this.captcha.type == 'invisible') {
                this.confirmInvisibleCaptcha();
            }
            else
            {
                this.$store.dispatch('cartStore/confirmCaptcha', {
                    token: csrfToken,
                    code: self.captcha.type === 'base' ? self.captchaCode : jQuery("#g-recaptcha-response").val(),
                    type: captchaHelper.captchaType,
                    hCaptchaResponse: $("textarea[name='h-captcha-response']").val()
                }).then(response => {
                    if((response.notifications && response.notifications.length > 0)
                        && (response.appState && response.appState.captcha.confirmed != true)){
                        self.showError(response.notifications);
                        self.reloadCaptcha();
                    }
                    if(response.appState && response.appState.captcha.confirmed === true){
                        self.closeCaptcha();
                        self.runCallback(response);
                        self.reloadCaptcha();
                        self.captchaCode = null;
                    }
                });
            }
        },
        confirmInvisibleCaptcha: () =>{
            const self = this;
                self.error = null;
                this.$store.state.cartStore.app.captcha.confirmed = true;
                this.$store.state.cartStore.settings.captcha.isCompleted = true;

                grecaptcha.execute().then(function(token) {
                    self.$store.dispatch('cartStore/confirmCaptcha', {
                        token: csrfToken,
                        code: grecaptcha.getResponse(),
                        type: 'recaptcha'//captchaHelper.captchaType
                    }).then(response => {
                        if((response.notifications && response.notifications.length > 0)
                            && (response.appState && response.appState.captcha.confirmed != true)){
                            self.showError(response.notifications);
                            self.confirmInvisibleCaptcha();
                        }
                        if(response.appState && response.appState.captcha.confirmed === true){
                            self.closeCaptcha();
                            self.runCallback(response);
                            self.reloadCaptcha();
                            self.captchaCode = null;
                        }
                    });
                });
        },
        closeCaptcha(){
            if(this.isBlockedCaptcha){
                return false;
            }
            this.error = null;
            $('#captchaContainerModal').modal('hide');
        },
        reloadCaptcha(){
            const self = this;
            if (self.captcha.type === 'hCaptcha' && typeof hcaptcha !== 'undefined') {
                hcaptcha.reset();
            }

            let src = this.captcha.imgUrl;
            jQuery(jQuery('#inputCaptchaImageCheckout')).attr('src', src + '?nocache=' + (new Date()).getTime());
        },
        showError(notifications){
            this.error = notifications.find(notification => notification.component == 'captcha').message;
        },
        runCallback(response){
            captchaHelper.runSuccessCallback(response);
        },
        initCaptcha(){
            const self = this;
            if(self.captcha.type === 'base' || this.recaptchaFullInitialized === true){
                return;
            }
            if(self.captcha.siteKey){
                recaptchaSiteKey = self.captcha.siteKey;
                self.recaptchaKeyInitialized = true;
                recaptchaLoadComplete = false;
                recaptchaCount = 0;
                self.$nextTick(() => {
                    WHMCS.recaptcha.register();
                    self.recaptchaFullInitialized = true;
                    captchaHelper.callbackEvent = self.captchaCallback;
                })
            }else{
                //set type as base if keys does not exists
                this.captcha.type = 'base';
            }
        },
        captchaCallback(val){
            this.confirm();
        },

    },
    getCaptchaType() {
        return captchaHelper.captchaType
    }
};

mgJsComponentHandler.addDefaultComponent('mg-one-page-captcha', captchaComponent);
