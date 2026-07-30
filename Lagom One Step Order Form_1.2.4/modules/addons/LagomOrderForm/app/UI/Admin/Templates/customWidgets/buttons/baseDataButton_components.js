mgJsComponentHandler.addDefaultComponent('mg-data-button', {
    template : '#t-mg-data-button',
    props: [
        'component_id',
        'component_namespace',
        'component_index',
        'component_data',
    ],
    data : function() {
        return {
            data: null,
        };
    },
    created: function () {
        this.data = JSON.parse(this.component_data);
        this.$parent.$root.$on('reloadMgData', this.updateMgData);
    },
    methods: {
        loadModal: function(event, targetId, namespace, index, params, addSpinner){
            mgPageControler.vueLoader.loadModal(event, targetId,
                typeof namespace !== 'undefined' ? namespace : getItemNamespace(targetId),
                typeof index !== 'undefined' ? index : getItemIndex(targetId), params, addSpinner);
        },
        updateMgData: function(id, params)
        {
            if(this.component_id === id){
                this.data = params.data;
            }

        }
    }
});
