/**
 * Cart Component
 */
mgJsComponentHandler.addDefaultComponent('mg-one-page-metrics-billing', {
    template: '#t-mg-one-page-metrics-billing',
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
            floors: [],
            type: '',
            name: '',
            unit: '',
            included:'',
        }
    },
    watch:{
        isVisible: function(value) {
            this.$nextTick(function () {
                if(this.showNumber == true){
                    renderSectionIndex();
                }
            });
        }
    },
    computed: {
        selectedProduct:{
            get(){
                return this.$store.getters['cartStore/getSelectedProductId']();
            }
        },
        metricsBilling:{
            get(){
                return this.$store.getters['cartStore/getMetricsBilling']();
            }
        },
        currency: {
            get() {
                return this.$store.getters['cartStore/getSelectedCurrency']();
            },
        },
        showNumber: {
            get() {
                return this.$store.getters['cartStore/shouldShowNumber']();
            }
        },
        isVisible: {
            get() {
                return this.$store.getters['cartStore/isVisible']('metricsBilling')
            }
        },
        layoutSettings: {
            get() {
                return this.$store.getters['cartStore/getLayoutSettings']()
            }
        }
    },
    methods:{
        capitalize(word) {
            return word[0].toUpperCase() + word.slice(1);
        },
        getFormattedPrice(price) {
            return formatPrice.getFormattedPrice(price, this.currency.format)
        },
        setData(key) {
            this.floors = this.metricsBilling[key].nextFloors
            this.type = this.metricsBilling[key].type
            this.name = this.metricsBilling[key].name
            this.unit = this.metricsBilling[key].unit
            this.included = this.metricsBilling[key].included
        },
        getTranslatedMessage(name) {
            if (name) {
                name = this.capitalize(name)
            }
            let langs = pageOrderStore.getters['cartStore/getLang']();
            return mgPageLang.getTranslation([name], langs) ? mgPageLang.sprintf(mgPageLang.translate(name, {'name': name},name)) : name
        },
        getUnit(unit) {
            return unit ? ' /'+  this.getTranslatedMessage(unit) : mgPageLang.translate('perUnit');
        },
        getUnitModal(unit) {
            return unit ? mgPageLang.translate('perUnitModal') + ' ' +  this.getTranslatedMessage(unit) : mgPageLang.translate('perUnit');
        },

    }
});
