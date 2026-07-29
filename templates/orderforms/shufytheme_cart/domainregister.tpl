{include file="shufytheme/includes/theme-core/init-standalone.tpl"}
{include file="orderforms/standard_cart/common.tpl"}
<div class="full__with__section">
	<div class="domain__register__hero">
		<div class="container">
			<div class="main__banner__row row justify-content-center align-items-center" id="domainsearchwrapper">
				<div class="col-md-10 col-12">
					<div class="banner__content text-center">
						<div class="dark-mode-texts mb-10">
							<h1 class="coodiv-text-4 font-weight-bold mb-3">{$LANG.shufytheme.domains__findyourperfect} <span class="main__banner__primary__text">{$LANG.shufytheme.domains__domainname}</span></h1>
							<p class="coodiv-text-8 font-weight-300 p-1">{$LANG.shufytheme.getyourdreaddomain}</p>
							
							<div class="coodiv__primary__link__tabs d-flex align-items-center justify-content-center mt-6">
								<a class="active" href="#">{lang key='registerdomain'}</a>
								<a href="{$WEB_ROOT}/cart.php?a=add&domain=transfer">{lang key='transferdomain'}</a>
							</div>
						
						</div>
						<div class="domain__register__form banner__domain__searching domain-slector-inputs position-relative {if $showAdvancedSearchOptions} domain-checker-advanced{/if}">
							<form method="post" action="{$WEB_ROOT}/cart.php" id="frmDomainChecker">
								<div class="option">
								
									<input type="hidden" name="a" value="checkDomain">
									<div class="domain__search__input__wrapper single-input row justify-content-start w-100">
										{if $showAdvancedSearchOptions}
										<div class="domain__search__input__searching position-relative col">
											<input style="border: 0 !important" class="inputdomainsearch form-control form-control-lg input-lg search__input" name="message" id="message" value="{$message}" title="{lang key='domainSearch.domainOrAiPrompt'}" data-placement="left" data-trigger="manual" placeholder="{lang key='domainSearch.domainOrAiInstruction'}" />
										</div>
										<div class="domain__search__input__options col-auto d-flex align-items-center">
											<button type="submit" id="btnCheckAvailability" class="{if $captcha->isEnabled() && $captcha->isEnabledForForm($captchaForm) && !$captcha->recaptcha->isInvisible()}recaptcha__filed__activated{/if} search-btn btn btn-primary domain-check-availability{$captcha->getButtonClass($captchaForm)} d-flex align-items-center gap-5"> {lang key='search'} <i class="fa-light fa-sparkles"></i> </button>
										</div>
										{else}
										<div class="domain__search__input__searching position-relative col">
											<input style="border: 0 !important" type="text" name="domain" class="inputdomainsearch form-control form-control-lg input-lg search__input" placeholder="{$LANG.findyourdomain}" value="{$lookupTerm}" id="inputDomain" data-toggle="tooltip" data-placement="left" data-trigger="manual" title="{lang key='orderForm.domainOrKeyword'}" />
										</div>
										<div class="domain__search__input__options col-auto d-flex align-items-center">
											<button type="submit" id="btnCheckAvailability" class="{if $captcha->isEnabled() && $captcha->isEnabledForForm($captchaForm) && !$captcha->recaptcha->isInvisible()}recaptcha__filed__activated{/if} search-btn btn btn-primary domain-check-availability{$captcha->getButtonClass($captchaForm)}">{$LANG.search}</button>
										</div>
										{/if}
									</div>
									{if $captcha->isEnabled() && $captcha->isEnabledForForm($captchaForm) && !$captcha->recaptcha->isInvisible()}
										<div class="domain__register__page__captcha captcha-container" id="captchaContainer">
											{if $captcha == "recaptcha"}
												<div class="google__tick__recaptcha">
													<div class="form-group recaptcha-container mb-0"></div>
												</div>
											{elseif $captcha != "recaptcha"}
												<div class="default-captcha default-captcha-register-margin">
													<p class="coodiv-text-12 font-weight-300 mb-3">{lang key="cartSimpleCaptcha"}</p>
													<div class="row justify-content-start">
														<div class="col-auto">
															<img id="inputCaptchaImage" src="{$systemurl}includes/verifyimage.php" align="middle" />
														</div>
														<div class="col">
															<input id="inputCaptcha" type="text" name="code" maxlength="6" class="form-control form-control-sm input-sm" data-toggle="tooltip" data-placement="top" data-trigger="manual" title="{lang key='orderForm.required'}" />
														</div>
													</div>
												</div>
											{/if}
											<a id="domainregisterpagecaptchaclose"><i class="fal fa-times"></i></a>
										</div>
									{/if}
								
							</div>
							{if $showAdvancedSearchOptions}
								<div class="domain__register__form__spotlighttlds advenced__search__option__wrapper">
									<div class="domain__search__input__options col-auto d-flex align-items-center">
										<div class="inputdomainselect select__dropdown__menu__search__wrapper">
											<select name="tlds[]"  multiple="multiple" data-min-selection="1" data-placeholder="{lang key='domainSearch.tlds'}" class="select__dropdown__menu__search">
												{foreach $tlds as $tld}
													<option{if in_array($tld, $selectedTlds)} selected {if count($selectedTlds) <= 1}disabled="disabled"{/if}{/if} value="{$tld}">{$tld}</option>
												{/foreach}
											</select>
										</div>
									</div>
									<div class="domain__search__input__options col-auto d-md-flex d-none align-items-center">
										<div class="inputdomainselect select__dropdown__menu__search__wrapper">
											<select name="maxLength" data-placeholder="{lang key='domainSearch.maxLength'}" class="select__dropdown__menu__search">
												{foreach $searchLengths as $len}
													<option value="{$len}" {if $maxLength === $len}selected{/if}>{$len}</option>
												{/foreach}
											</select>
										</div>
									</div>
									<div class="ml-auto domain__search__input__options col-auto d-md-flex d-none align-items-center">
										<label class="switch__box__on__off" for="marketingoptin">
											<span class="switch__box__on__off__title">{lang key="domainSearch.safeSearch"}</span>
											<input type="checkbox" name="filter" class="no-icheck toggle-switch-success" data-size="small" data-on-text="Yes" data-off-text="No" {if $safeSearchSelected}checked{/if}>
										</label>
									</div>
								</div>
							{else}
								{if $spotlightTlds}
									<div class="domain__register__form__spotlighttlds">
										<span class="domain__register__form__spotlighttlds__title coodiv-text-12 font-weight-400">{$LANG.shufytheme.domainsspotlighttlds} </span>
										{foreach $spotlightTlds as $key => $data}
											<div class="domain__register__form__spotlighttlds__item">
												<span class="tld {if $data.group}with__badge{/if}" onclick="addSuffix('{$data.tld}')" id="{$data.tld}">
												{if $data.tld == ".co.uk"}
												co.uk
												{else if $data.tld == ".com.au"}
												com.au
												{else}
												{$data.tld|replace:".":""}
												{/if}
												{if $data.group}<span class="badge {$data.group}">{$data.groupDisplayName}</span>{/if}
												</span>
											</div>
										{/foreach}
									</div>
								{/if}
							{/if}
							</form> 
						</div>
						<div class="dark-mode-texts mt-10">
							<h6 class="text-center font-weight-300 coodiv-text-8">Over <b class="font-weight-600">35,000+</b> Domains Registered Worldwide</h6>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="full__with__section">
	<div class="pb-0" id="order-standard_cart">
		<div id="DomainSearchResults" class="domain__page__results w-hidden">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-10 col-12">
					
						<div id="primarySuggestionHeading" class="primary-domain-header"><i class="fa-regular fa-sparkles"></i> {$LANG.domainSearch.topSuggestion}</div>
						<div id="primaryExactHeading" class="primary-domain-header">{$LANG.domainSearch.exactMatch}</div>
				
				
						<div id="searchDomainInfo" class="domain__search__results__wrapper">
							<p id="primaryLookupSearching" class="domain-lookup-loader domain-lookup-primary-loader domain-searching"><i class="fas fa-spinner fa-spin"></i> {lang key='orderForm.searching'}...</p>
							
							 
							
							<div id="primaryLookupResult" class="domain-lookup-result w-hidden">
								<div class="row justify-content-start">
									<div class="col-md-6 col-12">
										<div class="domain__page__luckup__result__box h-100">
											<div class="domain__lookup__result__box domain-invalid">
												<i class="domain__lookup__result__icon fas fa-times"></i>
												<p class="domain-checker-unavailable headline">{lang key='orderForm.domainInvalid'}</p>
												<p>
													{lang key='orderForm.domainLetterOrNumber'}<span class="domain-length-restrictions">{lang key='orderForm.domainLengthRequirements'}</span><br />
													{lang key='orderForm.domainInvalidCheckEntry'}
												</p>
											</div>
											<div class="domain-unavailable domain-checker-unavailable headline">
												<span class="badge badge-danger"><i class="fal fa-times mr-2"></i>{lang key='clientareahostingdomain'} {lang key='domainunavailable2'}</span>
												<div class="domain__page__luckup__result__domain">
													<h6 class="domain__page__luckup__result__text">{lang key='orderForm.domainIsUnavailable'}</h6>
												</div>
											</div>
											<div class="domain-available domain-checker-available headline">
												<span class="badge badge-success"><i class="fal fa-check mr-2"></i> Exact match</span>
												<div class="domain__page__luckup__result__domain">
													<h6 class="domain__page__luckup__result__text"><strong></strong> {$LANG.domainavailable2}</h6>
												</div>
											</div>
											
											<div class="domain-tld-unavailable domain-checker-unavailable">
											<span class="badge badge-danger"><i class="fal fa-times mr-2"></i>{lang key='clientareahostingdomain'} {lang key='domainunavailable'}</span>
											<div class="domain__page__luckup__result__domain">
												<h6 class="domain__page__luckup__result__text">{lang key='orderForm.domainHasUnavailableTld'}</h6>
											</div>
											</div>
											
											
											<div class="domain-price domain__search__results__wrapper__price p-0">
												<span class="coodiv-text-11 font-weight-300 price"></span>
												
												<button class="btn btn-primary btn-sm btn-add-to-cart mt-3" data-whois="0" data-domain="">
													<span class="to-add">{$LANG.addtocart}</span>
													<span class="loading">
														<i class="fas fa-spinner fa-spin"></i> {lang key='loading'}
													</span>
													<span class="added"><i class="far fa-shopping-cart"></i> {lang key='checkout'}</span>
													<span class="unavailable">{$LANG.domaincheckertaken}</span>
												</button>
											</div>
											<p class="coodiv-text-11 font-weight-300 domain-error domain-checker-unavailable"></p>
										</div>
									</div>
									{if $spotlightTlds}
										{assign var="displayIndex" value=1}
										<div class="col-md-6 col-12 mt-md-0 mt-8">
											<div id="spotlightTlds" class="domain__page__luckup__result__box recommended__domains__wrapper overflow-hidden h-100">
												{foreach $spotlightTlds as $key => $data}
													{if $key == 4}
														<div id="spotlight{$data.tldNoDots}" class="spotlight__tlds__domain__item">
															{if $data.group}
																<div class="spotlight__tld__badge spotlight-tld-{$data.group}">{$data.groupDisplayName}</div>
															{/if}
															<span class="badge badge-warning"><i class="fal fa-check mr-2"></i> {lang key='upgradeService.recommended'}</span>
															<div class="domain__page__luckup__result__domain">
																<h6 id="targetElement" class="coodiv-text-6 font-weight-600 mb-0">{$data.tld}</h6>
															</div>
															<span class="domain-lookup-loader domain-lookup-spotlight-loader">
																<i class="fas fa-spinner fa-spin"></i>
															</span>
															<div class="domain-lookup-result d-flex flex-column gap-5 mt-2">
																
																<span class="coodiv-text-11 font-weight-300 available price w-hidden">{$data.register}</span>
													
																<div class="recommended__domains__btns">
																<button type="button" class="unavailable__domain__lookup__btn unavailable w-hidden" disabled="disabled">
																	{lang key='domainunavailable'}
																</button>
																<button type="button" class="unavailable__domain__lookup__btn invalid w-hidden" disabled="disabled">
																	{lang key='domainunavailable'}
																</button>
																
																
																<button type="button" class="recommended__domains__wrapper__btn btn btn-primary btn-sm btn-add-to-cart w-hidden" data-whois="0" data-domain="">
																	<span class="to-add">{$LANG.addtocart}</span>
																	<span class="loading">
																		<i class="fas fa-spinner fa-spin"></i> {lang key='loading'}
																	</span>
																	<span class="added"><i class="far fa-shopping-cart"></i> {lang key='checkout'}</span>
																	<span class="unavailable">{$LANG.domaincheckertaken}</span>
																</button>
																											
																<button type="button" class="btn btn-primary domain-contact-support w-hidden">
																	{lang key='domainChecker.contactSupport'}
																</button>
																</div>
															</div>
														</div>
													{/if}
												{/foreach}
											</div>
										</div>
									{/if}
								</div>
								<div class="btn btn-primary domain-contact-support headline">{$LANG.domainContactUs}</div>
								<div id="idnLanguageSelector" class="form-group idn-language-selector w-hidden">
									<div class="row">
										<div class="col-sm-10 col-sm-offset-1 col-lg-8 col-lg-offset-2 offset-sm-1 offset-lg-2">
											<div class="margin-10 text-center">
												{lang key='cart.idnLanguageDescription'}
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-8 col-lg-6 col-sm-offset-2 col-lg-offset-3 offset-sm-2 offset-lg-3">
											<select name="idnlanguage" class="form-control">
												<option value="">{lang key='cart.idnLanguage'}</option>
												{foreach $idnLanguages as $idnLanguageKey => $idnLanguage}
													<option value="{$idnLanguageKey}">{lang key='idnLanguage.'|cat:$idnLanguageKey}</option>
												{/foreach}
											</select>
											<div class="field-error-msg">
												{lang key='cart.selectIdnLanguageForRegister'}
											</div>
										</div>
									</div>
								</div>
							</div>
							{if $spotlightTlds}
								<div id="spotlightTlds" class="domain__search__page__spotlighttlds spotlight__tlds__domains__configure__product__wrapper clearfix">
									<div class="domain__search__page__spotlighttlds__header">
									<h6 class="domain__search__page__spotlighttlds__header__text coodiv-text-10 font-weight-600 mb-0">{lang key='featuredProduct'}</h6>
									</div>
									<div class="spotlight__tlds__domains__configure__product__container">
										{foreach $spotlightTlds as $key => $data}
											<div class="spotlight__tlds__domains__configure__product__item product__{$spotlightTlds|count}__in__row col">
												<div id="spotlight{$data.tldNoDots}" class="spotlight__tlds__domain__item">
													{if $data.group}
														<div class="spotlight__tld__badge spotlight-tld-{$data.group}">{$data.groupDisplayName}</div>
													{/if}
													<div class="spotlight__tld__data">
														{$data.tld|replace:'.':'<span class="dot">.</span>'}
													</div>
													<span class="domain-lookup-loader domain-lookup-spotlight-loader">
														<i class="fas fa-spinner fa-spin"></i>
													</span>
													<div class="domain-lookup-result">
														<button type="button" class="unavailable__domain__lookup__btn unavailable w-hidden" disabled="disabled">
															{lang key='domainunavailable'}
														</button>
														<button type="button" class="unavailable__domain__lookup__btn invalid w-hidden" disabled="disabled">
															{lang key='domainunavailable'}
														</button>
														<span class="available price w-hidden">{$data.register}</span>
											
														
														<button type="button" class="btn btn-add-to-cart w-hidden" data-whois="0" data-domain="">
															<span class="to-add">{lang key='orderForm.add'}</span>
															<span class="loading">
																<i class="fas fa-spinner fa-spin"></i> {lang key='loading'}
															</span>
															<span class="added"><i class="far fa-shopping-cart"></i> {lang key='checkout'}</span>
															<span class="unavailable">{$LANG.domaincheckertaken}</span>
														</button>
																									
														<button type="button" class="btn btn-primary domain-contact-support w-hidden">
															{lang key='domainChecker.contactSupport'}
														</button>
													</div>
												</div>
											</div>
										{/foreach}
									</div>
								</div>
							{/if}
				
				
							<div class="domain__search__suggested__domains__wrapper suggested-domains suggested__domains__table position-relative">
								<div class="domain__search__suggested__domains__title">
									<h6 class="domain__search__suggested__domains__title__text coodiv-text-10 font-weight-600 mb-0">{lang key='orderForm.suggestedDomains'}</h6>									
								</div>
								
								
								<div id="suggestionsLoader" class="card-body panel-body domain-lookup-loader domain-lookup-suggestions-loader">
									<i class="fas fa-spinner fa-spin"></i> {lang key='orderForm.generatingSuggestions'}
								</div>
								
								<div class="panel-body card-body domain-lookup-message domain-lookup-suggestions-message">
									{lang key='domainSearch.errors.noSuggestions'}
								</div>
								
								<div id="domainSuggestions" class="domain-lookup-result list-group w-hidden">
									<div class="domain-suggestion list-group-item w-hidden">
										<div class="domain__suggestion__wrap__item d-flex align-items-center justify-content-between">
										<span class="d-flex align-items-center gap-5">
										<span style="direction: ltr">
										<span class="domain"></span>
										<span class="extension"></span>
										</span>
										<span class="promo w-hidden">
											<span class="sales-group-hot w-hidden">{lang key='domainCheckerSalesGroup.hot'}</span>
											<span class="sales-group-new w-hidden">{lang key='domainCheckerSalesGroup.new'}</span>
											<span class="sales-group-sale w-hidden">{lang key='domainCheckerSalesGroup.sale'}</span>
										</span>
										</span>
										<div class="domain__suggestion__wrap__item__the__action d-flex align-items-center gap-5">
										<span class="price"></span>
										<div class="actions">
					
											
											<button type="button" class="btn-add-to-cart" data-whois="1" data-domain="">
												<span class="to-add">{$LANG.addtocart}</span>
												<span class="loading"><i class="fas fa-spinner fa-spin"></i></span>
												<span class="added">{lang key='checkout'}</span>
												<span class="unavailable">{$LANG.domaincheckertaken}</span>
											</button>
														
														
											<button type="button" class="btn btn-primary domain-contact-support w-hidden">{lang key='domainChecker.contactSupport'}</button>
										</div>
										</div>
										</div>
									</div>
								</div>
								
								<div class="more-suggestions w-hidden">
									<button id="moreSuggestions" onclick="loadMoreSuggestions();return false;">{lang key='domainsmoresuggestions'}</button>
									<span id="noMoreSuggestions" class="no-more small w-hidden">{lang key='domaincheckernomoresuggestions'}</span>
								</div>	
							</div>
						</div>
					</div>
				</div>

				
				{if $spotlightTlds}
					<div id="spotlightTlds" class="spotlight-tlds d-none">
						<div class="spotlight-tlds-container">
							{foreach $spotlightTlds as $key => $data}
								<div class="spotlight-tld-container spotlight-tld-container-{$spotlightTlds|count}">
									<div id="spotlight{$data.tldNoDots}" class="spotlight-tld">
										{if $data.group}
											<div class="spotlight-tld-{$data.group}">{$data.groupDisplayName}</div>
										{/if}
										{$data.tld}
										<span class="domain-lookup-loader domain-lookup-spotlight-loader">
											<i class="fas fa-spinner fa-spin"></i>
										</span>
										<div class="domain-lookup-result">
											<button type="button" class="btn unavailable w-hidden" disabled="disabled">
												{lang key='domainunavailable'}
											</button>
											<button type="button" class="btn invalid w-hidden" disabled="disabled">
												{lang key='domainunavailable'}
											</button>
											<span class="available price w-hidden">{$data.register}</span>
											<button type="button" class="btn btn-add-to-cart w-hidden" data-whois="0" data-domain="">
												<span class="to-add">{lang key='orderForm.add'}</span>
												<span class="loading">
													<i class="fas fa-spinner fa-spin"></i> {lang key='loading'}
												</span>
												<span class="added"><i class="far fa-shopping-cart"></i> {lang key='checkout'}</span>
												<span class="unavailable">{$LANG.domaincheckertaken}</span>
											</button>
											<button type="button" class="btn btn-primary domain-contact-support w-hidden">
												{lang key='domainChecker.contactSupport'}
											</button>
										</div>
									</div>
								</div>
							{/foreach}
						</div>
					</div>
				{/if}

				

			</div>
		</div>
		{include file="orderforms/$carttpl/parts/domain-register-front.tpl"}
	</div>
