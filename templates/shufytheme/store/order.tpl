<div class="full__with__section">
	<div class="inner__page__content__container">
		<div class="row justify-content-start">
			<div class="col-md-8 col-12">
				<div class="orderform__cart__header mt-5">
					<h1 class="coodiv-text-5 font-weight-bold mb-0 text-capitalize">{$product->name}</h1>
					<p class="coodiv-text-10 font-weight-300">{$product->description}</p>
				</div>
			</div>
		</div>
	</div>
	<div class="full__width__secondarysidebar__menu mt-9 mb-3 into__main__page__content__full__width__element">
		<div class="inner__page__content__container">
			<ul class="nav">
				<li href="#group1" class="nav-item active"><a href="#" class="nav-link"><span>Web Hosting</span></a></li>
				<li href="#group2" class="nav-item"><a href="#" class="nav-link"><span>VPS Hosting</span></a></li>
				<li href="#group3" class="nav-item"><a href="#" class="nav-link"><span>Dedicated Servers</span></a></li>
				<li href="#group17" class="nav-item"><a href="#" class="nav-link"><span>Vultr Reseller</span></a></li>
				<li href="#group16" class="nav-item"><a href="#" class="nav-link"><span>Reseller Hosting</span></a></li>
				<li href="#groupdomain" class="nav-item"><a href="#" class="nav-link"><span>Domain Search</span></a></li>
			</ul>
		</div>
	</div>
	<div class="inner__page__content__container mt-8">
		<div class="store-order-container mb-3">
		
			 {if $configValidationMessage}
				<div class="alert alert-danger" role="alert">
					{$configValidationMessage}
				</div>
			{/if}
			
		
			<form method="post" action="{routePath('cart-order-addtocart')}" id="frmAddToCart">
				<input type="hidden" name="pid" value="{$product->id}">
				<input type="hidden" name="domain_type" value="" id="inputDomainType">
				<h6 class="coodiv-text-8 font-weight-300 mb-3">{lang key='store.choosePaymentTerm'}</h6>
				<div class="shadow__card mb-10">
					<div class="card__body payment-term float-none">
						<select name="billingcycle" class="form-control custom-select">
							{foreach $product->pricing()->allAvailableCycles() as $pricing}
								<option value="{$pricing->cycle()}"
                                        {if (isset($orderFormData.billingcycle) && $orderFormData.billingcycle == $pricing->cycle()) || (!isset($orderFormData.billingcycle) && $requestedCycle == $pricing->cycle())} selected{/if}
                                >
									{if $pricing->isRecurring()}
										{if $pricing->isYearly()}
											{$pricing->cycleInYears()} - {$pricing->yearlyPrice()}
										{else}
											{$pricing->cycleInMonths()} - {$pricing->monthlyPrice()}
										{/if}
									{else}
										{$pricing->toFullString()}
									{/if}
								</option>
							{/foreach}
						</select>
					</div>
				</div>		
				
				<h6 class="coodiv-text-8 font-weight-300">{lang key='store.chooseDomain'}</h6>
				<div class="order-domain-select-wrapper mt-0">
					<div class="order-domain-select">
						<div class="order-domain-select-header">
							<ul class="nav store-domain-tabs" role="tablist">
								{if $requireDomain}
								{if (count($domains) > 0 && $loggedin)}
								<li class="nav-item active" role="presentation">
									<a class="nav-link" href="#existing-domain" aria-controls="existing-domain" role="tab" data-toggle="tab">
										{lang key='store.chooseExistingDomain'}
									</a>
								</li>
								{/if}
								{if $allowSubdomains}
								<li class="nav-item" role="presentation">
									<a class="nav-link" href="#sub-domain" aria-controls="sub-domain" role="tab" data-toggle="tab">
										{lang key='store.subOfExisting'}
									</a>
								</li>
								{/if}
								<li class="nav-item" role="presentation">
									<a class="nav-link" id="tabCustomDomainControl" href="#custom-domain" aria-controls="custom-domain" role="tab" data-toggle="tab">
										{lang key='store.domainAlreadyOwned'}
									</a>
								</li>
								{else}
								<li class="nav-item" role="presentation">
									<a class="nav-link" id="tabNoDomain" href="#no-domain" role="tab" data-toggle="tab">
										{lang key='store.noDomain'}
									</a>
								</li>
								{/if}
							</ul>
						</div>
						<div class="order-domain-select-body">
							<div class="tab-content bg-white border-0 store-domain-tab-content">
								{if $requireDomain}
									{if count($domains) > 0}
										<div role="tabpanel" class="tab-pane active" id="existing-domain">
											{if $loggedin}
												<div class="store-domain-form">
													<select class="form-control custom-select" name="existing_domain">
														{foreach $domains as $domain}
															<option value="{$domain}"{if (isset($orderFormData.existing_domain) && $orderFormData.existing_domain == $domain) || (!isset($orderFormData.existing_domain) && $domain == $selectedDomain)} selected="selected"{/if}>
																{$domain}
															</option>
														{/foreach}
													</select>
													<span class="domain-validation ok">
														<i class="fas fa-check"></i>
														{lang key='store.eligible'}
													</span>
												</div>
											{else}
												<a href="{routePath('cart-order-login')}">{lang key='store.login'}</a> {lang key='store.addToExistingPackage'}
											{/if}
										</div>
									{/if}
									{if $allowSubdomains}
										<div role="tabpanel" class="tab-pane" id="sub-domain">
											<div class="store-domain-form">
												<div class="input-group">
													<input type="text" class="form-control subdomain-input" name="sub_domain" placeholder="Your desired subdomain" value="{if isset($orderFormData.sub_domain)}{$orderFormData.sub_domain}{/if}">
													<select class="custom-select" name="existing_sld_for_subdomain" id="existing_sld_for_subdomain">
														{foreach $domains as $domain}
															<option value="{$domain}"{if isset($orderFormData.existing_sld_for_subdomain) && $orderFormData.existing_sld_for_subdomain == $domain} selected{/if}>.{$domain}</option>
														{/foreach}
													</select>
												</div>
												<span class="domain-validation subdomain-validation"></span>
											</div>
										</div>
									{/if}
									<div role="tabpanel" class="tab-pane" id="custom-domain">
										<div class="store-domain-form">
										<input type="text" class="form-control domain-input" placeholder="example.com" name="custom_domain" value="{if isset($orderFormData.custom_domain)}{$orderFormData.custom_domain}{else}{$customDomain}{/if}">
										<span class="domain-validation domain-input-validation"></span>
										</div>
									</div>
								{else}
									<div role="tabpanel" class="tab-pane" id="no-domain">
										{lang key='store.noDomainRequired'}
									</div>
								{/if}
							</div>
							
							
							{if $configurationFields && count($configurationFields) > 0}
							<div class="card">
								<div class="card__body">
									{foreach $configurationFields as $field}
										{if $field.type != 'domain'}
										<div class="form-group mb-3">
											<label for="config_{$field.name}" class="form-label">
												{$field.label}
												{if $field.required}<span class="text-danger">*</span>{/if}
											</label>

											{if $field.type == 'select'}
												{include file="$template/store/config-fields/select.tpl" field=$field}
											{elseif $field.type == 'textarea'}
												{include file="$template/store/config-fields/textarea.tpl" field=$field}
											{elseif $field.type == 'boolean'}
												{include file="$template/store/config-fields/boolean.tpl" field=$field}
											{else}
												{include file="$template/store/config-fields/input.tpl" field=$field}
											{/if}

											{if $configFieldErrors && $configFieldErrors[$field.name]}
												<div class="alert alert-danger mt-1">
													{foreach $configFieldErrors[$field.name] as $error}
														{$error}<br>
													{/foreach}
												</div>
											{/if}
										</div>
										{/if}
									{/foreach}
								</div>
							</div>
						{/if}
							
							
						</div>
						
						
						<div class="card__footer">
							<div class="row">
								<div class="col-sm-5 col-12 d-flex align-items-center justify-content-start">
									 <a href="javascript:history.go(-1)" class="btn btn-default btn-sm">
										{lang key='back'}
									</a>
								</div>
								<div class="col-sm-7 col-12 d-flex align-items-center justify-content-end gap-10">
									<button type="submit" name="continue" value="1" class="btn btn-default btn-sm">
										{lang key='orderForm.continueShopping'}
									</button>
									<button type="submit" name="checkout" value="1" class="btn btn-primary btn-sm">
										{lang key='orderForm.checkout'}
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	{if $upsellProduct && $promotion}
		<div class="inner__page__content__container">
			<div class="minimalist__promo__banner shadow__card my-8">
				<div class="banner-background">
				<div class="banner-shape">
					{include file="$template/assets/svg/core/banner-shape-illustration.tpl"} 	
				</div>
				</div>
				<div class="minimalist__promo__banner__body">
					<div class="minimalist__promo__banner__content">
						<div class="minimalist__promo__banner__content__header mb-5">
							<h6 class="coodiv-text-7 font-weight-700 minimalist__promo__banner__title mb-0">{$promotion->getHeadline()}</h6>
							<p class="coodiv-text-11 font-weight-400 minimalist__promo__banner__desc">{$promotion->getTagline()}</p>
						</div>
						{if $promotion->getDescription()}
							<p class="minimalist__promo__banner__desc">{$promotion->getDescription()}</p>
						{/if}                    
						{if $promotion->hasFeatures()}
							<ul class="minimalist__promo__banner__desc__ul">
								{foreach $promotion->getFeatures() as $highlight}
									<li>{$highlight}</li>
								{/foreach}
							</ul>
						{/if}
						<div class="minimalist__promo__banner__actions">
						<form method="post" action="{routePath('cart-order')}">
							<input type="hidden" name="pid" value="{$upsellProduct->id}">
							<input type="hidden" name="upsell" value="1">
							<button type="submit" class="btn btn-primary-light btn-sm mt-5">
								{foreach $product->pricing()->allAvailableCycles() as $pricing}
									<span class="span-upsell span-upsell-{$pricing->cycle()}">
										{if is_null($upsellComparison->diff({$pricing->cycle()}))}
											{$promotion->getCta()} {$upsellProduct->name} {lang key='fromJust'} {$upsellProduct->pricing()->best()->breakdownPrice()}
										{else}
											{$promotion->getCta()} {$upsellProduct->name} {lang key='forJust'} {$upsellComparison->diff({$pricing->cycle()})->breakdownPrice()} {{lang key='more'}|lower}
										{/if}
									</span>
								{/foreach}
							</button>
						</form>
						</div>
					</div>
				</div>
				<div class="minimalist__promo__banner__illustration">
					{if file_exists("templates/$template/assets/svg/orderform/{$promotion->getServiceName()}-illustration.tpl")}
						{include file="$template/assets/svg/orderform/{$promotion->getServiceName()}-illustration.tpl"} 
					{/if}
				</div>
			</div>
		</div>
	{/if}
