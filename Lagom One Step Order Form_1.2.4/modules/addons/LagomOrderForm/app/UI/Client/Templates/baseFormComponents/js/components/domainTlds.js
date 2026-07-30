/**
 * Domains TLDs Component
 */
mgJsComponentHandler.addDefaultComponent('mg-one-page-domain-tlds', {
    template: '#t-mg-one-page-domain-tlds',
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
            selectedGroup: [],
            selectedPeriod: 1,
            searchedWord: null,
            tldToShow: [],
            sel: null,
            paginationEntriesNumber: 10,
            isComponentRendered: false,
            defaultSelectedGroups: null,
            defaultTldsToShow: null,
            isFunctionBroken: false,
            selectize: null,
            selectedOptions: [],
        }
    },
    created() {
        renderCheckBox('tld-filters-wrapper',
            function (val) {
                self.accountId = val;
            });

            let item = $('.tld-filters .items').find('.item').first();

            $('<span id="tldGroupCounter" class="tld-filters-counter">' + this.selectedGroup[0] + '</span>').insertAfter(item);
    },
    watch:{
        isVisible: function(value){
            let self = this;
            if(!this.isComponentRendered) {
                self.defaultSelectedGroups = self.selectedGroup
                self.defaultTldsToShow = self.tldToShow
                self.isComponentRendered = true
            }

            this.selectedGroup = this.defaultSelectedGroups
            this.tldToShow = this.defaultTldsToShow

            this.$nextTick(function () {
                if(this.showNumber == true){
                    renderSectionIndex();
                }
            });
        },
        groups: function(value) {
            if(this.selectedGroup.length === 0 && value.length > 0)
            {
                this.selectedGroup.push(value[0]['name']);
            }
            this.reloadTlds();
        },
        searchedWord: function(val){
            this.reloadTlds();
        },
        tlds: function(val){
            this.reloadTlds();
        },
        selectedGroup: function(val){
            let self = this;
            this.reloadTlds();
            this.updateCounter();
        },
        groupSelectVisibility: function(val){
            const self = this;
            if(val === true){
                self.$nextTick(() => {
                    self.renderSelect();
                })
            }
        },
        tldToShow: function() {
            const self = this;
            if(this.groupSelectVisibility){
                self.$nextTick(() => {
                    let selectizeInput = document.querySelector('.tld-filters .selectize-input');
                    if (selectizeInput) {
                        self.renderPagination();
                    }
                    if(document.querySelector('#tld-pagination')) {
                        if(self.tldToShow.length == 0) {
                            document.querySelector('#tld-pagination').classList.add('hidden')
                        }
                        else {
                            document.querySelector('#tld-pagination').classList.remove('hidden')
                        }
                    }
                })
            }
        },
    },
    computed: {
        showNumber:{
            get(){
                return this.$store.getters['cartStore/shouldShowNumber']();
            }
        },
        isVisible: {
            get () {
                return this.$store.getters['cartStore/isVisible']('domains') && this.$store.getters['cartStore/isDomainSectionAvailableComponent']('suggestions');
            }
        },
        groups: {
            get(){
                return this.$store.getters['cartStore/getTldCategories']();
            }
        },
        tlds:{
            get()
            {
                return this.$store.getters['cartStore/getTldExtensions']();
            }
        },
        currencyId:{
            get(){
                return this.$store.getters['cartStore/getSelectedCurrencyId']()
            }
        },
        isBlockedPage: {
            get() {
                return this.$store.getters['cartStore/getBlockedEvents']()['fullPage'] > 1;
            }
        },
        groupSelectVisibility:{
            get(){
                return this.isVisible === true && this.groups && this.groups.length > 0;
            }
        },
        currency: {
            get() {
                return this.$store.getters['cartStore/getSelectedCurrency']();
            },
        },
        layoutSettings: {
            get() {
                return this.$store.getters['cartStore/getLayoutSettings']();
            }
        },
    },
    methods: {
        reloadTlds: function(){
            let self = this;
            self.tldToShow = [];
            for (const [index, tld] of Object.entries(self.tlds)) {

                if(self.searchedWord !== null && tld.extension.indexOf(self.searchedWord) === -1){
                    continue;
                }

                if(self.groups.length > 0)
                {
                    categories = tld.categories ? tld.categories : [];
                    let c = categories.filter(result => {
                        return self.selectedGroup.indexOf(result) !== -1
                    });
                    if(c.length > 0){
                        self.tldToShow.push(tld)
                    }
                }else{
                    self.tldToShow.push(tld)
                }
            }
            this.updateCounter();
            this.filtersHandler();
        },

        changeSelect(event) {
            this.paginationEntriesNumber = event.target.value;
            this.renderPagination();
        },
        

        //TLD pagination
        renderPagination: function() {
            let self = this;
            let visibleTlds = [...document.querySelectorAll('.tld-pricing.data-container .tld-row')]
            let tldPricingHeader = document.querySelector('.tld-pricing .tld-pricing-header');
            let entriesSelect = document.querySelector('#pagination-entries');
            if(entriesSelect) {
                $('#tld-pagination').pagination({
                    dataSource: visibleTlds,
                    pageSize: self.paginationEntriesNumber,
                    pageRange: 1,
                    prevText: mgPageLang.translate('previous'),
                    nextText: mgPageLang.translate('next'),
                    callback: function(data, pagination) {
                        let finalData = tldPricingHeader + data
                        visibleTlds.map(singleItem => {
                            singleItem.classList.add('hidden')
                        })
                        data.map(singleItem => {
                            singleItem.classList.remove('hidden')
                        })
                    }
                })
            }
        },

        renderSelect: function(){
            const self = this;
            let dropdownRendered = false;
            
            let opt = {
                sortField: 'id',
                // plugins: ['remove_button'],
                copyClassesToDropdown: false,
                hideSelected: false,
                onItemAdd(value, item) {
                    let selectize = this;
                    //TODO sprawdziÄ‡ dodawania itemĂłw do selectedGroup


                    let options = [...document.querySelectorAll('.tld-filters .selectize-dropdown-content .option')]
                    options.map((singleOption, index) => {
                        if(singleOption.dataset.value == 'Others') {
                            $('<span class="divider"></span>').insertBefore(singleOption)
                        }
                    });
                    self.reloadTlds();
                    self.updateCounter();
                    let tldFiltersOptions = [...document.querySelectorAll('.tld-filters .selectize-dropdown-content .option')]
                    tldFiltersOptions.map(singleOption => {
                        $(singleOption).off();
                        
                        setTimeout(function() {
                            if(singleOption.classList.contains('selected')) {
                                $(singleOption).off();
                                $(singleOption).on('click', function() {
                                    let item = this
                                    setTimeout(function() {
                                        self.deselectHandler(item, item.dataset.value, selectize);
                                    }, 3)
                                    
                                })
                            }
                        }, 200)
                    })
                },
                onDropdownOpen() {
                    let selectize = this;
                    let item = $('.tld-filters .items').find('.item').first();
                    if (!dropdownRendered && item.length && self.selectedGroup[0] !== item[0].textContent) {
                        self.selectedGroup.push(item[0].textContent)
                    }
                    $('.tld-filters .selectize-control').addClass('selectize-open')

                    if( !dropdownRendered) {
                        
                        addSelectBtns(this);
                        dropdownRendered = true
                    }
                    addDivider()
                    self.reloadTlds();
                    let tldFiltersOptions = [...document.querySelectorAll('.tld-filters .selectize-dropdown-content .option')]
                    tldFiltersOptions.map(singleOption => {
                        $(singleOption).off();
                        
                        setTimeout(function() {
                            if(singleOption.classList.contains('selected')) {
                                $(singleOption).off();
                                $(singleOption).on('click', function() {
                                    let item = this
                                    setTimeout(function() {
                                        self.deselectHandler(item, item.dataset.value, selectize);
                                    }, 3)
                                    
                                })
                            }
                        }, 200)
                    })
                    // 
                },
                onDropdownClose() {
                    $('.tld-filters .selectize-control').removeClass('selectize-open')
                },
            };

            //Handle deselect
            function removeHandler(value, selectize) {
                let options = [...document.querySelectorAll('.tld-filters .selectize-dropdown-content .option')]
                options.map((singleOption, index) => {
                    
                    if(singleOption.dataset.value == value) {
                        
                        setTimeout(function() {
                            $(singleOption).off()
                            $(singleOption).on('click', self.deselectHandler(singleOption, value))
                        }, 500)
                        
                        // singleOption.addEventListener('click', deselectHandler)
                    }
                })
            }



            // Add dividers and  select all/clear all buttons
            function addSelectBtns(selectize) {
                $('.selectize-option').remove()
                const selectAll = mgPageLang.translate('selectAll')
                const clearAllFilters = mgPageLang.translate('clearAllFilters')
                $('<div class="selectize-option" data-check-all>'+ selectAll +'<i class="ls ls-check"></i></div>').insertBefore($('.tld-filters .selectize-dropdown-content'));
                $('<div class="selectize-option selectize-option--clear-all" data-clear-all>'+ clearAllFilters +'<i class="ls ls-close"></i></div>').insertBefore($('.tld-filters .selectize-dropdown-content'));
                    filterButtonsHandler(selectize)
                // },1);

            }

            function addDivider(selectize) {
                $('.tld-filters .divider').remove();
                let options = [...document.querySelectorAll('.tld-filters .selectize-dropdown-content .option')]
                options.map((singleOption, index) => {
                    if(singleOption.dataset.value == 'Others') {
                        setTimeout(function() {
                            $('<span class="divider"></span>').insertBefore(singleOption)
                        }, 1)
                    }
                });
                $('<span class="divider"></span>').insertBefore($('.tld-filters .selectize-dropdown-content'));
            }

            let removeHandlerHelper = removeHandler();

            //Handle select all/clear all buttons
            function filterButtonsHandler(selectize) {
                let selectAllBtn = document.querySelector('.tld-filters [data-check-all]')
                let clearAllBtn = document.querySelector('.tld-filters [data-clear-all]');

                let clearAll = function() {
                    // setTimeout(function() {
                        selectize.clear();
                        $('.tld-filters .selectize-dropdown-content .option').removeClass('selected')
                        clearAllBtn.classList.add('hidden')
                        selectAllBtn.classList.remove('hidden')
                        self.updateCounter();
                        // removeHandlerHelper;
                    // }, 6)

                     
                }
                let selectAll = function() {
                    let options = Object.keys(selectize.options).filter(key => key !== 'all')
                    self.selectize = selectize;
                    selectize.setValue(options, true)
                    self.selectedGroup = options
                    selectAllBtn.classList.add('hidden')
                    clearAllBtn.classList.remove('hidden')
                    self.updateCounter();

                }

                selectAllBtn.addEventListener('click', selectAll)
                clearAllBtn.addEventListener('click', clearAll)
                // setTimeout(function() {

                // }, 6)

            }

            self.renderPagination();
            

            
            if($('#tldGroupSelect').length > 0){
                self.sel = $('#tldGroupSelect').selectize(opt).on("change",function(){
                    self.selectedGroup = self.sel.getValue();
                    let item = $('.tld-filters .items').find('.item').first();                  
                    let counter = $(this)[0].length;
                    // $('#tldGroupCounter').remove();                   
                    let inputHeight = $('.tld-filters .item').length * 40;
                    $('.tld-filters .selectize-input').css('height', inputHeight+'px');
                    if (inputHeight == 0){
                        $('.tld-filters .selectize-dropdown').css('top', '35px');
                    }
                    else{
                        $('.tld-filters .selectize-dropdown').css('top', inputHeight+'px');
                    }
                    
                    // if (counter > 1){
                        // $('<span id="tldGroupCounter" class="tld-filters-counter">, +<span>'+counter+'</span></span>').insertAfter(item);
                        // $('.tld-filters .items .item').css('display', 'none')
                        
                    // }
                })[0].selectize;     
                self.sel.$dropdown_content.addClass('has-scroll')
 
                $('.tld-filters .selectize-input').on('click', function(){
                    $("#tldGroupSelect")[0].selectize.open();
                    let inputHeight = $(this).find('.item').length * 40;
                    $(this).css('height', inputHeight+'px');
                    if (inputHeight == 0){
                        $('.tld-filters .selectize-dropdown').css('top', '35px');
                    }
                    else{   
                        $('.tld-filters .selectize-dropdown').css('top', inputHeight+'px');
                    }
                    
                })
                if($('#tldGroupSelect')[0].length > 1){
                    let counter = $('#tldGroupSelect')[0].length;
                    let item = $('.tld-filters .items').find('.item').first();    
                    // $('#tldGroupCounter').remove();     
                    // if (counter > 1){
                    //     $('.tld-filters .items .item').css('display', 'none')
                    //     $('<span id="tldGroupCounter" class="tld-filters-counter">'+counter+' categories selected</span>').insertAfter(item);
                    // }
                }
            }
        },
        countTldByCategoryName(category){
            const self = this;
            let tlds = self.tlds.filter(cat => cat.pricing[self.currencyId]);
            let cat = tlds = tlds.filter(tld => tld.categories.indexOf(category) !== -1);

            return cat.length;
        },
        getTldFirstPeriod(tld, name, prop) {

            if (!tld['pricing'][this.currencyId]) {
                return false;
            }

            if (!tld['pricing'][this.currencyId][name] || !tld['pricing'][this.currencyId]['domainregister']) {
                return false;
            }
            let periods = Object.keys(tld['pricing'][this.currencyId]['domainregister']);
            if (!periods) {
                return false;
            }

            if(!tld['pricing'][this.currencyId][name][periods[0]])
            {
                return false
            }

            if (!tld['pricing'][this.currencyId][name][periods[0]][prop] ){
                return false
            }
            if (tld['pricing'][this.currencyId][name][periods[0]].rawPrice == 0 && prop != 'period') {
                return this.$store.getters['cartStore/getZeroPrice']('domainsPrices')
            }
            return tld['pricing'][this.currencyId][name][periods[0]][prop];
        },
        updateCounter() {
            $('#tldGroupCounter').remove();

            let item = $('.tld-filters .items').find('.item').first();
            let counter = this.selectedGroup.length;

            $('<span id="tldGroupCounter" class="tld-filters-counter">'+counter+' categories selected</span>').insertAfter(item);
            if (counter > 1) {
                
                $('.tld-filters .items .item').css('display', 'none')
                $('#tldGroupCounter').text(counter + ' categories selected')
                $('#tldGroupCounter').css('display', '')
            }
            // else if (counter == 0) {
            //     $('.tld-filters .items .item').remove()
            //     $('#tldGroupCounter').css('display', 'none');
            // }
            else {
                $('.tld-filters .items .item').css('display', '')
                $('#tldGroupCounter').css('display', 'none');
            }
        },
        deselectHandler(singleOption, value, selectize) {
            let self = this;
            if(singleOption) {
                let selectedOptionIndex = self.selectedGroup.indexOf(singleOption.dataset.value)
                let selectedOptions = [...document.querySelectorAll('#tldGroupSelect option')];

                selectedOptions.map((singleSelectedOption, index) => {
                    if (index == selectedOptionIndex) {
                        selectize.removeItem(value)
                        singleSelectedOption.remove();
                    }
                })
                singleOption.classList.remove('selected')
                $('.tld-filters .item[data-value="' + value + '"]').remove();

                self.updateCounter();
                $(singleOption).off()
            }
        },
        filtersHandler() {
            let selectAllBtn = $('.tld-filters [data-check-all]')
            let clearAllBtn = $('.tld-filters [data-clear-all]');
            if(this.selectedGroup.length > 0) {
                selectAllBtn.addClass('hidden')
                clearAllBtn.removeClass('hidden')
            }
            else {
                clearAllBtn.addClass('hidden')
                selectAllBtn.removeClass('hidden')
            }
        }
    }
});
