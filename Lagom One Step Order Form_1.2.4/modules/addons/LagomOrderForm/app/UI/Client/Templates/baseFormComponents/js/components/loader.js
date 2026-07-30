/**
 * Cart Component
 */
mgJsComponentHandler.addDefaultComponent('mg-one-page-loader', {
    template: '#t-mg-one-page-loader',
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
            isPageBeingLoaded: false,
        }
    },
    computed: {
        isVisible: {
            get() {
                let isVisible = this.$store.getters['cartStore/getSpinners']()['page'];
                if(isVisible) {
                    anim.play();
                    document.querySelector('#one-page-order-init-loader').classList.remove('hidden');
                    document.querySelector('.main-header-content').classList.add('hidden');

                    //Promo extension
                    if(document.querySelector('#integrations-containerlagomExtensionWidget')) {
                        document.querySelector('#integrations-containerlagomExtensionWidget').classList.add('hidden')
                    }
                    document.querySelector('body').classList.remove('page-complete')
                }
                else {
                    document.querySelector('#one-page-order-init-loader').classList.add('hidden')
                    document.querySelector('.main-header-content').classList.remove('hidden')

                    //Promo extension
                    if(document.querySelector('#integrations-containerlagomExtensionWidget')) {
                        document.querySelector('#integrations-containerlagomExtensionWidget').classList.remove('hidden')
                    }

                    document.querySelector('.main-body').classList.remove('preloaded');
                    document.querySelector('.main-header').classList.remove('preloaded')
                    
                    anim.stop();
                }
                return isVisible;
            }
        },
        isBlockedPage: {
            get() {
                return this.$store.getters['cartStore/getBlockedEvents']()['fullPage'] > 1;
            }
        },
    },
    methods: {}
});
