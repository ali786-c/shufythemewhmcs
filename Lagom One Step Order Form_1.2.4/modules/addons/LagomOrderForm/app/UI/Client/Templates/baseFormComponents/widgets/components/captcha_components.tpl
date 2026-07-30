<script type="text/x-template" id="t-mg-one-page-captcha-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
    <div v-if="captchaType == 'invisible' && isVisible" >
        <form id="captchaForm">
            <div class="g-recaptcha" id="invisible" title="" :data-sitekey="captcha.siteKey" data-size="invisible"  data-original-title="Required"></div>
            {* <div class="recaptcha-container center-block" id="captchaContainer">
            </div> *}
            <button type="button" class="btn btn-primary has-loader btn-recaptcha hidden btn-recaptcha-invisible" @click="confirmCaptcha($event)">
                <span class="btn-text" v-bind:class="[isSpinning ? 'invisible': '']">{$MGLANG->absoluteT('LagomOrderForm','captcha','modal','confirm')}</span>
                <div class="btn-loader">
                    <div class="spinner spinner-light spinner-sm" v-if="isSpinning">
                        <div class="rect1"></div>
                        <div class="rect2"></div>
                        <div class="rect3"></div>
                        <div class="rect4"></div>
                        <div class="rect5"></div>
                    </div>
                </div>
            </button>
        </form>
    </div>
    <div class="modal fade modalForHCaptcha" id="captchaContainerModal" data-backdrop="static" v-else-if="captchaType == 'hCaptcha' && isVisible">
        <div class="modal-dialog" >
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="lm lm-close"></i></button>
                    <h3 class="modal-title">{$MGLANG->absoluteT('LagomOrderForm','captcha', 'modal', 'change', 'title')}</h3>
                </div>
                <div>
                    <div>
                        <div class="alert alert-danger alert-sm m-b-16" v-if="error" v-html="error"></div>
                        <form id="captchaForm">
                            <div class="modal-body">
                                <div id="hCaptchaDiv" class="h-captcha" :data-sitekey="captcha.siteKey"></div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary has-loader" @click="confirmCaptcha($event)">
                                    <span class="btn-text" v-bind:class="[isSpinning ? 'invisible': '']">{$MGLANG->absoluteT('LagomOrderForm','captcha','modal','confirm')}</span>
                                    <div class="btn-loader">
                                        <div class="spinner spinner-light spinner-sm" v-if="isSpinning">
                                            <div class="rect1"></div>
                                            <div class="rect2"></div>
                                            <div class="rect3"></div>
                                            <div class="rect4"></div>
                                            <div class="rect5"></div>
                                        </div>
                                    </div>
                                </button>
                                <button type="button" class="btn btn-default" @click="closeCaptcha()">{$MGLANG->absoluteT('LagomOrderForm','captcha', 'modal',  'close')}</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="captchaContainerModal" data-backdrop="static" v-else-if="captchaType != 'invisible' && isVisible">
        <div class="modal-dialog" >
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="lm lm-close"></i></button>
                    <h3 class="modal-title">{$MGLANG->absoluteT('LagomOrderForm','captcha', 'modal', 'change', 'title')}</h3>
                </div>
                {* RECAPTCAH CONTAINER *}
                <div v-if="captchaType !== 'base'">
                    <div v-if="recaptchaKeyInitialized">
                        <div class="alert alert-danger alert-sm m-b-16" v-if="error" v-html="error"></div>
                        <form id="captchaForm">
                            <div class="modal-body">
                                <div class="recaptcha-container center-block" id="captchaContainer">
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary has-loader  btn-recaptcha" v-bind:class="[captchaType === 'invisible' ? 'btn-recaptcha-invisible': '']"  @click="confirmCaptcha($event)">
                                    <span class="btn-text" v-bind:class="[isSpinning ? 'invisible': '']">{$MGLANG->absoluteT('LagomOrderForm','captcha','modal','confirm')}</span>
                                    <div class="btn-loader">
                                        <div class="spinner spinner-light spinner-sm" v-if="isSpinning">
                                            <div class="rect1"></div>
                                            <div class="rect2"></div>
                                            <div class="rect3"></div>
                                            <div class="rect4"></div>
                                            <div class="rect5"></div>
                                        </div>
                                    </div>
                                </button>
                                 <button type="button" class="btn btn-default" @click="closeCaptcha()">{$MGLANG->absoluteT('LagomOrderForm','captcha', 'modal',  'close')}</button>
                            </div>
                        </form>
                    </div>
                </div>
                {* BASE CAPTCAH CONTAINER *}
                <div class="modal-body" v-if="captchaType === 'base'">
                    <div class="alert alert-danger alert-sm m-b-16" v-if="error" v-html="error"></div>
                    <div class="captcha-container" id="captchaContainer">
                        <p>{$MGLANG->absoluteT('LagomOrderForm','captcha', 'modal', 'change',  'description')}</p>
                        <div class="default-captcha input-group">
                            <div class="input-group-addon">
                                <img id="inputCaptchaImageCheckout" :src="captcha.imgUrl" align="middle"/>
                            </div>
                            <input id="inputCaptcha" type="text" name="code" maxlength="{$rawObject->getMaxLength()}"
                                    v-model="captchaCode" class="form-control" required
                                    data-toggle="tooltip" data-placement="right" data-trigger="manual"
                                   @keyup.enter="confirmCaptcha($event)"
                            />
                        </div>

                    </div>
                </div>
                <div class="modal-footer" v-if="captchaType === 'base'">
                    <button type="button" class="btn btn-primary has-loader" @click="confirmCaptcha($event)" >
                        <span class="btn-text" v-bind:class="[isSpinning ? 'invisible': '']">{$MGLANG->absoluteT('LagomOrderForm','captcha','modal','confirm')}</span>
                        <div class="btn-loader">
                            <div class="spinner spinner-light spinner-sm" v-if="isSpinning">
                                <div class="rect1"></div>
                                <div class="rect2"></div>
                                <div class="rect3"></div>
                                <div class="rect4"></div>
                                <div class="rect5"></div>
                            </div>
                        </div>
                    </button>
                    <button type="button" class="btn btn-default" @click="closeCaptcha()">{$MGLANG->absoluteT('LagomOrderForm','captcha', 'modal',  'close')}</button>
                </div>
            </div>
        </div>
    </div>
</script>