</div>

<script>
$(document).ready(function() {
	var itemsPerPage = 8;
	var $items = $('.tld-row').filter(':visible');
	var pageCount = Math.ceil($items.length / itemsPerPage);
	var currentPage = 1;
	function showItems(page) {
		var startIndex = (page - 1) * itemsPerPage;
		var endIndex = startIndex + itemsPerPage - 1;
		$items.hide().slice(startIndex, endIndex + 1).show();
	}
	function updatePaginationButtons() {
		$('.prev').prop('disabled', currentPage === 1);
		$('.next').prop('disabled', currentPage === pageCount);
		var pageNumbersHTML = '';
		for (var i = 1; i <= pageCount; i++) {
		  if (i === currentPage) {
			pageNumbersHTML += '<a class="btn btn-light btn-sm active">' + i + '</a>';
		  } else {
			pageNumbersHTML += '<a class="btn btn-light btn-sm" href="#" data-page="' + i + '">' + i + '</a>';
		  }
		}
		$('.page-numbers').html(pageNumbersHTML);
	}
	function goToPage(page) {
		currentPage = page;
		showItems(currentPage);
		updatePaginationButtons();
	}
	function refreshPagination() {
		currentPage = 1;
		$items = $('.tld-row').filter(':visible');
		pageCount = Math.ceil($items.length / itemsPerPage);
		showItems(currentPage);
		updatePaginationButtons();
	}
	showItems(currentPage);
	updatePaginationButtons();
	$('.prev').on('click', function() {
		if (currentPage > 1) {
		  goToPage(currentPage - 1);
		}
	});
	$('.next').on('click', function() {
		if (currentPage < pageCount) {
		  goToPage(currentPage + 1);
		}
	});
	$('.pagination').on('click', 'a', function(event) {
		event.preventDefault();
		var page = parseInt($(this).attr('data-page'));
		goToPage(page);
	});
	$('.tld-filters a ').on('click', function() {
		refreshPagination();
	});
	setTimeout(function () {
		refreshPagination();
	}, 1000);
});
</script>
<script>
function addSuffix(suffix) {
    var inputField = document.getElementById('inputDomain');
    var currentDomain = inputField.value.trim();
    var existingSuffixRegex = /\.[a-zA-Z0-9.-]+$/;
    if (existingSuffixRegex.test(currentDomain)) {
        var updatedDomain = currentDomain.replace(existingSuffixRegex, suffix);
        inputField.value = updatedDomain;
    } else {
        inputField.value = currentDomain + suffix;
    }
}
</script>

