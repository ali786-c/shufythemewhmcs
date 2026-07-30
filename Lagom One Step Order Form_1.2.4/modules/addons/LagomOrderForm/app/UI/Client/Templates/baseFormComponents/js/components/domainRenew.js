
/**
 * Configurations Component
 */
mgJsComponentHandler.addDefaultComponent('mg-one-page-domain-renew', {
    template: '#t-mg-one-page-domain-renew',
    props:{
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
            domainPeriods: [],
            loader: false,
            loaderId: null,
            searchedWord: null,
            renewDomains: [],
            visibleDomains: 8,
        }
    },
    watch:{
        'isVisible': function(value){
            this.$nextTick(function () {
                if(this.showNumber == true){
                    renderSectionIndex();
                    this.reloadRenewDomains();
                }
            });
        },
        domains: function(){
            this.reloadRenewDomains();
        },
        searchedWord: function(){
            this.reloadRenewDomains();
        },
        visibleDomains: function() {
            this.reloadRenewDomains();
        }
    },
    computed: {
        isVisible: {
            get () {
                return (this.$store.getters['cartStore/isVisible']('domains') && this.domains && this.$store.getters['cartStore/isDomainSectionAvailableComponent']('renew'));
            }
        },
        showNumber:{
            get(){
                return this.$store.getters['cartStore/shouldShowNumber']();
            }
        },
        formData:{
            get(){
                return {};
            }
        },
        domains:{
            get(){
                let domainsResult = this.$store.getters['cartStore/getDomainSchemaRenewableDomains']()
                if(domainsResult.length > this.visibleDomains) {
                    let splicedDomains = [...domainsResult];
                    splicedDomains.length = this.visibleDomains;
                    return splicedDomains
                }
                else {
                    return domainsResult;
                }
            }
        },
        isBlockedPage: {
            get() {
                return this.$store.getters['cartStore/getBlockedEvents']()['fullPage'] > 1;
            },
        },
        selectedDomains:{
            get(){
                return this.$store.getters['cartStore/getSelectedRenewDomains']()
            }
        },
    },
    methods: {
        renewDomain: function(id){
            let self = this;
            if(self.isBlockedPage){//add && this.selectedDomains.hasOwnProperty(id) if need disable for selected domain
                return;
            }
            self.loader = true;
            self.loaderId = id;
            let period = this.domainPeriods[id] ? this.domainPeriods[id] : this.getDefaultDomainPeriod(id);
            this.$store.dispatch('cartStore/renewDomain', {id: id, period: period})
                .then(result => {
                    self.loader = false;
                    self.loaderId = null;
                });
        },
        getTransletedExpireStatus: function(message, expire){

            expire = expire < 0 ? expire * -1 : expire;
            return mgPageLang.sprintf(mgPageLang.translate([message], {'expire':expire}));
        },
        changePeriod: function(id, event){
            this.domainPeriods[id] = event;
            const renewDomain = this.renewDomains.filter(domain => domain.id === id)[0];

            if( this.selectedDomains.hasOwnProperty(id) )
            {
                this.$store.dispatch('cartStore/renewDomain', {
                    'id': id,
                    'period': renewDomain.selectedRenewal
                });
            }

        },
        getDefaultDomainPeriod: function(id)
        {
            let domain = this.domains.filter(domain => domain.id == id)[0];
            let firstKey = Object.keys(domain.renewalOptions)[0];
            // //return firstKey or rawPeriod
            //
            return domain.renewalOptions[firstKey].rawPeriod;
        },
        reloadRenewDomains: function()
        {
            let self = this;

            if(self.domains){
                self.renewDomains = self.domains.filter(domain => {
                    if(self.searchedWord !== null && domain.domain.indexOf(self.searchedWord) === -1){
                        return false;
                    }
                    return true;
                })
            }
        },
        hasDomains: function(){
            return Object.keys(this.domains).length > 0;
        },
        loadMoreDomains: function() {
            this.visibleDomains += 8;
        },
        selectRenewalOption: function(option, renewalOptions, domain) {
            let self = this;
            this.renewDomains.map(singleDomain => {
                if (singleDomain.id == domain.id) {
                    singleDomain.selectedRenewal = option.rawPeriod
                    self.changePeriod(singleDomain.id, option.rawPeriod)
                }
                else if(!singleDomain.selectedRenewal) {
                    singleDomain.selectedRenewal = null;
                }
            })
            this.reloadRenewDomains();
        },
        removeDomain: function(id) {
            this.$store.dispatch('cartStore/removeDomainRenew', {id:id})
        }
    }

});