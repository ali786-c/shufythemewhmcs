mgJsComponentHandler.addDefaultComponent('mg-one-page-product-server-fields', {
    template: '#t-mg-one-page-product-server-fields',
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
    components: {
        vForm: vForm,
    },
    data: function () {
        return {
            formData: {},
            interactiveMode: true,
        }
    },
    watch: {
        formData: {
            handler(formData){
                if(!(this.interactiveMode === true)){
                    return;
                }
                this.updateServerFields(formData);
            },
            deep: true,
        },
        stateFormData: {
            handler(formData){
                this.updateComponentFormData(formData);
            },
            deep: true,
        },
    },
    computed: {
        showNumber: {
            get() {
                return this.$store.getters['cartStore/shouldShowNumber']();
            }
        },
        isVisible: {
            get() {
                return this.$store.getters['cartStore/isVisible']('configurations') && this.serverFields !== undefined && this.serverFields.fields && this.serverFields.fields.length > 0;
            }
        },
        serverFields: {
            get() {
                if(this.lagomTemplateSettings.enable_custom_hostname == '1' && this.layoutSettings.templates && this.layoutSettings.templates.lagom && (this.layoutSettings.templates.lagom.hide_password_fields == this.selectedGroupId || $.inArray(this.selectedGroupId, this.layoutSettings.templates.lagom.hide_password_fields) !== -1)) {
                    if((typeof this.layoutSettings.templates.lagom.hide_password_fields == 'object' || typeof this.layoutSettings.templates.lagom.hide_password_fields == 'number' ) && this.formData.rootpw == '') {
                        const pass = this.generatePass(14)
                        this.formData.rootpw = pass
                        this.interactiveMode = true
                    }
    
                    if((typeof this.layoutSettings.templates.lagom.hide_password_fields == 'object' || typeof this.layoutSettings.templates.lagom.hide_password_fields == 'number') && this.formData.hostname == '') {
                        const hostname = this.makeid(this.lagomTemplateSettings.custom_hostname_interfix_length) + '.' + this.lagomTemplateSettings.custom_hostname_prefix + this.lagomTemplateSettings.custom_hostname_suffix
                        this.formData.hostname = hostname
                        this.interactiveMode = true
                    }
                }

                return this.filterByLayoutSettings(this.$store.getters['cartStore/getProductServerFields']());
            }
        },
        configurableOptions: {
            get(){
                return this.$store.getters['cartStore/getProductConfigurableOptions']();
            }
        },
        isBlockedPage: {
            get() {
                return this.$store.getters['cartStore/getBlockedEvents']()['fullPage'] > 1;
            }
        },
        stateFormData: {
            get() {
                return this.$store.getters['cartStore/getServerFieldsFormData']();
            }
        },
        areConfigOptionsVisible: {
            get() {
                if (this.$store.getters['cartStore/isVisible']('configurations') && this.configurableOptions !== undefined && this.configurableOptions.fields) {
                    return true
                }
                else {
                    return false
                }
            }
        },
        lagomTemplateSettings: {
            get() {
                return this.$store.getters['cartStore/getLagomTemplateSettings']();
            }
        },
        layoutSettings: {
            get() {
                return this.$store.getters['cartStore/getLayoutSettings']();
            }
        },
        selectedGroupId: {
            get() {
                return this.$store.getters['cartStore/getSelectedGroupId']();
            }
        },
    },
    methods: {
        updateComponentFormData(formData){
            this.interactiveMode    = false;
            this.formData           = formData;
            this.$nextTick(() => {
                this.interactiveMode    = true;
            });
        },
        updateServerFields(data){
            this.$store.dispatch('cartStore/updateServerFields', {serverFields: data});
        },
        filterByLayoutSettings(serverFields)
        {
            if(!serverFields.fields) {
                return [];
            }
            
            const layoutSettings = this.$store.getters['cartStore/getLayoutSettings']();
            const gid = parseInt(this.$store.getters['cartStore/getSelectedGroupId']());

            if(!layoutSettings || !layoutSettings.templates || !layoutSettings.templates.lagom )
            {
                return serverFields;
            }
            
            const lagomLayoutSettings = layoutSettings.templates.lagom;            

            if((typeof lagomLayoutSettings.hide_password_fields == 'object' && lagomLayoutSettings.hide_password_fields.indexOf(gid) > -1) || parseInt(lagomLayoutSettings.hide_password_fields) == gid)
            {
                serverFields.fields = serverFields.fields.filter(el => el.name !== 'rootpw');
                serverFields.fields = serverFields.fields.filter(el => el.name !== 'hostname');
            }

            if((typeof lagomLayoutSettings.hide_nameserver_fields == 'object' && lagomLayoutSettings.hide_nameserver_fields.indexOf(gid) > -1) || parseInt(lagomLayoutSettings.hide_nameserver_fields) == gid)
            {
                serverFields.fields = serverFields.fields.filter(el => el.name.indexOf('prefix') === -1);
            }
            
            return serverFields;
        },
        makeid(length) {
            var result = '';
            var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
            var charactersLength = characters.length;
            for (var i = 0; i < length; i++) {
                result += characters.charAt(Math.floor(Math.random() * charactersLength));
            }
            return result;
        },
        generatePass(pLength){
            var keyListAlpha="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz",
                    keyListInt="123456789",
                    keyListSpec="@#$%^&*-+=?",
                    password='';
            var len = Math.ceil(pLength/2);
            len = len - 1;
            var lenSpec = pLength-2*len;
            for (i=0;i<len;i++) {
                password+=keyListAlpha.charAt(Math.floor(Math.random()*keyListAlpha.length));
                password+=keyListInt.charAt(Math.floor(Math.random()*keyListInt.length));
            }
            for (i=0;i<lenSpec;i++)
                password+=keyListSpec.charAt(Math.floor(Math.random()*keyListSpec.length));
            password=password.split('').sort(function(){return 0.5-Math.random()}).join('');
            return password;
        }   
    }
});