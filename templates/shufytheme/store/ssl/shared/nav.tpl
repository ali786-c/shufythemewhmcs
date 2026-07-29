<div class="full__width__secondarysidebar__menu white-bg">
	<div class="main__page__content">
		<ul class="nav">
			<li class="nav-item {if empty($current)} active{/if}">
			<a class="nav-link" href="{routePath('store-product-group', $routePathSlug)}">{lang key='overview'}</a>
			</li>
			{if $certTypes.dv > 0 || $inPreview}
			<li class="nav-item {if $current == 'dv'} active{/if}">
			<a class="nav-link" href="{routePath('store-product-group', $routePathSlug, 'dv')}">{lang key='store.ssl.shared.dvSsl'}</a>
			</li>
			{/if}
			{if $certTypes.ov > 0 || $inPreview}
			<li class="nav-item{if $current == 'ov'} active{/if}">
			<a class="nav-link" href="{routePath('store-product-group', $routePathSlug, 'ov')}">{lang key='store.ssl.shared.ovSsl'}</a>
			</li>
			{/if}
			{if $certTypes.ev > 0 || $inPreview}
			<li class="nav-item {if $current == 'ev'} active{/if}">
			<a class="nav-link" href="{routePath('store-product-group', $routePathSlug, 'ev')}">{lang key='store.ssl.shared.evSsl'}</a>
			</li>
			{/if}
			{if $certTypes.wildcard > 0 || $inPreview}
			<li class="nav-item{if $current == 'wildcard'} active{/if}">
			<a class="nav-link" href="{routePath('store-product-group', $routePathSlug, 'wildcard')}">{lang key='store.ssl.shared.wcSsl'}</a>
			</li>
			{/if}
		</ul>
	</div>
</div>
{if $inCompetitiveUpgrade}
    <div class="competitive-upgrade-banner" id="competitiveUpgradeBanner">
        <div class="container">
            <button class="btn btn-default btn-sm float-right" onclick="$('#competitiveUpgradeBanner').slideUp()">{lang key="dismiss"}</button>
            <h4>{lang key="store.ssl.competitiveUpgrade"}</h4>
            <p>{lang key="store.ssl.competitiveUpgradeBannerMsg" domain=$competitiveUpgradeDomain}</p>
        </div>
    </div>
{/if}
