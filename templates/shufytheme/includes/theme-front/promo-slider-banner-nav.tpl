{assign var="items" value=$CoodivMarketConnectServices|default:array()}
{if is_array($items) && $items|count > 1}
	<div class="homepage__promo__slider__nav__wrapper d-lg-block d-none items-{$items|count}">	
		{foreach from=$items item=item key=k name=foo}
			<div class="homepage__promo__slider__nav__box text-center coodiv-hover-y">
				<div class="homepage__promo__slider__nav__box__icon__wrapper">
				{include file="$template/includes/theme-core/promo-slide-icons.tpl" illustration="{$item.name}"}  
				</div>
				<h6 class="coodiv-text-9 font-weight-700 mt-2">{$item.name}</h6>				
				<p class="coodiv-text-11 font-weight-300 mt-1 slider__text__wrapper">
				{if $item.name == 'threesixtymonitoring'}					
					{$LANG.shufytheme.banner__nav__threesixtymonitoring}	
				{else if $item.name == 'xovinow'}					
					{$LANG.shufytheme.banner__nav__xovi}				
				{else if $item.name == 'symantec'}					
					{$LANG.shufytheme.banner__nav__symantec}					
				{else if $item.name == 'nordvpn'}							
					{$LANG.shufytheme.banner__nav__nordvpn}					
				{else if $item.name == 'spamexperts'}					
					{$LANG.shufytheme.banner__nav__spamexperts}					
				{else if $item.name == 'ox'}					
					{$LANG.shufytheme.banner__nav__ox}					
				{else if $item.name == 'codeguard'}					
					{$LANG.shufytheme.banner__nav__codeguard}					
				{else if $item.name == 'marketgoo'}					
					{$LANG.shufytheme.banner__nav__marketgoo}					
				{else if $item.name == 'sitebuilder'}					
					{$LANG.shufytheme.banner__nav__sitebuilder}					
				{else if $item.name == 'weebly'}					
					{$LANG.shufytheme.banner__nav__weebly}				
				{else if $item.name == 'sitelock'}					
					{$LANG.shufytheme.banner__nav__sitelock}	
				{else if $item.name == 'socialbee'}					
					{$LANG.store.socialbee.cartShortDescription}					
				{/if}
				</p>
			</div>
		{/foreach}
	</div>
{/if}
