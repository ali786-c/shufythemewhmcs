const domainAddon = {
    template: '#t-mg-one-page-domain-addon-field',
    data: function () {
        return {
            selected: false,
            loader: false,
        }
    },
    props: {
        field: {
            required: true
        },
        data: null,
    },
    watch:{
        selectedAddons: {
            handler(formData) {
                if(formData && formData[this.field.id] === 'on'){
                    this.selected = true;
                }else{
                    this.selected = false;
                }
            },
            deep: true,
        },
    },
    computed:{
        selectedAddons:{
            get(){
                return this.$store.getters['cartStore/getDomainAddonsFormData']()
            },
            deep: true
        },
        layoutSettings: {
            get() {
                return this.$store.getters['cartStore/getLayoutSettings']();
            }
        },
        currency: {
            get() {
                return this.$store.getters['cartStore/getSelectedCurrency']();
            },
        },
    },
    methods: {
        addAddon: function () {
            let self = this;
            self.loader = true;
            this.$store.dispatch('cartStore/addDomainAddon', this.field.id)
                .then(response => { self.loader = false;})
                .catch(() => {self.loader = false;});
        },
        removeAddon: function () {
            let self = this;
            // self.loader = true;
            this.$store.dispatch('cartStore/deleteDomainAddon', this.field.id)
                .then(response => {})
                .catch(() =>{});
        },
    },
};