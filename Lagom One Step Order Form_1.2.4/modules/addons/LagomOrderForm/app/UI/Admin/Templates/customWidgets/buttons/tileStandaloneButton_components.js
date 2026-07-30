mgJsComponentHandler.addDefaultComponent('mg-tile-standalone-button', {
    template : '#t-mg-tile-standalone-button',
    props: [
        'component_id',
        'component_namespace',
        'component_index',
        'img',
        'title'
    ],
    data : function() {
        return {
            imagePath: null,
        };
    },
    created: function () {
        this.imagePath = this.img;
        this.$parent.$root.$on('reloadMgData', this.updateMgData);
        mgEventHandler.on('refreshAvailableIcons', null, this.refreshIcon)
    },
    methods: {
        loadModal: function(event, targetId, namespace, index, params, addSpinner, spinnerOnTargetId){
            mgPageControler.vueLoader.loadModal(event, targetId,
                typeof namespace !== 'undefined' ? namespace : getItemNamespace(targetId),
                typeof index !== 'undefined' ? index : getItemIndex(targetId), params, addSpinner, spinnerOnTargetId);
        },
        updateMgData: function(id, params){
            if(this.component_id === id){
                this.imagePath = params.path;
            }
        },
        refreshIcon: function(id, params){
            if(params && params.availableIcons && params.availableIcons.indexOf(this.imagePath) == -1){
                this.imagePath = null;
            }
        }
    }
});
