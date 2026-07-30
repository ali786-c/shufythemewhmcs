<div class="lu-block__body" id="{$rawObject->getId()}">
    <div class="lu-widget">
        {if $rawObject->isShowTitle()}
            <div class="lu-widget__header">
                <div class="lu-widget__top lu-top">
                     <div class="lu-top__title"> {if $rawObject->isRawTitle()}{$rawObject->getRawTitle()}{elseif $rawObject->getTitle()}{$MGLANG->T($rawObject->getTitle())}{/if}</div>
                </div>
            </div>
        {/if}
        <div class="lu-widget__content">
            <div class="lu-row">
                {foreach from=$rawObject->getFieldComponents() item=field }
                    {$field->getHtml()}
                {/foreach}
{*                <div class="lu-col-sm m-w-206">*}
{*                    <a href="#" data-toggle="lu-modal" data-target="#choose-icons" class="lu-widget lu-widget--gateway has-overlay">*}
{*                        <div class="lu-widget__media">*}
{*                            <div class="lu-widget__overlay" data-trigger="logo_big">*}
{*                                <div class="lu-widget__content">*}
{*                                    <div class="lu-msg lu-msg--sm">*}
{*                                        <div class="lu-msg__icon lu-i-c--bordered-dash">*}
{*                                            <span class="lu-i-c lu-zmdi lu-i-c-2x lu-zmdi-image-alt lu-text-default"></span>*}
{*                                        </div>*}
{*                                        <div class="lu-msg__body">*}
{*                                            <div class="lu-msg__title lu-type-8">Click to assing icon</div>*}
{*                                        </div>*}
{*                                    </div>*}
{*                                </div>*}
{*                            </div>*}
{*                            <div class="lu-widget__content">*}
{*                                <img src="/dev/modules/addons/LagomOrderForm/templates/client/default/assets/img/gateways/banktransfer.svg" alt="Bank Transfer"/>*}
{*                            </div>*}
{*                        </div>*}
{*                    </a>*}
{*                    <h6>Bank Transfer</h6>*}
{*                </div>*}

{*                <div class="lu-col-sm m-w-206">*}
{*                    <a href="#" data-toggle="lu-modal" data-target="#choose-icons" class="lu-widget lu-widget--gateway">*}
{*                        <div class="lu-widget__media">*}
{*                            <div class="lu-msg lu-msg--sm">*}
{*                                <div class="lu-msg__icon lu-i-c--bordered-dash">*}
{*                                    <span class="lu-i-c lu-zmdi lu-i-c-2x lu-zmdi-image-alt lu-text-default"></span>*}
{*                                </div>*}
{*                                <div class="lu-msg__body">*}
{*                                    <div class="lu-msg__title lu-type-8">Click to assing icon</div>*}
{*                                </div>*}
{*                            </div>*}
{*                        </div>*}
{*                    </a>*}
{*                    <h6>Stripe</h6>*}
{*                </div>*}
{*                <div class="lu-col-sm m-w-206">*}
{*                    <a href="#" data-toggle="lu-modal" data-target="#choose-icons" class="lu-widget lu-widget--gateway">*}
{*                        <div class="lu-widget__media">*}
{*                            <div class="lu-msg lu-msg--sm">*}
{*                                <div class="lu-msg__icon lu-i-c--bordered-dash">*}
{*                                    <span class="lu-i-c lu-zmdi lu-i-c-2x lu-zmdi-image-alt lu-text-default"></span>*}
{*                                </div>*}
{*                                <div class="lu-msg__body">*}
{*                                    <div class="lu-msg__title lu-type-8">Click to assing icon</div>*}
{*                                </div>*}
{*                            </div>*}
{*                        </div>*}
{*                    </a>*}
{*                    <h6>PayPal</h6>*}
{*                </div>*}
{*                <div class="lu-col-sm m-w-206">*}
{*                    <a href="#" data-toggle="lu-modal" data-target="#choose-icons" class="lu-widget lu-widget--gateway">*}
{*                        <div class="lu-widget__media">*}
{*                            <div class="lu-msg lu-msg--sm">*}
{*                                <div class="lu-msg__icon lu-i-c--bordered-dash">*}
{*                                    <span class="lu-i-c lu-zmdi lu-i-c-2x lu-zmdi-image-alt lu-text-default"></span>*}
{*                                </div>*}
{*                                <div class="lu-msg__body">*}
{*                                    <div class="lu-msg__title lu-type-8">Click to assing icon</div>*}
{*                                </div>*}
{*                            </div>*}
{*                        </div>*}
{*                    </a>*}
{*                    <h6>2Checkout</h6>*}
{*                </div>*}
            </div>
        </div>
    </div>
</div>