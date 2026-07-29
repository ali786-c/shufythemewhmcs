{if $loggedin}
<div class="header__item header__icon__small header__item_messages">         
	<button class="header__head">
	  <i class="far fa-bell"></i> <span class="header__head__item___number">{if $clientAlerts}{count($clientAlerts)}{else}0{/if}</span>
	</button>
	<div class="header__body header__notifications">
	  <div class="header__top">
		<div class="header__title">
		{lang key='notifications'}
		<a href="{$WEB_ROOT}/clientarea.php?action=details#emailPreferences">{lang key='clientareacontactsemails'}</a>
		</div>
		<div class="actions actions_small">
		  <button class="actions__button"><i class="fal fa-ellipsis-h"></i></button>
		  <div class="actions__body">
			<a href="{$WEB_ROOT}/clientarea.php?action=emails" class="actions__option"><i class="icon fal fa-envelope"></i> {lang key='navemailssent'}</a>
			<a href="{$WEB_ROOT}/user/accounts" class="actions__option"><i class="icon fal fa-sync"></i> {lang key='navSwitchAccount'}</a>
		  </div>
		</div>
	  </div>
	  <div class="header__list">
	  {foreach $clientAlerts as $alert}	
      <div class="header__message new">
		 <div class="header__details">
			 <div class="header__line">
			 <div class="header__subtitle">
			 <i class="icon fas fa-fw fa-{if $alert->getSeverity() == 'danger'}exclamation-triangle danger__icon{elseif $alert->getSeverity() == 'warning'}exclamation-triangle alert__icon{elseif $alert->getSeverity() == 'info'}info-circle info__icon{else}check-circle success__icon{/if}"></i>
				{if $alert->getLinkText()}
				{$alert->getLinkText()}
				{else}
				{$LANG.addfunds}
				{/if}
			 </div>
			 <div class="header__time">
				 {if $alert->getSeverity() == 'danger'}
					<b>{$LANG.shufytheme.notification.danger}:</b> {$LANG.shufytheme.notification.danger_content}
				 {elseif $alert->getSeverity() == 'warning'}
					<b>{$LANG.shufytheme.notification.warning}:</b> {$LANG.shufytheme.notification.warning_content}
				 {elseif $alert->getSeverity() == 'info'}
					<b>{$LANG.shufytheme.notification.informations}:</b> {$LANG.shufytheme.notification.informations_content}
				 {else}
					<b>{$LANG.shufytheme.notification.success}:</b> {$LANG.shufytheme.notification.success_content}
				 {/if}
			 </div>
			 </div>
			 <div class="header__content">{$alert->getMessage()}</div>
			 {if $alert->getLinkText()}
			 <div class="header__content__footer d-flex align-items-center justify-content-end">
				<a href="{$alert->getLink()}" class="header__message__body__demise">			
				{lang key='readmore'}
				</a>
			 </div>
			 {/if}
		 </div>
	  </div>  
	  {foreachelse}
	  <div class="py-6">
			<div class="py-7 no__data__error__box with__icon d-flex flex-column justify-content-center align-items-center">
				<div class="message__image mb-7">
					{include file="$template/assets/svg/core/no-data.tpl"}         
				</div>
				<h6 class="coodiv-text-9 font-weight-bold mb-0"> {lang key='knowledgebaseno'} {lang key='notifications'}</h6>
				<p class="coodiv-text-11 font-weight-300">{lang key='notificationsnone'}</p>
			</div>
	  </div>
	  {/foreach}
	  </div>
	</div>
</div>
{/if}