/**
 * Cart Component
 */
mgJsComponentHandler.addDefaultComponent('mg-one-page-notes', {
    template: '#t-mg-one-page-notes',
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
            message: '',
            interactiveMode: false,
        }
    },
    watch: {
        isVisible: function (value) {
            if (value === false) {
                return;
            }
            this.message = this.$store.getters['cartStore/getNotesValue']();
        },
    },
    computed: {
        showNumber: {
            get() {
                return this.$store.getters['cartStore/shouldShowNumber']();
            }
        },
        orderSettings: {
            get(){
                return this.$store.getters['cartStore/getWhmcsOrderSettings']();
            }
        },
        isVisible: {
            get() {
                return this.$store.getters['cartStore/isVisible']('cart') && this.$store.getters['cartStore/getWhmcsOrderSettings']().ShowNotesFieldOnCheckout;
            }
        },
        isBlockedPage: {
            get() {
                return this.$store.getters['cartStore/getBlockedEvents']()['fullPage'] > 1;
            }
        },
    },
    methods: {
        updateMessage(){
            this.$store.dispatch('cartStore/updateNote', {note: this.message});
        }
    }
});
