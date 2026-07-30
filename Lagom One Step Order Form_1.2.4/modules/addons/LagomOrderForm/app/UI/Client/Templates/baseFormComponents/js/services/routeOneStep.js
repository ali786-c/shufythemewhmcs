const routeOneStep = {
    namespaced: true,
    actions:{
        async goTo({state, commit, dispatch, getters}, data)
        {
            let page = await (data !== null && typeof data === 'object' ? data.next : data);
            switch(page)
            {
                case 'domain-renew':
                    await dispatch('domainRenew')
                    break;
                case 'domain':
                case 'domains':
                    await dispatch('domain');
                    break;
                case 'addon':
                case 'addons':
                    await dispatch('addons');
                    break;
                case 'product':
                case 'products':
                case 'oneStep':
                    await dispatch('oneStep');
                    break;
                case 'nextStep':
                    await dispatch('nextStep');
                    break;
                case 'previousStep':
                    await dispatch('previousStep');
                    break;
                case 'complete':
                    await dispatch('complete');
                    break;
                case 'checkout':
                    await dispatch('checkout');
                    break;
                default:
                    await dispatch('oneStep');
                    break;
            }
            await commit('cartStore/setLastSPage', page,      {root: true});
            await commit('cartStore/showComponent', 'sectionNumber',      {root: true});
        },
        async domain({state, commit, dispatch, rootState}){
            await commit('cartStore/pushSpinner', {spinner: 'page'}, {root: true});
            if(rootState.cartStore.formType == 'oneStep'){
                await commit('cartStore/showComponent', 'groups', {root: true});
            }
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
            await commit('cartStore/showComponent', 'metricsBilling', {root: true});
            await commit('cartStore/popSpinner', {spinner: 'page'}, {root: true});
        },
        async domainRenew({state, commit, dispatch, rootState}){
            await commit('cartStore/pushSpinner', {spinner: 'page'}, {root: true});
            if(rootState.cartStore.formType == 'oneStep'){
                await commit('cartStore/showComponent', 'groups', {root: true});
            }
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
            await commit('cartStore/popSpinner', {spinner: 'page'}, {root: true});
        },
        async oneStep({state, commit, dispatch, getters, rootState}){
            domainDetails = await this.getters['cartStore/getSelectedProductDetails']();
            if(domainDetails && domainDetails.showdomainoptions == 1) {
                await commit('cartStore/showComponent', 'domains',{root: true})
            } else {
                await commit('cartStore/hideComponent', 'domains',{root: true})
            }
            
            await commit('cartStore/hideComponent', 'packageInfo',        {root: true});
            await commit('cartStore/hideComponent', 'addons',             {root: true});
            await commit('cartStore/hideComponent', 'domainsRegistrant', {root: true});

            await commit('cartStore/showComponent', 'groups', {root: true});
            await commit('cartStore/showComponent', 'products', {root: true});
            await commit('cartStore/showComponent', 'cart',    {root: true});
            await commit('cartStore/showComponent', 'configurations',    {root: true});
            await commit('cartStore/showComponent', 'billingDetails', {root: true});
            await commit('cartStore/showComponent', 'paymentMethods',    {root: true})
            await commit('cartStore/showComponent', 'promocode', {root: true});
            await commit('cartStore/showComponent', 'orderFields', {root: true});
            await commit('cartStore/showComponent', 'metricsBilling', {root: true});
            await commit('cartStore/showComponent', 'ipLog',              {root: true});

        },

        async addons({state, commit, dispatch, rootState}){
            await commit('cartStore/hideComponent', 'products',           {root: true});
            await commit('cartStore/hideComponent', 'domains',            {root: true});
            await commit('cartStore/hideComponent', 'domain',               {root: true});
            await commit('cartStore/hideComponent', 'configurations',     {root: true});
            await commit('cartStore/hideComponent', 'packageInfo',        {root: true});
            await commit('cartStore/hideComponent', 'domainsRegistrant', {root: true});

            await commit('cartStore/showComponent', 'groups', {root: true});
            await commit('cartStore/showComponent', 'billingDetails',      {root: true})
            await commit('cartStore/showComponent', 'paymentMethods',     {root: true})
            await commit('cartStore/showComponent', 'cart',               {root: true})
            await commit('cartStore/showComponent', 'addons',             {root: true})
            await commit('cartStore/showComponent', 'promocode', {root: true});
            await commit('cartStore/showComponent', 'orderFields', {root: true});
            await commit('cartStore/showComponent', 'metricsBilling', {root: true});
        },
        async checkout({state, commit, dispatch, rootState}){
            // const domainOptions = await this.getters['cartStore/getSelectedProductDetailsValue']('showdomainoptions');
            // if(domainOptions == 1){
            //     await commit('cartStore/showComponent', 'domains',{root: true})
            // }else{
            //     await commit('cartStore/hideComponent', 'domains',{root: true})
            // }
            await commit('cartStore/hideComponent', 'domainsRegistrant', {root: true});
            await commit('cartStore/hideComponent', 'products',           {root: true});
            await commit('cartStore/hideComponent', 'groups',             {root: true});
            await commit('cartStore/hideComponent', 'domains',            {root: true});
            await commit('cartStore/hideComponent', 'configurations',     {root: true});
            await commit('cartStore/hideComponent', 'billingDetails',     {root: true});
            await commit('cartStore/hideComponent', 'packageInfo',        {root: true});
            await commit('cartStore/hideComponent', 'billingDetails',     {root: true});
            await commit('cartStore/hideComponent', 'paymentMethods',     {root: true});
            await commit('cartStore/hideComponent', 'cart',               {root: true});
            await commit('cartStore/hideComponent', 'addons',             {root: true});
            await commit('cartStore/hideComponent', 'newOrderHeader',     {root: true});

            await commit('cartStore/showComponent', 'billingDetails',     {root: true})
            await commit('cartStore/showComponent', 'paymentMethods',     {root: true})
            await commit('cartStore/showComponent', 'cart',               {root: true})
        },
        async complete({state, commit, dispatch, rootState}){
            await commit('cartStore/hideComponent', 'domainsRegistrant', {root: true});
            await commit('cartStore/hideComponent', 'products',           {root: true});
            await commit('cartStore/hideComponent', 'groups',             {root: true});
            await commit('cartStore/hideComponent', 'domains',            {root: true});
            await commit('cartStore/hideComponent', 'configurations',     {root: true});
            await commit('cartStore/hideComponent', 'billingDetails',     {root: true});
            await commit('cartStore/hideComponent', 'packageInfo',        {root: true});
            await commit('cartStore/hideComponent', 'billingDetails',     {root: true});
            await commit('cartStore/hideComponent', 'paymentMethods',     {root: true});
            await commit('cartStore/hideComponent', 'cart',               {root: true});
            await commit('cartStore/hideComponent', 'addons',             {root: true});
            await commit('cartStore/hideComponent', 'newOrderHeader',     {root: true});
            await commit('cartStore/hideComponent', 'promocode',          {root: true});
            await commit('cartStore/hideComponent', 'orderFields',        {root: true});
            await commit('cartStore/hideComponent', 'metricsBilling',     {root: true});
            /* show */
            await commit('cartStore/showComponent', 'complete',           {root: true})
            document.querySelector('body').classList.add('page-complete')
        },

        async nextStep({state, commit, dispatch, rootState}){
        },
        async previousStep({state, commit, dispatch, rootState}){
        },
        // async replaceURL({state, commit, dispatch, getters, rootState}, {urlParams: urlParams}) {
        //
        //     if(rootState.cartStore.groupId && !urlParams['gid']){
        //         urlParams['gid'] = rootState.cartStore.groupId;
        //     }
        //
        //     return new Promise((resolve, reject) => {
        //         var baseUrl = rootState.cartStore.pageUri;
        //         for(var index in urlParams){
        //             baseUrl += '&' + index + '=' + urlParams[index];
        //         }
        //         window.history.pushState({page: "singlePage"}, "sing page redirect", baseUrl);
        //         resolve()
        //     });
        // },

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





