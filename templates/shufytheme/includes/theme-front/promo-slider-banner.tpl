{if !empty($CoodivMarketConnectServices) && is_array($CoodivMarketConnectServices)}
	{assign var="items" value=$CoodivMarketConnectServices}
	<div class="main__homepage__promo__slider__banner">
		<div class="banner-background" aria-hidden="true">
			<div class="banner-shape active">
				<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 800 400">
				<defs>
				<linearGradient id="linear-gradient" x1="556.06" y1="209.99" x2="585.29" y2="170.51" gradientTransform="matrix(1.38, -0.05, -0.06, -1.5, -148.97, 473.36)" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#2c2e30"/><stop offset="1" stop-color="#1c1e20" stop-opacity="0"/></linearGradient>
				<mask id="mask" x="-398.07" y="-559.62" width="1106.37" height="1101.99" maskUnits="userSpaceOnUse">
				<g id="mask0"><path class="cls-1" d="M409.86-75.74a2.25,2.25,0,0,1,3.37,1.79V292.2a2.25,2.25,0,0,1-3.37,1.8L65.23,110.92a2,2,0,0,1,0-3.59Z"/></g>
				</mask>
				</defs>
				<path class="cls-2" d="M515.67,362,410,296.53,768.56-4.81l90.15,47.18Z"/>
				<path class="cls-3" d="M411.87,295.14V-.68H771.24L412.72,296Z"/>
				<path class="cls-4" d="M409.87-73.28a2.25,2.25,0,0,1,3.36,1.8V294.69a2.25,2.25,0,0,1-3.37,1.79L65.21,113.28l-.09-.09a3.91,3.91,0,0,1,0-5.63l.09-.09Z"/>
				<path class="cls-1" d="M409.86-75.74a2.25,2.25,0,0,1,3.37,1.79V292.2a2.25,2.25,0,0,1-3.37,1.8L65.23,110.92a2,2,0,0,1,0-3.59Z"/>
				<g class="cls-5">
				<path class="cls-6" d="M332.89-542.83l144,213.16c67.3,99.64,35.53,224.49-62.82,281S180.15-21,112.86-120.65l-144-213.16"/>
				<path class="cls-6" d="M-265.36,117.65l144.87-74.51C-52.78,8.32,24.41,22.76,53.78,71.32S55.92,188-11.79,222.85l-144.87,74.51"/>
				<path class="cls-6" d="M-384.35,88.85-154.72-29.26c107.33-55.2,234.15-24.92,286,60.74S144.36,232.53,37,287.74L-192.6,405.84"/>
				<path class="cls-6" d="M290.53,393c-86.6-79.86-85.19-209.81,2-290.24S520.71,21,607.32,100.88s85.2,209.81-2,290.24L465.17,520.32"/>
				<path class="cls-7" d="M558.07,342.64c-35.06,34.44-96.44,35.37-137.21.09s-43.64-91.83-8.58-126.27,96.44-35.37,137.2-.09S593.13,308.2,558.07,342.64Z"/>
				<path class="cls-7" d="M639,409.31c-62.41,61.32-179.82,57.77-262.73-14S282.09,215.75,344.5,154.43s179.83-57.76,262.73,14S701.41,348,639,409.31Z"/>
				</g>
				</svg>
			</div>
		</div>
		<div class="row justify-content-start">
			<div class="col-lg-5 col-md-6 col-12 order-md-first order-last">
				<div class="promo__slider__items__slider">
					{foreach from=$items item=item key=k name=foo}
						<div class="promo__slider__item">
							<div class="col-12 d-flex flex-column justify-content-center caption">							
								{if file_exists("templates/$template/assets/svg/merketconnect-logos/webp/{$item.name}.webp")}
									<div class="markectcoonnect__slug__logo">
										<img loading="lazy" {if $item.name == codeguard}width="140" height="30" {else if $item.name == threesixtymonitoring}width="115" height="30" {else if $item.name == xovinow}width="123" height="30" {else if $item.name == symantec}width="113" height="30" {else if $item.name == nordvpn}width="138" height="30" {else if $item.name == spamexperts}width="117" height="30" {else if $item.name == ox}width="155" height="15" {else if $item.name == marketgoo}width="153" height="30" {else if $item.name == sitebuilder}width="190" height="25" {else if $item.name == weebly}width="86" height="30" {else if $item.name == sitelock}width="154" height="30" {else}width="auto" height="30" {/if}src="{$WEB_ROOT}/templates/{$template}/assets/svg/merketconnect-logos/webp/{$item.name}.webp" alt="{$item.name} logo" />
									</div>
								{else}
									<h6 class="promo__slug__name coodiv-text-12 font-weight-400">{$item.name}</h6>
								{/if}
								<h6 class="promo__title coodiv-text-4 font-weight-700" aria-hidden="true">
								{if $item.name == 'threesixtymonitoring'}					
									{$LANG.shufytheme.banner__nav__threesixtymonitoring__title}	
								{else if $item.name == 'xovinow'}					
									{$LANG.shufytheme.banner__nav__xovi__title}				
								{else if $item.name == 'symantec'}					
									{$LANG.shufytheme.banner__nav__symantec__title}					
								{else if $item.name == 'nordvpn'}							
									{$LANG.shufytheme.banner__nav__nordvpn__title}					
								{else if $item.name == 'spamexperts'}					
									{$LANG.shufytheme.banner__nav__spamexperts__title}					
								{else if $item.name == 'ox'}					
									{$LANG.shufytheme.banner__nav__ox__title}					
								{else if $item.name == 'codeguard'}					
									{$LANG.shufytheme.banner__nav__codeguard__title}					
								{else if $item.name == 'marketgoo'}					
									{$LANG.shufytheme.banner__nav__marketgoo__title}					
								{else if $item.name == 'sitebuilder'}					
									{$LANG.shufytheme.banner__nav__sitebuilder__title}					
								{else if $item.name == 'weebly'}					
									{$LANG.shufytheme.banner__nav__weebly__title}				
								{else if $item.name == 'sitelock'}					
									{$LANG.shufytheme.banner__nav__sitelock__title}		
								{else if $item.name == 'socialbee'}					
									{$LANG.store.socialbee.cartTitle}
								{/if}
								</h6>
								<p class="promo__sub__title coodiv-text-9 font-weight-300 mt-4" aria-hidden="true">
								{if $item.name == 'threesixtymonitoring'}					
									{$LANG.shufytheme.banner__nav__threesixtymonitoring__tagline}	
								{else if $item.name == 'xovinow'}					
									{$LANG.shufytheme.banner__nav__xovi__tagline}				
								{else if $item.name == 'symantec'}					
									{$LANG.shufytheme.banner__nav__symantec__tagline}					
								{else if $item.name == 'nordvpn'}							
									{$LANG.shufytheme.banner__nav__nordvpn__tagline}					
								{else if $item.name == 'spamexperts'}					
									{$LANG.shufytheme.banner__nav__spamexperts__tagline}					
								{else if $item.name == 'ox'}					
									{$LANG.shufytheme.banner__nav__ox__tagline}					
								{else if $item.name == 'codeguard'}					
									{$LANG.shufytheme.banner__nav__codeguard__tagline}					
								{else if $item.name == 'marketgoo'}					
									{$LANG.shufytheme.banner__nav__marketgoo__tagline}					
								{else if $item.name == 'sitebuilder'}					
									{$LANG.shufytheme.banner__nav__sitebuilder__tagline}					
								{else if $item.name == 'weebly'}					
									{$LANG.shufytheme.banner__nav__weebly__tagline}				
								{else if $item.name == 'sitelock'}					
									{$LANG.shufytheme.banner__nav__sitelock__tagline}		
								{else if $item.name == 'socialbee'}					
									{$LANG.store.socialbee.cartShortDescription}										
								{/if}
								</p>
								<div class="promo__btns banner__actions__btns">
									<a href="{routePath('store-product-group', $item.productGroup.slug)}" class="btn btn-lg btn-primary">{lang key='getStartedNow'}</a>
									<a href="{routePath('store-product-group', $item.productGroup.slug)}" class="btn btn-lg btn-primary-outline d-md-flex d-none">{lang key='learnmore'}</a>
								</div>
							</div>
						</div>
					{/foreach}
				</div>
			</div>
			<div class="col-lg-7 col-md-6 col-12 pr-lg-15 order-md-last order-first">
				<div class="promo__slider__illunsration__wrapper">
					{foreach from=$items item=item key=k name=foo}
						<div class="promo__slider__illunsration__item" aria-hidden="true">
							{include file="$template/includes/theme-core/promo-slide-illustration.tpl" illustration="{$item.name}"}  
						</div>
					{/foreach}
				</div>
			</div>
		</div>
	</div>
{/if}