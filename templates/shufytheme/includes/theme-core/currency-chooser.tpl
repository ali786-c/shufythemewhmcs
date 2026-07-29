{if $languagechangeenabled && $locales && count($locales) > 1}
	<div class="language__dropdown__select dropdown dropup language" data-language-select>
		<a aria-label="currency selector" class="dropdown__toggle" data-toggle="dropdown" href="#">
			<span class="language__flag__text currency__title__text">{$activeCurrency.code}</span>
		</a>
		<div class="dropdown-menu dropdown__language__search" id="languageChooserContent">
			<div class="dropdown__language__search__child dropdown__header">
				<i class="fal fa-search"></i>
				<input class="languagefiltersearch form-control" placeholder="{$LANG.search}..." type="text" data-language-select-search>
			</div>
			<div class="dropdown__menu__items has-scroll pb-3" data-language-select-list>
				{if $inShoppingCart}
					<form method="post" action="{$WEB_ROOT}/cart.php{if $action}?a={$action}{if $domain}&domain={$domain}{/if}{elseif $gid}?gid={$gid}{/if}">		
				{else}
					<form method="get" action="{$currentpagelinkback}">	
				{/if}
					<input type="hidden" data-language-select-value value="{$activeLocale.localisedName}">
					<input type="hidden" data-language-select-backlink value="{$currentpagelinkback}">
					<input type="hidden" data-language-select-lang value="{$LANG['upgradeService']['select']}">
					<div class="item-selector">
						<input type="hidden" name="currency" value="">
						{foreach $currencies as $selectCurrency}
							<li class="dropdown__language__search__child dropdown__menu__item">
								<a href="#" class="item{if $activeCurrency.id == $selectCurrency.id} active{/if}" data-value="{$selectCurrency.id}">
									<span class="language__text"> {$selectCurrency.code}</span>
								</a>
							</li>
						{/foreach}
					</div>
					<button type="submit" class="mt-3 btn btn-primary btn-sm d-block w-100 py-1 coodiv-text-11 font-weight-300 min-h-auto">{lang key='apply'}</button>		
				</form>
			</div>                 
		</div>
	</div>
{/if}


