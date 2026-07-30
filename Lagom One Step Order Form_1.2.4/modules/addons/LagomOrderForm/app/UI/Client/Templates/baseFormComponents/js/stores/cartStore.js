const cartStore = {
    namespaced: true,
    modules: {
        //route: route,
        gatewayHooks: gatewayHooks,
        api: LagomOrderFormApi,
        infoModule: infoModule,
    },
    state: {
        requestParams: {},
        moduleSettings: {},
        url: {},
        isGatewayCharge: false,
        pageUri: null,
        app: {
            sPage: null,
            cart: {
                products: [],
                domains: [],
                addons: [],
            },
            client: {
                exists: false,
            },
            ipAddress:null,
            isIDNDomainsActive: false,
            groups: [],
            orderFields: {},
            groupSection: {},
            $isWhmcs88OrHigher: false,
            requestedPromoCode: '',
            domainCustomFields: {},
            promoCodeErrorMessage: '',
            metricsBilling: {},
            domainForm: {},
            billingDetails: {},
            urlParams: {},
            formType: null,
            domainToSearch: null,
            account_id: null,
            requestedConfigOption : false,
        },
        localStorage: {
            billingDetails: {},
            loginDetails: {},
            ccinfo: 'new',
            ccdescription: '',
            tos: '',
        },
        settings: {
            captcha: {},
            countryDetails: {},
            currencies: {},
            gateways: {},
            lang: {},
            tldCategories: {},
            tldExtensions: {},
            summary: {},
            schema: {
                addons: {},
                billingCycles: {},
                configurableOptions: {},
                customFields: {},
                server: {},
            },
            domain: {
                schema: {
                    addons: {},
                    customFields: {},
                    serverNamespaces: {},
                    registerFields: {},
                    registrationTypes: {},
                    spotlights: {},
                    renewable: {},
                }
            },
            domainInfo: {
                domain: {},
                spotlight: {},
                transfer: {},
                owndomain: {},
                subdomain: {},
                suggestions: {},
            },
            completeOrder: {},
            template: {},
            layoutSettings: {},
        },
        notifications: {},
        alerts: {},
        orderSettings: {},
        previous: {
            sPage: null,
        },
        additionalNotes: [],
        validateErrors: [],
        showElements: {
            newOrderHeader: true,
            products: false,
            cart: false,
            domains: false,
            configurations: false,
            billingDetails: false,
            packageInfo: false,
            paymentMethods: false,
            groups: false,
            addons: false,
            complete: false,
            sectionNumber: false,
            currency: true,
            domainsRegistrant: false,
            globalError: false,
            alert: true,
            promocode: false,
            metricsBilling: false,
            orderFields: false,
            ipLog: false,
        },
        spinners: {
            cart: null,
            domainSearchSpinner: null,
            domainAddSpinner: null,
            initial: null,
            logging: null,
            captcha: null,
            ordering: null,
            page: null,
            productButton: null,
        },
        blockedEvents: {
            fullPage: null,
            logging: null,
            captcha: null,
            formData: null,
        },
        apiError: {},
        areAvailableAddons: false,
        billingDetailsErrors: false,
        billingCycleDuringLoading: '',
        registerPasswords: {
            password: null,
            confirmPassword: null,
        },
        billingDetailsValidFields: {},
        captchaOccurrence: 0,
    },
    mutations: {
        setAppState: function (state, app) {
            Vue.set(state, 'app',Object.assign({},  state.app, app));
        },
        setLocalDetails: function (state, object) {
            Vue.set(state.localStorage, object.name, object.details);
        },
        setGroups: function (state, groups) {
            state.app.groups = groups;
        },
        setCaptcha: function (state, captcha) {
            state.settings.captcha = captcha;
        },
        setCountryDetails: function (state, countryDetails) {
            state.settings.countryDetails = countryDetails;
        },
        setBillingDetailsFields: function (state, billingDetailFields) {
            state.settings.billingDetailFields = billingDetailFields;
        },
        setOrderFields: function (state, fields) {
            state.app.orderFields = fields;
        },
        setAdditionalNotes: function (state, data) {
            state.app.additionalNotes = data;
        },
        setPromoCodeErrorMessage: function (state, data) {
            state.app.promoCodeErrorMessage = data;
        },
        setCurrencies: function (state, currencies) {
            state.settings.currencies = currencies;
        },
        setTemplate: function (state, template) {
            state.settings.template = template;
        },
        setLayoutSettings: function (state, layoutSettings) {
            state.settings.layoutSettings = layoutSettings;
        },
        setGateways: function (state, gateways) {
            state.settings.gateways = gateways;
        },
        setLang: function (state, lang) {
            state.settings.lang = lang;
        },
        setTldCategories: function (state, tldCategories) {
            state.settings.tldCategories = tldCategories;
        },
        setTldExtensions: function (state, extensions) {
            state.settings.tldExtensions = extensions;
        },
        setCartSummary: function (state, summary) {
            state.settings.summary = summary;
        },
        setSchemaAddons: function (state, schema) {
            state.settings.schema.addons = schema;
        },
        setSchemaBillingCycles: function (state, schema) {
            state.settings.schema.billingCycles = schema;
        },
        setSchemaConfigOptions: function (state, schema) {
            state.settings.schema.configurableOptions = schema;
        },
        setSchemaCustomFields: function (state, schema) {
            state.settings.schema.customFields = schema;
        },
        setSchemaServers: function (state, schema) {
            state.settings.schema.server = schema;
        },
        setDomainSchemaRegistrationTypes: function (state, schema) {
            state.settings.domain.schema.registrationTypes = schema;
        },
        setDomainSchemaAddons: function (state, schema) {
            state.settings.domain.schema.addons = schema;
        },
        setDomainSchemaCustomFields: function (state, schema) {
            state.settings.domain.schema.customFields = schema;
        },
        setDomainSchemaRegisterFields: function (state, schema) {
            state.settings.domain.schema.registerFields = schema;
        },
        setDomainSchemaSpotlights: function (state, schema) {
            state.settings.domain.schema.spotlights = schema;
        },
        setDomainSchemaServerNamespaces: function (state, schema) {
            state.settings.domain.schema.serverNamespaces = schema;
        },
        setDomainSchemaRenewableDomains: function (state, schema) {
            state.settings.domain.schema.renewable = schema;
        },
        setBillingCycle: function (state, cycle) {
            state.app.cart.products[state.app.productKey]['billingcycle'] = cycle;
        },
        setPageUri: function (state, uri) {
            state.pageUri = uri;
        },
        setClientDetails: function (state, clientDetails) {
            state.app.client = clientDetails
        },
        updateNotifications: function (state, notifications) {
            notifications.foreach(function (element) {
                if (!state.notifications.find(notif => notif.message === element.message))
                {
                    state.notifications.push(element);
                }
            })
        },
        setDomainRegistrationType: function (state, type) {
            state.app.domainRegType = type;
        },
        setInfoDomain: function (state, details) {
            state.settings.domainInfo.domain = details;
        },
        setInfoSubDomain: function (state, details) {
            state.settings.domainInfo.subdomain = details;
        },
        setInfoSpotlight: function (state, details) {
            state.settings.domainInfo.spotlight = details;
        },
        setInfoTransfer: function (state, details) {
            state.settings.domainInfo.transfer = details;
        },
        setInfoOwn: function (state, details) {
            state.settings.domainInfo.owndomain = details;
        },
        setInfoSuggestions: function (state, details) {
            state.settings.domainInfo.suggestions = details;
        },
        setCompleteOrderDetails: function (state, payload) {
            state.settings.completeOrder = payload;
        },
        setGatewayChargeFlag: function (state,isCharge) {
            state.isGatewayCharge = isCharge;
        },
        setAccountId: function (state, payload) {

        },
        clearSpinnersAndEvents: function (state) {
            state.spinners = {
                cart: null,
                domainSearchSpinner: null,
                domainAddSpinner: null,
                initial: null,
                logging: null,
                captcha: null,
                ordering: null,
                page: null,
            };
            state.blockedEvents = {
                fullPage: null,
                logging: null,
                captcha: null,
            };
        },
        setSPage: function (state, uri) {
            state.sPage = uri;
        },
        setLastSPage: function (state, sPage) {
            state.previous.sPage = sPage;
        },
        setModuleParams: function (state, payload) {
            state.moduleSettings = payload;
        },
        initURLObject: function (state) {
            state.url = new URL(window.location.href);
        },
        setRequestParams: function (state, payload) {
            state.requestParams = payload;
        },
        setSelectedConfigurationFormData: function (state, formData) {
            state.selectedConfigurations.formData = formData;
        },
        setComponentsConfiguration: function (state, data) {
            state.componentsConfiguration = data;
        },
        setPageType: function (state, type) {
            state.pageType = type;
        },
        setFormType: function (state, type) {
            state.formType = type;
        },
        setSelectedApplyCredits: function (state, value) {
            state.app.applyCredits = value;
        },
        /** Spinners **/
        pushSpinner: function (state, params) {
            state.spinners[params.spinner] = state.spinners[params.spinner] + 10;
        },
        popSpinner: function (state, params) {
            state.spinners[params.spinner] = (state.spinners[params.spinner] > 0) ? state.spinners[params.spinner] - 10 : 0;
        },
        pushBlockEvent: function (state, params) {
            state.blockedEvents[params.event] = state.blockedEvents[params.event] + 10;
        },
        popBlockEvent: function (state, params) {
            state.blockedEvents[params.event] = (state.blockedEvents[params.event] > 0) ? state.blockedEvents[params.event] - 10 : 0;
        },
        showComponent: function (state, name) {
            state.showElements[name] = true;
        },
        hideComponent: function (state, name) {
            state.showElements[name] = false;
        },
        pushValidateError: function (state, data) {
            if (data.id === undefined)
            {
                throw new Error('field id is empty')
            }
            const exists = state.validateErrors.find(item => item.id === data.id);
            if (!exists)
            {
                state.validateErrors.push(data);
            }
        },
        popValidateError: function (state, id) {
            state.validateErrors = state.validateErrors.filter(item => item.id !== id);
        },
        clearValidators: function (state) {
            state.validateErrors = [];
            state.settings.completeOrder = null;
            state.alerts = {};
        },
        setApiError: function (state, data) {
            state.apiError = data;
        },
        addAlert: function (state, alert) {
            Vue.set(state.alerts, alert.type, alert.message);
        },
        removeAlert: function (state, alert) {
            if(state.alerts) {
                Vue.set(state.alerts, alert.type, false);
            }
        },
        setAvailableAddons: function (state, data) {
            if (data.data)
            {
                state.areAvailableAddons = true
            } else if (!data.data && data.isSectionVisible)
            {
                state.areAvailableAddons = true
            } else
            {
                state.areAvailableAddons = false
            }
        },
        setBillingDetailsErrors: function (state, data) {
            state.billingDetailsErrors = data
        },
        setBillingCycleDuringLoading: function (state, data) {
            state.billingCycleDuringLoading = data
        },
        setRegisterPassword: function (state, data) {
            state.registerPasswords.password = data
        },
        setRegisterConfirmPassword: function (state, data) {
            state.registerPasswords.confirmPassword = data
        },
    },
    actions: {
        showValidation({state, commit, dispatch, getters})
        {
            let firstWithError = null;
            let elementPositionTop = 0
            state.validateErrors.map(element => {
                let el = document.getElementById(element.id);
                if (el && (firstWithError == null || (el.getBoundingClientRect().top < firstWithError.getBoundingClientRect().top)))
                {
                    elementPositionTop = el.getBoundingClientRect().top
                    firstWithError = el;
                }
            });
            
            if (firstWithError)
            {
                window.scrollTo({
                    behavior: 'smooth',
                    top: firstWithError.getBoundingClientRect().y ? firstWithError.getBoundingClientRect().top + window.scrollY - 120 : firstWithError.getBoundingClientRect().top + window.scrollY
                })
                // firstWithError.scrollIntoView({behavior: 'smooth', block: 'start'});
            }
        },
        async init({state, commit, dispatch, getters}, {settings: settings})
        {
            await commit('pushSpinner', {spinner: 'page'});
            await commit('pushBlockEvent', {spinner: 'fullPage'});
            await dispatch('setInitialDetails', settings);
            await dispatch('api/loadPageConfiguration', getters.getInitialParamsFromUrl());
            await dispatch('checkSinglePage');
            await dispatch('handleCustomUrls');
            await commit('popSpinner', {spinner: 'page'});
            await commit('popBlockEvent', {event: 'fullPage'});
            await dispatch('removeInitialLoader', settings);
            await dispatch('handleShowCartButton');
            await dispatch('handleEmptyDomainConfiguration');
        },
        async setInitialDetails({state, commit, dispatch}, settings)
        {
            await commit('setComponentsConfiguration', settings.componentsConfiguration);// example tos enabled, tos link, tax as vat, ...
            commit('setModuleParams', settings.moduleSettings);
            commit('initURLObject');
            commit('setRequestParams', settings.requestParams);
            commit('setPageUri', settings.baseUrl);
            commit('setPageType', settings.pageType);
            commit('setFormType', settings.formType);
            
        },
        async changeGroup({state, commit, dispatch, getters}, groupId)
        {
            await commit('pushBlockEvent', {event: 'fullPage'});
            await commit('pushSpinner', {spinner: 'page'});
            await commit('clearValidators');
            
            await dispatch('api/changeGroup', {group: groupId}).then(async () => {
                await dispatch('checkSinglePage');
            }).catch(async () => {
            });
            await dispatch('clearValidators');
            await commit('popBlockEvent', {event: 'fullPage'});
            await commit('popSpinner', {spinner: 'page'});
        },
        async checkSinglePage({state, commit, dispatch, getters})
        {
            if (state.previous.sPage !== state.app.sPage)
            {
                commit('setLastSPage', state.app.sPage);
                await dispatch('route/goTo', state.app.sPage);
            }
            
            await dispatch('updateURI');
        },
        async removeInitialLoader({state, commit, dispatch, getters})
        {
            const mgIntegration = jQuery(LagomOrderFormContainer.integrationTarget);
            // mgIntegration.find('#one-page-order-init-loader').remove();
            mgIntegration.find('#one-page-order-init-loader').addClass('hidden');
            mgIntegration.find('#' + LagomOrderFormContainer.containerId).attr('hidden', false);
        },
        async handleShowCartButton({state, commit, dispatch, getters})
        {
            // $('#Secondary_Navbar-View_Cart').click(async function(event){
            //     event.preventDefault();
            //     await dispatch('changeGroup', getters.getDefaultGroupId());
            // });
        },
        async handleEmptyDomainConfiguration({state, commit, dispatch, getters})
        {
            let domains = getters.isVisible('domains');
        },
        async handleCustomUrls({state, commit, dispatch, getters})
        {
            return;
            
            const params = {
                'ordertype': 'formType',
            };
            
            for (key in params)
            {
                let param = state.url.searchParams.get(key);
                if (param)
                {
                    state[params[key]] = param;
                }
            }
        },
        updateURI({state, commit, dispatch, getters})
        {
            let baseUrl = state.pageUri;
            if (state.app.urlParams.friendlyUrl)
            {
                baseUrl += state.app.urlParams.friendlyUrl;
            }
            
            let urlParams = '';
            
            if (typeof state.app.urlParams.query === 'string')
            {
                urlParams += state.app.urlParams.query;
            } else if (typeof state.app.urlParams.query === 'object')
            {
                urlParams += Object.keys(state.app.urlParams.query).map(function (k)
                {
                    return k + '=' + state.app.urlParams.query[k];
                }).join('&');
            }
            const url = baseUrl + (urlParams ? '?' + urlParams : '');
            
            window.history.pushState({page: 'singlePage'}, 'sing page redirect', url);
        },
        async changeProduct({state, commit, dispatch, getters}, productId)
        {
            await commit('pushBlockEvent', {event: 'fullPage'});
            await commit('pushSpinner', {spinner: 'productButton'});
            await commit('pushSpinner', {spinner: 'cart'});
            await commit('clearValidators');
            
            await dispatch('api/changeProduct', {productId});
            await dispatch('clearValidators');
            
            await commit('popBlockEvent', {event: 'fullPage'});
            await commit('popSpinner', {spinner: 'productButton'});
            await commit('popSpinner', {spinner: 'cart'});
            await dispatch('checkSinglePage');
            renderNavScroll();
        },
        async changeBillingCycle({state, commit, dispatch, getters}, cycle)
        {
            await commit('pushBlockEvent', {event: 'fullPage'});
            await commit('pushSpinner', {spinner: 'cart'});
            await commit('setBillingCycle', cycle);
            
            await dispatch('api/changeBillingCycle', {cycle})
            
            await commit('popBlockEvent', {event: 'fullPage'});
            await commit('popSpinner', {spinner: 'cart'});
        },
        async updateConfigurableOptions({state, commit, dispatch, getters}, data)
        {
            await commit('pushBlockEvent', {event: 'fullPage'});
            await commit('pushSpinner', {spinner: 'cart'});
            await dispatch('api/updateConfigurableOptions', data)
                .then(async () => {
                })
                .catch(async () => {
                });
            await commit('popBlockEvent', {event: 'fullPage'});
            await commit('popSpinner', {spinner: 'cart'});
        },
        async updateServerFields({state, commit, dispatch, getters}, data)
        {
            await dispatch('api/updateServerFields', data)
                .then(async () => {
                })
                .catch(async () => {
                });
        },
        async updateCustomFields({state, commit, dispatch, getters}, data)
        {
            await dispatch('api/updateCustomFields', data)
                .then(async () => {
                })
                .catch(async () => {
                });
        },
        async addProductAddon({state, commit, dispatch, getters}, data)
        {
            await commit('pushBlockEvent', {event: 'fullPage'});
            await commit('pushSpinner', {spinner: 'cart'});
            await dispatch('api/addProductAddon', data)
                .then(async () => {
                })
                .catch(async () => {
                });
            await commit('popBlockEvent', {event: 'fullPage'});
            await commit('popSpinner', {spinner: 'cart'});
        },
        async changeProductAddon({state, commit, dispatch, getters}, data)
        {
            await commit('pushBlockEvent', {event: 'fullPage'});
            await commit('pushSpinner', {spinner: 'cart'});
            await dispatch('api/changeProductAddon', data)
                .then(async () => {
                })
                .catch(async () => {
                });
            await commit('popBlockEvent', {event: 'fullPage'});
            await commit('popSpinner', {spinner: 'cart'});
        },
        async deleteProductAddon({state, commit, dispatch, getters}, data)
        {
            await commit('pushBlockEvent', {event: 'fullPage'});
            await commit('pushSpinner', {spinner: 'cart'});
            await dispatch('api/deleteProductAddon', data)
                .then(async () => {
                })
                .catch(async () => {
                });
            await commit('popBlockEvent', {event: 'fullPage'});
            await commit('popSpinner', {spinner: 'cart'});
        },
        async deleteAddon({state, commit, dispatch, getters}, data)
        {
            await commit('pushBlockEvent', {event: 'fullPage'});
            await commit('pushSpinner', {spinner: 'cart'});
            await dispatch('api/deleteAddon', data)
                .then(async () => {
                })
                .catch(async () => {
                });
            await commit('popBlockEvent', {event: 'fullPage'});
            await commit('popSpinner', {spinner: 'cart'});
        },
        async updateBillingCountryDetails({state, commit, dispatch, getters}, data)
        {
            let details = getters.getAppBillingDetails()
            details.country = data.details.country
            details.state = data.details.state
            await commit('pushSpinner', {spinner: 'cart'});
            await dispatch('api/updateBillingDetails', details)
                .then(async () => {
                })
                .catch(async () => {
                });
            await commit('popSpinner', {spinner: 'cart'});
        },
        async updateDomainContactCountryDetails({state, commit, dispatch, getters}, data)
        {
            let details = getters.getDomainContactDetails()
            details.country = data.details.country
            details.state = data.details.state
            await commit('pushSpinner', {spinner: 'cart'});
            await dispatch('api/updateDomainContactDetails', details)
                .then(async () => {
                })
                .catch(async () => {
                });
            await commit('popSpinner', {spinner: 'cart'});
        },
        async updateBillingDetails({state, commit, dispatch, getters}, data)
        {
            await dispatch('api/updateBillingDetails', data)
                .then(async () => {
                })
                .catch(async () => {
                });
        },
        async updateOrderFields({state, commit, dispatch, getters}, fields)
        {
            await dispatch('api/updateOrderFields', {fields})
        },
        updateCreditCardInfo({state, commit, dispatch, getters}, value)
        {
            //todo: update in backend if needed
            commit('setLocalDetails', {name: 'ccinfo', details: value});
        },
        updateCreditCardDescription({state, commit, dispatch, getters}, value)
        {
            //todo: update in backend if needed
            commit('setLocalDetails', {name: 'ccdescription', details: value});
        },
        updateBillingDetailsLocal({state, commit, dispatch, getters}, details)
        {
            commit('setLocalDetails', {name: 'billingDetails', details});
        },
        async changePaymentGateway({state, commit, dispatch, getters}, details)
        {
            await commit('pushBlockEvent', {event: 'fullPage'});
            await commit('pushSpinner', {spinner: 'cart'})
            
            await dispatch('api/changeGateway', details)
                .then(async () => {
                })
                .catch(async () => {
                });
            
            await commit('popSpinner', {spinner: 'cart'})
            await commit('popBlockEvent', {event: 'fullPage'});
        },
        async confirmCaptcha({state, commit, dispatch, getters}, data)
        {
            let resp = {};
            await commit('pushBlockEvent', {event: 'captcha'});
            await commit('pushSpinner', {spinner: 'captcha'})
            await dispatch('api/confirmCaptcha', data)
                .then(response => {
                    resp = response;
                })
                .catch(async () => {
                });
            await commit('popSpinner', {spinner: 'captcha'})
            await commit('popBlockEvent', {event: 'captcha'});
            return resp;
        },
        async clearValidateErrors({state, commit, dispatch, getters})
        {
            await commit('clearValidators');
            await mgEventHandler.runCallback('RefreshAlertState', null, {})
        },
        setDomainRegistrationType({state, commit, dispatch, getters}, type)
        {
            if (type != state.app.domainRegType)
            {
                commit('setDomainRegistrationType', type);
                dispatch('api/changeDomainRegistrationType', {type});
            }
        },
        updateDomainContactDetails({state, commit, dispatch, getters}, details)
        {
            dispatch('api/updateDomainContactDetails', details)
                .then(() => {
                })
                .catch(response => {
                });
        },
        updateNote({state, commit, dispatch, getters}, details)
        {
            dispatch('api/updateTextNotes', details)
                .then(() => {
                })
                .catch(response => {
                });
        },
        updateMarketingEmail({state, commit, dispatch, getters}, details)
        {
            dispatch('api/updateMarketingEmails', details)
                .then(() => {
                })
                .catch(response => {
                });
        },
        updateAccountId({state, commit, dispatch, getters}, details)
        {
            state.app.account_id = details.val;
        },
        updateTermOfService({state, commit, dispatch, getters}, value)
        {
            //todo: update in backend if required
            commit('setLocalDetails', {name: 'tos', details: value});
        },
        async addPromocode({state, commit, dispatch, getters}, details)
        {
            await commit('pushBlockEvent', {event: 'fullPage'});
            await commit('pushSpinner', {spinner: 'cart'});
            await dispatch('api/addPromoCode', details)
                .then(() => {
                    commit('removeAlert', {type: 'promo'})
                })
                .catch(response => {
                    commit('addAlert', {type: 'promo', message: response.message})
                });
            await commit('popSpinner', {spinner: 'cart'})
            await commit('popBlockEvent', {event: 'fullPage'});
        },
        async removePromocode({state, commit, dispatch, getters}, details)
        {
            await commit('pushBlockEvent', {event: 'fullPage'});
            await commit('pushSpinner', {spinner: 'cart'});
            await dispatch('api/removePromoCode', details)
                .then(() => {
                    commit('removeAlert', {type: 'promo'})
                })
                .catch(response => {
                    commit('addAlert', {type: 'promo', message: response.message})
                });
            await commit('popSpinner', {spinner: 'cart'})
            await commit('popBlockEvent', {event: 'fullPage'});
        },
        async changeCurrency({state, commit, dispatch, getters}, details)
        {
            await commit('pushBlockEvent', {event: 'fullPage'});
            await commit('pushSpinner', {spinner: 'cart'});
            await dispatch('api/changeCurrency', details)
                .then(() => {
                })
                .catch(response => {
                });
            await commit('popSpinner', {spinner: 'cart'})
            await commit('popBlockEvent', {event: 'fullPage'});
        },
        async addProduct({state, commit, dispatch, getters}, pid)
        {
            console.log('in progress..');
            console.log('If you want to add new product, add the body request.');
            console.log('If you want to change the product, use the changeProduct method ');
        },
        async orderAddon({state, commit, dispatch, getters}, data)
        {
            await commit('pushBlockEvent', {event: 'fullPage'});
            await commit('pushSpinner', {spinner: 'cart'});
            
            await dispatch('api/addAddon', data)
                .then(() => {
                })
                .catch(() => {
                });
            await dispatch('checkSinglePage');
            await commit('popSpinner', {spinner: 'cart'});
            await commit('popBlockEvent', {event: 'fullPage'});
        },
        
        async addDomainAddon({state, commit, dispatch, getters}, aid)
        {
            await commit('pushBlockEvent', {event: 'fullPage'});
            await commit('pushSpinner', {spinner: 'cart'});
            let formData = getters.getDomainAddonsFormData();
            formData[aid] = 'on';
            await dispatch('api/updateDomainAddons', {addons: formData})
                .then(() => {
                })
                .catch(() => {
                });
            await dispatch('checkSinglePage');
            await commit('popSpinner', {spinner: 'cart'});
            await commit('popBlockEvent', {event: 'fullPage'});
        },
        async deleteDomainAddon({state, commit, dispatch, getters}, aid)
        {
            await commit('pushBlockEvent', {event: 'fullPage'});
            await commit('pushSpinner', {spinner: 'cart'});
            let formData = getters.getDomainAddonsFormData();
            formData[aid] = null;
            await dispatch('api/updateDomainAddons', {addons: formData})
                .then(() => {
                })
                .catch(() => {
                });
            await dispatch('updateDomainAddons', formData);
            await commit('popSpinner', {spinner: 'cart'});
            await commit('popBlockEvent', {event: 'fullPage'});
            
        },
        async addDomain({state, commit, dispatch, getters}, {type: type, domain: domain, year: year})
        {
            await commit('pushBlockEvent', {event: 'fullPage'});
            await commit('pushSpinner', {spinner: 'cart'})
            await commit('pushSpinner', {spinner: 'domainAddSpinner'})
            if(type == 'own' || type == 'subdomain') {
                await commit('pushSpinner', {spinner: 'domainSearchSpinner'});
            }

            const data = {type: type, domain: domain, period: year};
            await dispatch('api/addDomain', data)
                .then(() => {
                })
                .catch(() => {
                });
            
            await commit('popSpinner', {spinner: 'cart'});
            await commit('popSpinner', {spinner: 'domainAddSpinner'})
            if(type == 'own' || type == 'subdomain') {
                await commit('popSpinner', {spinner: 'domainSearchSpinner'});
            }
            await commit('popBlockEvent', {event: 'fullPage'});
            //await dispatch('route/goTo', 'nextStep')
            await dispatch('checkSinglePage');
        },
        async changePeriod({state, commit, dispatch, getters}, {type: type, domain: domain, year: year})
        {
            await commit('pushBlockEvent', {event: 'fullPage'});
            await commit('pushSpinner', {spinner: 'cart'})
            await commit('pushSpinner', {spinner: 'domainAddSpinner'})
            const data = {type: type, domain: domain, period: year};
            
            await dispatch('api/changePeriod', data)
                .then(() => {
                })
                .catch(() => {
                });
            
            await commit('popSpinner', {spinner: 'cart'});
            await commit('popSpinner', {spinner: 'domainAddSpinner'})
            await commit('popBlockEvent', {event: 'fullPage'});
            //await dispatch('route/goTo', 'nextStep')
            await dispatch('checkSinglePage');
        },
        async updateDomain({state, commit, dispatch, getters}, data)
        {
            await dispatch('api/updateDomain', data);
            await dispatch('checkSinglePage');
        },
        async removeDomain({state, commit, dispatch, getters}, data)
        {
            await commit('pushBlockEvent', {event: 'fullPage'});
            await commit('pushSpinner', {spinner: 'cart'});
            await dispatch('api/removeDomain', data);
            state.settings.domain.schema.registerFields = {}
            state.validateErrors = []
            await dispatch('checkSinglePage');
            await commit('popSpinner', {spinner: 'cart'});
            await commit('popBlockEvent', {event: 'fullPage'});
        },
        
        async renewDomain({state, commit, dispatch, getters}, data)
        {
            await commit('pushBlockEvent', {event: 'fullPage'});
            await commit('pushSpinner', {spinner: 'cart'})
            
            await dispatch('api/renewDomain', data)
                .then(() => {
                })
                .catch(() => {
                });
            
            await dispatch('checkSinglePage');
            await commit('popSpinner', {spinner: 'cart'});
            await commit('popBlockEvent', {event: 'fullPage'});
        },
        async removeDomainRenew({state, commit, dispatch, getters}, data)
        {
            await commit('pushBlockEvent', {event: 'fullPage'});
            await commit('pushSpinner', {spinner: 'cart'})
            
            await dispatch('api/deleteRenewDomain', data)
                .then(() => {
                })
                .catch(() => {
                });
            
            await dispatch('checkSinglePage');
            await commit('popSpinner', {spinner: 'cart'});
            await commit('popBlockEvent', {event: 'fullPage'});
        },
        async loadDomainInformation({state, commit, dispatch}, data)
        {
            await commit('pushBlockEvent', {event: 'fullPage'});
            await commit('pushSpinner', {spinner: 'domainSearchSpinner'});
            await commit('pushSpinner', {spinner: 'cart'});
            await dispatch('disableDomainSectionAvailableComponent', 'suggestions');
            await dispatch('api/checkDomain', data);
            
            await commit('popSpinner', {spinner: 'domainSearchSpinner'});
            await commit('popSpinner', {spinner: 'cart'});
            await commit('popBlockEvent', {event: 'fullPage'});
        },
        async disableDomainSectionAvailableComponent({state, commit, dispatch, getters}, name)
        {
            let regTypes = getters.getDomainRegTypes();
            let section = regTypes[getters.getDomainRegistrationType()];
            if (section === undefined)
            {
                return true;
            }
            if (section.supportedComponents === undefined)
            {
                return true;
            }
            
            let index = section.supportedComponents.indexOf(name);
            if (index === -1)
            {
                return true;
            }
            section.supportedComponents.splice(index, 1);
            regTypes[getters.getDomainRegistrationType()] = section;
            commit('setDomainSchemaRegistrationTypes', regTypes);
            
            return true;
        },
        async completeOrder({state, commit, dispatch, getters})
        {

            await commit('pushBlockEvent', {event: 'fullPage'});
            await commit('pushSpinner', {spinner: 'ordering'});
            await commit('clearValidators')
            try{
                await mgEventHandler.runCallback('PreCompleteOrder', null, {})
                    .then((resp) => {
                        if (state.validateErrors.length > 0)
                        {
                            throw Error(state.validateErrors);
                        }
                        });
                orderModel.buildRequest(this);
                const client = getters.getClient()
                if (getters.getApplyCreditsStatus() !== 1 || client && client.credit.numeric < getters.getCartSummary().total.numeric) {

                    const resp = await dispatch('gatewayHooks/runHookGatewayPreOrderFunction', orderModel.getRequestDetails());
                    if (resp !== undefined && resp.validation_feedback && getters.getCartSummary().total.numeric > 0) {
                        await dispatch('api/validateStripe', {message: resp.validation_feedback})
                    }

                    let gatewayFormData = await dispatch('gatewayHooks/runHookGatewayFormData');
                    orderModel.addGatewayParams(gatewayFormData);
                }
            }
            catch(error)
            {
                await commit('popSpinner', {spinner: 'ordering'});
                await commit('popBlockEvent', {event: 'fullPage'});
                return dispatch('showValidation');
            }
            await dispatch('api/complete', orderModel.getRequestDetails());
            await dispatch('afterCompleteOrder')
            await commit('popSpinner', {spinner: 'ordering'})
            await commit('popBlockEvent', {event: 'fullPage'});
            return true;
        },
        async afterCompleteOrder({state, commit, dispatch, getters})
        {
            const details = getters.getCompleteOrderDetails();
            if (!details || details.status == 'error')
            {
                mgEventHandler.runCallback('ReloadBillingDetails');
                return;
            }
            //todo error
            if (details.redirectionType === 'on' || (details.redirectionType === 'gateway' && !details.redirectButton && details.invoiceId))
            {
               // window.location.href = state.moduleSettings.mainEndpoint + 'viewinvoice.php?id=' + details.invoiceId;
               window.location.href = state.moduleSettings.mainEndpoint + `index.php?rp=/invoice/${details.invoiceId}/pay`;
            } else
            {
                await dispatch('route/goTo', 'complete');
            }
        },
        async loadUserData({state, commit, dispatch, getters}, params)
        {
            await commit('pushBlockEvent', {event: 'logging'});
            await commit('pushSpinner', {spinner: 'logging'});
            await commit('pushSpinner', {spinner: 'cart'})
            await dispatch('api/getUserAccount')
                .then(() => {
                })
                .catch(() => {
                });
            await commit('popSpinner', {spinner: 'logging'});
            await commit('popSpinner', {spinner: 'cart'})
            await commit('popBlockEvent', {event: 'logging'});
        },
        async loginUser({state, commit, dispatch, getters}, params)
        {
            await commit('pushBlockEvent', {event: 'logging'});
            await commit('pushSpinner', {spinner: 'logging'})
            await commit('pushSpinner', {spinner: 'cart'})
            let data = await dispatch('api/loginUser', params)
                .then(response => {
                    return response;
                })
                .catch(err => {
                    if (err.status)
                    {
                        return err;
                    }
                    return {status: 'error'};
                });
            await commit('popSpinner', {spinner: 'logging'});
            await commit('popSpinner', {spinner: 'cart'})
            await commit('popBlockEvent', {event: 'logging'});
            return data;
        },
        async applyCredits({state, commit, dispatch, getters}, details)
        {
            await commit('setSelectedApplyCredits', details.applyCredits);
            await dispatch('api/updateApplyCredits', details)
                .then()
                .catch();
        },
        async updateBillingAccount({state, commit, dispatch, getters}, details)
        {
            await dispatch('api/updateBillingAccount', {account_id: details.id, token: csrfToken}).then(async () => {
                await dispatch('api/changeUserAccount', {account_id: details.id}).then(() => {
                }).catch(() => {
                });
            }).catch(() => {
            });
        },
        infoLog: function ({state, commit, dispatch}, {message: message}) {
            dispatch('infoModule/infoLog', {message: message})
        },
        errorLog: function ({state, commit, dispatch}, {message: message, response: response}) {
            dispatch('infoModule/errorLog', {message: message, response: response})
        },
    },
    getters: {
        isVisible: state => function (index) {
            return state.showElements[index] === true && !(state.spinners['page'] > 1);
        },
        getAppItemKey: state => function () {
            return Number.isInteger(state.app.productKey) ? 0 : state.app.productKey;
        },
        getGroups: state => function () {
            return state.app.groups ? state.app.groups : [];
        },
        getDefaultGroupId: state => function () {
            return !pageOrderIsObjectEmpty(state.app.groups) ? state.app.groups.find(group => group).id : false;
        },
        getSelectedGroupId: (state, getters) => function () {
            if(state.app.group)
            {
                return state.app.group;
            }
            
            if(getters.getGroupBySelectedProductId())
            {
                return getters.getGroupBySelectedProductId();
            }
            
            return getters.getDefaultGroupId();
        },
        getAppBillingDetails: (state, getters) => function () {
            return state.app.billingDetails ? state.app.billingDetails : false;
        },
        getGroupByIdOrDefault: (state, getters) => function (id) {
            let group = getters.getGroupById(id);
            return group ? group : getters.getGroupById(getters.getDefaultGroupId());
        },
        getSelectedGroupByIdOrBestMatch: (state, getters) => function (id) {
            return getters.getGroupById(id) ? getters.getGroupById(id) : getters.getGroupById(getters.getSelectedGroupId());
        },
        getGroupBySelectedProductId: (state, getters) => function ()
        {
            const selectedProduct = getters.getSelectedProduct();
            
            if (!selectedProduct)
            {
                return null;
            }
            const gid = selectedProduct.gid;
            return getters.getGroupById(gid);
        },
        getGroupById: state => function (id) {
            return state.app.groups.find(group => group.id == id);
        },
        getCurrentGroup: (state, getters) => function () {
            const group = getters.getSelectedGroupByIdOrBestMatch(getters.getSelectedGroupId());
            return group ? group : false;
        },
        getGroupProducts: (state, getters) => function () {
            const group = getters.getCurrentGroup()
            if (group && group.products !== undefined && group.products !== null)
            {
                const groupProductsArray = Object.keys(group.products).map(key => group.products[key]);
                if (groupProductsArray.length) {
                    let visibleProducts = []
                    if (group.type == 'addons')
                    {
                        visibleProducts = groupProductsArray
                    } else {
                        visibleProducts = groupProductsArray.filter(product => product.hidden == 0 || (state.app.cart.products[0] && product.id == state.app.cart.products[0].pid));
                    }
                    return visibleProducts ? visibleProducts : [];
                }
            }
            return [];
        },
        getGroupProductById: (state, getters) => function (id) {
            let products = getters.getGroupProducts();
            return products ? products.find(product => product.id == id) : false;
        },
        getCurrencies: state => function () {
            return state.settings.currencies ? state.settings.currencies : [];
        },
        getDefaultCountry: state => function () {
            if (state.app.client.exists && state.app.client.type === 'logged') {
                return state.app.client.country;
            } else {
                return state.settings.countryDetails.defaultCountry ? state.settings.countryDetails.defaultCountry : false;
            }
        },
        getTemplate: state => function () {
            return state.settings.template ? state.settings.template : '';
        },
        getLayoutSettings: state => function () {
            return state.settings.layoutSettings ? state.settings.layoutSettings : {};
        },
        getSelectedProduct: (state, getters) => function () {
            let itemKey = getters.getAppItemKey();
            return itemKey !== false ? getters.getCartProductByKey(itemKey) : false;
        },
        getSelectedProductDetails: (state, getters) => function () {
            let itemKey = getters.getAppItemKey();
            let product = itemKey !== false ? getters.getCartProductByKey(itemKey) : false;
            return product ? getters.getGroupProductById(product.pid) : false;
        },
        getSelectedProductDetailsValue: (state, getters) => function (option) {
            const product = getters.getSelectedProductDetails();
            return product ? product[option] : null;
        },
        getSelectedProductCycle: (state, getters) => function () {
            const productDetails = getters.getSelectedProductDetails()

            let defaultCycle = productDetails && productDetails.pricing ? Object.keys(productDetails.pricing)[0] : 'monthly';
            //const
            if (state.settings.layoutSettings.highestBillingPeriod) {
                defaultCycle = Object.keys(state.settings.schema.billingCycles)[Object.keys(state.settings.schema.billingCycles).length - 1]
            }
            let payType = getters.getSelectedProductDetailsValue('paytype');
            if (payType === 'onetime') {
                return defaultCycle;
            }
            let product = getters.getSelectedProduct();
            if (product && product.billingcycle && !Object.keys(state.settings.schema.billingCycles).includes(product.billingcycle)) {
                return Object.keys(productDetails.pricing)[0]
            }

            return (product && product.billingcycle) ? product.billingcycle : defaultCycle;
        },
        getSelectedProductId: (state, getters) => function () {
            let product = getters.getSelectedProduct();
            return product ? product.pid : false;
        },
        getSelectedRenewDomains: (state) => function () {
            return state.app.cart.renewals ? state.app.cart.renewals : {};
        },
        getSelectedAddons: (state) => function () {
            return state.app.cart.addons ? state.app.cart.addons : {};
        },
        getSelectedCurrencyId: state => function () {
            return state.app.currency ? state.app.currency.id : false;
        },
        getSelectedCurrency: (state, getters) => function () {
            return state.app.currency ? state.app.currency : getters.getDefaultCurrency();
        },
        getCurrencyById: state => function (id) {
            return state.settings.currencies.find(currency => currency.id == id)
        },
        getDefaultCurrency: state => function () {
            return state.app.currency ? state.app.currency : null;
        },
        getCartProductByKey: state => function (key) {
            return state.app.cart.products[key] ? state.app.cart.products[key] : false;
        },
        getCartDomainByKey: state => function (key) {
            return state.app.cart.domains[key] ? state.app.cart.domains[key] : false;
        },
        getCartSummary: state => function () {
            return state.settings.summary ? state.settings.summary : {};
        },
        getCaptchaSettings: state => function () {
            return state.settings.captcha ? state.settings.captcha : {};
        },
        getCaptchaConfirmation: state => function () {
            return state.app.captcha.confirmed ? state.app.captcha.confirmed : false;
        },
        getPromo: state => function () {
            return state.settings.promo ? state.settings.promo : false;
        },
        getBillingCycles: state => function () {
            return state.settings.schema.billingCycles ? state.settings.schema.billingCycles : false;
        },
        getOrderFields: state => function () {
            return state.app.orderFields ? state.app.orderFields : false;
        },
        getDomainCustomFields: state => function () {
            return state.app.domainCustomFields ? state.app.domainCustomFields : false;
        },
        getGroupSection: state => function () {
            return state.app.groupSection ? state.app.groupSection : false;
        },
        getGatewayChargeFlag: state => function () {
            return state.isGatewayCharge;
        },
        getAdditionalNotes: state => function () {
            return state.app.additionalNotes ? state.app.additionalNotes : false;
        },
        getIpAddress: state => function () {
            return state.app.ipAddress ? state.app.ipAddress : false;
        },
        getMetricsBilling: state => function () {
            return state.app.metricsBilling ? state.app.metricsBilling : false;
        },
        getRequestedPromoCode: state => function () {
            return state.app.requestedPromoCode ? state.app.requestedPromoCode : false;
        },
        isWhmcs88OrHigher: state => function () {
            return state.app.isWhmcs88OrHigher ? state.app.isWhmcs88OrHigher : false;
        },
        getRequestedConfigOption: state => function () {
            return state.app.requestedConfigOption ? state.app.requestedConfigOption : false;
        },
        getPromoCodeErrorMessage: state => function () {
            return state.app.promoCodeErrorMessage ? state.app.promoCodeErrorMessage : false;
        },
        getProductAddons: state => function () {
            return state.settings.schema.addons ? state.settings.schema.addons : [];
        },
        getProductConfigurableOptions: state => function () {
            return state.settings.schema.configurableOptions ? state.settings.schema.configurableOptions : false;
        },
        getConfigurableOptionsFormData: (state, getters) => function () {
            let product = getters.getSelectedProduct();
            return product ? Object.assign({}, product.configoptions) : false;
        },
        getCustomFieldsFormData: (state, getters) => function () {
            let product = getters.getSelectedProduct();
            return product ? Object.assign({}, product.customfields) : false;
        },
        getServerFieldsFormData: (state, getters) => function () {
            let product = getters.getSelectedProduct();
            return product ? Object.assign({}, product.server) : false;
        },
        getProductAddonsFormData: (state, getters) => function () {
            let product = getters.getSelectedProduct();
            return product ? product.addons : false;
        },
        getProductServerFields: state => function () {
            return state.settings.schema.server ? state.settings.schema.server : false;
        },
        getProductCustomFields: state => function () {
            return state.settings.schema.customFields ? state.settings.schema.customFields : false;
        },
        getBillingDetailsSchema: state => function () {
            return state.settings.billingDetailFields.schema ? state.settings.billingDetailFields.schema : false;
        },
        getBillingDetailsOptionalFields: state => function () {
            return state.settings.billingDetailFields.optionalFields ? state.settings.billingDetailFields.optionalFields : [];
        },
        getClient: state => function () {
            return state.app.client ? state.app.client : false;
        },
        getAccountId: state => function () {
            return state.app.account_id ? state.app.account_id : false;
        },
        getLoginDetails: state => function () {
            return state.localStorage.loginDetails;
        },
        getAuthOption: state => function () {
            return state.localStorage.authOption;
        },
        getLocalBillingDetails: state => function () {
            return state.localStorage.billingDetails;
        },
        getCcInfo: state => function () {
            return state.localStorage.ccinfo;
        },
        getCcDescription: state => function () {
            return state.localStorage.ccdescription;
        },
        getTermOfServiceValue: state => function () {
            return state.localStorage.tos;
        },
        getCountryDetails: state => function () {
            return state.settings.countryDetails ? state.settings.countryDetails : false;
        },
        getCountries: state => function () {
            return state.settings.countryDetails.countries ? state.settings.countryDetails.countries : false;
        },
        getDomainSchema: state => function () {
            return state.settings.domain.schema ? state.settings.domain.schema : false;
        },
        getDomainSchemaAddons: (state, getters) => function () {
            let schema = getters.getDomainSchema();
            return schema ? schema.addons : false;
        },
        getDomainSchemaCustomFields: (state, getters) => function () {
            let schema = getters.getDomainSchema();
            return schema ? schema.customFields : false;
        },
        getDomainSchemaRegisterFields: (state, getters) => function () {
            let schema = getters.getDomainSchema();
            return schema ? schema.registerFields : false;
        },
        getDomainSchemaServerNamespaces: (state, getters) => function () {
            let schema = getters.getDomainSchema();
            return schema ? schema.serverNamespaces : false;
        },
        getDomainSchemaRenewableDomains: (state, getters) => function () {
            let schema = getters.getDomainSchema();
            return schema ? schema.renewable : false;
        },
        getDomainRegTypes: (state, getters) => function () {
            let schema = getters.getDomainSchema();
            
            return schema ? schema.registrationTypes : false;
        },
        getDomainSpotlights: (state, getters) => function () {
            let schema = getters.getDomainSchema();
            return schema ? schema.spotlights : false;
        },
        getPaymentGateways: state => function () {
            return state.settings.gateways ? state.settings.gateways : false;
        },
        getApplyCreditsStatus: state => function () {
            return state.app.applyCredits ? state.app.applyCredits : false;
        },
        getTldExtensions: state => function () {
            return state.settings.tldExtensions ? state.settings.tldExtensions : false;
        },
        isIDNDomainsActive: state => function () {
            return state.app.isIDNDomainsActive ? state.app.isIDNDomainsActive : false;
        },
        getProductDomain: (state, getters) => function () {
            let product = getters.getSelectedProduct();
            return (product.domain && product.domain.length > 0) ? product.domain : false;
        },
        getDomainRegistrationType: state => function () {
            return state.app.domainRegType;
        },
        getDomainInfo: state => function () {
            return state.settings.domainInfo;
        },
        getDomainInfoByType: (state, getters) => function (type) {
            let info = getters.getDomainInfo();
            return info ? info[type] : false;
        },
        getDomainForm: state => function () {
            return state.app.domainForm;
        },
        getDomainToSearch: state => function () {
            return state.app.domainToSearch;
        },
        getDomainFormServers: (state, getters) => function () {
            let form = getters.getDomainForm();
            return form ? form.servers : false;
        },
        getDomainFormCustomFields: (state, getters) => function () {
            let form = getters.getDomainForm();
            return form ? form.customFields : false;
        },
        getDomainFormRegisterFields: (state, getters) => function () {
            let form = getters.getDomainForm();
            return form ? form.registerFields : false;
        },
        getDomainAddonsFormData: (state, getters) => function () {
            let form = getters.getDomainForm();
            return form ? form.addons : false;
        },
        getLang: state => function () {
            return state.settings.lang;
        },
        isDomainSelected: (state, getters) => function () {
            if(state.app.domainRegType === 'renew') {
                return 1;
            }
            else if (state.app.domainRegType === 'own' || state.app.domainRegType === 'subdomain')
            {
                return getters.getProductDomain();
            }
            else if (state.app.cartType === 'domain' || state.app.cartType === 'product')
            {
                let itemKey = getters.getAppItemKey();
                return itemKey !== false ? getters.getCartDomainByKey(itemKey) : false;
            }
            return false;
        },
        getDomainName: (state, getters) => function () {
            if (state.app.cartType === 'product')
            {
                return getters.getProductDomain();
            } else if (state.app.cartType === 'domain')
            {
                let itemKey = getters.getAppItemKey();
                let domain = itemKey !== false ? getters.getCartDomainByKey(itemKey) : false;
                return domain ? domain['domain'] : false;
            }
            return false;
        },
        
        getTldCategories: state => function () {
            return state.settings.tldCategories;
        },
        getAlert: state => function (type) {
            return state.alerts;
        },
        getMarketingEmailsValue: state => function () {
            return state.app ? state.app.marketingEmails : false;
        },
        getNotesValue: state => function () {
            return state.app ? state.app.notes : false;
        },
        getDomainContactDetails: state => function () {
            return state.app.domainContact ? state.app.domainContact : false;
        },
        getStatesByCountryCode: (state, getters) => function (countryCode) {
            //filter doesn't work on object
            if (states)
            {
                for (var index in states)
                {
                    if (index == countryCode)
                    {
                        if (states[index].includes("end")) {
                            const i = states[index].indexOf("end");
                            if (i !== -1) {
                                states[index].splice(i, 1);
                            }
                        }
                        return states[index]
                    }
                }
            }
            return [];
        },
        getSpinners: state => function () {
            return state.spinners;
        },
        getBlockedEvents: state => function () {
            return state.blockedEvents;
        },
        getSPage: state => function () {
            return state.app.sPage;
        },
        getSelectedPaymentGateway: state => function () {
            return state.app.paymentMethod ? state.app.paymentMethod : null;
        },
        getComponentsConfiguration: state => function () {
            return state.componentsConfiguration;
        },
        getCompleteOrderDetails: state => function () {
            return state.settings.completeOrder ? state.settings.completeOrder : false;
        },
        getWhmcsOrderSettings: state => function () {
            return state.app.orderSettings ? state.app.orderSettings : {};
        },
        isDomainSectionAvailableComponent: (state, getters) => function (name) {
            let section = getters.getDomainRegTypes()[getters.getDomainRegistrationType()];
            if (section === undefined)
            {
                return false;
            }
            if (section.supportedComponents === undefined)
            {
                return false;
            }
            if (section.supportedComponents.indexOf(name) === -1)
            {
                return false;
            }
            return true;
        },
        shouldShowNumber: state => function () {
            return state.pageType === 'bottom' && state.showElements['sectionNumber'] === true;
        },
        getPageType: state => function () {
           return state.pageType;
        },
        isGroupModalEnabled: state => function () {
            return state.formType === 'oneStep';
        },
        isTwoStep: state => function () {
            return state.formType === 'twoSteps';
        },
        isOneStep: state => function () {
            return state.formType === 'oneStep';
        },
        isBillingAccountsSupported: state => function () {
            return state.componentsConfiguration['billingAccountsSupported'] === true;
        },
        getBillingCycleDuringLoading: state => function () {
            return state.billingCycleDuringLoading;
        },
        getInitialParamsFromUrl: state => function ()
        {
            let path = state.url.pathname.replace(whmcsBaseUrl, '');
         
            const [, group, pid, ...otherUrlParams] = path.split('/').filter(el => el.length);
            let params = {
                group: group,
                pid: pid
            };
            
            for (let i = 0; i < Math.floor(otherUrlParams.length / 2); i++)
            {
                params[otherUrlParams[i]] = otherUrlParams[i+1];
            }
            state.url.searchParams.forEach(function(value, key) {
                params[key] = value;
            });

            return params;
        },
        getBillingDetailsErrors: state => function () {
            return state.billingDetailsErrors;
        },
        getValidateErrors: state => function() {
            return state.validateErrors
        },
        getLagomTemplateSettings: state => function () {
            return state.app.lagomTemplateSettings;
        },
        getZeroPrice: state => function (setting) {
            switch(state.settings.layoutSettings[setting]) {
                case 'hide':
                    return ''
                case 'free':
                    return mgPageLang.translate('free')
                default:
                    const currency = state.app.currency;
                    return currency.prefix + formatPrice.getFormattedPrice(0,currency.format) + (state.settings.layoutSettings.displayPriceSuffix ? (' ' + currency.suffix) : '')
            }
        },
    }
};