</div>

<script>
jQuery(document).ready(function(){

    var delay = (function(){
      var timer = 0;
      return function(callback, ms){
        clearTimeout (timer);
        timer = setTimeout(callback, ms);
      };
    })();

    jQuery('.store-order-container .subdomain-input').keyup(function() {
        delay(function(){
          jQuery('.subdomain-validation').html('<i class="fas fa-spinner fa-spin"></i> Validating...').removeClass('ok');

          jQuery('#frmAddToCart button[type="submit"]').prop('disabled', true);

          var domainName = jQuery('.subdomain-input').val() + '.' + jQuery('#existing_sld_for_subdomain').val();

          WHMCS.http.jqClient.post('{routePath('cart-order-validate')}', 'domain=' + domainName, function(data) {
              if (data.valid) {
                  jQuery('.subdomain-validation').html('<i class="fas fa-check"></i> Valid').addClass('ok');
                  jQuery('#frmAddToCart button[type="submit"]').removeProp('disabled');
              } else {
                  jQuery('.subdomain-validation').html('<i class="fas fa-times"></i> Invalid domain');
              }
          }, 'json');

        }, 1000 );
    });

    var delay2 = (function(){
      var timer = 0;
      return function(callback, ms){
        clearTimeout (timer);
        timer = setTimeout(callback, ms);
      };
    })();

    jQuery('.store-order-container .domain-input').keyup(function() {
        delay2(function(){
          jQuery('.domain-input-validation').html('<i class="fas fa-spinner fa-spin"></i> Validating...').removeClass('ok');
          jQuery('#frmAddToCart button[type="submit"]').prop('disabled', true);
          WHMCS.http.jqClient.post('{routePath('cart-order-validate')}', 'domain=' + jQuery('.domain-input').val(), function(data) {
            if (data.valid) {
                jQuery('.domain-input-validation').html('<i class="fas fa-check"></i> Valid').addClass('ok');
                jQuery('#frmAddToCart button[type="submit"]').removeProp('disabled');
            } else {
                jQuery('.domain-input-validation').html('<i class="fas fa-times"></i> Invalid domain');
            }
          }, 'json');
        }, 1000 );
    });
    {if $requireDomain}
        jQuery('.store-domain-tabs a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
            var tab = jQuery(e.target).attr('aria-controls');
            jQuery('#inputDomainType').val(tab);
            if (tab == 'custom-domain' || tab == 'sub-domain') {
                var validationBlockSelector = tab == 'custom-domain' ? '.domain-input-validation' : '.subdomain-validation';
                var validationHtml = jQuery(validationBlockSelector).html();

                if (validationHtml == '<i class="fas fa-check"></i> Valid') {
                    jQuery('#frmAddToCart button[type="submit"]').removeProp('disabled');
                } else {
                    jQuery('#frmAddToCart button[type="submit"]').prop('disabled', true);
                }
            } else {
                {if $loggedin}
                    jQuery('#frmAddToCart button[type="submit"]').removeProp('disabled');
                {else}
                    jQuery('#frmAddToCart button[type="submit"]').prop('disabled', true);
                {/if}
            }
        });
    {/if}

    {if !isset($orderFormData.domain_type)}
        jQuery('.store-domain-tabs li').removeClass('active');
        jQuery('.store-domain-tabs li:first-child a').click();
    {/if}
    {if !$loggedin && $requireDomain}
        jQuery('#frmAddToCart button[type="submit"]').prop('disabled', true);
    {/if}

    jQuery('.payment-term').find('select').change(function() {
        var cycle = jQuery('.payment-term').find('option:selected').val();
        updateUpsellDetailsOnBillingCycleChange(cycle);
    });
    updateUpsellDetailsOnBillingCycleChange(jQuery('.payment-term').find('option:selected').val());

    {if $customDomain || (isset($orderFormData.domain_type, $orderFormData.custom_domain) && $orderFormData.domain_type == 'custom-domain')}
        jQuery('#tabCustomDomainControl').one('shown.bs.tab', function() {
            jQuery('.store-order-container .domain-input').trigger('keyup');
        }).click();
    {/if}
    {if isset($orderFormData.sub_domain, $orderFormData.domain_type) && $orderFormData.domain_type == 'sub-domain'}
        jQuery('.store-domain-tabs a[href="#sub-domain"]').one('shown.bs.tab', function() {
            jQuery('.store-order-container .subdomain-input').trigger('keyup');
        }).click();
    {/if}
});

function updateUpsellDetailsOnBillingCycleChange(cycle) {
    jQuery('.span-upsell').hide();
    jQuery('.span-upsell-' + cycle).show();
}
</script>
