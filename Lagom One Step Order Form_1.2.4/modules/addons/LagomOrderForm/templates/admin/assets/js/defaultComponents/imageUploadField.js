mgJsComponentHandler.addDefaultComponent('mg-image-upload-field', {
    template: '#t-mg-image-upload-field',
    props: [
        'component_id',
        'component_namespace',
        'component_index',
        'image_name',
        'gallery_path',
    ],
    data: function () {
        return {
            availableGraphics: [],
            defaultImage: "img-container.svg",
            linkToGallery: '',
        };
    },
    created: function () {
        this.loadAvailableGraphics();
    },
    methods: {
        isUploaded: function () {
            return this.image_name.length > 0;
        },
        getAvailableGraphics: function () {
            return (typeof this.availableGraphics != 'undefined') ? this.availableGraphics : [];
        },
        getImageFullUrl: function () {
            return this.gallery_path + this.image_name;
        },
        getImageUrlWithName: function (name) {
            return this.gallery_path + name;
        },
        deleteSelectedImage: function () {
            this.image_name = '';
        },
        loadAvailableGraphics: function () {
            var self = this;
            self.loading = true;

            var requestParams = {
                loadData: self.component_id,
                namespace: self.component_namespace,
                index: self.component_index,
            };

            var response = mgPageControler.vueLoader.vloadData(requestParams);

            return response.done(function (data) {
                Object.entries(data['images']).forEach(item => {
                    if (item[1] === self.defaultImage) {
                        delete data['images'][item[0]]
                    }
                })
                self.availableGraphics = data['images'];
                self.linkToGallery = data['linkToGallery'];
            }).fail(function () {
                console.log("failed");
            }).then(() => {
                self.loading = false;
            });
        },
        selectImage: function(imageName) {
            this.image_name = imageName;
        },
        setFileNameInInput: function() {
            input = $("#fileInputContainer input")[0];
            if (typeof input != 'undefined') {
                imageName = document.getElementById("imageName")
                inputImage = input.files[0];
                imageName.innerText = inputImage.name;
            }
        },
        emptyGallery: function() {
            return Object.keys(this.availableGraphics).length == 0;
        },
        truncate(str, n){
            return (str.length > n) ? str.slice(0, n-1) + '&hellip;' : str;
        },
    }
});