const domainDropdown = {
    template: '#t-mg-one-page-domain-dropdown-field',
    props: {
        field: {
            required: true
        },
        data: {
            type: Object,
            required: true
        },
    },
    data: function () {
        return {
            value: null,
        }
    },
    value: function(val){
        if(this.data[this.field.id] !== this.value){
            this.data[this.field.id] = this.value
        }
    },
    created(){
        this.initDisplayName();
        this.initValue();
    },
    watch:{
        value: function(val){
            if(this.data[this.field.id] !== this.value){
                this.$set(this.data,this.field.id,this.value)
            }
        }
    },
    methods: {
        initDisplayName(){
            this.displayName = this.displayName === null ? this.name : this.displayName;
        },
        initValue(){
            this.value = this.field.default
            // if(this.data[this.field.id]){
            //     this.value = this.data[this.field.id];
            // }else{
            //     this.$set(this.data,this.field.id,this.value)
            // }
        },
        getTranslatedMessage(name) {
            let langs = pageOrderStore.getters['cartStore/getLang']();
            return mgPageLang.getTranslation([name], langs) ? mgPageLang.sprintf(mgPageLang.translate(name, {'name': name},name)) : name
        },
        change(){
            this.$emit('change', {
                id: this.field.id,
                field: this.field.name,
                value: this.value
            });
        }
    },
};