<script>
jQuery(document).ready(function() {
    jQuery('.tld-filters a:first-child').click();
{if $lookupTerm && !$captchaError && !$invalid}
    jQuery('#btnCheckAvailability').click();
{/if}
{if $invalid}
    jQuery('#primaryLookupSearching').toggle();
    jQuery('#primaryLookupResult').children().toggle();
    jQuery('#primaryLookupResult').toggle();
    jQuery('#DomainSearchResults').toggle();
    jQuery('.domain-invalid').toggle();
{/if}
});

{if $showAdvancedSearchOptions}
    $(document).ready(function() {
        jQuery('#frmDomainChecker .multiselect').each(function () {
            const enableFiltering = $(this).hasClass('multiselect-filter');
            const minSelection = jQuery(this).data('min-selection');
            $(this).multiselect({
                onChange: function (element) {
                    const closestSelect = element.closest('select');
                    const selectedOptions = closestSelect.find('option:selected');
                    if (minSelection === undefined) {
                        return;
                    }
                    const atMinOptions = selectedOptions.length <= minSelection;
                    const targetOptions = atMinOptions ? selectedOptions : closestSelect.find('option');
                    targetOptions.each(function () {
                        const inputElement = jQuery('input[value="' + jQuery(this).val() + '"]');
                        inputElement.prop('disabled', atMinOptions ? 'disabled' : false);
                    });
                },
                buttonText: function(options, select) {
                    return select.data('placeholder');
                },
                maxHeight: 200,
                includeFilterClearBtn: false,
                enableCaseInsensitiveFiltering: enableFiltering,
            });
        })
    });
{/if}

</script>


<script>
$(document).ready(function() {
  $('.recaptcha__filed__activated').on('click', function() {
    if ($('.inputdomainsearch').val().trim() !== '') {
      $('.domain__register__page__captcha').addClass('active');
    }
  });
  $('#domainregisterpagecaptchaclose').on('click', function() {
    $('.domain__register__page__captcha').removeClass('active');
  });
});
</script>