const LagomOrderFormApi = {
    namespaced: true,
    state: {
      cancelTokens:{

      },
    },
    actions: {
        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @returns {Promise<unknown>}
         */
        loadPageConfiguration: function ({state, commit, dispatch, rootState},params) {
            return new Promise((resolve, reject) => {

                let url = rootState.cartStore.moduleSettings.apiEndpoint + '/cart/configuration/get';
                axios.get(url,{params: params})
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        resolve(response.data);
                    })
                    .catch(async function (error) {
                        reject(error.response ? error.response.data: 'response not found');
                    });

            });
        },

        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param params
         * @returns {Promise<unknown>}
         */
        changeGroup: function({state, commit, dispatch, rootState}, params){
            return new Promise((resolve, reject) => {
                axios.post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/group/set', Qs.stringify(params)).
                then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        resolve(response.data);
                }).
                catch(async function (error) {
                        reject(error.response ? error.response.data: 'response not found');
                });
            });
        },

        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param pid
         * @param data
         * @returns {Promise<unknown>}
         */
        addProduct: function ({state, commit, dispatch, rootState}, {pid, data}) {
            return new Promise((resolve, reject) => {
                axios.post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/product/' + pid + '/add', Qs.stringify(data))
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: addProduct'}, {root: true});
                        resolve();
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'api: addProduct - ' + error}, {root: true})
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },

        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param pid
         * @param data
         * @returns {Promise<unknown>}
         */
        changeProduct: function ({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                axios.post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/product/' + data.productId + '/change')
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: changeProduct'}, {root: true});
                        resolve();
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'api: changeProduct - ' + error}, {root: true})
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },

        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        changeBillingCycle: function ({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                axios.post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/billingCycle/change', Qs.stringify(data))
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: Change Billing Cycle'}, {root: true});
                        resolve();
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'api: Change Billing Cycle - ' + error}, {root: true})
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },

        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        updateConfigurableOptions: function ({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                if(state.cancelTokens.updateConfigurableOptions){
                    state.cancelTokens.updateConfigurableOptions.cancel();
                }
                const cancelTokenSource = axios.CancelToken.source();
                state.cancelTokens.updateConfigurableOptions = cancelTokenSource;

                axios.post(
                    rootState.cartStore.moduleSettings.apiEndpoint + '/cart/config-options/update',
                    Qs.stringify(data),
                    {cancelToken: cancelTokenSource.token}
                )
                .then(async function (response) {
                    await dispatch('setResponseDetails', response.data);
                    dispatch('cartStore/infoLog', {message: 'api: Update Config Options'}, {root: true});
                    resolve();
                })
                .catch(function (error) {
                    dispatch('cartStore/errorLog', {message: 'api: Update Config Options - ' + error}, {root: true})
                    reject(error.response ? error.response.data: 'response not found');
                });
            });
        },

        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        updateServerFields: function ({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                if(state.cancelTokens.updateServerFields){
                    state.cancelTokens.updateServerFields.cancel();
                }
                const cancelTokenSource = axios.CancelToken.source();
                state.cancelTokens.updateServerFields = cancelTokenSource;

                axios.post(
                    rootState.cartStore.moduleSettings.apiEndpoint + '/cart/server-fields/update',
                    Qs.stringify(data),
                    {cancelToken: cancelTokenSource.token}
                )
                .then(async function (response) {
                    await dispatch('setResponseDetails', response.data);
                    dispatch('cartStore/infoLog', {message: 'api: Update Config Options'}, {root: true});
                    resolve();
                })
                .catch(function (error) {
                    dispatch('cartStore/errorLog', {message: 'api: Update Config Options - ' + error}, {root: true})
                    reject(error.response ? error.response.data: 'response not found');
                });
            });
        },

        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        changeDomainRegistrationType: function ({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                if(state.cancelTokens.changeDomainRegistrationType){
                    state.cancelTokens.changeDomainRegistrationType.cancel();
                }
                const cancelTokenSource = axios.CancelToken.source();
                state.cancelTokens.changeDomainRegistrationType = cancelTokenSource;

                axios.post(
                    rootState.cartStore.moduleSettings.apiEndpoint + '/cart/registration-type/update',
                    Qs.stringify(data),
                    {cancelToken: cancelTokenSource.token}
                    )
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: changeDomainRegistrationType'}, {root: true});
                        resolve();
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'api: changeDomainRegistrationType - ' + error}, {root: true})
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },

        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        updateCustomFields: function ({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                if(state.cancelTokens.updateCustomFields){
                    state.cancelTokens.updateCustomFields.cancel();
                }
                const cancelTokenSource = axios.CancelToken.source();
                state.cancelTokens.updateCustomFields = cancelTokenSource;

                axios.post(
                    rootState.cartStore.moduleSettings.apiEndpoint + '/cart/custom-fields/update',
                    Qs.stringify(data),
                    {cancelToken: cancelTokenSource.token}
                )
                .then(async function (response) {
                    await dispatch('setResponseDetails', response.data);
                    dispatch('cartStore/infoLog', {message: 'api: Update Custom Fields'}, {root: true});
                    resolve();
                })
                .catch(function (error) {
                    dispatch('cartStore/errorLog', {message: 'api: Update Custom Fields - ' + error}, {root: true})
                    reject(error.response ? error.response.data: 'response not found');
                });
            });
        },

        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        updateBillingDetails: function({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                if(state.cancelTokens.updateBillingDetails){
                    state.cancelTokens.updateBillingDetails.cancel();
                }
                const cancelTokenSource = axios.CancelToken.source();
                state.cancelTokens.updateBillingDetails = cancelTokenSource;

                axios.post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/billing-details/update',
                    Qs.stringify(data),
                    {cancelToken: cancelTokenSource.token})
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: updateBillingDetails'}, {root: true});
                        resolve(response.data);
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'updateBillingDetails: complete - ' + error}, {root: true})
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },

        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        updateDomainContactDetails: function({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {

                if(state.cancelTokens.updateDomainContactDetails){
                    state.cancelTokens.updateDomainContactDetails.cancel();
                }
                const cancelTokenSource = axios.CancelToken.source();
                state.cancelTokens.updateDomainContactDetails = cancelTokenSource;

                axios.post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/domain-contact/update',
                    Qs.stringify(data),
                    {cancelToken: cancelTokenSource.token})
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: updateBillingDetails'}, {root: true});
                        resolve(response.data);
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'updateBillingDetails: complete - ' + error}, {root: true})
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },

        getDefaultCountrySetting: function({state, commit, dispatch, rootState}, data) {
            return;
        },

        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        updateTextNotes: function({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {

                if(state.cancelTokens.updateTextNotes){
                    state.cancelTokens.updateTextNotes.cancel();
                }
                const cancelTokenSource = axios.CancelToken.source();
                state.cancelTokens.updateTextNotes = cancelTokenSource;

                axios.post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/text-notes/update',
                    Qs.stringify(data),
                    {cancelToken: cancelTokenSource.token})
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: updateBillingDetails'}, {root: true});
                        resolve(response.data);
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'updateBillingDetails: complete - ' + error}, {root: true})
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },
        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        updateMarketingEmails: function({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {

                if(state.cancelTokens.updateMarketingEmails){
                    state.cancelTokens.updateMarketingEmails.cancel();
                }
                const cancelTokenSource = axios.CancelToken.source();
                state.cancelTokens.updateMarketingEmails = cancelTokenSource;

                axios.post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/marketing-emails/update',
                    Qs.stringify(data),
                    {cancelToken: cancelTokenSource.token})
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: updateBillingDetails'}, {root: true});
                        resolve(response.data);
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'updateBillingDetails: complete - ' + error}, {root: true})
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },

        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        updateApplyCredits: function({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {

                if(state.cancelTokens.updateApplyCredits){
                    state.cancelTokens.updateApplyCredits.cancel();
                }
                const cancelTokenSource = axios.CancelToken.source();
                state.cancelTokens.updateApplyCredits = cancelTokenSource;

                axios.post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/apply-credits/update',
                    Qs.stringify(data),
                    {cancelToken: cancelTokenSource.token})
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: updateBillingDetails'}, {root: true});
                        resolve(response.data);
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'updateBillingDetails: complete - ' + error}, {root: true})
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },

        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        addDomain: function ({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                axios.post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/domain/add', Qs.stringify(data))
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: addDomain'}, {root: true});
                        resolve();
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'api: addDomain - ' + error}, {root: true});
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },

        changePeriod: function ({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                axios.post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/domain/period/change', Qs.stringify(data))
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: addDomain'}, {root: true});
                        resolve();
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'api: addDomain - ' + error}, {root: true});
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },

        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        updateDomain: function ({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                if(state.cancelTokens.updateDomain){
                    state.cancelTokens.updateDomain.cancel();
                }
                const cancelTokenSource = axios.CancelToken.source();
                state.cancelTokens.updateDomain = cancelTokenSource;
                axios.post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/domain/update',
                    Qs.stringify(data),
                    {cancelToken: cancelTokenSource.token})
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: updateDomain'}, {root: true});
                        resolve();
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'api: updateDomain - ' + error}, {root: true});
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },

        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        updateDomainAddons: function ({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                if(state.cancelTokens.updateDomainAddons){
                    state.cancelTokens.updateDomainAddons.cancel();
                }
                const cancelTokenSource = axios.CancelToken.source();
                state.cancelTokens.updateDomainAddons = cancelTokenSource;
                axios.post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/domain-addons/update',
                    Qs.stringify(data),
                    {cancelToken: cancelTokenSource.token})
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: updateDomain'}, {root: true});
                        resolve();
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'api: updateDomain - ' + error}, {root: true});
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },
        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        renewDomain: function ({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                axios.post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/domain/renew', Qs.stringify(data))
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: addDomain'}, {root: true});
                        resolve();
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'api: addDomain - ' + error}, {root: true});
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },
        deleteRenewDomain: function ({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                axios.post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/domain/renew/delete', Qs.stringify(data))
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: deleteRenewDomain'}, {root: true});
                        resolve();
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'api: deleteRenewDomain - ' + error}, {root: true});
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },
        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        addPromoCode: function ({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                axios.post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/promo/add', Qs.stringify(data))
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: addPromoCode'}, {root: true});
                        resolve();
                    })
                    .catch(function (error) {
                        commit('cartStore/setPromoCodeErrorMessage',error.response.data.message, {root: true})
                        //commit('cartStore/setSelectedPromo', {error: error.data.promoDetails.message}, {root: true});
                        dispatch('cartStore/errorLog', {message: 'api: addPromoCode - ' + error}, {root: true})
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },
        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        removePromoCode: function ({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                axios.post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/promo/delete', Qs.stringify(data))
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: removePromoCode'}, {root: true});
                        resolve();
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'api: removePromoCode - ' + error}, {root: true});
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },
        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        changeCurrency: function ({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                axios.post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/currency/change', Qs.stringify(data))
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: changeCurrency'}, {root: true});
                        resolve();
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'api: changeCurrency - ' + error}, {root: true});
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },

        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        domainUpdate: function ({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                axios.post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/domain/update', Qs.stringify(data))
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: domainUpdate'}, {root: true});
                        resolve();
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'api: domainUpdate - ' + error}, {root: true});
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },
        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @returns {Promise<unknown>}
         */
        removeDomains: function ({state, commit, dispatch, rootState}) {
            return new Promise((resolve, reject) => {
                axios.post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/domain/delete')
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: removeDomains'}, {root: true});
                        resolve();
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'api: removeDomains - ' + error}, {root: true});
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },
        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        loginUser: function ({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                axios.post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/user/login', Qs.stringify(data))
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: loginUser'}, {root: true});
                        resolve(response.data);
                    })
                    .catch(async function (error) {
                        dispatch('cartStore/errorLog', {message: 'api: loginUser - ' + error}, {root: true});
                        await dispatch('cartStore/displayError', error.response ? error.response.data: [], {root: true});
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },
        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @returns {Promise<unknown>}
         */
        changeUserAccount: function ({state, commit, dispatch, rootState}, data) {
            const queryString = data ? '?' + (new URLSearchParams(data).toString()) : null;

            return new Promise((resolve, reject) => {

                if(state.cancelTokens.changeUserAccount){
                    state.cancelTokens.changeUserAccount.cancel();
                }
                const cancelTokenSource = axios.CancelToken.source();
                state.cancelTokens.changeUserAccount = cancelTokenSource;

                axios.get(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/account/change' + queryString,
                    {cancelToken: cancelTokenSource.token}
                    )
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: getUser'}, {root: true});
                        resolve();
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'api: getUser - ' + error}, {root: true});
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },
        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @returns {Promise<unknown>}
         */
        getUserAccount: function ({state, commit, dispatch, rootState}) {

            return new Promise((resolve, reject) => {

                if(state.cancelTokens.getUserAccount){
                    state.cancelTokens.getUserAccount.cancel();
                }
                const cancelTokenSource = axios.CancelToken.source();
                state.cancelTokens.getUserAccount = cancelTokenSource;

                axios.get(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/account',
                    {cancelToken: cancelTokenSource.token}
                )
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: getUser'}, {root: true});
                        resolve();
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'api: getUser - ' + error}, {root: true});
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },
        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        addAddon: function ({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                axios.post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/addon/add', Qs.stringify(data))
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: addProduct'}, {root: true});
                        resolve();
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'api: addProduct - ' + error}, {root: true})
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },
        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        addProductAddon: function ({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                axios.post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/product-addon/add', Qs.stringify(data))
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: addProduct'}, {root: true});
                        resolve();
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'api: addProduct - ' + error}, {root: true})
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },
        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        changeProductAddon: function ({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                axios.post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/product-addon/change', Qs.stringify(data))
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: addProduct'}, {root: true});
                        resolve();
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'api: addProduct - ' + error}, {root: true})
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },
        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        deleteProductAddon: function({state, commit, dispatch, rootState}, data){
            return new Promise((resolve, reject) => {
                axios.post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/product-addon/delete', Qs.stringify(data))
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: delete product addon'}, {root: true});
                        resolve();
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'api: delete product addon - ' + error}, {root: true})
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },
        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        deleteAddon: function({state, commit, dispatch, rootState}, data){
            return new Promise((resolve, reject) => {
                axios.post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/addon/delete', Qs.stringify(data))
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: delete product addon'}, {root: true});
                        resolve();
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'api: delete product addon - ' + error}, {root: true})
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },
        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        checkDomain: function ({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                /* firstly request to WHMCS function */

                //data.source = 'cartAddDomain';
                dispatch('checkDomainWhmcs', data).then(whmcsResponse => {
                    let result = whmcsResponse.data;
                    let config = whmcsResponse.config;
                    /* request to module API */
                    axios.post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/domain/check', Qs.stringify({
                        requestData: data,
                        responseData: {result: result}
                    }))
                        .then(async function (response) {
                            await dispatch('setResponseDetails', response.data);
                            dispatch('cartStore/infoLog', {message: 'domainModule: checkDomain'}, {root: true});
                            resolve();
                        })
                        .catch(function (error) {
                            dispatch('cartStore/errorLog', {message: 'domainModule: checkDomain - ' + error}, {root: true})
                            reject(error.response ? error.response.data: 'response not found');
                        });
                });
            });
        },
        /**
         *
         */
        /* request to WHMCS function */
        checkDomainWhmcs: function ({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                setTimeout(() => {
                    axios.post(rootState.cartStore.moduleSettings.mainEndpoint + 'index.php?rp=/domain/check', Qs.stringify(data))
                        .then(async function (response) {
                            resolve(response);
                        })
                        .catch(function (error) {
                            dispatch('cartStore/errorLog', {message: 'domainModule: read - ' + error}, {root: true})
                            reject(error.response ? error.response.data: 'response not found');
                        });
                },300)
            });
        },

        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @returns {Promise<unknown>}
         */
        removeDomain: function ({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                axios.post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/domain/delete', Qs.stringify(data))
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: remove Domain'}, {root: true});
                        resolve();
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'api: remove Domain - ' + error}, {root: true});
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },
        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        removeItems: function ({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                axios
                    .post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/remove/items', Qs.stringify(data))
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: addProduct'}, {root: true});
                        resolve();
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'api: addProduct - ' + error}, {root: true})
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },
        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        confirmCaptcha: function({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                axios.post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/captcha/confirm', Qs.stringify(data))
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: confirmCaptcha'}, {root: true});
                        resolve(response.data);
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'checkoutWhmcs: complete - ' + error}, {root: true})
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },
        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        twoFactorForm: function({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                axios.get(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/twoFactor/form')
                    .then(async function (response) {
                        dispatch('cartStore/infoLog', {message: 'api: twoFactor'}, {root: true});
                        resolve(response.data);
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'twoFactor: complete - ' + error}, {root: true})
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },
        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        complete: function ({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                /* firstly request to WHMCS function */
                dispatch('checkoutWhmcs', data).then(whmcsResponse => {
                    let result = whmcsResponse.data;
                    let query = whmcsResponse.config.data;
                    /* request to module API */
                     axios.post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/complete', Qs.stringify({
                        requestData: data,
                        responseData: {query: query, result: result}
                    }))
                        .then(async (response) => {
                            dispatch('cartStore/infoLog', {message: 'api: completeOrder'}, {root: true});
                            await dispatch('setResponseDetails', response.data);
                            if (response.data.settings && response.data.settings.completeOrder  && response.data.settings.completeOrder.status !== 'error') {
                                if (response.data.settings.activeFraudModule) {
                                    await dispatch('fraudcheckWhmcs', {});
                                } else {
                                    await dispatch('completeWhmcs', {});
                                }
                            }
                            resolve();
                        })
                        .catch(function (error) {
                            dispatch('cartStore/errorLog', {message: 'api: completeOrder - ' + error}, {root: true})
                            reject(error.response ? error.response.data: 'response not found');
                        });
                });
            });
        },
        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        checkoutWhmcs: function ({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                var url = rootState.cartStore.moduleSettings.mainEndpoint + 'cart.php?a=checkout';
                var params = data;
                axios.post(url, params)
                    .then(async function (response) {
                        dispatch('cartStore/infoLog', {message: 'api: checkoutWhmcs'}, {root: true});
                        resolve(response);
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'api: checkoutWhmcs - ' + error}, {root: true})
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });

        },

        fraudcheckWhmcs: function ({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                var url = rootState.cartStore.moduleSettings.mainEndpoint + 'cart.php?a=fraudcheck';
                var form = document.createElement('form');
                form.setAttribute('id', 'myForm');
                form.setAttribute('name', 'myForm');
                form.setAttribute('method', 'post');
                form.setAttribute('action', url);
                form.enctype = "multipart/form-data";
                document.body.appendChild(form);
                form.submit();
            });

        },

        updateOrderFields: function ({state, commit, dispatch, rootState}, fields) {
            return new Promise((resolve, reject) => {
                axios.post(rootState.cartStore.moduleSettings.mainEndpoint + 'modules/addons/LagomOrderForm/api/index.php/cart/order-fields/update', Qs.stringify(fields))
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: Update Order Fields'}, {root: true});
                        resolve();
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'api: Update Order Fields - ' + error}, {root: true})
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },

        validateStripe: function ({state, commit, dispatch, rootState}, fields) {
            return new Promise((resolve, reject) => {
                axios.post(rootState.cartStore.moduleSettings.mainEndpoint + 'modules/addons/LagomOrderForm/api/index.php/cart/validate-stripe', Qs.stringify(fields))
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        dispatch('cartStore/infoLog', {message: 'api: Validate Stripe'}, {root: true});
                        resolve();
                    })
                    .catch(function (error) {
                        dispatch('cartStore/errorLog', {message: 'api: Validate Stripe - ' + error}, {root: true})
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },

        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        completeWhmcs: function ({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                var url = rootState.cartStore.moduleSettings.mainEndpoint + 'cart.php?a=complete';
                var params = data;
                rootState.cartStore.settings.gateways.forEach((item) => {
                    if( item.gatewayKey === rootState.cartStore.app.paymentMethod) {
                        // DO wytłumaczenia
                        let selectedGateway = false
                        const paymentGateways = rootState.cartStore.settings.gateways;
                        const selected = rootState.cartStore.app.paymentMethod;
                        if(paymentGateways){
                            for(var index in paymentGateways){
                                if(paymentGateways[index].gatewayKey == selected){
                                    selectedGateway = paymentGateways[index];
                                }
                            }
                        }
                        if (selectedGateway.charge && selectedGateway.charge.isChargeable && selectedGateway.type === 'CC') {

                            axios.post(url, params)
                                .then(async function (response) {
                                    dispatch('cartStore/infoLog', {message: 'api: completeWhmcs'}, {root: true});
                                    resolve(response);
                                })
                                .catch(function (error) {
                                    dispatch('cartStore/errorLog', {message: 'api: completeWhmcs - ' + error}, {root: true})
                                    reject(error.response ? error.response.data: 'response not found');
                                });
                        } else {
                            var form = document.createElement('form');
                            form.setAttribute('id', 'myForm');
                            form.setAttribute('name', 'myForm');
                            form.setAttribute('method', 'post');
                            form.setAttribute('action', url);
                            form.enctype = "multipart/form-data";
                            document.body.appendChild(form);
                            form.submit();
                        }
                    }
                });
            });

        },
        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        updateBillingAccount: function({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                axios.post(rootState.cartStore.moduleSettings.mainEndpoint + 'index.php?rp=/cart/account/select', Qs.stringify(data))
                    .then(async function (response) {
                        resolve(response.data);
                        setTimeout(function() {
                            // return;
                            //Replace top nav "account" element
                            $.get(rootState.cartStore.moduleSettings.mainEndpoint + 'index.php')
                            .done(function(data) {
                                $('body').addClass('page-user-logged')
                                data = data.replace(/<img[^>]((?!gravatar).)*>/g,"");
                                data = $.parseHTML(data)
                                let elements = $(data).find('.dropdown[menuitemname=Account]')
                                elements.each((elementIndex, element) => {
                                    if($('.dropdown[menuitemname=Account]').length) {
                                        $('.dropdown[menuitemname=Account]').replaceWith(element)
                                    }
                                    else {
                                        $('#header .top-nav').append(element)
                                    }
                                })
                                let avatar = $('#header .top-nav .client-avatar img')
                                let avatarURL = avatar.attr('src')
                                avatar.attr('src', '')
                                setTimeout(function() {
                                    avatar.attr('src', avatarURL)
                                }, 1)
                            })
                        }, 20)

                    })
                    .catch(function (error) {
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },

        /**
         *
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<unknown>}
         */
        changeGateway: function({state, commit, dispatch, rootState}, data) {
            return new Promise((resolve, reject) => {
                axios.post(rootState.cartStore.moduleSettings.apiEndpoint + '/cart/gateway/change', Qs.stringify(data))
                    .then(async function (response) {
                        await dispatch('setResponseDetails', response.data);
                        resolve();
                    })
                    .catch(function (error) {
                        reject(error.response ? error.response.data: 'response not found');
                    });
            });
        },

        /**
         * allow to set response for proper state
         * @param state
         * @param commit
         * @param dispatch
         * @param rootState
         * @param data
         * @returns {Promise<void>}
         */
        setResponseDetails: async function({state, commit, dispatch, rootState}, data){
            /**
             * current app settings
             */
            if(data.settings){
                await dispatch('setAppSettings', data.settings);
            }

            /**
             * current app status
             */
            if(data.appState){
                await dispatch('setAppState', data.appState);
            }
        },
        setAppState: async function({state, commit, dispatch, rootState}, data){
            await commit('cartStore/setAppState', data, {root: true});
        },
        setAppSettings: async function({state, commit, dispatch, rootState}, data){
            if(data.groups){
                await commit('cartStore/setGroups', data.groups, {root: true});
            }

            if(data.captcha){
                await commit('cartStore/setCaptcha', data.captcha, {root: true});
            }

            if(data.countryDetails){
                await commit('cartStore/setCountryDetails', data.countryDetails, {root: true});
            }

            if(data.billingDetailFields){
                await commit('cartStore/setBillingDetailsFields', data.billingDetailFields, {root: true});
            }

            if(data.currencies){
                await commit('cartStore/setCurrencies', data.currencies, {root: true});
            }

            if(data.lang){
                await commit('cartStore/setLang', data.lang, {root: true});
            }

            if(data.gateways){
                await commit('cartStore/setGateways', data.gateways, {root: true});
            }

            if(data.tldCategories){
                await commit('cartStore/setTldCategories', data.tldCategories, {root: true});
            }

            if(data.tldExtensions){
                await commit('cartStore/setTldExtensions', data.tldExtensions, {root: true});
            }

            if(data.summary){
                await commit('cartStore/setCartSummary', data.summary, {root: true});
            }

            if(data.notifications){
                await commit('cartStore/updateNotifications', data.notifications, {root: true});
            }

            if(data.completeOrder){
                await commit('cartStore/setCompleteOrderDetails', data.completeOrder, {root: true});
            }

            if(data.token){
                let tokens = data.token;
                if(tokens.csrf){
                    csrfToken = tokens.csrf;
                }
            }

            if(data.template){
                await commit('cartStore/setTemplate',data.template, {root: true})
            }

            if(data.layoutSettings){
                await commit('cartStore/setLayoutSettings',data.layoutSettings, {root: true})
            }

            if(data.rsthemes){
                await commit('cartStore/setRsThemes',data.rsthemes, {root: true})
            }
            /**
             *
             * product schema fields
             */
            if(data.schema){
                let schema = data.schema;
                if( schema.addons )
                {
                    await commit('cartStore/setSchemaAddons', schema.addons, { root: true });
                }

                if( schema.billingCycles )
                {
                    await commit('cartStore/setSchemaBillingCycles', schema.billingCycles, { root: true });
                }

                if( schema.configurableOptions )
                {
                    await commit('cartStore/setSchemaConfigOptions', schema.configurableOptions, { root: true });
                }

                if( schema.productsConfigurableOptions )
                {
                    await commit('cartStore/setSchemaProductsConfigOptions', schema.productsConfigurableOptions, { root: true });
                }


                if( schema.customFields )
                {
                    await commit('cartStore/setSchemaCustomFields', schema.customFields, { root: true });
                }

                schema.server = schema.server? schema.server: {};
                await commit('cartStore/setSchemaServers', schema.server, {root: true});
            }

            if(data.domain){
                let domain = data.domain;
                if(domain.schema) {
                    if(domain.schema.registrationTypes) {
                        await commit('cartStore/setDomainSchemaRegistrationTypes', domain.schema.registrationTypes, {root: true});
                    }
                    if(domain.schema.addons){
                        await commit('cartStore/setDomainSchemaAddons', domain.schema.addons, {root: true});
                    }
                    if(domain.schema.customFields){
                        await commit('cartStore/setDomainSchemaCustomFields', domain.schema.customFields, {root: true});
                    }
                    if(domain.schema.registerFields){
                        await commit('cartStore/setDomainSchemaRegisterFields', domain.schema.registerFields, {root: true});
                    }
                    if(domain.schema.spotlights){
                        await commit('cartStore/setDomainSchemaSpotlights', domain.schema.spotlights, {root: true});
                    }
                    if(domain.schema.serverNamespaces){
                        await commit('cartStore/setDomainSchemaServerNamespaces', domain.schema.serverNamespaces, {root: true});
                    }
                    if(domain.schema.renewable){
                        await commit('cartStore/setDomainSchemaRenewableDomains', domain.schema.renewable, {root: true});
                    }
                }
            }

            if(data.domainInfo){
               let info = data.domainInfo;
               
                if(info.domain){
                    await commit('cartStore/setInfoDomain', info.domain, {root: true});
                }

                if(info.spotlight){
                    await commit('cartStore/setInfoSpotlight', info.spotlight, {root: true});
                }

                if(info.transfer){
                    await commit('cartStore/setInfoDomain', info.transfer, {root: true});
                    await commit('cartStore/setInfoTransfer', info.transfer, {root: true});
                }

                if(info.subdomain){
                    await commit('cartStore/setInfoSubDomain', info.subdomain, {root: true});
                }

                if(info.owndomain){
                    await commit('cartStore/setInfoOwn', info.owndomain, {root: true});
                }

                if(info.suggestions){
                    await commit('cartStore/setInfoSuggestions', info.suggestions, {root: true});
                }
            }
        },
    },
};