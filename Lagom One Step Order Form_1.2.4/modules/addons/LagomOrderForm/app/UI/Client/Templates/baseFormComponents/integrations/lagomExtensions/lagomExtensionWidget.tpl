{if $promoSliderExtension}
    <div id="integrations-container{$rawObject->getId()}" class="section section--extension">
        <div id="{$rawObject->getId()}">
            {if $promoSliderExtension && file_exists("$templatePath/core/extensions/PromoBanners/promo-slide.tpl")}
                {include file="$templatePath/core/extensions/PromoBanners/promo-slide.tpl" setting="cart-view" class="m-t-3x"}
            {/if}
        </div>
    </div>
{/if}