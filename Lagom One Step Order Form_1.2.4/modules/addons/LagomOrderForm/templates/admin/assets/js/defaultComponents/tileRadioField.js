mgJsComponentHandler.addDefaultComponent('mg-tile-radio-field', {
    template: '#t-mg-tile-radio-field',
    props: [
        'component_id',
        'component_namespace',
        'component_index',
        'form_name',
        'form_data'
    ],
    data: function () {
        return {
            isMultiple: false,
            isSelectable: false,
            items: [],
            selected: [],
            details: [],
            loading: false,
        };
    },
    created: function () {
        var self = this;
        self.details = JSON.parse(self.form_data);

        self.$nextTick(function () {

            if (self.details.loadOnReady != true) {
                self.setData(self.details);
                return;
            }
            self.loadAjaxData();
        });

        self.$parent.$root.$on('reloadMgData', this.loadAjaxData);
    },
    methods: {
        addItem: function (id) {
            if (this.isMultiple === false) {
                this.selected.splice(0);
            }
            if (this.selected.includes(id) === false) {
                this.selected.push(id);
            }
        },
        loadModal: function(event, targetId, namespace, index, params, addSpinner, spinnerOnTargetId){
            mgPageControler.vueLoader.loadModal(event, targetId,
                typeof namespace !== 'undefined' ? namespace : getItemNamespace(targetId),
                typeof index !== 'undefined' ? index : getItemIndex(targetId), params, addSpinner, spinnerOnTargetId);
        },
        isSelected: function (id) {
            return this.selected.includes(id);
        },
        loadAjaxData: function () {
            var self = this;
            self.loading = true;
            var loadFormData = false;
            if (loadFormData) {
                var tmpForm = $("select[name='" + self.component_id + "']").parents('form').first();
                var tmpFormId = $(tmpForm).attr('id');
                var tmpFormDataHandler = new mgFormControler(tmpFormId);
                var formData = tmpFormDataHandler.getFieldsData();
                if (typeof formData.formData !== 'undefined') {
                    formData = formData.formData;
                }
            } else {
                var formData = {};
            }

            var requestParams = {
                loadData: self.component_id,
                namespace: self.component_namespace,
                index: self.component_index
            };

            for (var key in formData) {
                if (!formData.hasOwnProperty(key)) {
                    continue;
                }
                requestParams[key] = formData[key];
            }

            var response = mgPageControler.vueLoader.vloadData(requestParams);
            return response.done(function (data) {

                self.setData(data);
                self.$nextTick(function () {
                    self.initField();
                });
                self.removeLoader();
            }).fail(function () {
                self.removeLoader();
                self.$nextTick(function () {
                    self.initField();
                });
                mgEventHandler.runCallback('SelectFieldDataLoaded', self.component_id, {
                    instance: self,
                    data: data.data.rawData
                });
            }).then(() => {
                self.loading = false;
            });


        },
        initField: function () {
            this.$forceUpdate()
        },
        removeLoader: function () {

        },
        setData: function (data) {

            if (!data) {
                return;
            }

            let self = this;

            if (data.isSelectable != undefined) {
                self.isSelectable = data.isSelectable;
            }

            if (data.isMultiple != undefined) {
                self.isMultiple = data.isMultiple;
            }
            if (data.items != undefined) {
                self.items = data.items;
                self.items.forEach(function (icon) {
                    if (icon.isActive === true) {
                        self.addItem(icon.id);
                    }
                });
            }
        }
    }
});
