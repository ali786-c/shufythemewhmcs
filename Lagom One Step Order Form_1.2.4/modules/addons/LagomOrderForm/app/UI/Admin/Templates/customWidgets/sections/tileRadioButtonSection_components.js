mgJsComponentHandler.addDefaultComponent('mg-tile-radio-buttons', {
    template : '#t-mg-tile-radio-buttons',
    props: [
        'component_id',
        'component_namespace',
        'component_index',
        'tile_buttons_encoded',
        'name',
        'active_value',
    ],
    data : function() {
        return {
            'tileButtons' : [],
            'activeTileButton' : null,
        };
    },
    created: function () {
        this.tileButtons = JSON.parse(this.tile_buttons_encoded);
        this.activeTileButton = this.active_value;
        this.$parent.$root.$on('reloadMgData', this.updateMgData);
    },
    methods: {
        activeTile: function (id, isDisabled) {
            if(isDisabled == false){
                this.activeTileButton = id;
            }

        },
        updateMgData: function(){
        },
    }
});
