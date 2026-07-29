<div id="popuppfirsttime" class="flowting__cookies__box__wrapper {$coodivsettings.cookiesboxposition|default:''}">
	<div class="flowting__cookies__box__header">
		<h6 class="coodiv-text-9 font-weight-bold mb-0">
		{if $coodivsettings.cookiesbox_header|default:'' == null}
			{$LANG.shufytheme.cookiesboxheader}
		{else}
			{$coodivsettings.cookiesbox_header|default:''}
		{/if}
		</h6>
	</div>
	<div class="flowting__cookies__box__body">
	<p class="coodiv-text-11 font-weight-300 mb-0">
	{if $coodivsettings.cookiesboxtext|default:'' == null}
		 {$LANG.shufytheme.cookiesboxbody} <a href="#">{$LANG.shufytheme.cookiesboxbodybuttontext}</a> 
	{else}
		{$coodivsettings.cookiesboxtext|default:''}
	{/if}
	{if $coodivsettings.cookiesbox_link_text|default:'' != null}
		<a href="{if $coodivsettings.cookiesbox_link_url|default:'' == null}#{else}{$coodivsettings.cookiesbox_link_url|default:''}{/if}">{$coodivsettings.cookiesbox_link_text|default:''}</a>
	{/if}
	
	</p>
	</div>
	<div class="flowting__cookies__box__footer btn__cotaniner d-flex flex-wrap gap-5 justify-content-end">
		<button id="gbpr-badge-decline" type="button" class="btn btn-light btn-sm">{$LANG.shufytheme.cookiesboxdecline}</button>
		<button id="gbpr-badge-close" type="button" class="btn btn-primary btn-sm">{$LANG.shufytheme.cookiesboxallow}</button>
	</div>
</div>