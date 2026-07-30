const productAddons = {
    template: '#t-mg-one-page-product-addon-section',
    props: {

        field: {
            type: Object,
            required: true
        },
        data: {
            required: true
        },
    },
    components: {
        stantaloneAddon: stantaloneProductAddon
    },
    computed: {
        showNumber:{
            get(){
                return this.$store.getters['cartStore/shouldShowNumber']();
            }
        },
        layoutSettings: {
            get() {
                return this.$store.getters['cartStore/getLayoutSettings']();
            }
        },
    }
};