<script type="text/x-template" id="t-mg-image-upload-field-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
        :name="name"
        :active_value="active_value"
>

<div class="lu-form-group">
    <label class="lu-form-label">
        {if $rawObject->isRawTitle()}{$rawObject->getRawTitle()}{elseif $rawObject->getTitle()}{$MGLANG->T($rawObject->getTitle())}{/if}
        {if $rawObject->getDescription()}
            <i data-title="{$MGLANG->T($rawObject->getDescription())}" data-toggle="lu-tooltip" class="lu-i-c-2x lu-zmdi lu-zmdi-help-outline lu-form-tooltip-helper"></i>
        {/if}
    </label>
    <div v-if="isUploaded()" class="imageFieldContainer">
        <a v-on:click="deleteSelectedImage()" data-toggle="lu-modal" class="lu-widget lu-widget--big lu-widget--gateway" class="has-overlay">
            <div class="lu-widget__media" {foreach $htmlAttributes as $aValue} {$aValue@key}="{$aValue}" {/foreach}>
                <div  class="lu-widget__overlay">
                    <div class="lu-widget__content" id="{$rawObject->getId()}">
                        <div class="lu-msg lu-msg--sm">
                            <div class="lu-msg__icon lu-i-c--bordered-dash">
                                <span class="lu-i-c lu-zmdi lu-i-c-2x lu-zmdi-image-alt lu-text-default"></span>
                            </div>
                            <div class="lu-msg__body">
                                <div class="lu-msg__title lu-type-8">{$MGLANG->absoluteT('button', 'clickToChangeImage')}</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="lu-widget__content">
                    <div class="lu-row">
                        <div class="lu-col-4 imagePreviewContainer">
                            <img :src="getImageFullUrl()" alt="Image Preview">
                        </div>
                    </div>
                    <div class="lu-row">
                        <div class="lu-col-8 imageNameContainer">
                            <span v-html="truncate(image_name,60)"></span>
                        </div>
                    </div>
                </div>
            </div>
        </a>
        <input type="hidden" id="{$rawObject->getId()}" name="{$rawObject->getName()}" :value="image_name">
    </div>
    <div v-else class="imageFieldContainer">
        <div class="imageGalleryContainer" :class="[
            { 'imageGalleryContainer--empty' : emptyGallery() }
        ]">
            <div v-if="emptyGallery()" class="lu-text-center lu-m-t-1x imageGalleryContainer__empty">
                <strong>{$MGLANG->absoluteT('info', 'noImagesInGallery')}</strong>
                <div class="imageGalleryContainer__upload">
                    <span>{$MGLANG->absoluteT('info', 'addGraphic')}</span>
                    <a :href="linkToGallery">{$MGLANG->absoluteT('info', 'mediaManager')}.</a>
                </div>

            </div>
            <div v-else v-for="image in getAvailableGraphics()" class="imageGalleryItem">
                <figure v-on:click="selectImage(image)" data-toggle="lu-modal" class="lu-widget lu-widget--big has-overlay lu-col-3 ">
                    <div  class="lu-widget__overlay">
                        <div class="lu-widget__content" id="{$rawObject->getId()}">
                            <div class="lu-msg lu-msg--sm">
                                <div class="lu-msg__icon lu-i-c--bordered-dash">
                                    <span class="lu-i-c lu-zmdi lu-i-c-2x lu-zmdi-image-alt lu-text-default"></span>
                                </div>
                                <div class="lu-msg__body">
                                    <div class="lu-msg__title lu-type-8">{$MGLANG->absoluteT('button', 'selectImage')}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="lu-widget__content">
                        <div class=imageGalleryItemContainer>
                            <div>
                                <img :src="getImageUrlWithName(image)" alt="Image Preview">
                            </div>
                        </div>
                        <figcaption v-html="image"></figcaption>
                    </div>
                </figure>
            </div>
        </div>
{*        <div class="lu-col-4" id="fileInputContainer">*}
{*            <label for="file">*}
{*                <div class="uploadFileBtn">{$MGLANG->absoluteT('button', 'uploadNewImage')}</div>*}
{*                <span id="imageName"></span>*}
{*            </label>*}
{*            <input type="file" placeholder="{$rawObject->getPlaceholder()}" id="file" name="{$rawObject->getName()}" v-on:change="setFileNameInInput()">*}
{*        </div>*}
    </div>


</div>