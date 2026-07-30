const sliderInput = {
    template: '#t-mg-one-page-slider-input-field',
    computed: {
        visible: {
            get() {
                return this.field.billingCycles[Object.keys(this.field.billingCycles)[0]] !== undefined;
                // return this.field.billingCycles[this.billingCycle] !== undefined;
            }
        },
        details: {
            get() {
                let details = this.field.billingCycles[Object.keys(this.field.billingCycles)[0]]
                if (this.product && this.oldProduct.id !== this.product.id) {
                    this.inputValue = 0
                    if(this.slider) {
                        $('.range-slider-current-value').text(0)
                        // $('[data-range-price]').text(this.getFormattedPrice(0))
                        $('.range-slider-origin').css('transform', 'translateX(-100%)')
                        $('.range-slider-connect').css('transform', 'translate(0,0) scale(0,0)')
                    }
                    this.oldProduct = this.product
                }
                return details
                // return this.field.billingCycles[this.billingCycle];
            }
        },
        billingCycle: {
            get() {
                return this.$store.getters['cartStore/getSelectedProductCycle']();
            }
        },
        currency: {
            get() {
                return this.$store.getters['cartStore/getSelectedCurrency']();
            },
        },
        currencyPrefix: {
            get() {
                return this.currency['prefix'];
            },
        },
        fieldId: {
            get() {
                return 'mg-page-order-config-opt-' + this.field.id;
            }
        },
        option: {
            get() {
                return (this.details !== undefined && this.details.options !== undefined) ? this.details.options[0] : undefined;
            }
        },
        dataOptions: {
            get() {
                if (this.details.qtyminimum != this.details.qtymaximum) {
                    var min = this.details.qtyminimum;
                    var max = this.details.qtymaximum;
                } else if(this.details.qtymaximum != 0) {
                    var min = this.details.qtyminimum;
                    var max = min + 1;
                } else {
                    var min = this.details.qtyminimum;
                    var max = Number.MAX_SAFE_INTEGER;
                }
                if(this.details.qtymaximum == 999 || this.details.qtymaximum == 0) {
                    var isUnlimited = true;
                }
                else {
                    var isUnlimited = false;
                }
                return {
                    minValue: min,
                    maxValue: max,
                    step: 1,
                    startValue: this.inputValue,
                    pricePerOne: this.option.recurring,
                    isUnlimited,
                    priceFloat: this.getFormattedPrice(this.option.recurring)
                }
            }
        },
        product: {
            get(){
                return this.$store.getters['cartStore/getSelectedProductDetails']();
            }
        },
        selectedConfigOptions: {
            get(){
                const product = this.$store.getters['cartStore/getSelectedProduct']()
                if (product.configoptions) {
                    return Object.entries(product.configoptions)
                }
                return []
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
        groupSettings: {
            get() {
                return this.$store.getters['cartStore/getGroupSection']();
            }
        },
        showNumber: {
            get() {
                return this.$store.getters['cartStore/shouldShowNumber']();
            }
        },
    },
    props: {
        field: {
            type: Object,
            required: true
        },
        data: {
            type: Object,
            required: true
        }
    },
    data: function () {
        return {
            inputValue: 0,
            inputted: 0,
            slider: null,
            oldProduct: false,
            // parentElement: '',
            // clonedElement: '',
        }
    },

    mounted() {
        let self = this;
        if (self.details.qtymaximum === 0) {
            self.details.isUnlimited = true;
            self.details.qtymaximum = 999;
        }
        else {
            self.details.isUnlimited = false;
        }

        // this.setInputValue(typeof this.data[this.details.id] !== 'undefined' ? this.data[this.details.id] : this.details.selectedvalue);

        this.$nextTick(function () {
            self.slider = document.getElementById(self.fieldId + '-slider');
            // self.parentElement = self.slider.parentElement;
            // self.clonedElement = self.slider.cloneNode(true);
            this.selectedConfigOptions.forEach(item => {
                if (this.field.id == item[0]) {
                    this.setInputValue(item[1])
                }
            })
            self.renderSlider();
        });
    },
    watch: {
        billingCycle: function(val){
            const self = this;
            if(!self.visible) {
                return;
            }
            self.$nextTick(() => {
                if (self.slider) {
                    self.slider.noUiSlider.set(self.inputValue);
                }
                self.$forceUpdate();
            })

        },
        visible: function (val) {
            let self = this;
            self.inputValue = 0;
            if (val === true) {
                this.$nextTick(function () {
                    self.slider = document.getElementById(self.fieldId + '-slider');
                    self.renderSlider();
                });
            }
        },
        inputValue: function (val) {
            this.data[this.field.id] = val
        },
    },
    ready: function () {

    },
    methods: {
        isPageRTL() {
            return $('html').attr('dir') == 'rtl' ? true : false;
        },
        setValue(event) {
            this.slider.noUiSlider.set(event.target.value);
        },
        renderSlider() {
            let self = this;
            if (self.slider === null) {
                this.$store.dispatch();
                return;
            }
            let slider = noUiSlider.create(self.slider, {
                start: self.dataOptions.startValue,
                step: self.dataOptions.step,
                connect: [true, false],
                snap: false,
                range: {
                    'min': self.dataOptions.minValue,
                    'max': self.dataOptions.maxValue
                },
                behaviour: 'tap-drag',
                direction: self.isPageRTL() ? 'rtl' : 'ltr',
                format: {
                    to: function (value) {
                        return value !== undefined && Math.round(value);
                    },
                    from: function (value) {
                        return value;
                    }
                },
                // pips: {
                //     mode: 'steps',
                //     stepped: true,
                // },
                'cssPrefix': 'range-slider',
                'cssClasses': {
                    target: '',
                    base: '-base',
                    origin: '-origin',
                    handle: '-handle',
                    handleLower: '-handle-lower',
                    handleUpper: '-handle-upper',
                    horizontal: '-horizontal',
                    vertical: '-vertical',
                    background: '-background',
                    connects: "-connects",
                    connect: '-connect',
                    ltr: '-ltr',
                    rtl: '-rtl',
                    draggable: '-draggable',
                    drag: '-state-drag',
                    tap: '-state-tap',
                    active: 'is-active',
                    tooltip: '-tooltip',
                    pips: '-pips',
                    pipsHorizontal: '-pips-horizontal',
                    pipsVertical: '-pips-vertical',
                    marker: '-marker',
                    markerHorizontal: '-marker-horizontal',
                    markerVertical: '-marker-vertical',
                    markerNormal: '-marker-normal',
                    markerLarge: '-marker-large',
                    markerSub: '-marker-sub',
                    value: '-value',
                    valueHorizontal: '-value-horizontal',
                    valueVertical: '-value-vertical',
                    valueNormal: '-value-normal',
                    valueLarge: '-value-large',
                    valueSub: '-value-sub'
                },
            });

            self.inputValue = self.slider.noUiSlider.get();
            let currentValue = document.querySelectorAll('#' + this.fieldId + ' .range-slider-handle');
            let sliderPips = document.querySelectorAll('#' + this.fieldId + ' .range-slider-pips [data-value]');
            // if (sliderPips.length > 21) {

            // }
            self.slider.classList.add("range-slider-two-pips");


            for (i = 0; i < sliderPips.length; i++) {
                sliderPips[i].addEventListener('click', function (event) {
                    let amountLabel = document.querySelector('#' + self.fieldId + ' .range-slider-base .range-slider-current-value');
                    amountLabel.textContent = event.target.dataset.value
                    self.slider.noUiSlider.set(event.target.dataset.value);
                });
            }
            for (i = 0; i < currentValue.length; i++) {
                let amountLabel = document.createElement('span')
                amountLabel.classList.add('range-slider-current-value')
                amountLabel.textContent = self.inputValue
                currentValue[i].appendChild(amountLabel)
            }
            this.handleSliderEvents();
        },
        handleSliderEvents() {
            let container = this.fieldId,
                rangeSlider = document.querySelectorAll('#' + this.fieldId + ' [data-range-slider]'),
                rangeInput = document.querySelectorAll('#' + this.fieldId + ' [data-range-input]'),
                //incBtn = document.querySelectorAll('#'+this.fieldId+' [data-range-inc]'), 
                //decBtn = document.querySelectorAll('#'+this.fieldId+' [data-range-dec]'), 
                price = document.querySelectorAll('#' + this.fieldId + ' [data-range-price]'),
                selectedOption = document.querySelectorAll('#' + this.fieldId + ' [data-selected-option]'),
                viewValue = document.querySelectorAll('#' + this.fieldId + ' [data-range-view]'),
                self = this;
            this.renderFirstAndLastNumber()
            this.slider.noUiSlider.on('update', (values, handle) => {
                this.onUpdate(values, handle, rangeInput);
                this.setPrice(values, handle, rangeInput, price);
                this.setViewValue(values, handle, rangeInput, viewValue);
            });
            this.slider.noUiSlider.on('slide', (values, handle) => {
                this.onSlide(values, handle, rangeInput);
                this.setPrice(values, handle, rangeInput, price);
                this.setViewValue(values, handle, rangeInput, viewValue);
                this.$el.querySelector('.range-slider-handle .range-slider-current-value').textContent = values[0]
            });

            this.slider.noUiSlider.on('change', (values, handle) => {
                this.setPrice(values, handle, rangeInput, price);
                this.setViewValue(values, handle, rangeInput, viewValue);
                this.setInputValue(values[0]);
            });

            this.slider.noUiSlider.on('set', (values, handle) => {
                this.onSet(values, handle, rangeInput);
                this.setPrice(values, handle, rangeInput, price);
                this.setViewValue(values, handle, rangeInput, viewValue);
                this.setInputValue(values[0]);
            });

            this.slider.noUiSlider.on('start', (values, handle) => {
                this.onSet(values, handle, rangeInput);
                this.setPrice(values, handle, rangeInput, price);
                this.setViewValue(values, handle, rangeInput, viewValue);
                this.setInputValue(values[0]);
            });
        },
        renderFirstAndLastNumber() {
            let self = this;
            let templateFirst = `
                
                    <div class="range-slider-value" style="` + (this.isPageRTL() ? `right: 0;`: `left: 0;`) + ` display: block;">` + self.dataOptions.minValue + `</div>
            `

            let templateLast = `
                    <div class="range-slider-value" style="` + (this.isPageRTL() ? `right: 100%;`: `left: 100%;`) + ` display: block;">` + self.dataOptions.maxValue + `</div>
            `
            let rangeSliderPips = document.createElement('div')
            rangeSliderPips.classList.add('range-slider-pips')
            document.querySelector('#' + self.fieldId + ' .range-slider-base').appendChild(rangeSliderPips)
            document.querySelector('#' + self.fieldId + ' .range-slider-pips').innerHTML = templateFirst + templateLast
        },
        onUpdate(values, handle, rangeInput) {
            rangeInput[0].value = values[0].toFixed(0);
        },
        onSet(values, handle, rangeInput) {
            rangeInput[0].value = values[0].toFixed(0);
        },
        onSlide(values, handle, rangeInput) {
            rangeInput[0].value = values[0].toFixed(0);
        },
        setViewValue(values, handle, rangeInput, viewValue) {
            if (viewValue[0]){
                viewValue[0].innerText = rangeInput[0].value;
            }
        },
        setPrice(values, handle, rangeInput, price) {
            if(this.inputValue > this.dataOptions.maxValue) {
                this.inputValue = this.dataOptions.maxValue
                if(rangeInput.length) {
                    rangeInput[0].value = this.inputValue
                }
                this.updateSlider()
            }
            if((price.length || rangeInput.length) && price[0]) {
                price[0].innerText = this.getFormattedPrice(parseFloat(this.dataOptions.pricePerOne) * rangeInput[0].value);
            }
        },
        setInputValue(value) {
            this.inputValue = value;
        },
        updateSlider(action) {
            let rangeInput = document.querySelectorAll('#' + this.fieldId + ' [data-range-input]')
            let viewValue = document.querySelectorAll('#' + this.fieldId + ' [data-range-view]');
            if(action == 'increase') {
                this.inputValue++
            }
            else if(action == 'decrease' && this.inputValue > this.dataOptions.minValue) {
                this.inputValue--
            }
            else if(action == 'checktyping') {
                if(this.inputValue > this.dataOptions.maxValue){
                    this.inputValue = this.dataOptions.maxValue;
                }else if(this.inputValue < this.dataOptions.minValue){
                    this.inputValue = this.dataOptions.minValue
                }
            }
            if(rangeInput.length) {
                rangeInput[0].value = parseInt(this.inputValue).toFixed(0);
            }
            if(this.slider) {
                this.slider.noUiSlider.set(this.inputValue);
                this.$el.querySelector('.range-slider-handle .range-slider-current-value').textContent = this.inputValue
            }
        },
        getFormattedPrice(price) {
            return formatPrice.getFormattedPrice(price, this.currency.format)
        },
        getPrice() {
            const price = this.details.selectedqty !== 0 ?
                this.details.selectedrecurring / this.details.selectedqty * this.inputValue : this.details.options[0].recurring * this.inputValue
            return price || this.details.options[0].recurring ? this.currencyPrefix + this.getFormattedPrice(price) + (this.layoutSettings.displayPriceSuffix ? (' ' + this.currency.suffix) : '')
                : this.$store.getters['cartStore/getZeroPrice']('configurableOptionsPrices')
        },
        getSetupFee(showZeroPrice = false) {
            const price = this.details.selectedqty !== 0 ?
                this.details.selectedsetup / this.details.selectedqty * this.inputValue : this.details.options[0].setupFee * this.inputValue
            return (price || showZeroPrice) ? '+ ' +  this.currencyPrefix + this.getFormattedPrice(price) + (this.layoutSettings.displayPriceSuffix ? (' ' + this.currency.suffix) : '')
                : ''
        }
    }

};