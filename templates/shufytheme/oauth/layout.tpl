<!doctype html>
<html {if $coodivcolorsettings.darkmodefault|default:''=='activated'}data-theme="dark"{/if} lang="{$activeLocale.languageCode}">
	<head>
		<meta charset="{$charset}" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>{$requestedAction} - {$companyname}</title>
		{include file="$template/includes/head.tpl"}
		{$headoutput}
		{if $coodivcolorsettings.allowdarkmode|default:''=='activated' || $coodivcolorsettings.id|default:'' != '1'}
			<script>
			const theme = localStorage.getItem('theme');
			if (theme === "light") {
				document.documentElement.setAttribute('data-theme', 'light');
			} else {
				document.documentElement.setAttribute('data-theme', 'dark');
			}
			</script>
		{/if}
		
		
		
		
	</head>
		<body class="authorization__page this__is__login__page default__login__page {if $coodivcolorsettings.darkmodefault|default:''=='activated' && $coodivcolorsettings.allowdarkmode|default:''!='activated'}body__dark{/if} {if ($language == 'arabic' || $language == 'hebrew' || $language == 'farsi')}rtl{else}ltr{/if} {$coodivcolorsettings.dafaultthemecolor|default:''} {if $coodivsettings.userdropdown|default:''=='activated' || $coodivsettings.id|default:'' != '1'}header__item__user__body__fixed__layout{/if} {if $coodivsettings.cartdropdown|default:''=='activated' || $coodivsettings.id|default:'' != '1'}cart__header__body__fixed__layout{/if} {if $coodivsettings.notificationdropdown|default:''=='activated' || $coodivsettings.id|default:'' != '1'}notification__body__fixed__layout{/if}  {if $shuffythemeversion}header__sideroutput{else}header__sidernotoutput{/if}  {if $coodivsidebaroptions.themesidebarsettingsfixedtopheader|default:''=='activated' || $coodivsidebaroptions.id|default:'' != '1'}fixed__top__header{else}absolute__top__header{/if} {if $coodivsidebaroptions.themesidebarsettingsfixedhorizontalmenu|default:''=='activated' || $coodivsidebaroptions.id|default:'' != '1'} fixed__top__horizontal__sidebar{else}absolute__top__horizontal__sidebar{/if} {if $coodivsidebaroptions.themesidebarsettingsfixedsecondarymenu|default:''=='activated' || $coodivsidebaroptions.id|default:'' != '1'}fixed__scondary__menu{/if} {if $coodivsidebaroptions.themesidebarsettingssidebaronhover|default:''=='activated' || $coodivsidebaroptions.id|default:'' != '1'}sidebar__on__hover{else}full__sidebar__width{/if} {if $coodivsidebaroptions.themesidebarsettingschildonhover|default:''=='activated' || $coodivsidebaroptions.id|default:'' != '1'}sidebar__child__menu__on__hover{/if} {if $coodivsidebaroptions.themesidebarsettingsdarkicons|default:''=='activated' || $coodivsidebaroptions.id|default:'' != '1'}sidebar__dark__icon {/if} {if $coodivsidebaroptions.themesidebarsettingswithouticons|default:''=='activated'}sidebar__without__icon {/if} {if $coodivsidebaroptions.themesidebarsettingfullwidthtopheader|default:''=='activated'}header__full__width{else}header__not__full__width{/if} {if $coodivsidebaroptions.themesidebarsettingfullwithhorizontalmenu|default:''=='activated'}horizontal__sidebar__full__width{else}horizontal__sidebar__not__full__width{/if} product__as__slider alow__product__slider__switch white__header__without__hero sticky__scondary__menu full__width__header__sidebar regular__header {if $coodivlayoutssettings.layoutsettingssidebarlayout|default:''=='sidebarlayoutstyleone'}minimalist__sidebar{else if $coodivlayoutssettings.layoutsettingssidebarlayout|default:''=='sidebarlayoutstyletwo'}big__icons__sidebar{else if $coodivlayoutssettings.layoutsettingssidebarlayout|default:''=='sidebarlayoutstylethree'}separated__sidebar minimalist__sidebar{else if $coodivlayoutssettings.layoutsettingssidebarlayout|default:''=='sidebarlayoutstylefour'}separated__sidebar big__icons__sidebar {else}minimalist__sidebar{/if} {if $coodivlayoutssettings.layoutsettingssidebarposition|default:''=='sidebarpositionleft'}left__layout__sidebar{else if $coodivlayoutssettings.layoutsettingssidebarposition|default:''=='sidebarpositionright'}right__layout__sidebar{else if $coodivlayoutssettings.layoutsettingssidebarposition|default:''=='sidebarpositiontop'}horizontal__sidebar{else if $coodivlayoutssettings.layoutsettingssidebarposition|default:''=='sidebarpositiontopstart'}horizontal__sidebar horizontal__top__sidebar{/if} {if $coodivlayoutssettings.layoutsettingssidebarstyle|default:''=='sidebarsidebarlogo'}header__sidebar__logo{else if $coodivlayoutssettings.layoutsettingssidebarstyle|default:''=='sidebarheaderlogo'}header__top__logo{else}header__sidebar__logo{/if} {if $coodivsidebaroptions.themesidebarsettingsdarkmode|default:''=='activated' || $coodivsidebaroptions.id|default:'' != '1'}dark__sidebar__color{else}default-color{/if} {if $coodivsettings.customersnotifications|default:''=='activated'}alerts__close__hide{/if} {if $coodivsidebaroptions.themesidebarsettingsallowusertoexpend|default:''=='activated' || $coodivsidebaroptions.id|default:'' != '1'}sidebar__allow__expend{else}sidebar__not__allow__expend{/if} {if $coodivsidebaroptions.themesidebarsettingsallowusertocollapse|default:''=='activated' || $coodivsidebaroptions.id|default:'' != '1'}sidebar__allow__collapse{else}sidebar__not__allow__collapse{/if} {if $loginpage || $templatefile == "clientregister" || $templatefile == "password-reset-container"}authorization__page{/if} {if $templatefile == 'homepage'}homepage__main__stylesheets__body{/if} {if $loginpage eq 0 and $templatefile ne "clientregister"}not__login__page{else}this__is__login__page default__login__page{/if}" data-phone-cc-input="{$phoneNumberInputStyle}">


		<div id="fullpage-overlay" class="w-hidden">
			<div class="fullpage__loadingscreen__overlay">
				<div class="data__loading__animation__wrapper default__loading__effect">
					 {include file="$template/includes/theme-core/loader.tpl"}  
					 <span class="section__loader__title">{lang key='loading'}</span>		 
				</div>
			</div>
		</div>
		
	<div class="main__login__content__wrapper">
	<div class="main__login__content">
	
	<div class="autho__logo__wrapper website__identity__sidebar d-flex align-items-center justify-content-center mb-8">		
		<a class="website__identity__sidebar__link text-center d-flex align-items-center justify-content-center gap-10" href="{$WEB_ROOT}/index.php">
			{if $coodivsettings.siteaslogo|default:''=='activated'}
				<div class="website__identity__sidebar__text__logo__wrapper">
					<span class="website__identity__sidebar__text__logo__first__later">
						<span id="websiteidenditytextlogofirst">
							{if $coodivsettings.customtextlogo|default:'' == null}
								{$companyname}
							{else}
								{$coodivsettings.customtextlogo|default:''}
							{/if}
						</span>
					</span>
					<span id="websiteidenditytextlogofull" class="website__identity__sidebar__text__logo__full">
						{if $coodivsettings.customtextlogo|default:'' == null}
							{$companyname}
						{else}
							{$coodivsettings.customtextlogo|default:''}
						{/if}
					</span>
				</div>
			{else}
				{if $coodivsettings.defaultlogolinkfull|default:''}
					<img class="image__logo__tagline white__logo" src="{$coodivsettings.defaultlogolinkfull|default:''}" alt="{$companyname} logo" />
					<img class="image__logo__tagline dark__logo" src="{$coodivsettings.darklogolinkfull|default:''}" alt="{$companyname} logo" />
				{else}
					{if $coodivsettings.defaultlogolinkicon|default:'' == null && $coodivsettings.defaultlogolinktagline|default:'' == null}
						<svg class="main__shufy__theme__logo svg__logo white__logo" x="0px" y="0px" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="-0.06 0 364.66 171.03">
							<g class="logo__path">
							<path class="shufy__theme__logo__icon__two" d="M110.9,97.4c0,14.8-0.1,29.6,0,44.4c0,2.7-0.7,4.1-3.3,5.2c-5,2-9.7,4.5-14.3,7.3c-3.4,2.1-2.5-0.5-2.6-2  c-0.1-9.5-0.2-19-0.3-28.4c-0.1-12.1-0.4-24.1-0.3-36.2c0-7.1-4.5-10.3-9.5-13.2C60.4,63,40.2,51.5,19.9,40c-1.4-0.7-2.1-2.2-2-3.7  c0.1-7.7-0.3-15.4,0.1-23.1C18.7,2.8,28.8-3.7,39.3,2.3c21.2,12.1,42.4,24.4,63.6,36.5c5.6,3.2,8,7.8,8,14.2  C110.9,67.8,110.9,82.6,110.9,97.4L110.9,97.4z"/>
							<path class="shufy__theme__logo__icon__one" d="M78.8,104c0,2,0,4,0,6s0.2,3.3-2.5,1.7c-8.7-5.3-17.6-10.2-26.4-15.4S32.3,85.9,23.5,80.7  c-2.2-1.3-3.3-0.8-3.6,1.9c-0.8,7.5-0.1,8.4,8.2,12.9c14.7,8,29.3,16.3,44.1,24.2c5.3,2.8,6.6,7.5,6.6,12.8c0.1,8,0,16.1-0.1,24.2  c-0.1,7.6-2.9,11.7-9.9,14c-3.6,1.2-6.9-1.1-9.7-2.9C41.5,157.1,24,146.2,6.5,135.3c-4.2-2.6-6.7-6.4-6.4-11.9  c0.2-3.4,0.1-6.9,0-10.3c-0.1-2.5,0.2-3.6,2.9-2c9.1,5.6,18.3,11,27.4,16.5c8.6,5.2,17.1,10.3,25.6,15.6c2,1.2,2.6,1,2.5-1.3v-0.4  c0.3-8.5,0.3-8.6-7.3-12.9c-14.7-8.3-29.2-17.1-44.1-24.8c-5.8-3-7.5-6.5-7.1-12.9C0.6,82.3,0.3,73.6,0,65  c-0.2-6.7,3.8-11.6,10.7-13.1c2.7-0.6,5,0.8,7.3,2.1c17.7,10.2,35.3,20.4,53,30.5c5.3,3,7.6,7.8,7.8,13.8  C78.9,100.2,78.8,102.1,78.8,104L78.8,104z"/>
							</g>
							<path class="text__logo shufy__theme__logo__text" d="M138.7,83.8c1.8,2.1,3.8,3.9,6.2,5.3c1.8,1.1,3.9,1.7,6.1,1.8c1.7,0.1,3.3-0.5,4.6-1.5c1.2-0.9,1.8-2.3,1.8-3.8  c0.1-1.5-0.5-2.9-1.6-4c-1-0.9-3.4-1.9-7.1-2.9c-5-1.3-8.6-3.1-10.7-5.3c-2.1-2.2-3.1-5.2-3.1-9c-0.1-4.5,1.7-8.9,4.9-12  c3.3-3.1,7.6-4.7,12.8-4.7c2.7,0,5.4,0.4,8.1,1.1c2.6,0.8,5,1.9,7.2,3.5l-4.4,10.1c-1.5-1.3-3.1-2.3-4.9-3.1c-1.6-0.7-3.3-1-5-1  c-1.5-0.1-2.9,0.4-4.1,1.2c-1,0.7-1.6,1.9-1.6,3.1c0,1.2,0.5,2.3,1.4,3.1c1.6,1.1,3.4,1.8,5.4,2.2l0.6,0.2c5.7,1.5,9.5,3.2,11.3,5.1  c1.2,1.3,2.2,2.9,2.8,4.5c0.7,1.9,1,3.9,1,5.9c0,5.5-1.8,9.8-5.4,13.2c-3.6,3.3-8.4,5-14.3,5c-3.4,0-6.7-0.6-9.8-1.8  c-3.2-1.4-6-3.3-8.5-5.7L138.7,83.8z M176.4,100.5V49h14v20h18.7V49h14.1v51.5h-14v-21h-18.7v21H176.4z M232,49h14v25  c0,2.6,0.1,5.3,0.3,7.9c0.1,1.4,0.5,2.7,1,4c0.5,1.3,1.5,2.4,2.8,3c1.5,0.7,3.2,1.1,4.9,1c1.7,0.1,3.4-0.3,4.9-1  c1.3-0.6,2.3-1.7,2.8-3c0.5-1.3,0.8-2.6,1-4c0.2-2.6,0.3-5.3,0.3-7.9V49h14v27.2c0,5.7-0.3,9.8-1,12.5c-0.6,2.5-1.8,4.9-3.5,6.9  c-1.9,2.2-4.4,3.8-7.2,4.7c-7.3,2.1-15.1,2.1-22.4,0c-2.8-0.9-5.3-2.5-7.3-4.7c-1.6-2-2.8-4.4-3.4-6.9c-0.7-2.7-1-6.8-1-12.5V49H232  z M286.7,100.5V49h31.5v11.2h-17.9v9h16.8v11h-16.8v20.2H286.7z M333.2,100.5V77l-18-28h16.1l6.9,13.3c0.1,0.1,0.1,0.3,0.2,0.4  c0.7,1.3,1.2,2.6,1.5,4c0.3-1.3,0.8-2.6,1.5-3.8c0.2-0.3,0.2-0.4,0.3-0.5l6.8-13.2h16.1l-18,28v23.5L333.2,100.5z M144.2,115.3  h-11.3v-2.4h25.2v2.4h-11.3v31.2h-2.6L144.2,115.3z M164.3,111.1v15.4c1.5-3,4.6-4.8,7.9-4.6c3.4,0,8.1,1.7,8.1,9.3v15.3h-2.4v-14.8  c0-4.8-2.2-7.4-6.1-7.4c-4.8,0-7.5,2.9-7.5,8.8v13.4h-2.4v-35.4H164.3z M188.8,134.8c0,6.2,3.2,10,7.8,10s6-2.5,6.9-4.5h2.5  c-1,3.2-3.6,6.8-9.5,6.8c-7.3,0-10.1-6.3-10.1-12.4c0-6.9,3.4-12.8,10.4-12.8c7.4,0,9.7,6.4,9.7,10.9c0,0.7,0,1.3,0,2H188.8z   M204,132.7c0-4.8-2.6-8.5-7.4-8.5c-4.9,0-7.2,3.5-7.7,8.5H204z M212.3,128.7c0-2.1,0-4.3,0-6.2h2.4c0,0.8,0.1,2.9,0.1,4.3  c1.1-3,4-4.9,7.2-4.9c3.4,0,6,1.7,7,4.8c1.4-3,4.5-4.9,7.8-4.8c3.7,0,7.5,2.1,7.5,8.8v15.8h-2.5V131c0-3.2-1.1-6.7-5.6-6.7  c-4.6,0-6.8,3.8-6.8,8.4v13.8h-2.4v-15.5c0-3.5-1.1-6.8-5.5-6.8c-4.7,0-6.9,4.1-6.9,9v13.2h-2.4L212.3,128.7z M252.6,134.8  c0,6.2,3.2,10,7.8,10c4.6,0,6-2.5,6.9-4.5h2.4c-1,3.2-3.5,6.8-9.5,6.8c-7.3,0-10.1-6.3-10.1-12.4c0-6.9,3.4-12.8,10.4-12.8  c7.4,0,9.8,6.4,9.8,10.9c0,0.7,0,1.3,0,2H252.6z M267.8,132.7c0-4.8-2.6-8.5-7.3-8.5c-4.9,0-7.2,3.5-7.7,8.5H267.8z"/>
						</svg>
					{else}
						{if $coodivsettings.defaultlogolinkicon|default:'' == null}
							<div class="website__identity__sidebar__text__logo__wrapper">
								<span class="website__identity__sidebar__text__logo__first__later">
									<span id="websiteidenditytextlogofirst">
									{if $coodivsettings.customtextlogo|default:'' == null}
										{$companyname}
									{else}
										{$coodivsettings.customtextlogo|default:''}
									{/if}
									</span>
								</span>
							</div>
						{else}
							<img class="image__logo icon white__logo" src="{$coodivsettings.defaultlogolinkicon|default:''}" alt="{$companyname} logo" />
						{/if}
						{if $coodivsettings.defaultlogolinktagline|default:'' == null}
							<span class="text__logo__tagline {if $coodivsettings.defaultlogolinkicon|default:'' != null}d-none{/if}">
								{if $coodivsettings.customtextlogo|default:'' == null}
									{$companyname}
								{else}
									{$coodivsettings.customtextlogo|default:''}
								{/if}
							</span>
							{else}
							<img class="image__logo__tagline white__logo" src="{$coodivsettings.defaultlogolinktagline|default:''}" alt="{$companyname} logo" />
						{/if}
					{/if}
					
					{if $coodivsettings.darklogolinkicon|default:'' == null && $coodivsettings.darklogolinktagline|default:'' == null}
						<svg class="main__shufy__theme__logo svg__logo dark__logo" x="0px" y="0px" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="-0.06 0 364.66 171.03">
							<g class="logo__path">
							<path class="shufy__theme__logo__icon__two" d="M110.9,97.4c0,14.8-0.1,29.6,0,44.4c0,2.7-0.7,4.1-3.3,5.2c-5,2-9.7,4.5-14.3,7.3c-3.4,2.1-2.5-0.5-2.6-2  c-0.1-9.5-0.2-19-0.3-28.4c-0.1-12.1-0.4-24.1-0.3-36.2c0-7.1-4.5-10.3-9.5-13.2C60.4,63,40.2,51.5,19.9,40c-1.4-0.7-2.1-2.2-2-3.7  c0.1-7.7-0.3-15.4,0.1-23.1C18.7,2.8,28.8-3.7,39.3,2.3c21.2,12.1,42.4,24.4,63.6,36.5c5.6,3.2,8,7.8,8,14.2  C110.9,67.8,110.9,82.6,110.9,97.4L110.9,97.4z"/>
							<path class="shufy__theme__logo__icon__one" d="M78.8,104c0,2,0,4,0,6s0.2,3.3-2.5,1.7c-8.7-5.3-17.6-10.2-26.4-15.4S32.3,85.9,23.5,80.7  c-2.2-1.3-3.3-0.8-3.6,1.9c-0.8,7.5-0.1,8.4,8.2,12.9c14.7,8,29.3,16.3,44.1,24.2c5.3,2.8,6.6,7.5,6.6,12.8c0.1,8,0,16.1-0.1,24.2  c-0.1,7.6-2.9,11.7-9.9,14c-3.6,1.2-6.9-1.1-9.7-2.9C41.5,157.1,24,146.2,6.5,135.3c-4.2-2.6-6.7-6.4-6.4-11.9  c0.2-3.4,0.1-6.9,0-10.3c-0.1-2.5,0.2-3.6,2.9-2c9.1,5.6,18.3,11,27.4,16.5c8.6,5.2,17.1,10.3,25.6,15.6c2,1.2,2.6,1,2.5-1.3v-0.4  c0.3-8.5,0.3-8.6-7.3-12.9c-14.7-8.3-29.2-17.1-44.1-24.8c-5.8-3-7.5-6.5-7.1-12.9C0.6,82.3,0.3,73.6,0,65  c-0.2-6.7,3.8-11.6,10.7-13.1c2.7-0.6,5,0.8,7.3,2.1c17.7,10.2,35.3,20.4,53,30.5c5.3,3,7.6,7.8,7.8,13.8  C78.9,100.2,78.8,102.1,78.8,104L78.8,104z"/>
							</g>
							<path class="text__logo shufy__theme__logo__text" d="M138.7,83.8c1.8,2.1,3.8,3.9,6.2,5.3c1.8,1.1,3.9,1.7,6.1,1.8c1.7,0.1,3.3-0.5,4.6-1.5c1.2-0.9,1.8-2.3,1.8-3.8  c0.1-1.5-0.5-2.9-1.6-4c-1-0.9-3.4-1.9-7.1-2.9c-5-1.3-8.6-3.1-10.7-5.3c-2.1-2.2-3.1-5.2-3.1-9c-0.1-4.5,1.7-8.9,4.9-12  c3.3-3.1,7.6-4.7,12.8-4.7c2.7,0,5.4,0.4,8.1,1.1c2.6,0.8,5,1.9,7.2,3.5l-4.4,10.1c-1.5-1.3-3.1-2.3-4.9-3.1c-1.6-0.7-3.3-1-5-1  c-1.5-0.1-2.9,0.4-4.1,1.2c-1,0.7-1.6,1.9-1.6,3.1c0,1.2,0.5,2.3,1.4,3.1c1.6,1.1,3.4,1.8,5.4,2.2l0.6,0.2c5.7,1.5,9.5,3.2,11.3,5.1  c1.2,1.3,2.2,2.9,2.8,4.5c0.7,1.9,1,3.9,1,5.9c0,5.5-1.8,9.8-5.4,13.2c-3.6,3.3-8.4,5-14.3,5c-3.4,0-6.7-0.6-9.8-1.8  c-3.2-1.4-6-3.3-8.5-5.7L138.7,83.8z M176.4,100.5V49h14v20h18.7V49h14.1v51.5h-14v-21h-18.7v21H176.4z M232,49h14v25  c0,2.6,0.1,5.3,0.3,7.9c0.1,1.4,0.5,2.7,1,4c0.5,1.3,1.5,2.4,2.8,3c1.5,0.7,3.2,1.1,4.9,1c1.7,0.1,3.4-0.3,4.9-1  c1.3-0.6,2.3-1.7,2.8-3c0.5-1.3,0.8-2.6,1-4c0.2-2.6,0.3-5.3,0.3-7.9V49h14v27.2c0,5.7-0.3,9.8-1,12.5c-0.6,2.5-1.8,4.9-3.5,6.9  c-1.9,2.2-4.4,3.8-7.2,4.7c-7.3,2.1-15.1,2.1-22.4,0c-2.8-0.9-5.3-2.5-7.3-4.7c-1.6-2-2.8-4.4-3.4-6.9c-0.7-2.7-1-6.8-1-12.5V49H232  z M286.7,100.5V49h31.5v11.2h-17.9v9h16.8v11h-16.8v20.2H286.7z M333.2,100.5V77l-18-28h16.1l6.9,13.3c0.1,0.1,0.1,0.3,0.2,0.4  c0.7,1.3,1.2,2.6,1.5,4c0.3-1.3,0.8-2.6,1.5-3.8c0.2-0.3,0.2-0.4,0.3-0.5l6.8-13.2h16.1l-18,28v23.5L333.2,100.5z M144.2,115.3  h-11.3v-2.4h25.2v2.4h-11.3v31.2h-2.6L144.2,115.3z M164.3,111.1v15.4c1.5-3,4.6-4.8,7.9-4.6c3.4,0,8.1,1.7,8.1,9.3v15.3h-2.4v-14.8  c0-4.8-2.2-7.4-6.1-7.4c-4.8,0-7.5,2.9-7.5,8.8v13.4h-2.4v-35.4H164.3z M188.8,134.8c0,6.2,3.2,10,7.8,10s6-2.5,6.9-4.5h2.5  c-1,3.2-3.6,6.8-9.5,6.8c-7.3,0-10.1-6.3-10.1-12.4c0-6.9,3.4-12.8,10.4-12.8c7.4,0,9.7,6.4,9.7,10.9c0,0.7,0,1.3,0,2H188.8z   M204,132.7c0-4.8-2.6-8.5-7.4-8.5c-4.9,0-7.2,3.5-7.7,8.5H204z M212.3,128.7c0-2.1,0-4.3,0-6.2h2.4c0,0.8,0.1,2.9,0.1,4.3  c1.1-3,4-4.9,7.2-4.9c3.4,0,6,1.7,7,4.8c1.4-3,4.5-4.9,7.8-4.8c3.7,0,7.5,2.1,7.5,8.8v15.8h-2.5V131c0-3.2-1.1-6.7-5.6-6.7  c-4.6,0-6.8,3.8-6.8,8.4v13.8h-2.4v-15.5c0-3.5-1.1-6.8-5.5-6.8c-4.7,0-6.9,4.1-6.9,9v13.2h-2.4L212.3,128.7z M252.6,134.8  c0,6.2,3.2,10,7.8,10c4.6,0,6-2.5,6.9-4.5h2.4c-1,3.2-3.5,6.8-9.5,6.8c-7.3,0-10.1-6.3-10.1-12.4c0-6.9,3.4-12.8,10.4-12.8  c7.4,0,9.8,6.4,9.8,10.9c0,0.7,0,1.3,0,2H252.6z M267.8,132.7c0-4.8-2.6-8.5-7.3-8.5c-4.9,0-7.2,3.5-7.7,8.5H267.8z"/>
						</svg>
					{else}
						{if $coodivsettings.darklogolinkicon|default:'' == null}
							<div class="website__identity__sidebar__text__logo__wrapper">
								<span class="website__identity__sidebar__text__logo__first__later">
									<span id="websiteidenditytextlogofirst dark__logo">
									{if $coodivsettings.customtextlogo|default:'' == null}
										{$companyname}
									{else}
										{$coodivsettings.customtextlogo|default:''}
									{/if}
									</span>
								</span>
							</div>
						{else}
							<img class="image__logo icon dark__logo" src="{$coodivsettings.darklogolinkicon|default:''}" alt="{$companyname} logo" />
						{/if}
						{if $coodivsettings.darklogolinktagline|default:'' == null}
							<span class="text__logo__tagline dark__logo">
							{if $coodivsettings.customtextlogo|default:'' == null}
								{$companyname}
							{else}
								{$coodivsettings.customtextlogo|default:''}
							{/if}
							</span>
							{else}
							<img class="image__logo__tagline dark__logo" src="{$coodivsettings.darklogolinktagline|default:''}" alt="{$companyname} logo" />
						{/if}
					{/if}
				
				{/if}
			{/if}
		</a>
	</div>
	
	{if $loggedin}
		<form method="post" action="{$issuerurl}oauth/authorize.php" id="frmLogout login-form">
			<input type="hidden" name="logout" value="1"/>
			<input type="hidden" name="request_hash" value="{$request_hash}"/>
			<p class="coodiv-text-11 font-weight-400 text-center mb-6">
				{lang key='oauth.currentlyLoggedInAs' firstName=$userInfo.firstName lastName=$userInfo.lastName}{if $userInfo.clientName} ({$userInfo.clientName}){/if}.
				<a href="#" onclick="jQuery('#frmLogout').submit()">{lang key='oauth.notYou'}</a>
			</p>
		</form>
	{/if}
				
	
	<div class="login-form">
		<div class="default__shadow__panel">
			<div class="default__shadow__panel__body auth__page__inner__wrapper">
				{$content}
			<p class="coodiv-text-12 m-0 text-center font-weight-400 mt-10">{lang key='oauth.copyrightFooter' dateYear=$date_year companyName=$companyname}</p>
			</div>
		</div>
	</div>
	
	<form method="post" action="{$issuerurl}oauth/authorize.php" id="frmCancelLogin">
		<input type="hidden" name="return_to_app" value="1"/>
		<input type="hidden" name="request_hash" value="{$request_hash}"/>
		<button type="submit" class="btn btn-sm btn-default d-block w-100">
			{lang key='oauth.returnToApp' appName=$appName}
		</button>
	</form>
	
	
	
	
	
	
	
	</div>
	</div>

	 

		


		<script src="{$WEB_ROOT}/templates/{$template}/assets/js/scripts.min.js?v=1.2.4"></script>
		{if $coodivcolorsettings.allowdarkmode|default:''=='activated' || $coodivcolorsettings.id|default:'' != '1'}
		<script>
			const userPrefers = getComputedStyle(document.documentElement).getPropertyValue('content'); 
			if (theme === "dark") {
				document.body.classList.add('body__dark');
				document.getElementById("theme-toggle").innerHTML = "Light Mode";
			} else {
				document.body.classList.add('light-mode');
				document.documentElement.setAttribute('data-theme', 'light');
				document.getElementById("theme-toggle").innerHTML = "Dark Mode";
			}
			function modeSwitcher() {
				document.body.classList.add('body-transition-effect');
				if (document.body.classList.contains('body__dark')) {
					document.body.classList.remove('body__dark');
					document.body.classList.add('light-mode');
					document.documentElement.setAttribute('data-theme', 'light');
					window.localStorage.setItem('theme', 'light');
					document.getElementById("theme-toggle").innerHTML = "Dark Mode";
				} else {
					document.body.classList.remove('light-mode');
					document.body.classList.add('body__dark');
					window.localStorage.setItem('theme', 'dark');
					document.getElementById("theme-toggle").innerHTML = "Light Mode";
				}
				setTimeout(function () {  	
					document.body.classList.remove('body-transition-effect');
				}, 100);
				
			}
		</script>
	{/if}
  </body>
</html>
