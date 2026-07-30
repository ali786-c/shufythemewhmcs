/**
 * Groups Component
 */
mgJsComponentHandler.addDefaultComponent('mg-one-page-groups', {
    template: '#t-mg-one-page-groups',
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
            currency: null,
            showConfirm: true,
            groupInModal: null,
            hideConfirmationModal: false,
            isConfirmClicked: false,
            isSliderMoving: false,
        }
    },
    watch: {
        isVisible: function (value) {
            let self = this
            this.$nextTick(function () {
                if (this.showNumber == true) {
                    renderSectionIndex();
                }
                if(value) {
                    this.isSliderMoving = false
                    renderNavScroll();
                    this.handleNavTouchScroll(this.$refs.tabSlider, this.$refs.tabSliderContainer)
                }
                $('#changeGroupModal').on('hidden.bs.modal', function () {
                    if(self.hideConfirmationModal && !self.showConfirm && !self.isConfirmClicked) {
                        self.hideConfirmationModal = false
                    }
                });
                
            });
        },
        currency: function (value) {
            this.changeCurrency(value);
        },
        isModalEnabled: function (val) {
            if(val === false){
                this.setShowConfirmationModal(false);
            }
        },
        selectedGroupId: function(value)
        {
            this.$nextTick(() =>
            {
                const isTwoStep = this.$store.getters['cartStore/isTwoStep']();
                const showDomainOptions = this.$store.getters['cartStore/getSelectedProductDetailsValue']('showdomainoptions');
                
                if(showDomainOptions == 1  && !isTwoStep)
                {
                    this.$store.commit('cartStore/showComponent', 'domains', { root: true });
                }
                else
                {
                    this.$store.commit('cartStore/hideComponent', 'domains', { root: true });
                }
            });
        },
        hideConfirmationModal: function(val) {
            if(val) {
                this.showConfirm = false;

            }
        },
    },
    computed: {
        showNumber: {
            get() {
                return this.$store.getters['cartStore/shouldShowNumber']();
            }
        },
        selectedGroupId: {
            get() {
                return this.$store.getters['cartStore/getSelectedGroupId']();
            }
        },
        groups: {
            get() {
                return this.$store.getters['cartStore/getGroups']();
            }
        },
        isVisible: {
            get() {
                let self = this;
                if(Vue.$cookies.get('isGroupModalDisabled')) {
                    self.showConfirm = false
                }
                return this.$store.getters['cartStore/isVisible']('groups')
            }
        },
        isBlockedPage: {
            get() {
                return this.$store.getters['cartStore/getBlockedEvents']()['fullPage'] > 1;
            }
        },
        isModalEnabled: {
            get() {
                return this.$store.getters['cartStore/isGroupModalEnabled']();
            }
        },
        cart: {
            get() {
                return this.$store.getters['cartStore/getCartSummary']()
            }
        },
        layoutSettings: {
            get() {
                return this.$store.getters['cartStore/getLayoutSettings']();
            }
        },
        isTwoStep: {
            get() {
                return this.$store.getters['cartStore/isTwoStep']();
            }
        },
        selectedGateway: {
            get() {
                return this.$store.getters['cartStore/getSelectedPaymentGateway']();
            }
        },
    },
    methods: {
        setGroup: function (event, groupId) {
            event.preventDefault();
            if(!this.isSliderMoving) {
                if (this.isBlockedPage || this.selectedGroupId === groupId) {
                    return;
                }

                if (this.showConfirm && !this.isTwoStep) {
                    return this.showConfirmationModal(groupId);
                }

                this.runGroup(groupId);
            }
        },
        runGroup: function (groupId) {
            this.$store.dispatch('cartStore/changeGroup', groupId);
            this.mountStripeFields()
        },
        showConfirmationModal: function (groupId) {
            $('#changeGroupModal').modal('show');
            this.groupInModal = groupId;
        },
        setShowConfirmationModal(val){
            this.showConfirm = val;
        },
        confirm() {
            this.runGroup(this.groupInModal);
            this.isConfirmClicked = true
            this.close();
        },
        close(e) {
            let self = this
            $('#changeGroupModal').modal('hide');
            this.groupInModal = null;
            if(e) {
                self.showConfirm = true
                self.hideConfirmationModal = false
                self.isConfirmClicked = false
            }
            else {
                setTimeout(function() {
                    if(self.hideConfirmationModal) {
                        self.showConfirm = false
                        Vue.$cookies.set('isGroupModalDisabled', 'true', '7D')
                    }
                    else {
                        self.showConfirm = true
                    }
                    self.isConfirmClicked = true
                }, 250)
            }

            setTimeout(function() {
                if($('#changeGroupModal')[0]) {
                    if($('#changeGroupModal')[0].classList.contains('in')) {
                        $('#changeGroupModal').removeClass('in')
                    }
                }
            }, 200)
        },
        mountStripeFields() {
            if (this.selectedGateway === 'stripe') {
                const interval =  setInterval(function()  {
                    if ($('#mg-card-stripe').length) {
                        mgStripeMount()
                        clearInterval(interval)
                    }
                },1000)
            }
        },
        isPageRTL() {
            return $('html').attr('dir') == 'rtl' ? true : false;
        },
        renderSlider: function(mode) {
            if (document.querySelector('.tabs-slider')){
                this.sliderEnabled = true;
                let swiper = null;

                function initSlider(mode) {
                    swiper = new Swiper('.tabs-slider', {
                        spaceBetween: 0,
                        slidesPerView: 'auto',
                        watchSlidesProgress: true,
                        watchSlidesVisibility: true,
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
                }
                initSlider(mode)
                swiper.update();
            }
        },
    },
});
