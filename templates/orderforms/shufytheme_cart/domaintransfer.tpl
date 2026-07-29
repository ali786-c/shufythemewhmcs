{include file="shufytheme/includes/theme-core/init-standalone.tpl"}
{include file="orderforms/standard_cart/common.tpl"}
<div class="full__with__section">
	<div class="domain__register__hero">
		<div class="container">
			<div class="main__banner__row row justify-content-center align-items-center" id="domainsearchwrapper">
				<div class="col-md-8 col-12">
					<div class="banner__content text-center">
						<div class="dark-mode-texts mb-10">
							<h1 class="coodiv-text-4 font-weight-bold mb-3">{lang key='orderForm.transferToUs'}</h1>
							<p class="coodiv-text-8 font-weight-300 p-1">{lang key='orderForm.transferExtend'}</p>
							
							<div class="coodiv__primary__link__tabs d-flex align-items-center justify-content-center mt-6">
								<a href="cart.php?a=add&domain=register">{lang key='registerdomain'}</a>
								<a class="active" href="{$WEB_ROOT}/cart.php?a=add&domain=transfer">{lang key='transferdomain'}</a>
							</div>
						
						</div>
						<div class="domain__register__form banner__domain__searching domain-slector-inputs position-relative">
							<div class="option">
								<form method="post" action="{$WEB_ROOT}/cart.php" id="frmDomainTransfer">
									<input type="hidden" name="a" value="addDomainTransfer">
									<div class="domain__search__input__wrapper single-input row justify-content-start w-100 position-relative">
										<div class="domain__search__input__searching position-relative col">
											<input style="border: 0 !important" type="text" class="form-control transferdomaininput" name="domain" id="inputTransferDomain" value="{$lookupTerm}" placeholder="{lang key='yourdomainplaceholder'}.{lang key='yourtldplaceholder'}" data-toggle="tooltip" data-placement="left" data-trigger="manual" title="{lang key='orderForm.enterDomain'}" />
										</div>
										<div class="domain__search__input__epp position-relative col">
											<input style="border: 0 !important" type="text" class="form-control" name="epp" id="inputAuthCode" placeholder="{lang key='orderForm.authCodePlaceholder'}" data-toggle="tooltip" data-placement="left" data-trigger="manual" title="{lang key='orderForm.required'}" />
										</div>
										<div class="domain__search__input__options col-auto d-flex align-items-center">
											<button type="submit" id="btnTransferDomain" class="{if $captcha->isEnabled() && $captcha->isEnabledForForm($captchaForm) && !$captcha->recaptcha->isInvisible()}recaptcha__filed__activated{/if} search-btn btn btn-primary btn-transfer{$captcha->getButtonClass($captchaForm)}">
												<span class="loader w-hidden" id="addTransferLoader">
													<i class="fas fa-fw fa-spinner fa-spin"></i>
												</span>
												<span id="addToCart">{lang key="orderForm.addToCart"}</span>
											</button>
										</div>
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
									
									
								</form> 
							</div>
							
						</div>
						
						<div id="transferUnavailable" class="alert alert-warning slim-alert text-center w-hidden"></div>
						<div class="dark-mode-texts mt-10">
							<h6 class="text-center font-weight-300 coodiv-text-11">* {lang key='orderForm.extendExclusions'}</h6>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="full__with__section">
	<div class="pb-0" id="order-standard_cart">
		{include file="orderforms/$carttpl/parts/domain-transfer-front.tpl"}
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
$(document).ready(function() {
  $('.recaptcha__filed__activated').on('click', function() {
    if ($('.transferdomaininput').val().trim() !== '') {
      $('.domain__register__page__captcha').addClass('active');
    }
  });
  $('#domainregisterpagecaptchaclose').on('click', function() {
    $('.domain__register__page__captcha').removeClass('active');
  });
});
</script>