mgJsComponentHandler.addDefaultComponent('mg-one-page-promo-code-info', {
    template: '#t-mg-one-page-promo-code-info',
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
    },
    watch: {
        cart: function() {
            if(this.cart.promo && !this.cart.promo.isApplied && !this.wasShow()) {
                window.scrollTo({top: 0, behavior: 'smooth'});
                this.$nextTick(function () {
                    $(".promocode--not-applied").addClass("wasShow");
                });
            }
        }
    },
    computed: {
        cart: {
            get() {
                return this.$store.getters['cartStore/getCartSummary']()
            }
        },
    },
    methods: {
        wasShow: function() {
            return $(".promocode--not-applied").hasClass("wasShow");
        }
    }
});