{include file="$template/includes/theme-core/init-standalone.tpl"}
<!doctype html>
<html {if $coodivcolorsettings.darkmodefault|default:''=='activated'}data-theme="dark"{/if} lang="{$activeLocale.languageCode}">
<head>
<meta charset="{$charset}" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title>
{include file="$template/includes/head.tpl"}
{$headoutput}
{if $coodivcolorsettings.allowdarkmode|default:''=='activated' || $coodivcolorsettings.id|default:'' != '1'}
	<script>
	const theme = localStorage.getItem('theme');
	if (theme === "dark") {
	document.documentElement.setAttribute('data-theme', 'dark');
	}else{
	document.documentElement.setAttribute('data-theme', 'light');
	}
	</script>
{/if}
</head>
<body class="{if $templatefile == 'verify-email'}verify__email__page authorization__page this__is__login__page{/if}  {if $templatefile == 'user-invite-accept'}user__invite__acceptpage authorization__page this__is__login__page{/if} {if $coodivcolorsettings.darkmodefault|default:''=='activated' && $coodivcolorsettings.allowdarkmode|default:''!='activated'}body__dark{/if} {if ($language == 'arabic' || $language == 'hebrew' || $language == 'farsi')}rtl{else}ltr{/if} {$coodivcolorsettings.dafaultthemecolor|default:''} {if $coodivsettings.userdropdown|default:''=='activated' || $coodivsettings.id|default:'' != '1'}header__item__user__body__fixed__layout{/if} {if $coodivsettings.cartdropdown|default:''=='activated' || $coodivsettings.id|default:'' != '1'}cart__header__body__fixed__layout{/if} {if $coodivsettings.notificationdropdown|default:''=='activated' || $coodivsettings.id|default:'' != '1'}notification__body__fixed__layout{/if}  {if $shuffythemeversion}header__sideroutput{else}header__sidernotoutput{/if}  {if $coodivsidebaroptions.themesidebarsettingsfixedtopheader|default:''=='activated' || $coodivsidebaroptions.id|default:'' != '1'}fixed__top__header{else}absolute__top__header{/if} {if $coodivsidebaroptions.themesidebarsettingsfixedhorizontalmenu|default:''=='activated' || $coodivsidebaroptions.id|default:'' != '1'} fixed__top__horizontal__sidebar{else}absolute__top__horizontal__sidebar{/if} {if $coodivsidebaroptions.themesidebarsettingsfixedsecondarymenu|default:''=='activated' || $coodivsidebaroptions.id|default:'' != '1'}fixed__scondary__menu{/if} {if $coodivsidebaroptions.themesidebarsettingssidebaronhover|default:''=='activated' || $coodivsidebaroptions.id|default:'' != '1'}sidebar__on__hover{else}full__sidebar__width{/if} {if $coodivsidebaroptions.themesidebarsettingschildonhover|default:''=='activated' || $coodivsidebaroptions.id|default:'' != '1'}sidebar__child__menu__on__hover{/if} {if $coodivsidebaroptions.themesidebarsettingsdarkicons|default:''=='activated' || $coodivsidebaroptions.id|default:'' != '1'}sidebar__dark__icon {/if} {if $coodivsidebaroptions.themesidebarsettingswithouticons|default:''=='activated'}sidebar__without__icon {/if} {if $coodivsidebaroptions.themesidebarsettingfullwidthtopheader|default:''=='activated'}header__full__width{else}header__not__full__width{/if} {if $coodivsidebaroptions.themesidebarsettingfullwithhorizontalmenu|default:''=='activated'}horizontal__sidebar__full__width{else}horizontal__sidebar__not__full__width{/if} product__as__slider alow__product__slider__switch white__header__without__hero sticky__scondary__menu full__width__header__sidebar regular__header {if $coodivlayoutssettings.layoutsettingssidebarlayout|default:''=='sidebarlayoutstyleone'}minimalist__sidebar{else if $coodivlayoutssettings.layoutsettingssidebarlayout|default:''=='sidebarlayoutstyletwo'}big__icons__sidebar{else if $coodivlayoutssettings.layoutsettingssidebarlayout|default:''=='sidebarlayoutstylethree'}separated__sidebar minimalist__sidebar{else if $coodivlayoutssettings.layoutsettingssidebarlayout|default:''=='sidebarlayoutstylefour'}separated__sidebar big__icons__sidebar {else}minimalist__sidebar{/if} {if $coodivlayoutssettings.layoutsettingssidebarposition|default:''=='sidebarpositionleft'}left__layout__sidebar{else if $coodivlayoutssettings.layoutsettingssidebarposition|default:''=='sidebarpositionright'}right__layout__sidebar{else if $coodivlayoutssettings.layoutsettingssidebarposition|default:''=='sidebarpositiontop'}horizontal__sidebar{else if $coodivlayoutssettings.layoutsettingssidebarposition|default:''=='sidebarpositiontopstart'}horizontal__sidebar horizontal__top__sidebar{/if} {if $coodivlayoutssettings.layoutsettingssidebarstyle|default:''=='sidebarsidebarlogo'}header__sidebar__logo{else if $coodivlayoutssettings.layoutsettingssidebarstyle|default:''=='sidebarheaderlogo'}header__top__logo{else}header__sidebar__logo{/if} {if $coodivsidebaroptions.themesidebarsettingsdarkmode|default:''=='activated' || $coodivsidebaroptions.id|default:'' != '1'}dark__sidebar__color{else}default-color{/if} {if $coodivsettings.customersnotifications|default:''=='activated'}alerts__close__hide{/if} {if $coodivsidebaroptions.themesidebarsettingsallowusertoexpend|default:''=='activated' || $coodivsidebaroptions.id|default:'' != '1'}sidebar__allow__expend{else}sidebar__not__allow__expend{/if} {if $coodivsidebaroptions.themesidebarsettingsallowusertocollapse|default:''=='activated' || $coodivsidebaroptions.id|default:'' != '1'}sidebar__allow__collapse{else}sidebar__not__allow__collapse{/if} {if $coodivsidebaroptions.themesidebarsettingscollapsed|default:''=='activated' || $coodivsidebaroptions.id|default:'' != '1'}{else}minimalist__sidebar__full__width__open{/if} {if $loginpage || $templatefile == "clientregister" || $templatefile == "password-reset-container"}authorization__page{/if} {if $templatefile == 'homepage'}homepage__main__stylesheets__body{/if} {if $loginpage eq 0 and $templatefile ne "clientregister"}not__login__page{else}this__is__login__page default__login__page{/if}" data-phone-cc-input="{$phoneNumberInputStyle}">
{if $captcha}{$captcha->getMarkup()}{/if}
{$headeroutput}
{if $coodivsettings.customthemeloader|default:''!='loaderdisbaled' }
<div id="fullpage-overlay" class="w-hidden">
	<div class="fullpage__loadingscreen__overlay">
		<div class="data__loading__animation__wrapper default__loading__effect">
			 {include file="$template/includes/theme-core/loader.tpl"}  
			 <span class="section__loader__title">{lang key='loading'}</span>		 
		</div>
	</div>
</div>
{/if}
<!-- main-page-page-wrapper -->
<div id="mainpagewrapper" class="h-100 page-wrapper position-relative"><!-- start page wrapper -->
{if file_exists("$shuffythemedirection") && $shuffythemeversion}
	{include file="$shuffythemedirection"}
{/if}
