<script>
	// Define state tab index value
	var statesTab = 10;
	var stateNotRequired = true;
</script>
{include file="orderforms/standard_cart/common.tpl"}
<script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>
<script type="text/javascript" src="{$BASE_PATH_JS}/PasswordStrength.js"></script>
<script type="text/javascript" src="{$BASE_PATH_JS}/VatValidator.js"></script>
<script>
    window.langPasswordStrength = "{$LANG.pwstrength}";
    window.langPasswordWeak = "{$LANG.pwstrengthweak}";
    window.langPasswordModerate = "{$LANG.pwstrengthmoderate}";
    window.langPasswordStrong = "{$LANG.pwstrengthstrong}";
	window.langVatErrorInvalidFormat = "{lang key='tax.errorVatInvalidFormat'}";
</script>

<div class="standard__cart__order__steps__container full__with__section into__main__page__content__full__width__element">
	<div class="main__page__content">
		<div class="row justify-content-start">
			<div class="col-md-8 col-12">
				<div class="orderform__cart__header">
					<h1 class="coodiv-text-5 font-weight-bold mb-0">{$LANG.cartreviewcheckout}</h1>
					<p class="coodiv-text-10 font-weight-300">{lang key='orderForm.configureDesiredOptions'}</p>
				</div>
			</div>
		</div>

		<div class="standard__cart__order__steps__wrapper mt-9">
			<div class="standard__cart__order__steps">
				<a class="standard__cart__order__steps__item {if $cartitems > 0}done{/if}" href="#"><span class="standard__cart__order__steps__item__number">1</span> <span class="standard__cart__order__steps__item__text">{$LANG.cartproductselection|default:'Product Selection'}</span></a>
				<a class="standard__cart__order__steps__item {if $cartitems > 0}done{/if}" href="#"><span class="standard__cart__order__steps__item__number">2</span> <span class="standard__cart__order__steps__item__text">{$LANG.cartproductconfig|default:'Product Configuration'}</span></a>
				<a class="standard__cart__order__steps__item {if $cartitems > 0}current{/if}" href="#"><span class="standard__cart__order__steps__item__number">3</span> <span class="standard__cart__order__steps__item__text">{$LANG.cartreviewcheckout|default:'Review & Checkout'}</span></a>
				<a class="standard__cart__order__steps__item" href="#"><span class="standard__cart__order__steps__item__number">4</span> <span class="standard__cart__order__steps__item__text">{$LANG.checkout|default:'Proceed to Checkout'}</span></a>
			</div>
		</div>
	</div>
