<script type="text/x-template" id="t-mg-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
        :name="name"
>
    <div class="lu-form-group">
        <div class="galleryFieldButtonContainer">
            <button type="button" class="lu-btn lu-btn--primary" v-on:click="buttonAction(event)">
                <span class="lu-btn__text"> Upload Image </span>
            </button>
        </div>
        <div class="componentButtonContainer">
        </div>
        <div class="imageFieldContainer">
            <div class="imageMainGalleryContainer">
                <div v-if="emptyGallery()" class="lu-text-center lu-m-t-3x">
                    <span>{$MGLANG->absoluteT('info', 'noImagesInGallery')}</span>
                </div>
                <div v-else v-for="image in getAvailableGraphics()" class="imageMainGalleryItem">
                    <figure v-on:click="loadImageRemoveModal(event, image)" data-toggle="lu-modal" class="lu-widget lu-widget--big has-overlay lu-col-3 ">
                        <div class="lu-widget__overlay lu-widget__overlay--danger">
                            <div class="lu-widget__content" id="{$rawObject->getId()}">
                                <div class="lu-msg lu-msg--sm">
                                    <div class="lu-msg__icon">
                                        <span class="lu-zmdi lu-zmdi-delete"></span>
                                    </div>
                                    <div class="lu-msg__body">
                                        {$MGLANG->absoluteT('button', 'removeImage')}
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="lu-widget__content">
                            <div class=imageMainGalleryItemContainer >
                                <div>
                                    <img :src="getImageUrlWithName(image)" alt="Image Preview">
                                </div>
                            </div>
                            <figcaption v-html="image"></figcaption>
                        </div>
                    </figure>
                </div>
            </div>
        </div>
    </div>