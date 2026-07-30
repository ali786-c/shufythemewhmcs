async function mgStripePreOrder(details) {

    var newCcInputs = jQuery('#newCardInfo');
    const amount = parseFloat($('#cartTotalAmount').html())
    if(mgStripe.existingToken){
        return mgStripe.orderExisting(details);
    }else if (amount > 0){
        return mgStripe.orderNew(details);
    } else {
        return mgStripe.freeOrder(details)
    }
};

function mgStripeMount(details) {
    mgStripe.mount();
};

function mgStripeFormData(){
    return mgStripe.formData;
}

async function mgStripeChangeCard(details) {
    if(details.ccinfo === 'new')
    {
        await mgStripe.removeToken();
    }else{
        await mgStripe.loadCardToken(details.ccinfo);
    }
};


const mgStripe = {
    complete:{
        cardNumber: false,
        cardExpiry: false,
        cardCvc: false,
    },
    existingToken: null,
    formData:{},
    mount(){

        var self = this;

        self.mountInputs().then(result => {
            self.mountApp();
        });
        ;
    },
    change(callback, id, errorElass){
        //has-error
        var self = mgStripe;
        if(callback.error !== undefined && callback.complete !== true){
            self.complete[callback.elementType] = false;
            $('#'+id).parent().addClass('has-error has-error--form');
        }

        if(callback.complete === true)
        {
            self.complete[callback.elementType] = true;
            $('#'+id).parent().removeClass('has-error has-error--form');
        }
    },
    removeToken(){
        this.existingToken = null;
    },
    loadCardToken(card){
        var self = this;
        WHMCS.http.jqClient.jsonPost({
            url: WHMCS.utils.getRouteUrl("/payment/stripe/token/get"),
            data: "paymethod_id=" + card + "&token=" + csrfToken,
            success: function (e) {
                self.existingToken = e.token;
                return Promise.resolve(1);
            },
            warning: function (e) {
                //WARNING
                return Promise.reject(e);
            },
            fail: function (e) {
                //FAILED
                return Promise.reject(e);
            }
        })
    },
    orderExisting(details){
        var self = this;
        if (document.getElementById('g-recaptcha-response') && captchaComponent.getCaptchaType() === 'invisible') {
            grecaptcha.execute()
        }
        return new Promise((resolve, reject) => {
            WHMCS.http.jqClient.jsonPost({
                url: WHMCS.utils.getRouteUrl("/stripe/payment/intent"),
                data:  details + '&payment_method_id=' + self.existingToken,
                success: function (e) {
                    if (e.success) {
                        self.formData['remoteStorageToken'] = e.token;
                        resolve(1);
                    } else if (e.validation_feedback) {
                        resolve(e);
                    } else {
                        stripe.handleCardPayment(
                            e.token
                        ).then(function(result) {
                            if (result.error) {
                                e.validation_feedback = result.error.message;
                                resolve(e);
                            } else {
                                self.formData['remoteStorageToken'] = result.paymentIntent.id;
                                resolve(1);
                            }
                        });
                    }
                },
                warning: function (e) {
                    reject(e);
                },
                fail: function (e) {
                    reject(e);
                }
            });
        });
    },
    async orderNew(details){
        const input = document.getElementById('isWhmcs88OrHigher')
            return new Promise((resolve, reject) => {
                if (input && input.value !== "false") {
                    stripe.createPaymentMethod("card", card).then(function (e) {
                        if (e.error) {
                            reject(e);
                        } else {
                            WHMCS.http.jqClient.jsonPost({
                                url: WHMCS.utils.getRouteUrl("/stripe/payment/intent"),
                                data: details,
                                async: false,
                                success: function (e) {
                                    if (e.requires_payment) {
                                        stripe.confirmCardPayment(e.token, {
                                            payment_method: {
                                                card: card,
                                                billing_details: e.billing_details,
                                                metadata: e.metadata
                                            }
                                        })
                                    }
                                    resolve(1);
                                },
                                warning: function (e) {
                                    reject(e);
                                },
                                fail: function (e) {
                                    reject(e);
                                }
                            })
                        }
                    })
                } else {
                    const self = this
                    stripe.createPaymentMethod("card", card).then(function (e) {
                        if (e.error) {
                            reject(e);
                        } else {
                            details = details + '&payment_method_id=' + e.paymentMethod.id;
                            WHMCS.http.jqClient.jsonPost({
                                url: WHMCS.utils.getRouteUrl("/stripe/payment/intent"),
                                data: details,
                                async: false,
                                success: function (e) {
                                    if (e.success) {
                                        self.formData['remoteStorageToken'] = e.token;
                                        resolve(1);
                                    } else if (e.validation_feedback) {
                                        resolve(e);
                                    } else {
                                        stripe.handleCardPayment(
                                            e.token
                                        ).then(function(result) {
                                            if (result.error) {
                                                e.validation_feedback = result.error.message;
                                                resolve(e);
                                            } else {
                                                self.formData['remoteStorageToken'] = result.paymentIntent.id;
                                                resolve(1);
                                            }
                                        });
                                    }
                                },
                                warning: function (e) {
                                    reject(e);
                                },
                                fail: function (e) {
                                    reject(e);
                                }
                            })
                        }
                    }).catch(e => {
                        reject(e)
                    });
                }

            });
    },

    async freeOrder(details){
        var self = this;
        return new Promise((resolve, reject) => {
            stripe.createPaymentMethod("card", card).then(function (e) {
                if (e.error) {
                    reject(e);
                } else {
                    details = details + '&payment_method_id=' + e.paymentMethod.id;
                    WHMCS.http.jqClient.jsonPost({
                        url: WHMCS.utils.getRouteUrl('/stripe/setup/intent'),
                        data: details,
                        async: false,
                        success: function (response) {
                            if (response.success) {
                                stripe.handleCardSetup(
                                    response.setup_intent,
                                    card
                                ).then(function(result) {
                                    self.formData['remoteStorageToken'] = response.setup_intent.split('_secret')[0];
                                    resolve(1);
                                });
                            }
                        },
                        warning: function (e) {
                            reject(e);
                        },
                        fail: function (e) {
                            reject(e);
                        }
                    })
                }
            }).catch(e => {
                reject(e)
            });
        });
    },
    mountInputs(){
        return new Promise((resolve, reject) => {
            var card = $('#mg-card-stripe').parent()
            $('#mg-card-stripe').remove();
            card.append('<div id="mg-stripe-cc" class="form-control"></div>');

            var expiry = $('#mg-card-expiry-stripe').parent();
            $('#mg-card-expiry-stripe').remove();
            expiry.append('<div id="mg-stripe-expiry" class="form-control"></div>');

            var cvv = $('#mg-card-cvv-stripe').parent();
            $('#mg-card-cvv-stripe').remove();
            cvv.append('<div id="mg-stripe-cardcvv" class="form-control"></div>');
            resolve();
        });
    },
    mountApp(){
        if(jQuery('#mg-stripe-cc')[0] !== undefined){
            var self = this;

            card.mount('#mg-stripe-cc');
            card.addEventListener("change", function(result)
            {
                self.change(result, 'mg-stripe-cc', 'has-error')
            });

            cardExpiryElements.mount("#mg-stripe-expiry");
            cardExpiryElements.addEventListener("change", function(result)
            {
                self.change(result, 'mg-stripe-expiry', 'has-error')
            });

            cardCvcElements.mount("#mg-stripe-cardcvv");
            cardCvcElements.addEventListener("change", function(result)
            {
                self.change(result, 'mg-stripe-cardcvv', 'has-error')
            });
        }
    },

};