</div>
	
	{if $cartitems == 0}
	
	<div class="py-6">
		<div class="py-7 no__data__error__box with__icon d-flex flex-column justify-content-center align-items-center">
			<div class="message__image mb-7">
				{include file="$template/assets/svg/core/empty-folder.tpl"}         
			</div>
			<h6 class="coodiv-text-7 font-weight-bold">{lang key='cartempty'}</h6>
			<p class="coodiv-text-9 font-weight-300 mb-6">{lang key='orderForm.chooseFromRange'}</p>
			<a class="btn btn-primary" href="{$WEB_ROOT}/cart.php">{lang key='orderchooseapackage'}</a>
		</div>
	</div>


	{else}
    <div {if $errormessage|strstr:$LANG.ordererroraccepttos}class="ordererroraccepttos__has__error"{/if} id="order-standard_cart">
		<div class="row justify-content-start mx-0">
			<div class="orderform__main__content__wrapper__with__sidebar">
				{if $promoerrormessage}
					<div class="alert alert-warning text-center" role="alert">
						{$promoerrormessage}
					</div>
				{elseif $errormessage}
					<div class="alert alert-danger" role="alert">
						<p>{lang key='orderForm.correctErrors'}:</p>
						<ul>
							{$errormessage}
						</ul>
					</div>
				{elseif $promotioncode && $rawdiscount eq "0.00"}
					<div class="alert alert-info text-center" role="alert">
						{$LANG.promoappliedbutnodiscount}
					</div>
				{elseif $promoaddedsuccess}
					<div class="alert alert-success text-center" role="alert">
						{lang key='orderForm.promotionAccepted'}
					</div>
				{/if}

				{if $bundlewarnings}
					<div class="alert alert-warning" role="alert">
						<strong>{$LANG.bundlereqsnotmet}</strong><br />
						<ul>
							{foreach from=$bundlewarnings item=warning}
								<li>{$warning}</li>
							{/foreach}
						</ul>
					</div>
				{/if}
				<form method="post" action="{$smarty.server.PHP_SELF}?a=view">
				<div class="view__cart__items__wrapper default__shadow__panel">

					<div class="view__cart__items__wrapper__header">
						<div class="row justify-content-start">
							<div class="col-5">
								<span class="view__cart__items__wrapper__header__title">{lang key='orderForm.productOptions'}</span>
							</div>
							<div class="col-sm-2 col-auto">
								<span class="view__cart__items__wrapper__header__title">{lang key='orderForm.qty'}</span>
							</div>
							<div class="col">
								<span class="view__cart__items__wrapper__header__title">{lang key='orderForm.priceCycle'}</span>
							</div>
						</div>
					</div>
					
					
					<div class="view__cart__items__wrapper__body">
						{foreach $products as $num => $product}
							<div class="view__cart__items__wrapper__body__item">
								<div class="view__cart__items__wrapper__main__item view__cart__items__wrapper__body__item__product__info position-relative row justify-content-start">
									<div class="col-5">
										<div class="view__cart__items__wrapper__body__item__productinfo">
											<h6 class="coodiv-text-10 font-weight-bold mb-0">{$product.productinfo.groupname} - {$product.productinfo.name}</h6>
											{if $product.domain}
												<span class="this__item__domain">
													{$product.domain}
												</span>
											{/if}
										</div>
									</div>
									<div class="col-auto col-sm-2 item__qty">
										<input type="number" name="qty[{$num}]" value="{$product.qty|default:1}" class="form-control text-center" min="1" />
										<button data-toggle="tooltip" data-placement="top" type="submit" title="{lang key='orderForm.update'|default:'Update'}" class="update__item__qty__btn">
											<i class="fas fa-sync-alt"></i>
										</button>
									</div>
									<div class="col item__price">
										<div class="d-block">
											<span class="price">{$product.pricing.totalTodayExcludingTaxSetup}</span>
											<span class="cycle"> / {$product.billingcyclefriendly}</span>
											
											 {if $product.pricing.productonlysetup}
											 <span class="d-block product__only__setup__price">
											 {$product.pricing.productonlysetup->toPrefixed()} {$LANG.ordersetupfee}
											 </span>
											 {/if}
											 {if $product.proratadate}
											 <span class="d-block product__only__setup__price">
											 ({lang key='orderprorata'|default:'Prorated to'} {$product.proratadate})
											 </span>
											 {/if}
										</div>
									   
										
										
									</div>
									
									<div class="view__cart__items__wrapper__body__item__options">
										<button data-toggle="tooltip" data-placement="top" title="{lang key='orderForm.remove'}" type="button" class="btn-remove-from-cart" onclick="removeItem('p','{$num}')">
										<svg class="options__icons icon__trash">
										  <use xlink:href="#icon-trash"></use>
										</svg>
										</button>
										<a data-toggle="tooltip" data-placement="top" title="{lang key='orderForm.edit'}" href="{$WEB_ROOT}/cart.php?a=confproduct&i={$num}">
										<svg class="options__icons icon__edit">
										  <use xlink:href="#icon-edit"></use>
										</svg>
										 </a>
									</div>
								</div>
								{if $product.configoptions || $product.addons}
								<div class="view__cart__items__wrapper__body__item__product__configoptions">
									{foreach key=confnum item=configoption from=$product.configoptions}
										<div class="configoptions__item row justify-content-start">
											<div class="addon__name {if $showqtyoptions || $showAddonQtyOptions}col-5{else}col-7{/if}">
												<span class="item__name">{$configoption.name}:</span>
												<span class="item__value">
												{if $configoption.type eq 1 || $configoption.type eq 2}
												{$configoption.optionname}
												{elseif $configoption.type eq 3}
												{if $configoption.qty}
												{$configoption.optionname}
												{else}
												{lang key='no'|default:'No'}
												{/if}
												{elseif $configoption.type eq 4}
												{$configoption.qty} x {$configoption.option}
												{/if}</span>
											</div>
											
											{if $showqtyoptions || $showAddonQtyOptions}
												<div class="col-sm-2 col-auto addon__qty addon__qty__empty">
														-
												</div>
											{/if}
											<div class="addon__price col">
												<span class="item__price">
												{if $configoption.recurring->toNumeric() && $configoption.recurring->toNumeric() != 0}
												{$configoption.recurring}
												{else}
												-
												{/if}
												{if $configoption.setup} + {$configoption.setup->toPrefixed()} {$LANG.ordersetupfee}{/if}
												</span>
											</div>
										</div>
									{/foreach}
									
									{foreach key=addonnum item=addon from=$product.addons}
									<div class="configoptions__item row"{if $showAddonQtyOptions && $addon.allowqty===2} data-input-number-secondary{/if}>
										<div class="addon__name {if $showqtyoptions || $showAddonQtyOptions}col-6{else}col-7{/if}">
											<span class="item__name">{$LANG.orderaddon}:</span>
											<span class="item__value">{$addon.name}</span>
										</div>
										{if $showqtyoptions || $showAddonQtyOptions}
											<div class="item__qty {if $addon.allowqty !== 2} addon__qty__empty{/if} col-sm-2">
												{if $addon.allowqty === 2}
													<input type="number" name="paddonqty[{$num}][{$addonnum}]" value="{$addon.qty}" class="form-control text-center" min="0" />
													<button data-toggle="tooltip" data-placement="top" title="{lang key='orderForm.update'|default:'Update'}" type="submit" class="update__item__qty__btn">
														<i class="fas fa-sync-alt"></i>
													</button>
												{else}
													- 
												{/if}
											</div>
										{/if}
										
										<div class="col item-price">
											<span class="item__price">{$addon.totaltoday} / {$addon.billingcyclefriendly}</span>
											{if $addon.setup}{$addon.setup->toPrefixed()} {lang key='ordersetupfee'|default:'Setup Fee'}{/if}
											{if $addon.isProrated}<br />({lang key='orderprorata'|default:'Prorated to'} {$addon.prorataDate}){/if}
										</div>
									
										<div class="addon-actions d-none">
											<div class="cart-item-actions">
												<button type="button" class="btn btn-xs btn-icon btn-hover-danger" data-toggle="tooltip" data-html="true" data-original-title="{lang key='orderForm.remove'}" onclick="removeAddonItem('{$num}', 'products', '{$addonnum}')">
													<i class="lm lm-trash"></i>
												</button>
											</div>
										</div>
									</div>
								{/foreach}
								</div>
								{/if}
							</div>
						{/foreach}

						{foreach $addons as $num => $addon}
							<div class="view__cart__items__wrapper__body__item">
								<div class="view__cart__items__wrapper__main__item view__cart__items__wrapper__body__item__product__info position-relative row justify-content-start">
									<div class="col-5">
										<div class="view__cart__items__wrapper__body__item__productinfo">
											<h6 class="coodiv-text-10 font-weight-bold mb-0">{$addon.name} - {$addon.productname}</h6>
											{if $addon.domainname}
											<span class="this__item__domain">
												{$addon.domainname}
											</span>
											{/if}
										</div>	
									</div>
									<div class="col-auto col-sm-2 item__qty">
										{if $addon.allowqty === 2}
											<input type="number" name="addonqty[{$num}]" value="{$addon.qty}" class="form-control text-center" min="0" />
											<button type="submit" class="update__item__qty__btn" title="{lang key='orderForm.update'|default:'Update'}">
												<i class="fas fa-sync-alt"></i>
											</button>
										{/if}
									</div>
									<div class="col item__price">
										<span>{$addon.totaltoday}</span>
										<span class="cycle"> / {$addon.billingcyclefriendly}</span>
										{if $addon.setup}{$addon.setup->toPrefixed()} {lang key='ordersetupfee'|default:'Setup Fee'}{/if}
										{if $addon.isProrated}<br />({lang key='orderprorata'|default:'Prorated to'} {$addon.prorataDate}){/if}
									</div>
									
									<div class="view__cart__items__wrapper__body__item__options">
										<button data-toggle="tooltip" data-placement="top" title="{lang key='orderForm.remove'}" type="button" class="btn-remove-from-cart" onclick="removeItem('a','{$num}')">
										<svg class="options__icons icon__trash">
										  <use xlink:href="#icon-trash"></use>
										</svg>
										</button>
									</div>	
								</div>
							</div>
						{/foreach}

						{foreach $domains as $num => $domain}
							<div class="view__cart__items__wrapper__body__item">
								<div class="view__cart__items__wrapper__main__item view__cart__items__wrapper__body__item__product__info position-relative row justify-content-start">
									<div class="col-5">
										<div class="view__cart__items__wrapper__body__item__productinfo">
											<h6 class="coodiv-text-10 font-weight-bold mb-0">{if $domain.type eq "transfer"}{lang key='orderdomaintransfer'|default:'Domain Transfer'}{else}{lang key='orderdomainregistration'|default:'Domain Registration'}{/if}</h6>
											{if $domain.domain}
											<span class="this__item__domain">
												{$domain.domain}
											</span>
											{/if}
										</div>	
									</div>
									<div class="col-auto col-sm-2 item__qty">
									</div>
									<div class="col item__price">
										{if count($domain.pricing) == 1 || $domain.type == 'transfer'}
											<div class="d-block">
												<span name="{$domain.domain}Price">{$domain.price}</span>
												<span class="cycle">/ {$domain.regperiod} {$domain.yearsLanguage}</span>
												<span class="d-block renewal cycle">
													{if isset($domain.renewprice)}{lang key='domainrenewalprice'} <span class="renewal-price cycle">{$domain.renewprice->toPrefixed()}{$domain.shortRenewalYearsLanguage}{/if}</span>
												</span>
											</div>
										{else}
											<div class="d-block">
												<div class="billing__cycle__dropdown">
													<span name="{$domain.domain}Price">{$domain.price}</span>
													<span class="billing__cycle__dropdown__separation">/</span>
													<div class="veiwcart__period__dropdown__wrapper dropdown">
														<button class="veiwcart__period__dropdown__btn dropdown-toggle" type="button" id="{$domain.domain}Pricing" name="{$domain.domain}Pricing" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
														{$domain.regperiod} {$domain.yearsLanguage} 
															<span class="caret"></span>
														</button>
														<ul class="dropdown-menu" aria-labelledby="{$domain.domain}Pricing">
															{foreach $domain.pricing as $years => $price}
																<li class="dropdown-item">
																	<a href="#" onclick="selectDomainPeriodInCart('{$domain.domain}', '{$price.register}', {$years}, '{if $years == 1}{lang key='orderForm.year'}{else}{lang key='orderForm.years'}{/if}');return false;">
																		{$price.register}
																		/
																		{$years}
																		{if $years == 1}
																		{lang key='orderForm.year'}
																		{else}
																		{lang key='orderForm.years'}
																		{/if}
																	</a>
																</li>
															{/foreach}
														</ul>
													</div>
												</div>
												<span class="renewal cycle">
													{lang key='domainrenewalprice'} <span class="renewal-price cycle">{if isset($domain.renewprice)}{$domain.renewprice->toPrefixed()}{$domain.shortRenewalYearsLanguage}{/if}</span>
												</span>
											</div>
										{/if}
									</div>
									
									<div class="view__cart__items__wrapper__body__item__options">
										<button data-toggle="tooltip" data-placement="top" title="{lang key='orderForm.remove'}" type="button" class="btn-remove-from-cart" onclick="removeItem('d','{$num}')">
										<svg class="options__icons icon__trash">
										  <use xlink:href="#icon-trash"></use>
										</svg>
										</button>
										<a data-toggle="tooltip" data-placement="top" title="{lang key='orderForm.edit'}" href="{$WEB_ROOT}/cart.php?a=confdomains">
										<svg class="options__icons icon__edit">
										  <use xlink:href="#icon-edit"></use>
										</svg>
										 </a>
									</div>
									
									
								</div>
								{if $domain.dnsmanagement || $domain.emailforwarding || $domain.idprotection}  
								<div class="view__cart__items__wrapper__body__item__product__configoptions">
									{if $domain.dnsmanagement}
									<div class="configoptions__item row">
										<div class="addon__name {if $showqtyoptions || $showAddonQtyOptions}col-6{else}col-7{/if}">
											<span class="item__name">{lang key='orderaddon'|default:'Addon'}:</span>
											<span class="item__value">{lang key='domaindnsmanagement'|default:'DNS Management'}</span>
										</div>
									</div>
									{/if}
									{if $domain.emailforwarding}
									<div class="configoptions__item row">
										<div class="addon__name {if $showqtyoptions || $showAddonQtyOptions}col-6{else}col-7{/if}">
											<span class="item__name">{lang key='orderaddon'|default:'Addon'}:</span>
											<span class="item__value">{lang key='domainemailforwarding'|default:'Email Forwarding'}</span>
										</div>
									</div>
									{/if}
									{if $domain.idprotection}
									<div class="configoptions__item row">
										<div class="addon__name {if $showqtyoptions || $showAddonQtyOptions}col-6{else}col-7{/if}">
											<span class="item__name">{lang key='orderaddon'|default:'Addon'}:</span>
											<span class="item__value">{lang key='domainidprotection'|default:'ID Protection'}</span>
										</div>
									</div>
									{/if}
								</div>
								{/if}												
							</div>
						{/foreach}
						
						{foreach $renewalsByType['addons'] as $num => $service}
							<div class="item">
								<div class="row">
									<div class="col-sm-7">
										<span class="item-title">
											{lang key='renewServiceAddon.titleAltSingular'}
										</span>
										<span class="item-group">
											{$service.name}
										</span>
										<span class="item-domain">
											{$service.domainName}
										</span>
									</div>
									<div class="col-sm-4 item-price">
										<span>{$service.recurringBeforeTax}</span>
										<span class="cycle">{$service.billingCycle}</span>
									</div>
									<div class="col-sm-1">
										<button type="button" class="btn btn-link btn-xs btn-remove-from-cart" onclick="removeItem('r','{$num}','addon')">
											<i class="fas fa-times"></i>
											<span class="visible-xs d-block d-sm-none">{lang key='orderForm.remove'}</span>
										</button>
									</div>
								</div>
							</div>
						{/foreach}

						{foreach $renewals as $num => $domain}
							<div class="view__cart__items__wrapper__body__item">
								<div class="view__cart__items__wrapper__main__item view__cart__items__wrapper__body__item__product__info position-relative row justify-content-start">
									<div class="{if $showqtyoptions || $showAddonQtyOptions}col-8{else}col-7{/if}">
										<div class="view__cart__items__wrapper__body__item__productinfo">
											<h6 class="coodiv-text-10 font-weight-bold mb-0">{lang key='domainrenewal'|default:'Domain Renewal'}</h6>
											<span class="this__item__domain">{$domain.domain}</span>
										</div>	
									</div>
									<div class="col-4 item__price">
										<span class="price">{$domain.price}</span>
										<span class="cycle">{$domain.regperiod} {lang key='orderyears'|default:'Year(s)'}</span>													
									</div>
									<div class="view__cart__items__wrapper__body__item__options">
										<button data-toggle="tooltip" data-placement="top" title="{lang key='orderForm.remove'}" type="button" class="btn-remove-from-cart" onclick="removeItem('r','{$num}')">
										<svg class="options__icons icon__trash">
										  <use xlink:href="#icon-trash"></use>
										</svg>
										</button>
									</div>
								</div>
								
								<div class="view__cart__items__wrapper__body__item__product__configoptions">
									{if $domain.dnsmanagement}
									<div class="configoptions__item row">
										<div class="addon__name {if $showqtyoptions || $showAddonQtyOptions}col-6{else}col-7{/if}">
											<span class="item__name">{lang key='orderaddon'|default:'Addon'}:</span>
											<span class="item__value">{lang key='domaindnsmanagement'|default:'DNS Management'}</span>
										</div>
									</div>
									{/if}
									{if $domain.emailforwarding}
									<div class="configoptions__item row">
										<div class="addon__name {if $showqtyoptions || $showAddonQtyOptions}col-6{else}col-7{/if}">
											<span class="item__name">{lang key='orderaddon'|default:'Addon'}:</span>
											<span class="item__value">{lang key='domainemailforwarding'|default:'Email Forwarding'}</span>
										</div>
									</div>
									{/if}
									{if $domain.idprotection}
									<div class="configoptions__item row">
										<div class="addon__name {if $showqtyoptions || $showAddonQtyOptions}col-6{else}col-7{/if}">
											<span class="item__name">{lang key='orderaddon'|default:'Addon'}:</span>
											<span class="item__value">{lang key='domainidprotection'|default:'ID Protection'}</span>
										</div>
									</div>
									{/if}
								</div>
							</div>		
						{/foreach}

						{foreach $upgrades as $num => $upgrade}
							<div class="item">
								<div class="row">
									<div class="{if $showUpgradeQtyOptions}col-sm-5{else}col-sm-7{/if}">
										<span class="item-title">
											{$LANG.upgrade}
										</span>
										<span class="item-group">
											{if $upgrade->type == 'service'}
												{$upgrade->originalProduct->productGroup->name}<br>{$upgrade->originalProduct->name} => {$upgrade->newProduct->name}
											{elseif $upgrade->type == 'addon'}
												{$upgrade->originalAddon->name} => {$upgrade->newAddon->name}
											{/if}
										</span>
										<span class="item-domain">
											{if $upgrade->type == 'service'}
												{$upgrade->service->domain}
											{/if}
										</span>
									</div>
									{if $showUpgradeQtyOptions}
										<div class="col-sm-2 item-qty">
											{if $upgrade->allowMultipleQuantities}
												<input type="number" name="upgradeqty[{$num}]" value="{$upgrade->qty}" class="form-control text-center" min="{$upgrade->minimumQuantity}" />
												<button type="submit" class="btn btn-xs">
													{lang key='orderForm.update'}
												</button>
											{/if}
										</div>
									{/if}
									<div class="col-sm-4 item-price">
										<span>{$upgrade->newRecurringAmount}</span>
										<span class="cycle">{$upgrade->localisedNewCycle}</span>
									</div>
									<div class="col-sm-1">
										<button type="button" class="btn btn-link btn-xs btn-remove-from-cart" onclick="removeItem('u','{$num}')">
											<i class="fas fa-times"></i>
											<span class="visible-xs d-block d-sm-none">{lang key='orderForm.remove'}</span>
										</button>
									</div>
								</div>
								{if $upgrade->totalDaysInCycle > 0}
									<div class="row row-upgrade-credit">
										<div class="col-sm-7">
											<span class="item-group">
												{$LANG.upgradeCredit}
											</span>
											<div class="upgrade-calc-msg">
												{lang key="upgradeCreditDescription" daysRemaining=$upgrade->daysRemaining totalDays=$upgrade->totalDaysInCycle}
											</div>
										</div>
										<div class="col-sm-4 item-price">
											<span>-{$upgrade->creditAmount}</span>
										</div>
									</div>
								{/if}
							</div>
						{/foreach}
					</div>
					
					{if $cartitems > 0}
					<div class="view__cart__items__wrapper__footer">
						<div class="row justify-content-center justify-content-md-between gap-5">
						
							<div class="col-auto">
								<a href="{$WEB_ROOT}/cart.php" class="btn btn-primary-outline-light btn-with-icon btn-small" id="continueShopping">
									<svg class="options__icons icon__arrow__left">
										<use xlink:href="#icon-arrow-left"></use>
									</svg>
									{lang key='orderForm.continueShopping'}
								</a>  
							</div>
						
							<div class="col-auto">
								<button type="button" class="btn btn-primary-outline-light btn-with-icon btn-small" id="btnEmptyCart">
									<svg class="options__icons icon__trash">
										<use xlink:href="#icon-trash"></use>
									</svg>
									<span>{lang key='emptycart'|default:'Empty Cart'}</span>
								</button>    
							</div>
						</div>
					</div>
					{/if}
					
				</div>

					

				</form>

				{foreach $hookOutput as $output}
					<div class="viewcart__output__banner">
						{$output}
					</div>
				{/foreach}

				{foreach $gatewaysoutput as $gatewayoutput}
					<div class="view-cart-gateway-checkout">
						{$gatewayoutput}
					</div>
				{/foreach}



			   
				{if $taxenabled && !$loggedin}
				
				<div class="field-container mt-8">
					<div class="row justify-content-start mb-5">
						<div class="col-md-10 col-12">
							<h6 class="field__title coodiv-text-7 font-weight-300 mb-0">{lang key='orderForm.estimateTaxes'}</h6> 
						</div>
					</div>
					<div class="default__shadow__panel">
						<div class="default__shadow__panel__body">
							<form method="post" action="{$WEB_ROOT}/cart.php?a=setstateandcountry">
								<div class="form-group">
									<label for="inputCountry">{lang key='orderForm.country'}</label>
									<select name="country" id="inputCountry" class="form-control">
										{foreach $countries as $countrycode => $countrylabel}
											<option value="{$countrycode}"{if (!$country && $countrycode == $defaultcountry) || $countrycode eq $country} selected{/if}>
												{$countrylabel}
											</option>
										{/foreach}
									</select>
								</div>
								<div class="form-group">
									<label for="inputState">{lang key='orderForm.state'}</label>
									<input type="text" name="state" id="inputState" value="{$clientsdetails.state}" class="form-control"{if $loggedin} disabled="disabled"{/if} />
								</div>
								<div class="form-group text-right mb-0">
									<button type="submit" class="btn btn-primary btn-small">
										{lang key='orderForm.updateTotals'}
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				{/if}
			{include file="orderforms/$carttpl/checkout.tpl"}	
			</div>
			<div class="main-sidebar main-sidebar-lg" id="scrollingPanelContainer">

				<div class="sticky__order__summary__sidebar__wrapper sidebar__with__promo__box">
					<div class="sidebar__with__promo__box__wrapper">
					<div class="sticky__order__summary__sidebar">
						<div class="sticky__order__summary__sidebar__header">
							<h2 class="coodiv-text-7 font-weight-300 mb-0">{lang key='ordersummary'|default:'Order Summary'}</h2>
						</div>
						<div class="sticky__sidebar__order__summary position-relative">
							<div class="sticky__order__summary__sidebar__body">
								<div class="product__summary__totals__item">
									<span class="product__summary__name">{lang key='ordersubtotal'|default:'Subtotal'}</span>
									<span id="subtotal" class="product__summary__price">{$subtotal}</span>
								</div>
								{if $promotioncode || $taxrate || $taxrate2}
									<div class="bordered-totals">
										{if $promotioncode}
											<div class="product__summary__totals__item">
												<span class="product__summary__name">{$promotiondescription}</span>
												<span id="discount" class="product__summary__price">{$discount}</span>
											</div>
										{/if}
										{if $taxrate}
											<div class="product__summary__totals__item">
												<span class="product__summary__name">{$taxname} @ {$taxrate}%</span>
												<span id="taxTotal1" class="product__summary__price">{$taxtotal}</span>
											</div>
										{/if}
										{if $taxrate2}
											<div class="product__summary__totals__item">
												<span class="product__summary__name">{$taxname2} @ {$taxrate2}%</span>
												<span id="taxTotal2" class="product__summary__price">{$taxtotal2}</span>
											</div>
										{/if}
									</div>
								{/if}
								<div class="recurring-totals product__summary__totals__item">
									<span class="product__summary__name">{lang key='orderForm.totals'}</span>
									<span id="recurring" class="product__summary__price recurring-charges">
										<span id="recurringMonthly" {if !$totalrecurringmonthly}style="display:none;"{/if}>
											<span class="cost">{$totalrecurringmonthly}</span> {lang key='orderpaymenttermmonthly'|default:'Monthly'}<br />
										</span>
										<span id="recurringQuarterly" {if !$totalrecurringquarterly}style="display:none;"{/if}>
											<span class="cost">{$totalrecurringquarterly}</span> {lang key='orderpaymenttermquarterly'|default:'Quarterly'}<br />
										</span>
										<span id="recurringSemiAnnually" {if !$totalrecurringsemiannually}style="display:none;"{/if}>
											<span class="cost">{$totalrecurringsemiannually}</span> {lang key='orderpaymenttermsemiannually'|default:'Semi-Annually'}<br />
										</span>
										<span id="recurringAnnually" {if !$totalrecurringannually}style="display:none;"{/if}>
											<span class="cost">{$totalrecurringannually}</span> {lang key='orderpaymenttermannually'|default:'Annually'}<br />
										</span>
										<span id="recurringBiennially" {if !$totalrecurringbiennially}style="display:none;"{/if}>
											<span class="cost">{$totalrecurringbiennially}</span> {lang key='orderpaymenttermbiennially'|default:'Biennially'}<br />
										</span>
										<span id="recurringTriennially" {if !$totalrecurringtriennially}style="display:none;"{/if}>
											<span class="cost">{$totalrecurringtriennially}</span> {lang key='orderpaymenttermtriennially'|default:'Triennially'}<br />
										</span>
									</span>
								</div>
							</div>
							
							<div class="sidebar__separated__price d-flex flex-column" >
								<span class="coodiv-text-11 font-weight-300">{lang key='ordertotalduetoday'|default:'Total Due Today'}</span>
								<span class="totalDueToday"><span id="totalCartPrice" class="coodiv-text-5 font-weight-bold amt">{$total}</span></span>
							</div>
									

							<div class="express-checkout-buttons">
								{foreach $expressCheckoutButtons as $checkoutButton}
									{$checkoutButton}
									<div class="separator">
										- {$LANG.or|strtoupper} -
									</div>
								{/foreach}
							</div>
						</div>
						</div>

						<div class="sticky__order__summary__sidebar__footer">
							<!-- <a href="{$WEB_ROOT}/cart.php?a=checkout&e=false" class="orderform__submit__btn__succses btn btn-primary btn-lg w-100 btn-checkout{if $cartitems == 0} disabled{/if}" id="checkout"> -->
								<!-- {$LANG.orderForm.checkout} -->
							<!-- </a> -->
							<button type="submit" form="frmCheckout" id="btnCompleteOrder" class="btn btn-primary btn-lg w-100 btn-checkout disable-on-click spinner-on-click{if $captcha}{$captcha->getButtonClass($captchaForm)}{/if}" {if $cartitems==0}disabled="disabled"{/if}>
								<span class="btn-text">{if $inExpressCheckout}{lang key='confirmAndPay'|default:'Confirm & Pay'}{else}{lang key='completeorder'|default:'Complete Order'}{/if}</span>
							</button>
						</div>
					</div>
					<div class="sidebar__aply__promo__code__wrapper">
						{if $promotioncode}
							<div class="sidebar__accepted__promo__code">
								{$promotioncode} - {$promotiondescription}
								<a href="{$WEB_ROOT}/cart.php?a=removepromo" class="btn btn-primary-outline-light btn-with-icon btn-small">
									<svg class="options__icons icon__trash">
										<use xlink:href="#icon-trash"></use>
									</svg>
									{lang key='orderForm.remove'}
								</a>
							</div>
						{else}
							<a class="sidebar__aply__promo__code__caller coodiv-text-12 d-block text-center">
							  {lang key='orderForm.applyPromoCode'}
							</a>
							<form class="sidebar__aply__promo__code__form d-none" method="post" action="{$WEB_ROOT}/cart.php?a=checkout">
								<input type="text" name="promocode" id="inputPromotionCode" class="field form-control" placeholder="{lang key="orderPromoCodePlaceholder"}" required="required">
								<button type="submit" name="validatepromo" class="btn btn-primary-light btn-small" value="{$LANG.orderpromovalidatebutton|default:'Validate'}">
									{$LANG.apply|default:'Apply'}
								</button>
							</form>
						{/if}
					</div>
				</div>
				</div>
			</div>
		</div>
		{/if}
        <form method="post" action="{$WEB_ROOT}/cart.php">
            <input type="hidden" name="a" value="remove" />
            <input type="hidden" name="r" value="" id="inputRemoveItemType" />
            <input type="hidden" name="i" value="" id="inputRemoveItemRef" />
            <div class="modal fade modal-remove-item" id="modalRemoveItem" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
						<div class="modal-header border-0">
							<button type="button" class="close" data-dismiss="modal" aria-label="{lang key='orderForm.close'}">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body pb-18">
							<div class="d-flex align-items-center justify-content-center flex-column"> 
								<i class="fal fa-exclamation-triangle coodiv-text-2 text-danger"></i>    
								<h4 class="coodiv-text-6 font-weight-bold mt-5 mb-0">{lang key='orderForm.removeItem'}</h4>
								<p class="coodiv-text-11 font-weight-400">{lang key='cartremoveitemconfirm'}</p>
								<div class="d-flex align-items-center gap-5 flex-wrap justify-content-center mt-5">
									<button type="button" class="btn btn-secondary btn-sm px-4" data-dismiss="modal">{lang key='no'|default:'No'}</button>
									<button type="submit" class="btn btn-primary btn-sm px-4">{lang key='yes'|default:'Yes'}, {lang key='orderForm.removeItem'|default:'Remove Item'}</button>
								</div>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <form method="post" action="{$WEB_ROOT}/cart.php">
            <input type="hidden" name="a" value="empty" />
            <div class="modal fade modal-remove-item" id="modalEmptyCart" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
					
						<div class="modal-header border-0">
							<button type="button" class="close" data-dismiss="modal" aria-label="{lang key='orderForm.close'}">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
                        <div class="modal-body pb-18">
							<div class="d-flex align-items-center justify-content-center flex-column"> 
								<i class="fal fa-exclamation-triangle coodiv-text-2 text-danger"></i>    
								<h4 class="coodiv-text-6 font-weight-bold mt-5 mb-0">{lang key='emptycart'|default:'Empty Cart'}</h4>
								<p class="coodiv-text-11 font-weight-400">{lang key='cartemptyconfirm'|default:'Are you sure you want to empty your cart?'}</p>
								<div class="d-flex align-items-center gap-5 flex-wrap justify-content-center mt-5">
									<button type="button" class="btn btn-secondary btn-sm px-4" data-dismiss="modal">{lang key='no'|default:'No'}</button>
									<button type="submit" class="btn btn-primary btn-sm px-4">{lang key='yes'|default:'Yes'}, {lang key='emptycart'|default:'Empty Cart'}</button>
								</div>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
		
    
<script type="text/javascript" src="{$BASE_PATH_JS}/jquery.payment.js"></script>
<script>
    var hideCvcOnCheckoutForExistingCard = '{if $canUseCreditOnCheckout && $applyCredit && ($creditBalance->toNumeric() >= $total->toNumeric())}1{else}0{/if}';
</script>
<script type="text/javascript" src="{$BASE_PATH_JS}/CartTotalUpdater.js"></script>
{include file="orderforms/standard_cart/recommendations-modal.tpl"}
