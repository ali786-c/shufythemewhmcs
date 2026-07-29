<div class="footer__subscription__wrapper py-14 bg-default-2 light-mode-texts">
	<div class="main__page__content">
		<div class="subscription__wrapper__box row justify-content-between align-items-center">
			<div class="col-lg-6 col-12 text-lg-left text-center">
				<h6 class="coodiv-text-7 font-weight-700 mb-0">
					{if $coodivhomepagesettings.themehomepagesettingsubscribingsectiontitle|default:'' == null}
						{$LANG.shufytheme.homepage__subscribetile}
					{else}
						{$coodivhomepagesettings.themehomepagesettingsubscribingsectiontitle|default:''}
					{/if}
				</h6>
				<p class="coodiv-text-11 font-weight-300">
					{if $coodivhomepagesettings.themehomepagesettingsubscribingsectionsubtitle|default:'' == null}
						{$LANG.shufytheme.homepage__subscribesubtile}
					{else}
						{$coodivhomepagesettings.themehomepagesettingsubscribingsectionsubtitle|default:''}
					{/if}
				</p>
			</div>
			{if $coodivhomepagesettings.themehomepagesettingsubscribingsectionmailchimapi|default:'' == null}
				{assign var='mailchimpapikey' value='mailchimpapikey'}
			{else}				
				{assign var='mailchimpapikey' value=$coodivhomepagesettings.themehomepagesettingsubscribingsectionmailchimapi|default:''}
				{assign var='encodedapikey' value=$mailchimpapikey|base64_encode}
			{/if}
			<div class="col-lg-6 col-12">
			<form class="subscription__block__form" method="post" id="mailchimp-form" 
				  data-api-key="{$encodedapikey|escape:'htmlall':'UTF-8'}"
				  data-list-id="{$coodivhomepagesettings.themehomepagesettingsubscribingsectionmailchimcode|default:''}" 
				  data-dc="{$coodivhomepagesettings.themehomepagesettingsubscribingsectionmailchimoption|default:''}">
				<input class="input subscription-block-form-input col" type="email" id="mailchimpsubemail" name="email" placeholder="{$LANG.shufytheme.homepage__subscribeinputplaceholder}" required>  
				<div style="display:none;">
					<input type="text" id="email_botcheck" name="email_botcheck" value="" tabindex="-1" autocomplete="off">
				</div>
				<button type="submit" class="button mailchimp__form__submit__button">{if $coodivhomepagesettings.themehomepagesettingsubscribingsectionmailchimpusername|default:'' == null}{$LANG.shufytheme.homepage__subscribbuttontitle}{else}{$coodivhomepagesettings.themehomepagesettingsubscribingsectionmailchimpusername|default:''}{/if}</p></button>
			</form>
			<div id="mailchimp-form-messages"></div>
			<p class="pl-3 coodiv-text-12 font-heading font-weight-200 mb-0">{$LANG.ordertosagreement} <a class="font-weight-700" target="_blank" href="{$tosURL}">{$LANG.ordertos}</a></p>
		  </div>
		</div>
	</div>
</div>