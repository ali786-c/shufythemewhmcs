{include file="$template/includes/theme-core/init-standalone.tpl"}
{if $shuffythemeversion}
	<div class="main__page__content">		
		{if $coodivhomepagesettings.themehomepagesettingmarketconnectbannaers|default:''=='activated' || $coodivhomepagesettings.id|default:'' != '1'}
			{include file="$template/includes/theme-front/promo-slider-banner.tpl"}
		{/if}
		{if $coodivhomepagesettings.themehomepagesettingmarketconnectbannaersnav|default:''=='activated' || $coodivhomepagesettings.id|default:'' != '1'}
			{include file="$template/includes/theme-front/promo-slider-banner-nav.tpl"}
		{/if}
		{if $coodivhomepagesettings.themehomepagesettinghomepagefeaturedsection|default:''=='activated' || $coodivhomepagesettings.id|default:'' != '1'}
			{include file="$template/includes/theme-front/front-products.tpl"}
		{/if}
		
		{if $coodivhomepagesettings.themehomepagesettingservicesfeatures|default:''=='activated' || $coodivhomepagesettings.id|default:'' != '1'}
			{include file="$template/includes/theme-front/front-features.tpl"}
		{/if}
		
		{if $coodivhomepagesettings.themehomepagesettingannouncements|default:''=='activated' || $coodivhomepagesettings.id|default:'' != '1'}
			{include file="$template/includes/theme-front/front-latest-announcements.tpl"}
		{/if}
	</div>
	<div class="full__with__section">
		{if $coodivhomepagesettings.themehomepagesettingsavingbanner|default:''=='activated' || $coodivhomepagesettings.id|default:'' != '1'}
			{include file="$template/includes/theme-front/front-get-started-and-save.tpl"}
		{/if}
		{if $coodivhomepagesettings.themehomepagesettingsubscribingsection|default:''=='activated' || $coodivhomepagesettings.id|default:'' != '1'}
			{include file="$template/includes/theme-front/front-subscribe-element.tpl"}
		{/if}
	</div>
{/if}
