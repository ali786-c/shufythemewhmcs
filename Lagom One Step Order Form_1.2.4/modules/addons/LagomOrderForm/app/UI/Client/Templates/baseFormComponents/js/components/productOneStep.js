mgJsComponentHandler.addDefaultComponent('mg-one-page-products', {
    template: '#t-mg-one-page-products',
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
            showLoaderOnId: null,
            selectedMode: 'slider',
            sliderEnabled: true,
            isRendered: true,
            productCycleDuringLoading: null,
            slideWidths: [],
            chosenItem: 0,
            pricing: false,
        }
    },
    watch:{
        'isVisible': function(value){
            this.$nextTick(function () {
                if(this.showNumber == true){
                    renderSectionIndex();
                }
            });
        },
        'currency': function (newValue, oldValue){
            if(this.selectedProduct && oldValue && newValue.code != oldValue.code)
            {
                this.selectProduct(this.selectedProduct);
            }
        },
    },
    computed: {
        showNumber:{
            get(){
                return this.$store.getters['cartStore/shouldShowNumber']();
            }
        },
        products: {
            get () {
                return this.$store.getters['cartStore/getGroupProducts']()
            }
        },
        isVisible: {
            get () {
                return this.$store.getters['cartStore/isVisible']('products');
            }
        },
        cart: {
            get()
            {
                return this.$store.getters['cartStore/getCartSummary']()
            }
        },
        selectedProduct:{
            get(){
                const selectedProduct = this.$store.getters['cartStore/getSelectedProductId']()
                if (!selectedProduct && this.products[0]) {
                    return this.products[0].id
                }
                return this.$store.getters['cartStore/getSelectedProductId']();
            }
        },
        currency: {
            get() {
                return this.$store.getters['cartStore/getSelectedCurrency']();
            },
        },
        isBlockedPage: {
            get() {
                return this.$store.getters['cartStore/getBlockedEvents']()['fullPage'] > 1;
            }
        },
        isButtonLoader:{
            get() {
                return this.$store.getters['cartStore/getSpinners']()['productButton'] > 1;
            }
        },
        refLinkProductId:{
            get(){
                return this.$store.getters['cartStore/getAppRefLinkProductId']();
            }
        },
        productCycle:{
            get(){
                if(this.spinner) {
                    return this.$store.getters['cartStore/getBillingCycleDuringLoading']();
                }
                else {
                    let cycle = this.$store.getters['cartStore/getSelectedProductCycle']() ;
                    this.$store.commit('cartStore/setBillingCycleDuringLoading', cycle)
                    return cycle
                }
            }
        },
        isDiscountCenterOn: {
            get() {
                return this.$store.getters['cartStore/getLayoutSettings']().isDiscountCenterOn;
            }
        },

        highestBillingPeriod: {
            get() {
                return this.$store.getters['cartStore/getHighestPeriodPriceIfSettingExists']()
            }
        },
        capitalizedProductCycle: {
            get() {
                if(this.spinner) {
                    return mgPageLang.translate(this.$store.getters['cartStore/getBillingCycleDuringLoading']());
                }
                else {
                    return mgPageLang.translate(this.$store.getters['cartStore/getSelectedProductCycle']());
                }
            }
        },
        spinner: {
            get() {
                return this.$store.getters['cartStore/getSpinners']()['cart'];
            }
        },
        isOneStep:{
            get(){
                return this.$store.getters['cartStore/isOneStep']();
            }
        },
        orderSettings: {
            get(){
                return this.$store.getters['cartStore/getWhmcsOrderSettings']();
            }
        },
        visibleSlides: {
            get() {
                if(this.showNumber && this.isOneStep) {
                    return '[4, 3, 2, 2, 1]'
                }
                else if(!this.isOneStep) {
                    return '[4, 3, 2, 2, 1]'
                }
                else {
                    return '[3, 2, 2, 2, 1]'
                }
            }
        },
        layoutSettings: {
            get() {
                return this.$store.getters['cartStore/getLayoutSettings']();
            }
        },
        sysURL: {
            get() {
                return this.$store.state.cartStore.moduleSettings.mainEndpoint
            }
        },
    },
    methods: {
        selectProduct: function (productID) {
            if(this.isBlockedPage){
                return;
            }
            if(productID == this.selectedProduct) {
                return
            }
            this.chosenItem = productID
            this.showLoaderOnId = productID;
            this.$store.dispatch('cartStore/changeProduct', productID);
        },
        getPercentageDiff(oldVal, newVal){
            const diff = (newVal - oldVal) / oldVal
            return Math.round(Math.abs(diff * 100)) + '%'
        },
        getTranslatedMessage(cycle) {
            return mgPageLang.sprintf(mgPageLang.translate(['cycle'], {'cycle': cycle}), cycle)
        },
        isSelectedProduct: function(productId) {
            if (this.productExistsInGroup(this.chosenItem)) {
                return (this.chosenItem !== 0 && this.chosenItem == productId) || (this.chosenItem === 0 && this.selectedProduct == productId) && this.isOneStep
            }
            return this.selectedProduct == productId
        },
        addProduct: function (productID) {
            if(this.isBlockedPage){
                return;
            }
            this.showLoaderOnId = productID;
            this.$store.dispatch('cartStore/changeProduct', productID);
        },
        getNameToUpper(name) {
            return name.charAt(0).toUpperCase() + name.slice(1)
        },
        getProductPrice(product)
        {
            const pricing = product.pricing[this.getAvailableCycle(product)]
            if (this.getProductStartingPrice(product)) {
                return this.getProductStartingPrice(product)
            }
            return pricing ? product.pricing[this.getAvailableCycle(product)].finalPrice : false
        },
        getProductStartingPrice(product)
        {
            const pricing = product.pricing[this.getAvailableCycle(product)]
            return product.pricing && pricing ? pricing.startingPrice : false
        },
        getProductDiscountPrice(product)
        {
            const pricing = product.pricing[this.getAvailableCycle(product)]
            return product.pricing && pricing ? pricing.discountPrice : false
        },
        getProductDiscountPercentage(product)
        {
            const pricing = product.pricing[this.getAvailableCycle(product)]
            return product.pricing && pricing ? pricing.discountPercentage : false
        },
        getProductSetupFee(product)
        {
            const pricing = product.pricing[this.getAvailableCycle(product)]
            return product.pricing && pricing ? pricing.setupFee : false
        },
        getProductDiscountSetupFee(product)
        {
            const pricing = product.pricing[this.getAvailableCycle(product)]
            return product.pricing && pricing ? pricing.discountSetupFee : false
        },
        getProductDiscountSetupFeePercentage(product)
        {
            const pricing = product.pricing[this.getAvailableCycle(product)]
            return product.pricing && pricing ? pricing.discountSetupFeePercentage : false
        },
        getProductDiscountRawSetupFee(product)
        {
            const pricing = product.pricing[this.getAvailableCycle(product)]
            return product.pricing && pricing ? pricing.discountRawSetupFee : false
        },
        getAvailableCycle(product)
        {
            let cycle = this.productCycle;
            if (product.paytype === "onetime") {
                cycle = "monthly";
            } else if (product && product.pricing && product.pricing[this.productCycle] && this.isOneStep) {
                cycle =  this.productCycle;
            } else if (product && product.pricing && product.pricings[this.currency.id]) {
                const pricingsArray = product.pricings ? Object.keys(product.pricings[this.currency.id]) : product.pricing;
                cycle = this.layoutSettings.highestBillingPeriod ? pricingsArray[pricingsArray.length - 1] : pricingsArray[0];
            }

            return cycle;
        },
        translateBillingCycle(cycle)
        {
            return mgPageLang.translate(cycle);
        },
        productExistsInGroup(id)
        {
            return this.$store.getters['cartStore/getGroupProducts']().filter(product => product.id === id).length
        },
        renderSlider: function (mode) {
            let self = this;
            if (document.querySelector('.slider-container')){
                this.sliderEnabled = true;
                let swiper = null;
                // let slideWidths = $('.slider-container').data('slideWidth')
                let visibleSlides = $('.slider-container').data('visibleSlides')

                function getSlideWidth() {
                    return document.querySelector('.slider-container .swiper-wrapper').offsetWidth;
                }

                function getSliderNavigation() {
                    if($('.swiper-nav').length) {
                        let navigationCurrentSlide = document.querySelector('.swiper-nav .swiper-navigation .swiper-navigation-current-slide');
                        let navigationLastSlide = document.querySelector('.swiper-nav .swiper-navigation .swiper-navigation-last-slide');
                        let swiperWrapper = document.querySelector('.slider-container .swiper-wrapper')
                        let prevButton = document.querySelector('.swiper-nav .swiper-button-prev');
                        let nextButton = document.querySelector('.swiper-nav .swiper-button-next');
                        let lastVisibleSlide;
                        let slidesLength = swiper.slides.length;
                        let slides = Object.values(swiper.slides);

                        swiper.updateSlidesOffset();
                        slides.pop();
                        slides.map((singleSlide, index) => {
                            if(singleSlide.classList.contains('swiper-slide-visible')) {
                                lastVisibleSlide = index;
                            }
                        })

                        swiper.activeIndex = 0;

                        navigationCurrentSlide.textContent = lastVisibleSlide + 1;

                        navigationLastSlide.textContent = slidesLength;

                        var observer = new MutationObserver(function (mutations) {
                            slides = [...mutations[0].target.childNodes]
                            slides.map((singleSlide, index) => {
                                if(singleSlide.classList.contains('swiper-slide-visible')) {
                                    lastVisibleSlide = index;
                                }
                            })

                            navigationCurrentSlide.textContent = lastVisibleSlide + 1;

                            if (swiper.translate < -(swiper.virtualSize - swiper.width - 100)) {
                                swiperWrapper.style.left = '32px'
                            }
                            else if (swiper.translate < -200) {
                                swiperWrapper.style.left = '16px'
                            }
                            else if(swiper.translate < -100) {
                                swiperWrapper.style.left = '8px'
                            }
                            else {
                                swiperWrapper.style.left = '0'
                            }
                        });

                        let swiperContainer = document.querySelector('.slider-container .swiper-wrapper');
                        observer.observe(swiperContainer, {
                            attributes: true,
                            attributeFilter: ["style"],
                            childList: true,
                        });
                        const swiperClass = document.querySelector('.swiper-wrapper')
                        if (swiperClass) {
                            swiper.on('transitionStart', function(){
                                swiperClass.classList.add('swiper-wrapper--move')
                            });

                            swiper.on('transitionEnd', function(){
                                setTimeout(function() {
                                    swiperClass.classList.remove('swiper-wrapper--move')
                                }, 100);

                            });
                        }

                        swiper.on('sliderMove', function() {
                            if(lastVisibleSlide == swiper.slides.length - 1) {
                                nextButton.classList.add('swiper-button-disabled')
                            }
                            else if (swiper.activeIndex == 0) {
                                prevButton.classList.add('swiper-button-disabled')
                            }
                            else {
                                nextButton.classList.remove('swiper-button-disabled')
                                prevButton.classList.remove('swiper-button-disabled')
                            }
                        })
                        swiper.on('slideChange', function() {
                        })
                    }
                }

                function initNavigation() {
                    let prevButton = document.querySelector('.swiper-nav .swiper-button-prev');
                    let nextButton = document.querySelector('.swiper-nav .swiper-button-next');
                    swiper.activeIndex = 0;
                    let nextSlide = function nextSlide() {
                        swiper.slideNext()
                        if((swiper.activeIndex == swiper.slides.length - 1) || (swiper.activeIndex + swiper.visibleSlidesIndexes.length == swiper.slides.length)) {
                            nextButton.classList.add('swiper-button-disabled')
                            prevButton.classList.remove('swiper-button-disabled')
                        }
                        else {
                            nextButton.classList.remove('swiper-button-disabled')
                            prevButton.classList.remove('swiper-button-disabled')
                        }
                    }
                    let prevSlide = function prevSlide() {
                        swiper.slidePrev()
                        if(swiper.activeIndex == 0) {
                            prevButton.classList.add('swiper-button-disabled')
                            nextButton.classList.remove('swiper-button-disabled')
                        }
                        else {
                            prevButton.classList.remove('swiper-button-disabled')
                            nextButton.classList.remove('swiper-button-disabled')
                        }
                    }
                    prevButton.removeEventListener('click', prevSlide);
                    nextButton.removeEventListener('click', nextSlide);
                    prevButton.addEventListener('click', prevSlide);
                    nextButton.addEventListener('click', nextSlide);
                    prevButton.click();
                }

                function updateSlidesWidth() {
                    self.slideWidths = []
                    visibleSlides.map(singleVisibleSliderCounter => {
                        self.slideWidths.push($('.slider-container .swiper-wrapper .swiper-slide').first().outerWidth() * singleVisibleSliderCounter + ($('.slider-container').innerWidth() - $('.slider-container').width()))
                    })
                }

                function initSlider(mode) {
                    swiper = new Swiper('.slider-container', {
                        // Optional parameters
                        direction: 'horizontal',
                        loop: false,
                        initialSlide: 0,
                        spaceBetween: 0,
                        slidesPerView: visibleSlides[0],
                        watchSlidesProgress: true,
                        watchSlidesVisibility: true,
                        slidesPerGroup: 1,
                        centeredSlides: false,
                        slidesOffsetBefore: 0, // in px
                        slidesOffsetAfter: 0, // in px
                        width: self.slideWidths[0],
                        // Navigation arrows
                        breakpoints: {
                            1250: {
                                width: self.slideWidths[0],
                                slidesPerView: visibleSlides[0],
                            },
                            1164: {
                                width: self.slideWidths[1],
                                slidesPerView: visibleSlides[1],
                            },
                            991: {
                                width: self.slideWidths[2],
                                slidesPerView: visibleSlides[2],
                            },
                            767: {
                                width: self.slideWidths[3],
                                slidesPerView: visibleSlides[3],
                            },
                            568: {
                                width: self.slideWidths[4],
                                slidesPerView: visibleSlides[4],
                            },
                            1: {
                                width: self.slideWidths[4],
                                slidesPerView: visibleSlides[4],
                            }
                        },
                        containerModifierClass: 'swiper-container-', // NEW
                        slideClass: 'swiper-slide',
                        slideActiveClass: 'swiper-slide-active',
                        slideDuplicateActiveClass: 'swiper-slide-duplicate-active',
                        slideVisibleClass: 'swiper-slide-visible',
                        slideDuplicateClass: 'swiper-slide-duplicate',
                        slideNextClass: 'swiper-slide-next',
                        slideDuplicateNextClass: 'swiper-slide-duplicate-next',
                        slidePrevClass: 'swiper-slide-prev',
                        slideDuplicatePrevClass: 'swiper-slide-duplicate-prev',
                        wrapperClass: 'swiper-wrapper',
                        lazyLoadingClass: 'swiper-lazy',
                        lazyStatusLoadingClass: 'swiper-lazy-loading',
                        lazyStatusLoadedClass: 'swiper-lazy-loaded',
                        lazyPreloaderClass: 'swiper-lazy-preloader',
                        notificationClass: 'swiper-notification',
                        preloaderClass: 'preloader',
                        zoomContainerClass: 'swiper-zoom-container',
                        observeSlideChildren: true,
                        nextButton: '.swiper-button-next',
                        prevButton: '.swiper-button-prev',
                    });
                    getSliderNavigation();
                }
                window.onresize = getSlideWidth
                window.onresize = updateSlidesWidth()
                window.onresize = initSlider(mode);
                window.onresize = getSliderNavigation;
                // swiper.attachEvents();
                swiper.update();
                initNavigation();
                getSliderNavigation();
                $('.slider-container .swiper-wrapper .swiper-slide').each(function(index, slide) {
                    if($(slide).find('.package-selected').length) {
                        swiper.slideTo(index, 500)
                    }
                })

                // Switcher buttons
                let buttons = [...document.querySelectorAll('.swiper-switcher .swiper-switcher__label')]

                buttons.map(singleButton => {
                    singleButton.addEventListener('click', () => {
                        if(singleButton.dataset.slider == 'off') {
                            this.sliderEnabled = false
                        }

                        if(singleButton.dataset.slider == 'on') {
                            this.sliderEnabled = true
                        }

                        this.selectedMode = singleButton.textContent;
                        if(!this.sliderEnabled) {
                            swiper.translateTo(0, 0, false)
                            // swiper.cleanupStyles();
                            swiper.detachEvents();
                        }
                        else {
                            swiper.attachEvents();
                            swiper.update();
                            initNavigation();
                            getSliderNavigation();
                        }
                    })
                })


                //Navigation buttons - gradients

                let leftButton = document.querySelector('.swiper-container .swiper-navigation-secondary-left')
                let rightButton = document.querySelector('.swiper-container .swiper-navigation-secondary-right')
                leftButton.addEventListener('click', () => {

                    swiper.slidePrev()
                })
                rightButton.addEventListener('click', () => {
                    swiper.slideNext()
                })
            }
        },
        show(d) {
            return d
        },
        changeMode: function (event) {
            event.target.parentNode.querySelector('.active').classList.remove('active');
            event.target.classList.toggle('active');
            this.selectedMode = event.target.textContent;
            this.sliderEnabled = event.target.dataset.slider;

            if(event.target.dataset.slider == 'off') {
                this.sliderEnabled = false

            }

            if(event.target.dataset.slider == 'on') {
                this.sliderEnabled = true
            }
        },
        isMarketConnectProductWithDomain() {
            if (this.cart.products[0]) {
                return this.cart.products[0].productinfo.type === 'other' && this.cart.products[0].domain
            }
            return false
        },
        getFormattedPrice(price) {
            return formatPrice.getFormattedPrice(price, this.currency.format)
        },
        getDefaultBillingCycle(obj) {
            return this.layoutSettings.highestBillingPeriod ? Object.keys(obj)[Object.keys(obj).length - 1] : Object.keys(obj)[0]
        },
        isPageRTL() {
            return $('html').attr('dir') == 'rtl' ? true : false;
        },
        getSlidesClasses() {
            return [
                { 'slider-container swiper-container' : (this.products.length > 3 && this.layoutSettings.packagesSlider && this.sliderEnabled && this.$store.state.cartStore.pageType !== 'bottom' && this.isOneStep )|| (this.products.length > 4 && this.layoutSettings.packagesSlider && this.sliderEnabled && this.$store.state.cartStore.pageType !== 'bottom' && !this.isOneStep || this.products.length > 4 && this.layoutSettings.packagesSlider && this.sliderEnabled && this.$store.state.cartStore.pageType == 'bottom')},
                { 'swiper-sidebar' : !this.showNumber && this.isOneStep},
                { 'swiper-full-width' : this.showNumber || !this.isOneStep},
                { 'swiper-full-width--number' : this.showNumber && this.isOneStep},
                { 'swiper-full-width--futuristic' : this.layoutSettings.templates && this.layoutSettings.templates.lagom.active_style === 'futuristic'},
                { 'swiper-disabled' : !this.sliderEnabled}
            ]
        },
        getSecondaryNavigationClasses() {
            return [
                { 'swiper-wrapper': (this.products.length > 3 && this.layoutSettings.packagesSlider && this.sliderEnabled && this.$store.state.cartStore.pageType !== 'bottom' && this.isOneStep) || (this.products.length > 4 && this.layoutSettings.packagesSlider && this.sliderEnabled && this.$store.state.cartStore.pageType !== 'bottom' && !this.isOneStep) || (this.products.length > 4 && this.layoutSettings.packagesSlider && this.sliderEnabled && this.$store.state.cartStore.pageType == 'bottom')},
                { 'swiper-steps': !this.showNumber},
                { 'swiper-two-step' : !this.isOneStep}
            ]
        },
        getProductClasses() {
            return [
                { 'col-lg-3 col-md-4 col-xs-6 col-xxs-12': this.showNumber ||  (!this.showNumber && this.products.length > 0 && !this.isOneStep)},
                { 'col-lg-4 col-md-4 col-xs-6 col-xxs-12': !this.showNumber && this.products.length > 0 && this.isOneStep },
                { 'two-step-product' : !this.isOneStep},
                { 'col-sm-4 col-xs-6 col-xxs-12 swiper-slide': this.products.length > 3 && this.layoutSettings.packagesSlider && this.sliderEnabled && this.$store.state.cartStore.pageType !== 'bottom' },
                { 'swiper-slide': this.products.length > 4 && this.layoutSettings.packagesSlider && this.sliderEnabled && this.$store.state.cartStore.pageType == 'bottom' },
            ]
        },
        getPackageClass(product) {
            return [
                { 'package-selected' : (this.selectedProduct == product.id) && this.isOneStep},
                { 'package-featured': product.is_featured === 1},
                { 'package-sm': this.isOneStep},
                { 'is-disabled': product.outOfStock}
            ]
        },
        getPackageHorizontalClass(product) {
            return [
                { 'package-selected' : (this.selectedProduct == product.id) && this.isOneStep},
                { 'package-featured':  product.is_featured === 1},
                { 'package-sm': this.isOneStep},
                { 'is-disabled': product.outOfStock},
                { 'package-horizontal--bottom': this.showNumber}
            ]
        }
    },
    mounted: function() {
        this.productCycle = this.$store.getters['cartStore/getSelectedProductCycle']();
    },
    updated: function() {
        let that = this;
        if (document.querySelector('.swiper-header')) {
            if(!this.isRendered) {
                this.isRendered = true;
                this.sliderEnabled = true;
                setTimeout(function() {
                    that.renderSlider();
                }, 10);
            }
        }
        else {
            this.sliderEnabled = false;
            this.isRendered = false;
        }
        this.productCycle = this.$store.getters['cartStore/getSelectedProductCycle']();
    },
});
