<div class="homepage__services__area py-lg-18 py-10">
	<div class="row justify-content-center mb-10">
		<div class="col-md-8 col-12 text-center">
		<h6 class="coodiv-text-6 font-weight-700">
		{if $coodivhomepagesettings.themehomepagesettinghomepagefeaturedsectiontitle|default:'' == null}
			{$LANG.shufytheme.homepage__front__products__title}
		{else}
			{$coodivhomepagesettings.themehomepagesettinghomepagefeaturedsectiontitle|default:''}
		{/if}
		</h6>
		<p class="coodiv-text-9 font-weight-300 mt-1">
		{if $coodivhomepagesettings.themehomepagesettinghomepagefeaturedsectionsubtitle|default:'' == null}
			{$LANG.shufytheme.homepage__front__products__subtitle}
		{else}
			{$coodivhomepagesettings.themehomepagesettinghomepagefeaturedsectionsubtitle|default:''}
		{/if}
		</p>
		</div>
	</div>
	<div class="main__homepage__services__grid">
		{if $coodivhomepagesettings.themehomepagesettingfeaturedfirst|default:''=='activated' || $coodivhomepagesettings.id|default:'' != '1'}
		<div class="main__homepage__services__grid__element webhosting light-mode-texts">
			<div class="main__homepage__services__grid__element__illustration">
				<img src="{if $coodivhomepagesettings.themehomepagesettingfeaturedfirstcontentinllustration|default:'' == null}{$WEB_ROOT}/templates/{$template}/assets/img/core-img/hosting-illustration.svg{else}{$coodivhomepagesettings.themehomepagesettingfeaturedfirstcontentinllustration|default:''}{/if}" alt="hosting illustration" />
			</div>
			<div class="main__homepage__services__grid__element__header">
				<div class="title__side pr-6">
					<h6 class="title coodiv-text-7 font-weight-700">
					{if $coodivhomepagesettings.themehomepagesettingfeaturedfirstcontenttitle|default:'' == null}
						{$LANG.shufytheme.homepage__hosting__title}
					{else}
						{$coodivhomepagesettings.themehomepagesettingfeaturedfirstcontenttitle|default:''}
					{/if}
					</h6>
					<div class="d-block">
						<p class="sub-title coodiv-text-11 font-weight-300 d-block">
						{if $coodivhomepagesettings.themehomepagesettingfeaturedfirstcontenttitleicon|default:'' == null}
							{$LANG.shufytheme.homepage__hosting__subtitle}
						{else}
							{$coodivhomepagesettings.themehomepagesettingfeaturedfirstcontenttitleicon|default:''}
						{/if}
						</p>
					</div>
				</div>
				
				<div class="price__side text-lg-right text-left">
					<h6 class="coodiv-text-4 font-weight-700">
					{if $coodivhomepagesettings.themehomepagesettingfeaturedfirstcontentprice|default:'' == null}
						$2.99/mo
					{else}
						{$coodivhomepagesettings.themehomepagesettingfeaturedfirstcontentprice|default:''}
					{/if}
					</h6>
					<p class="sub-title coodiv-text-13 font-weight-300 d-block">
					{if $coodivhomepagesettings.themehomepagesettingfeaturedfirstcontentpricebilling|default:'' == null}
						{$LANG.shufytheme.homepage__hosting__priceinfo}
					{else}
						{$coodivhomepagesettings.themehomepagesettingfeaturedfirstcontentpricebilling|default:''}
					{/if}
					</p>
				</div>
			</div>
			
			<div class="main__homepage__services__grid__element__body">
				<p class="sub-title coodiv-text-11 font-weight-300 d-block">
				{if $coodivhomepagesettings.themehomepagesettingfeaturedfirstcontentdescription|default:'' == null}
					{$LANG.shufytheme.homepage__hosting__description}
				{else}
					{$coodivhomepagesettings.themehomepagesettingfeaturedfirstcontentdescription|default:''}
				{/if}
				</p>
				
				<ul class="main__homepage__services__grid__element__plan__features d-flex flex-column">
				<li>
				<h6 class="coodiv-text-11 font-weight-700">
				{if $coodivhomepagesettings.themehomepagesettingfeaturedfirstcontentsubtitleone|default:'' == null}
					{$LANG.shufytheme.homepage__hosting__feature1__title}
				{else}
					{$coodivhomepagesettings.themehomepagesettingfeaturedfirstcontentsubtitleone|default:''}
				{/if}
				</h6>
				<p class="sub-title coodiv-text-12 font-weight-300 d-block">
				{if $coodivhomepagesettings.themehomepagesettingfeaturedfirstcontentsubtitleoneicon|default:'' == null}
					{$LANG.shufytheme.homepage__hosting__feature1__subtitle}
				{else}
					{$coodivhomepagesettings.themehomepagesettingfeaturedfirstcontentsubtitleoneicon|default:''}
				{/if}
				</p>
				</li>
				<li>
				<h6 class="coodiv-text-11 font-weight-700">
				{if $coodivhomepagesettings.themehomepagesettingfeaturedfirstcontentsubtitletwo|default:'' == null}
					{$LANG.shufytheme.homepage__hosting__feature2__title}
				{else}
					{$coodivhomepagesettings.themehomepagesettingfeaturedfirstcontentsubtitletwo|default:''}
				{/if}
				</h6>
				<p class="sub-title coodiv-text-12 font-weight-300 d-block">
				{if $coodivhomepagesettings.themehomepagesettingfeaturedfirstcontentsubtitletwoicon|default:'' == null}
					{$LANG.shufytheme.homepage__hosting__feature2__subtitle}
				{else}
					{$coodivhomepagesettings.themehomepagesettingfeaturedfirstcontentsubtitletwoicon|default:''}
				{/if}
				</p>
				</li>
				<li>
				<h6 class="coodiv-text-11 font-weight-700">
				{if $coodivhomepagesettings.themehomepagesettingfeaturedfirstcontentsubtitlethree|default:'' == null}
					{$LANG.shufytheme.homepage__hosting__feature3__title}
				{else}
					{$coodivhomepagesettings.themehomepagesettingfeaturedfirstcontentsubtitlethree|default:''}
				{/if}
				</h6>
				<p class="sub-title coodiv-text-12 font-weight-300 d-block">
				{if $coodivhomepagesettings.themehomepagesettingfeaturedsecondcontentprice|default:'' == null}
					{$LANG.shufytheme.homepage__hosting__feature3__subtitle}
				{else}
					{$coodivhomepagesettings.themehomepagesettingfeaturedsecondcontentprice|default:''}
				{/if}
				</p>
				</li>
				</ul>
			</div>
			
			<div class="main__homepage__services__grid__element__footer">
			<a href="{if $coodivhomepagesettings.themehomepagesettingfeaturedfirstcontentbuttonlink|default:'' == null}#{else}{$coodivhomepagesettings.themehomepagesettingfeaturedfirstcontentbuttonlink|default:''}{/if}" class="btn btn-small btn-primary">
			{if $coodivhomepagesettings.themehomepagesettingfeaturedfirstcontentbutton|default:'' == null}
				{$LANG.shufytheme.homepage__hosting__button}
			{else}
				{$coodivhomepagesettings.themehomepagesettingfeaturedfirstcontentbutton|default:''}
			{/if}
			</a>
			</div>
		</div>
		{/if}
		{if $coodivhomepagesettings.themehomepagesettingfeaturedssecond|default:''=='activated' || $coodivhomepagesettings.id|default:'' != '1'}
		<div class="main__homepage__services__grid__element servers light-mode-texts">
			<div class="main__homepage__services__grid__element__header">
				<div class="title__side pr-6">
					<h6 class="title coodiv-text-7 font-weight-700">
					{if $coodivhomepagesettings.themehomepagesettingfeaturedsecondcontenttitle|default:'' == null}
						{$LANG.shufytheme.homepage__vps__title}	
					{else}
						{$coodivhomepagesettings.themehomepagesettingfeaturedsecondcontenttitle|default:''}
					{/if}					
					</h6>
					<div class="d-block">
						<p class="d-flex align-items-center sub-title coodiv-text-11 font-weight-300 d-block">
						<img height="13" {if $coodivhomepagesettings.themehomepagesettingfeaturedsecondcontenttitleicon|default:'' == null}width="17"{/if} class="mr-3 main__homepage__services__grid__element__flag" src="{if $coodivhomepagesettings.themehomepagesettingfeaturedsecondcontenttitleicon|default:'' == null}{$WEB_ROOT}/templates/{$template}/assets/img/flags/dutch.svg{else}{$coodivhomepagesettings.themehomepagesettingfeaturedsecondcontenttitleicon|default:''}{/if}" alt="world icon" /> 
						{if $coodivhomepagesettings.themehomepagesettingfeaturedsecondcontentsubtitleone|default:'' == null}
							{$LANG.shufytheme.homepage__vps__subtitle1}
						{else}
							{$coodivhomepagesettings.themehomepagesettingfeaturedsecondcontentsubtitleone|default:''}
						{/if}
						</p>
						<p class="d-flex align-items-center sub-title coodiv-text-11 font-weight-300 d-block">
						<img height="13" {if $coodivhomepagesettings.themehomepagesettingfeaturedsecondcontentsubtitleoneicon|default:'' == null}width="30"{/if} class="mr-3 main__homepage__services__grid__element__flag rounded-0" src="{if $coodivhomepagesettings.themehomepagesettingfeaturedsecondcontentsubtitleoneicon|default:'' == null}{$WEB_ROOT}/templates/{$template}/assets/img/core-img/intel-icon.svg{else}{$coodivhomepagesettings.themehomepagesettingfeaturedsecondcontentsubtitleoneicon|default:''}{/if}" alt="world icon" /> 
						{if $coodivhomepagesettings.themehomepagesettingfeaturedsecondcontentsubtitletwo|default:'' == null}
							{$LANG.shufytheme.homepage__vps__subtitle2}
						{else}
							{$coodivhomepagesettings.themehomepagesettingfeaturedsecondcontentsubtitletwo|default:''}
						{/if}
						</p>
					</div>
				</div>
				
				<div class="price__side text-lg-right text-left">
					<h6 class="coodiv-text-6 font-weight-700">
					{if $coodivhomepagesettings.themehomepagesettingfeaturedsecondcontentdescription|default:'' == null}
						{$LANG.shufytheme.homepage__vps__price}
					{else}
						{$coodivhomepagesettings.themehomepagesettingfeaturedsecondcontentdescription|default:''}
					{/if}
					</h6>
					<p class="sub-title coodiv-text-13 font-weight-300 d-block">
					{if $coodivhomepagesettings.themehomepagesettingfeaturedsecondcontentpricebilling|default:'' == null}
						{$LANG.shufytheme.homepage__vps__priceinfo}
					{else}
						{$coodivhomepagesettings.themehomepagesettingfeaturedsecondcontentpricebilling|default:''}
					{/if}
					</p>
				</div>
			</div>
			
			<div class="main__homepage__services__grid__element__body">
				
				<ul class="main__homepage__services__grid__element__plan__features d-flex flex-column">
					<li>
					<h6 class="coodiv-text-11 font-weight-700">
					{if $coodivhomepagesettings.themehomepagesettingfeaturedsecondcontentsubtitlethree|default:'' == null}
						{$LANG.shufytheme.homepage__vps__feature1__title}
					{else}
						{$coodivhomepagesettings.themehomepagesettingfeaturedsecondcontentsubtitlethree|default:''}
					{/if}
					</h6>
					<p class="sub-title coodiv-text-12 font-weight-300 d-block">
					{if $coodivhomepagesettings.themehomepagesettingfeaturedsecondcontentinllustration|default:'' == null}
						{$LANG.shufytheme.homepage__vps__feature1__subtitle}
					{else}
						{$coodivhomepagesettings.themehomepagesettingfeaturedsecondcontentinllustration|default:''}
					{/if}
					</p>
					</li>
				</ul>
			</div>
			
			<div class="main__homepage__services__grid__element__footer">				
				<a href="{if $coodivhomepagesettings.themehomepagesettingfeaturedsecondcontentbuttonlink|default:'' == null}#{else}{$coodivhomepagesettings.themehomepagesettingfeaturedsecondcontentbuttonlink|default:''}{/if}" class="btn btn-small btn-primary-light">
					{if $coodivhomepagesettings.themehomepagesettingfeaturedsecondcontentbutton|default:'' == null}
						{$LANG.shufytheme.homepage__vps__button}
					{else}
						{$coodivhomepagesettings.themehomepagesettingfeaturedsecondcontentbutton|default:''}
					{/if}
				</a>
			</div>
		</div>
		{/if}
		{if $coodivhomepagesettings.themehomepagesettingfeaturedthird|default:''=='activated' || $coodivhomepagesettings.id|default:'' != '1'}
			<div class="main__homepage__services__grid__element domains dark-mode-texts">
				<div class="main__homepage__services__grid__element__header border-0">
					<div class="title__side">
						<h6 class="title coodiv-text-7 font-weight-700">
						{if $coodivhomepagesettings.themehomepagesettingfeatureddomomainsectiontitle|default:'' == null}
							{$LANG.shufytheme.homepage__domains__title}
						{else}
							{$coodivhomepagesettings.themehomepagesettingfeatureddomomainsectiontitle|default:''}
						{/if}
						</h6>
						<div class="d-block">
							<p class="sub-title coodiv-text-11 font-weight-300 d-block">
							{if $coodivhomepagesettings.themehomepagesettingfeatureddomomainsectionsubtitle|default:'' == null}
								{$LANG.shufytheme.homepage__domains__subtitle1}
							{else}
								{$coodivhomepagesettings.themehomepagesettingfeatureddomomainsectionsubtitle|default:''}
							{/if}
							
							</p>
							<p class="sub-title coodiv-text-11 font-weight-300 d-block">
							{if $coodivhomepagesettings.themehomepagesettingfeatureddomomainsectionsubtitletwo|default:'' == null}
								{$LANG.shufytheme.homepage__domains__subtitle2}
							{else}
								{$coodivhomepagesettings.themehomepagesettingfeatureddomomainsectionsubtitletwo|default:''}
							{/if}
							</p>
							
							{if $coodivhomepagesettings.themehomepagesettingfeatureddomomainsectionsubtitlethree|default:'' == null}{else}<p class="sub-title coodiv-text-11 font-weight-300 d-block">{$coodivhomepagesettings.themehomepagesettingfeatureddomomainsectionsubtitlethree|default:''}</p>{/if}
							
						</div>
					</div>
				</div>
				
				<form class="position-relative" method="post" action="{$WEB_ROOT}/domainchecker.php" id="frmDomainHomepage">
					<div class="search-group search-group-combined">
						<div class="search-field search-field-lg">
							<div class="search-field-icon"><i class="fal fa-search"></i></div>
							<input class="inputdomainsearch form-control form-control-lg" type="text" name="message" placeholder="{$LANG.shufytheme.homepage__domains__inputplaceholder}" autocapitalize="none" required>
						</div>
						<div class="search-group-btn main__homepage__services__grid__element__domain__search__form__btn">
							 <button type="submit" class="{if $captcha->isEnabled() && $captcha->isEnabledForForm($captchaForm) && !$captcha->recaptcha->isInvisible()}recaptcha__filed__activated  {if $captcha != "recaptcha"}text__captcha__enabled{/if}{/if} btn btn-primary{$captcha->getButtonClass($captchaForm)} btn-small search" id="btnDomainSearch2">
                                {lang key="search"}
                            </button>
						</div>
					</div>
					{if $captcha->isEnabled() && $captcha->isEnabledForForm($captchaForm) && !$captcha->recaptcha->isInvisible()}
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
					<div class="domain__register__page__captcha captcha-container light-mode-texts" id="captchaContainer">
						{if $captcha == "recaptcha"}
							<div class="google__tick__recaptcha">
								{include file="$template/includes/captcha.tpl"}
							</div>
						{elseif $captcha != "recaptcha"}
							<div class="default-captcha default-captcha-register-margin">
								<p class="coodiv-text-12 font-weight-300 mb-0">{lang key="cartSimpleCaptcha"}</p>
								<div class="row justify-content-start align-items-center">
									<div class="col-auto">
										<img id="inputCaptchaImage" src="{$systemurl}includes/verifyimage.php" align="middle" />
									</div>
									<div class="col">
										<input id="inputCaptcha" type="text" name="code" maxlength="6" class="form-control form-control-sm input-sm" data-toggle="tooltip" data-placement="top" data-trigger="manual" title="{lang key='orderForm.required'}" required/>
									</div>
								</div>
							</div>
						{/if}
						<a id="domainregisterpagecaptchaclose"><i class="fal fa-times"></i></a>
					</div>
					{/if}
					{if $captcha->recaptcha->isInvisible()}
						{include file="$template/includes/captcha.tpl"}
					{/if}
				</form>
				{if $featuredTlds}
					<div class="row justify-content-start mt-7">
						{foreach $featuredTlds as $num => $tldinfo}
							{if $num < 3}
								<div class="col-auto">
									<div class="main__homepage__services__grid__element__domain__ltds__price">
										{if $tldinfo.tldNoDots == "couk"}
										<h6 class="ltd coodiv-text-7 font-weight-700 mb-0"><small>.</small> co.uk</h6>
										{else}
										<h6 class="ltd coodiv-text-7 font-weight-700 mb-0"><small>.</small> {$tldinfo.tldNoDots}</h6>
										{/if}
										<h6 class="price coodiv-text-11 font-weight-200 sub-color mb-0">
											{if is_object($tldinfo.register)}
												{$tldinfo.register->toFull()}
											{else}
												{lang key="domainregnotavailable"}
											{/if}
										</h6>
									</div>
								</div>
							{/if}
						{/foreach}
					</div>
				{/if}
			</div>
		{/if}
	</div>

	
	<div class="homepage__main__pricing__plans__wrapper row justify-content-start mt-8">
		{if $coodivhomepagesettings.themehomepagesettingfeaturescolorsplansfirst|default:''=='activated' || $coodivhomepagesettings.id|default:'' != '1'}
			<div class="col-lg col-md-6 col-12 mb-8 mb-lg-0">
				<div class="homepage__main__pricing__plan__box color__one">
					<div class="homepage__main__pricing__plan__header mb-6">
					<i class="coodiv-text-7 mb-2 {if $coodivhomepagesettings.themehomepagesettingfeaturescolorsplansfirsticon|default:'' == null}fab fa-wordpress-simple{else}{$coodivhomepagesettings.themehomepagesettingfeaturescolorsplansfirsticon|default:''}{/if} font-weight-300"></i>
					<h6 class="coodiv-text-7 font-weight-700 mb-0">
					{if $coodivhomepagesettings.themehomepagesettingfeaturescolorsplansfirsttitle|default:'' == null}
						{$LANG.shufytheme.homepage__wordpress__title}
					{else}
						{$coodivhomepagesettings.themehomepagesettingfeaturescolorsplansfirsttitle|default:''}
					{/if}
					</h6>
					<h6 class="coodiv-text-11 font-weight-700">
					{if $coodivhomepagesettings.themehomepagesettingfeaturescolorsplansfirstsubtitle|default:'' == null}
						{$LANG.shufytheme.homepage__wordpress__subtitle}
					{else}
						{$coodivhomepagesettings.themehomepagesettingfeaturescolorsplansfirstsubtitle|default:''}
					{/if}
					</h6>
					</div>
					<div class="homepage__main__pricing__plan__body mt-1 mb-9">
					<p class="coodiv-text-11 font-weight-300">
					{if $coodivhomepagesettings.themehomepagesettingfeaturescolorsplansfirstdescription|default:'' == null}
						{$LANG.shufytheme.homepage__wordpress__description}
					{else}
						{$coodivhomepagesettings.themehomepagesettingfeaturescolorsplansfirstdescription|default:''}
					{/if}
					</div>
					<div class="homepage__main__pricing__plan__footer">
					<h6 class="plan__pricing coodiv-text-5 font-weight-700 mb-0">
					{if $coodivhomepagesettings.themehomepagesettingfeaturescolorsplansfirstprice|default:'' == null}
						{$LANG.shufytheme.homepage__wordpress__price}
					{else}
						{$coodivhomepagesettings.themehomepagesettingfeaturescolorsplansfirstprice|default:''}
					{/if}
					</h6>
					<p class="sub-title coodiv-text-13 font-weight-300 d-block">
					{if $coodivhomepagesettings.themehomepagesettingfeaturescolorsplansfirstbilling|default:'' == null}
						{$LANG.shufytheme.homepage__wordpress__priceinfo}
					{else}
						{$coodivhomepagesettings.themehomepagesettingfeaturescolorsplansfirstbilling|default:''}
					{/if}
					</p>
					<a href="{if $coodivhomepagesettings.themehomepagesettingfeaturescolorsplansfirstbtnlink|default:'' == null}#{else}{$coodivhomepagesettings.themehomepagesettingfeaturescolorsplansfirstbtnlink|default:''}{/if}" class="btn btn-lg d-block w-100 mt-7">
					{if $coodivhomepagesettings.themehomepagesettingfeaturescolorsplansfirstbtntext|default:'' == null}
						{$LANG.shufytheme.homepage__wordpress__button}
					{else}
						{$coodivhomepagesettings.themehomepagesettingfeaturescolorsplansfirstbtntext|default:''}
					{/if}
					</a>
					</div>
				</div>
			</div>
		{/if}
		
		{if $coodivhomepagesettings.themehomepagesettingfeaturescolorsplanssecond|default:''=='activated' || $coodivhomepagesettings.id|default:'' != '1'}
		<div class="col-lg col-md-6 col-12 mb-8 mb-lg-0">
			<div class="homepage__main__pricing__plan__box color__two">
				<div class="homepage__main__pricing__plan__header mb-6">
				<i class="coodiv-text-7 mb-2 {if $coodivhomepagesettings.themehomepagesettingfeaturescolorsplanssecondicon|default:'' == null}fal fa-database{else}{$coodivhomepagesettings.themehomepagesettingfeaturescolorsplanssecondicon|default:''}{/if} font-weight-300"></i>
				<h6 class="coodiv-text-7 font-weight-700 mb-0">
				{if $coodivhomepagesettings.themehomepagesettingfeaturescolorsplanssecondtitle|default:'' == null}
					{$LANG.shufytheme.homepage__dedicated__title}
				{else}
					{$coodivhomepagesettings.themehomepagesettingfeaturescolorsplanssecondtitle|default:''}
				{/if}
				</h6>
				<h6 class="coodiv-text-11 font-weight-700">
				{if $coodivhomepagesettings.themehomepagesettingfeaturescolorsplanssecondsubtitle|default:'' == null}
					{$LANG.shufytheme.homepage__dedicated__subtitle}
				{else}
					{$coodivhomepagesettings.themehomepagesettingfeaturescolorsplanssecondsubtitle|default:''}
				{/if}
				</h6>
				</div>
				<div class="homepage__main__pricing__plan__body mt-1 mb-9">
				<p class="coodiv-text-11 font-weight-300">
				{if $coodivhomepagesettings.themehomepagesettingfeaturescolorsplansseconddescription|default:'' == null}
					{$LANG.shufytheme.homepage__dedicated__description}
				{else}
					{$coodivhomepagesettings.themehomepagesettingfeaturescolorsplansseconddescription|default:''}
				{/if}
				</div>
				<div class="homepage__main__pricing__plan__footer">
				<h6 class="plan__pricing coodiv-text-5 font-weight-700 mb-0">
				{if $coodivhomepagesettings.themehomepagesettingfeaturescolorsplanssecondprice|default:'' == null}
					{$LANG.shufytheme.homepage__dedicated__price}
				{else}
					{$coodivhomepagesettings.themehomepagesettingfeaturescolorsplanssecondprice|default:''}
				{/if}
				</h6>
				<p class="sub-title coodiv-text-13 font-weight-300 d-block">
				{if $coodivhomepagesettings.themehomepagesettingfeaturescolorsplanssecondbilling|default:'' == null}
					{$LANG.shufytheme.homepage__dedicated__priceinfo}
				{else}
					{$coodivhomepagesettings.themehomepagesettingfeaturescolorsplanssecondbilling|default:''}
				{/if}
				</p>
				<a href="{if $coodivhomepagesettings.themehomepagesettingfeaturescolorsplanssecondbtnlink|default:'' == null}#{else}{$coodivhomepagesettings.themehomepagesettingfeaturescolorsplanssecondbtnlink|default:''}{/if}" class="btn btn-lg d-block w-100 mt-7">
				{if $coodivhomepagesettings.themehomepagesettingfeaturescolorsplanssecondbtntext|default:'' == null}
					{$LANG.shufytheme.homepage__dedicated__button}
				{else}
					{$coodivhomepagesettings.themehomepagesettingfeaturescolorsplanssecondbtntext|default:''}
				{/if}
				</a>
				</div>
			</div>
		</div>
		{/if}
		
		
		{if $coodivhomepagesettings.themehomepagesettingfeaturescolorsplansthird|default:''=='activated' || $coodivhomepagesettings.id|default:'' != '1'}
		<div class="col-lg col-md-6 col-12 mb-8 mb-lg-0">
			<div class="homepage__main__pricing__plan__box color__tree">
				<div class="homepage__main__pricing__plan__header mb-6">
				<i class="coodiv-text-7 mb-2 {if $coodivhomepagesettings.themehomepagesettingfeaturescolorsplansthirdicon|default:'' == null}fab fa-windows{else}{$coodivhomepagesettings.themehomepagesettingfeaturescolorsplansthirdicon|default:''}{/if} font-weight-300"></i>
				<h6 class="coodiv-text-7 font-weight-700 mb-0">
				{if $coodivhomepagesettings.themehomepagesettingfeaturescolorsplansthirdtitle|default:'' == null}
					{$LANG.shufytheme.homepage__windows__title}
				{else}
					{$coodivhomepagesettings.themehomepagesettingfeaturescolorsplansthirdtitle|default:''}
				{/if}
				</h6>
				<h6 class="coodiv-text-11 font-weight-700">
				{if $coodivhomepagesettings.themehomepagesettingfeaturescolorsplansthirdsubtitle|default:'' == null}
					{$LANG.shufytheme.homepage__windows__subtitle}
				{else}
					{$coodivhomepagesettings.themehomepagesettingfeaturescolorsplansthirdsubtitle|default:''}
				{/if}
				</h6>
				</div>
				<div class="homepage__main__pricing__plan__body mt-1 mb-9">
				<p class="coodiv-text-11 font-weight-300">
				{if $coodivhomepagesettings.themehomepagesettingfeaturescolorsplansthirddescription|default:'' == null}
					{$LANG.shufytheme.homepage__windows__description}
				{else}
					{$coodivhomepagesettings.themehomepagesettingfeaturescolorsplansthirddescription|default:''}
				{/if}
				</div>
				<div class="homepage__main__pricing__plan__footer">
				<h6 class="plan__pricing coodiv-text-5 font-weight-700 mb-0">
				{if $coodivhomepagesettings.themehomepagesettingfeaturescolorsplansthirdprice|default:'' == null}
					{$LANG.shufytheme.homepage__windows__price}
				{else}
					{$coodivhomepagesettings.themehomepagesettingfeaturescolorsplansthirdprice|default:''}
				{/if}
				</h6>
				<p class="sub-title coodiv-text-13 font-weight-300 d-block">
				{if $coodivhomepagesettings.themehomepagesettingfeaturescolorsplansthirdbilling|default:'' == null}
					{$LANG.shufytheme.homepage__windows__priceinfo}
				{else}
					{$coodivhomepagesettings.themehomepagesettingfeaturescolorsplansthirdbilling|default:''}
				{/if}
				</p>
				<a href="{if $coodivhomepagesettings.themehomepagesettingfeaturescolorsplansthirdbtnlink|default:'' == null}#{else}{$coodivhomepagesettings.themehomepagesettingfeaturescolorsplansthirdbtnlink|default:''}{/if}" class="btn btn-lg d-block w-100 mt-7">
				{if $coodivhomepagesettings.themehomepagesettingfeaturescolorsplansthirdbtntext|default:'' == null}
					{$LANG.shufytheme.homepage__windows__button}
				{else}
					{$coodivhomepagesettings.themehomepagesettingfeaturescolorsplansthirdbtntext|default:''}
				{/if}
				</a>
				</div>
			</div>
		</div>
		{/if}
	</div>
</div>
