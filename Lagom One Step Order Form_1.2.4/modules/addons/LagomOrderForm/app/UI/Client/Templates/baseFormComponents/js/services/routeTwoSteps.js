const routeTwoSteps = {
    namespaced: true,
    actions:{
        async goTo({state, commit, dispatch, getters},data)
        {

            let page = await (data !== null && typeof data === 'object' ? data.next : data);
            switch(page)
            {
                case 'domain':
                    await dispatch('domain');
                    break;
                case 'addons':
                    await dispatch('addons');
                    break;
                case 'addonsStepTwo':
                    await dispatch('addonsStepTwo');
                    break;
                case 'configurations':
                    await dispatch('configurations');
                    break;
                case 'complete':
                    await dispatch('complete');
                    break;
                case 'domainRenew':
                case 'domainRenewStepTwo':
                    await dispatch('domainRenewStepTwo');
                    break;
                case 'domainStepTwo':
                    await dispatch('domainStepTwo');
                    break;
                case 'domain-renew':
                    await dispatch('domainRenew')
                    break;
                default:
                    await dispatch('products');
                    break;
            }
        },
        async products({state, commit, dispatch, rootState}){
            let productId = null;
            const arrayParams = rootState.cartStore.url.search.split('&')
            arrayParams.forEach(param => {
                const item = param.split('=')
                const key = item[0]
                if (key == 'pid'){
                    productId = item[1];
                }
            })

            if (productId == null) {
                productId = rootState.cartStore.app.cart.products[0] ? rootState.cartStore.app.cart.products[0].pid : null;
            }

            let urlArray = window.location.href.split('/')
            if (!isNaN(parseInt(urlArray[urlArray.length - 1])) || productId !== null) {
                domainDetails = await this.getters['cartStore/getSelectedProductDetails']();
                if(domainDetails && domainDetails.showdomainoptions == 1) {
                    await commit('cartStore/showComponent', 'domains',{root: true})
                } else {
                    await commit('cartStore/hideComponent', 'domains',{root: true})
                }
                await commit('cartStore/hideComponent', 'ipLog',              {root: true});
                await commit('cartStore/hideComponent', 'packageInfo',        {root: true});
                await commit('cartStore/hideComponent', 'addons',             {root: true});
                await commit('cartStore/hideComponent', 'domainsRegistrant', {root: true});

                await commit('cartStore/hideComponent', 'groups', {root: true});
                await commit('cartStore/showComponent', 'cart',    {root: true});
                await commit('cartStore/showComponent', 'configurations',    {root: true});
                await commit('cartStore/showComponent', 'billingDetails', {root: true});
                await commit('cartStore/showComponent', 'paymentMethods',    {root: true})
                $('.section.section--full-width').show()
            } else {
                $('.section.section--full-width').hide()
                await commit('cartStore/hideComponent', 'cart',               {root: true});
                await commit('cartStore/hideComponent', 'domain',            {root: true});
                await commit('cartStore/hideComponent', 'configurations',     {root: true});
                await commit('cartStore/hideComponent', 'billingDetails',     {root: true});
                await commit('cartStore/hideComponent', 'packageInfo',        {root: true});
                await commit('cartStore/hideComponent', 'paymentMethods',     {root: true});
                await commit('cartStore/hideComponent', 'addons',             {root: true})
                await commit('cartStore/hideComponent', 'sectionNumber',      {root: true});
                await commit('cartStore/hideComponent', 'domainsRegistrant', {root: true});
                await commit('cartStore/hideComponent', 'promocode', {root: true});
                await commit('cartStore/hideComponent', 'orderFields', {root: true});
                await commit('cartStore/hideComponent', 'metricsBilling', {root: true});

                await commit('cartStore/showComponent', 'groups', {root: true});
                await commit('cartStore/showComponent', 'products', {root: true});
                await dispatch('addFullWidthClass');
            }
        },

        async configurations({state, commit, dispatch, rootState}){
            $('.section.section--full-width').show()
            let productDetails = await this.getters['cartStore/getSelectedProductDetails']();
            if( productDetails && productDetails.showdomainoptions == 1 )
            {
                await commit('cartStore/showComponent', 'domains', { root: true });
            }
            else
            {
                await commit('cartStore/hideComponent', 'domains', { root: true });
            }

            await commit('cartStore/hideComponent', 'groups',           {root: true});
            // await commit('cartStore/hideComponent', 'currency',             {root: true});
            await commit('cartStore/showComponent', 'sectionNumber',      {root: true});
            await commit('cartStore/hideComponent', 'products',           {root: true});
            await commit('cartStore/hideComponent', 'addons',             {root: true});
            await commit('cartStore/hideComponent', 'domainsRegistrant', {root: true});

            await commit('cartStore/showComponent', 'cart',    {root: true});
            await commit('cartStore/showComponent', 'configurations',    {root: true});
            await commit('cartStore/showComponent', 'billingDetails', {root: true});
            await commit('cartStore/showComponent', 'packageInfo', {root: true});
            await commit('cartStore/showComponent', 'paymentMethods',    {root: true});
            await commit('cartStore/showComponent', 'promocode', {root: true});
            await commit('cartStore/showComponent', 'orderFields', {root: true});
            await commit('cartStore/showComponent', 'metricsBilling', {root: true});
            await commit('cartStore/showComponent', 'ipLog',              {root: true});

            await dispatch('removeFullWidthClass');
        },

        async domain({state, commit, dispatch, rootState}){

            // await commit('cartStore/hideComponent', 'sectionNumber',      {root: true});
            await commit('cartStore/hideComponent', 'products',           {root: true});
            await commit('cartStore/hideComponent', 'configurations',     {root: true});
            await commit('cartStore/showComponent', 'billingDetails',     {root: true});
            await commit('cartStore/hideComponent', 'packageInfo',        {root: true});
            await commit('cartStore/showComponent', 'paymentMethods',     {root: true});
            await commit('cartStore/hideComponent', 'addons',             {root: true});
            await commit('cartStore/showComponent', 'domains',              {root: true});
            await commit('cartStore/hideComponent', 'groups',               {root: true});
            await commit('cartStore/showComponent', 'domainsRegistrant', {root: true});

            await commit('cartStore/showComponent', 'groups',               {root: true});
            await commit('cartStore/showComponent', 'cart',               {root: true});
            await commit('cartStore/showComponent', 'domains',              {root: true});
            await commit('cartStore/showComponent', 'sectionNumber',      {root: true});
            await commit('cartStore/showComponent', 'suggestions',           {root: true});
            await commit('cartStore/showComponent', 'promocode', {root: true});
            await commit('cartStore/showComponent', 'orderFields', {root: true});
            $('.section.section--full-width').show()
            // await commit('cartStore/showComponent', 'metricsBilling', {root: true});
            // await commit('cartStore/showComponent', 'billingDetails',       {root: true});
            // await commit('cartStore/showComponent', 'addons',             {root: true});
            // await commit('cartStore/showComponent', 'paymentMethods',     {root: true});

        },
        async domainStepTwo({state, commit, dispatch, rootState}){
            await commit('cartStore/hideComponent', 'currency',         {root: true});
            await commit('cartStore/hideComponent', 'products',         {root: true});
            await commit('cartStore/hideComponent', 'configurations',   {root: true});
            await commit('cartStore/hideComponent', 'packageInfo',      {root: true});
            await commit('cartStore/hideComponent', 'addons',           {root: true});
            await commit('cartStore/hideComponent', 'suggestions',           {root: true});

            await commit('cartStore/showComponent', 'domainsRegistrant', {root: true});
            await commit('cartStore/showComponent', 'sectionNumber',      {root: true});
            await commit('cartStore/showComponent', 'domains',              {root: true});
            await commit('cartStore/showComponent', 'cart',                 {root: true});
            await commit('cartStore/showComponent', 'billingDetails',       {root: true});
            await commit('cartStore/showComponent', 'paymentMethods',       {root: true});
        },
        async domainRenewStepTwo({state, commit, dispatch, rootState}){
            await commit('cartStore/hideComponent', 'groups',           {root: true});
            await commit('cartStore/hideComponent', 'currency',         {root: true});
            await commit('cartStore/hideComponent', 'products',         {root: true});
            await commit('cartStore/showComponent', 'sectionNumber',        {root: true});
            await commit('cartStore/hideComponent', 'configurations',   {root: true});
            await commit('cartStore/hideComponent', 'packageInfo',      {root: true});
            await commit('cartStore/hideComponent', 'addons',           {root: true});
            await commit('cartStore/hideComponent', 'suggestions',      {root: true});
            // await commit('cartStore/hideComponent', 'domains',          {root: true});
            await commit('cartStore/hideComponent', 'domainsRegistrant', {root: true});


            await commit('cartStore/showComponent', 'cart',                 {root: true});
            await commit('cartStore/showComponent', 'billingDetails',       {root: true});
            await commit('cartStore/showComponent', 'paymentMethods',       {root: true});
            await commit('cartStore/showComponent', 'domains',          {root: true});
        },

        async addons({state, commit, dispatch, rootState}){
            await commit('cartStore/hideComponent', 'products',           {root: true});
            await commit('cartStore/hideComponent', 'domains',            {root: true});
            await commit('cartStore/hideComponent', 'configurations',     {root: true});
            await commit('cartStore/hideComponent', 'packageInfo',        {root: true});
            await commit('cartStore/hideComponent', 'billingDetails',     {root: true});
            await commit('cartStore/hideComponent', 'paymentMethods',     {root: true});
            await commit('cartStore/hideComponent', 'cart',               {root: true});
            // await commit('cartStore/hideComponent', 'sectionNumber',      {root: true});
            await commit('cartStore/hideComponent', 'domainsRegistrant', {root: true});

            await commit('cartStore/showComponent', 'groups',             {root: true});
            await commit('cartStore/showComponent', 'addons',             {root: true});
            await commit('cartStore/showComponent', 'promocode', {root: true});
            await commit('cartStore/showComponent', 'orderFields', {root: true});
            $('.payment-section').hide()
            await dispatch('addFullWidthClass');
            // await commit('cartStore/showComponent', 'metricsBilling', {root: true});
        },
        async addonsStepTwo({state, commit, dispatch, rootState}){
            await commit('cartStore/hideComponent', 'groups',             {root: true});
            await commit('cartStore/hideComponent', 'domainsRegistrant',  {root: true});
            await commit('cartStore/hideComponent', 'addons',             {root: true});
            await commit('cartStore/hideComponent', 'products',           {root: true});
            await commit('cartStore/hideComponent', 'domains',            {root: true});
            await commit('cartStore/hideComponent', 'configurations',     {root: true});
            await commit('cartStore/hideComponent', 'packageInfo',        {root: true});

            await commit('cartStore/showComponent', 'sectionNumber',      {root: true});
            await commit('cartStore/showComponent', 'billingDetails',     {root: true});
            await commit('cartStore/showComponent', 'paymentMethods',     {root: true});
            await commit('cartStore/showComponent', 'cart',               {root: true});
            $('.payment-section').show()

        },
        async complete({state, commit, dispatch, rootState}){
            await commit('cartStore/hideComponent', 'domainsRegistrant',  {root: true});
            await commit('cartStore/hideComponent', 'products',           {root: true});
            await commit('cartStore/hideComponent', 'groups',             {root: true});
            await commit('cartStore/hideComponent', 'domains',            {root: true});
            await commit('cartStore/hideComponent', 'configurations',     {root: true});
            await commit('cartStore/hideComponent', 'billingDetails',     {root: true});
            await commit('cartStore/hideComponent', 'packageInfo',        {root: true});
            await commit('cartStore/hideComponent', 'paymentMethods',     {root: true});
            await commit('cartStore/hideComponent', 'cart',               {root: true});
            await commit('cartStore/hideComponent', 'addons',             {root: true});
            await commit('cartStore/hideComponent', 'newOrderHeader',     {root: true});
            // await commit('cartStore/hideComponent', 'sectionNumber',      {root: true});
            /* show */
            commit('cartStore/showComponent', 'complete',           {root: true});
        },
        async domainRenew({state, commit, dispatch, rootState}){
            await commit('cartStore/pushSpinner', {spinner: 'page'}, {root: true});
            // if(rootState.cartStore.formType == 'oneStep'){
            await commit('cartStore/showComponent', 'groups', {root: true});
            // }
            await commit('cartStore/hideComponent', 'products',         {root: true});
            await commit('cartStore/hideComponent', 'configurations',   {root: true});
            await commit('cartStore/hideComponent', 'packageInfo',      {root: true});
            await commit('cartStore/hideComponent', 'addons',           {root: true});

            //await dispatch('cartStore/loadDomainSectionConfiguration', {},  {root: true});
            await commit('cartStore/showComponent', 'groups', {root: true});
            await commit('cartStore/showComponent', 'domainsRegistrant', {root: true});
            await commit('cartStore/showComponent', 'domains',              {root: true})
            await commit('cartStore/showComponent', 'cart',                 {root: true})
            await commit('cartStore/showComponent', 'billingDetails',       {root: true})
            await commit('cartStore/showComponent', 'paymentMethods',       {root: true})
            await commit('cartStore/showComponent', 'promocode', {root: true});
            await commit('cartStore/showComponent', 'orderFields', {root: true});
            // await commit('cartStore/showComponent', 'metricsBilling', {root: true});
            await commit('cartStore/popSpinner', {spinner: 'page'}, {root: true});
        },
        async previousStep({state, commit, dispatch, rootState}){

            const sPage = await dispatch('getCurrentlySpage');

            switch (sPage) {
                case 'domainStepTwo':
                    await dispatch('domain');
                    break;
                case 'addonsStepTwo':
                    await dispatch('addons');
                    break;
            }
        },

        async replaceURL({state, commit, dispatch, getters, rootState}, {urlParams: urlParams}) {

            if(rootState.cartStore.groupId && !urlParams['gid']){
                urlParams['gid'] = rootState.cartStore.groupId;
            }

            return new Promise((resolve, reject) => {
                var baseUrl = rootState.cartStore.pageUri;
                for(var index in urlParams){
                    baseUrl += '&' + index + '=' + urlParams[index];
                }
                window.history.pushState({page: "singlePage"}, "sing page redirect", baseUrl);
                resolve()
            });
        },

        async addFullWidthClass(){
            let el = document.getElementById('baseOrderContent');
            if(el){
                el.classList.add("full-width");
            }
        },

        async removeFullWidthClass(){
            let el = document.getElementById('baseOrderContent');
            if(el) {
                el.classList.remove("full-width");
            }
        },

        async getCurrentlySpage({state, commit, dispatch, getters, rootState}){
            const queryString = window.location.search;
            const urlParams = new URLSearchParams(queryString);
            return urlParams.get('spage');
        },

        async goToError({state, commit, dispatch, getters}, data){
            await commit('cartStore/pushSpinner', {spinner: 'page'} , {root: true});
            let page = await (typeof data === 'object' ? data.next : data);

            switch(page)
            {
                case 'FORBIDDEN':
                    await dispatch('forbidden');
                    break;
            }
        },
        async hideAll({state, commit, dispatch, getters}){
            await commit('cartStore/hideComponent', 'currency',         {root: true})
            await commit('cartStore/hideComponent', 'products',         {root: true})
            await commit('cartStore/hideComponent', 'cart',         {root: true})
            await commit('cartStore/hideComponent', 'domains',         {root: true})
            await commit('cartStore/hideComponent', 'configurations',         {root: true})
            await commit('cartStore/hideComponent', 'billingDetails',         {root: true})
            await commit('cartStore/hideComponent', 'packageInfo',         {root: true})
            await commit('cartStore/hideComponent', 'paymentMethods',         {root: true})
            await commit('cartStore/hideComponent', 'groups',         {root: true})
            await commit('cartStore/hideComponent', 'addons',         {root: true})
            await commit('cartStore/hideComponent', 'complete',         {root: true})
            await commit('cartStore/hideComponent', 'sectionNumber',         {root: true})
            await commit('cartStore/hideComponent', 'domainsRegistrant',         {root: true})
            await commit('cartStore/hideComponent', 'globalError',         {root: true})
        },
        async forbidden({state, commit, dispatch, rootState}){

            await dispatch('hideAll');
            await commit('cartStore/showComponent', 'globalError',           {root: true})
        },


    }
};
