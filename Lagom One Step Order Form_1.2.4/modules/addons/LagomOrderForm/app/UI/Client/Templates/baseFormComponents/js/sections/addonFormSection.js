const addonFormSection = {
    template: '#t-mg-one-page-addon-section-field',
    props: {
        field: {
            required: true
        },
        data: {
            required: true
        },
    },
    components: {
        stantaloneAddon: stantaloneProductAddon,
        marketConnect: marketConnect,
    },
    computed: {
        showNumber: {
            get() {
                //TODO Change Components
                return this.$store.getters['cartStore/shouldShowNumber']();
            }
        },
    }
};