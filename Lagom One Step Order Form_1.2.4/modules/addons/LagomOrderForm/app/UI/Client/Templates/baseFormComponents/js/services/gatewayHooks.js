const gatewayHooks = {
    namespaced: true,
    gatewayResolver:{},
    actions:{
        async runHookOnGatewaySelect({state, commit, dispatch, getters, rootState}, data){
            var gateway = getters.getSelectedPaymentGatewayDetails();
            var hooks = gateway.hooks;
            if ( hooks && typeof window[hooks.onMount] === "function") {
                await window[hooks.onMount](data, gateway);
            }
        },

        async runHookGatewayPreOrderFunction({state, commit, dispatch, getters, rootState}, data){
            var gateway = getters.getSelectedPaymentGatewayDetails()
            if (gateway.charge && gateway.charge.isChargeable && gateway.type === 'CC') {
                return
            }
            var hooks = gateway.hooks;
            if (hooks && typeof window[hooks.preOrder] === "function") {
                return await window[hooks.preOrder](data, gateway);
            }
            return Promise.resolve(1);
        },

        async runHookOnChangeCreditCard({state, commit, dispatch, getters, rootState}, data){
            var gateway = getters.getSelectedPaymentGatewayDetails()
            var hooks = gateway.hooks;
            if (hooks && typeof window[hooks.onChangeCard] === "function") {
                await window[hooks.onChangeCard](data, gateway);
            }
        },

        runHookGatewayFormData({state, commit, dispatch, getters, rootState}, data){
            var gateway = getters.getSelectedPaymentGatewayDetails()
            var hooks = gateway.hooks;
            if (hooks && typeof window[hooks.formData] === "function") {
                return Promise.resolve(window[hooks.formData](data, gateway));
            }
            return Promise.resolve({});
        },
    },
    getters:{
        getSelectedPaymentGatewayDetails: (state, getters, rootState) => function(){
            const paymentGateways = rootState.cartStore.settings.gateways;
            const selected = rootState.cartStore.app.paymentMethod;
            if(paymentGateways){
                for(var index in paymentGateways){
                    if(paymentGateways[index].gatewayKey == selected){
                        return paymentGateways[index];
                    }
                }
            }
            return [];
        },
    }

};