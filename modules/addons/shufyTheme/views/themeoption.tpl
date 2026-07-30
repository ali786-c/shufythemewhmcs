{if $smarty.get.genaralsettingsreset|default:'' == 1}
<div class="settings__popupalert__coodiv alert alert-success alert-dismissible show" role="alert">
  <span class="alert__progress"></span>
  <span class="icon"><i class="fal fa-check-circle"></i></span>
  <div class="text">
  <strong>Success!</strong> Shufytheme Genaral settings options has been reset successfully.
  </div>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	<span aria-hidden="true">&times;</span>
  </button>
</div>
{/if}

{if $smarty.get.success|default:'' == 1}
<div class="settings__popupalert__coodiv alert alert-success alert-dismissible show" role="alert">
  <span class="alert__progress"></span>
  <span class="icon"><i class="fal fa-check-circle"></i></span>
  <div class="text">
  <strong>Success!</strong> Shufytheme Genaral settings options has been saved successfully.
  </div>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	<span aria-hidden="true">&times;</span>
  </button>
</div>
{/if}

<div class="page__wrapper__content">
	<div class="coodiv__main__hero with__menu">
		<div class="coodiv__main__hero__breadcrumbs">{$breadcrumbs}</div>
		<div class="row justify-content-between">
			<div class="col-md-5 col-12">
				<h5 class="coodiv__main__hero__title">Shufy theme Genaral settings</h5>
				<p class="coodiv__main__hero__sub__title">You do not need to create complicated WHMCS hooks to create or edit menus anymore, Coodiv Primary Menu manager gives you convenient options to set up your theme main navigation.</p>
			</div>
			<div class="col-md-7 col-12 btn__container">
				<a href="#exportpageoptions" data-toggle="modal" class="add__new__group__btn"><i class="fas fa-inbox-out"></i>Export Options</a>
				<a href="#importpageoptions" data-toggle="modal" class="add__new__group__btn"><i class="fas fa-inbox-in"></i>Import Options</a>
				<a href="#resetpageoptions" data-toggle="modal" class="add__new__group__btn cancel"><i class="fas fa-redo-alt"></i>Reset Options</a>
			</div>
		</div>
		
		<ul class="navbar-nav coodiv__main__hero__nav">
		  <li class="nav-item active"><a class="nav-link">Genaral</a></li>
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=styleoptions">Colors</a></li>
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=typpoptions">Typography</a></li>
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=layoutoptions">Layouts</a></li>
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=sidebaroptions">Sidebar</a></li>
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=footeroptions">Footer</a></li>
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=homepageoptions">Homepage</a></li>
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=listgroup">Menu manager</a></li> 
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=settingsbackups">Backups</a></li>
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=themehealthcheck">Health</a></li>
		  
		  <li class="nav-item ml-auto"><a href="{$modurl}&action=extentions" class="nav-link">Extention manager</a></li> 
		</ul>
	</div>

	<form id="applythemeoption" class="full__fieldset__area default__form__panel__cart coodiv__whmcs__admin__panel__form shufytheme__ajax__save" action="{$modurl}&action=applythemeoption" method="post">
		<input type="hidden" name="itemid" value="1">
		<div class="section">
			<h5 class="title">Logo & Site Identity</h5>
			<div class="row">
				<div class="col-md-6 col-12">
					<div class="form-group templates__form__control">
						<label for="textlogo">Use Site Name as Logo (text) <i data-toggle="tooltip" data-placement="bottom" title="tick/enable this field to display your site name as a logo." class="fas fa-info-circle"></i></label>
						<fieldset name="textlogo" id="textlogo">
							<div class="radio">
								<label class="template__label">
									<input type="checkbox" name="textlogo" id="textlogo" value="activated" {if $themesetting.siteaslogo|default:''=='activated'}checked{/if}>
									i want to use my site Name as Logo
									<span class="checkmark"><i class="fal fa-check"></i></span>
								</label>
							</div>
						</fieldset>
					</div>
					<div class="form-group">
						<label for="customtextlogo">Custom text logo<i data-toggle="tooltip" data-placement="bottom" title="Add your custom logo text to display in place of the logo." class="fas fa-info-circle"></i></label>
						<input type="text" name="customtextlogo" id="customtextlogo" {if $themesetting.customtextlogo|default:'' == null}value="" placeholder="Leave this field empty if you'd like to use the default WHMCS settings"{else}value="{$themesetting.customtextlogo|default:''}"{/if} class="form-control" >
					</div>
					<div class="form-group">
						<label for="customlogolink">Custom Logo Target Link / URL <i data-toggle="tooltip" data-placement="bottom" title="Set a custom target URL when users click on your website logo (e.g. https://cloudhoste.eu). Leave empty for default WHMCS homepage." class="fas fa-info-circle"></i></label>
						<input type="text" name="customlogolink" id="customlogolink" {if $themesetting.customlogolink|default:'' == null}value="" placeholder="Leave empty for default WHMCS homepage (e.g. https://cloudhoste.eu or /index.php)"{else}value="{$themesetting.customlogolink|default:''}"{/if} class="form-control" >
					</div>
				</div>
				<div class="col-md-6 col-12">
					<div class="form-group">
						<label for="defaultlogolinkicon">Your default logo icon URL (1:1 aspect ratio)<i data-toggle="tooltip" data-placement="bottom" title="Add The URL to your icon logo must be a 1:1 aspect ratio for the sidebar views." class="fas fa-info-circle"></i></label>
						<input type="url" name="defaultlogolinkicon" id="defaultlogolinkicon" {if $themesetting.defaultlogolinkicon|default:'' == null}value="" placeholder="Leave this field empty if you'd like to use the default Coodiv Shufy theme settings"{else}value="{$themesetting.defaultlogolinkicon|default:''}"{/if} class="form-control" >
					</div>
					<div class="form-group">
						<label for="defaultlogolinkfull">Your Full logo link URL <i data-toggle="tooltip" data-placement="bottom" title="Add The URL to your full logo." class="fas fa-info-circle"></i></label>
						<input type="url" name="defaultlogolinkfull" id="defaultlogolinkfull" {if $themesetting.defaultlogolinkfull|default:'' == null}value="" placeholder="Leave this field empty if you'd like to use the default Coodiv Shufy theme settings"{else}value="{$themesetting.defaultlogolinkfull|default:''}"{/if} class="form-control" >
					</div>
				</div>
			</div>
		</div>

		<div class="section">
			<h5 class="title">General settings</h5>
			<div class="row">
				<div class="col-md-6 col-12">
					<div class="form-group templates__form__control">
						<label for="user-dropdown">Header dropdowns <i data-toggle="tooltip" data-placement="bottom" title="This Fields Are Bbout Display Dropdowns As a Sidebar" class="fas fa-info-circle"></i></label>
							<label class="template__label">
								<input type="checkbox" name="user-dropdown" id="user-dropdown" value="activated" {if $themesetting.userdropdown|default:''=='activated' || $themesetting.id|default:'' != '1'}checked{/if}>
									I want to display header user dropdown as a sidebar
								<span class="checkmark"><i class="fal fa-check"></i></span>
							</label>
							</div>
						</fieldset>
						<fieldset style="margin-bottom:10px" name="notification-dropdown" id="notification-dropdown">
							<div class="radio">
							<label class="template__label">
								<input type="checkbox" name="notification-dropdown" id="notification-dropdown" value="activated" {if $themesetting.notificationdropdown|default:''=='activated' || $themesetting.id|default:'' != '1'}checked{/if}>
									I want to display header notification dropdown as a sidebar
								<span class="checkmark"><i class="fal fa-check"></i></span>
							</label>
							</div>
						</fieldset>
						<fieldset class="d-none" style="margin-bottom:10px" name="cart-dropdown" id="cart-dropdown">
							<div class="radio">
							<label class="template__label">
								<input type="checkbox" name="cart-dropdown" id="cart-dropdown" value="activated" {if $themesetting.cartdropdown|default:''=='activated' || $themesetting.id|default:'' != '1'}checked{/if}>
									I want to display header cart dropdown as a sidebar
								<span class="checkmark"><i class="fal fa-check"></i></span>
							</label>
							</div>
						</fieldset>
					</div>
					
					
					<div class="form-group templates__form__control">
						<label for="client-marketconnect">Marketconnect Bannaers  <i data-toggle="tooltip" data-placement="bottom" title="This Fields Are About Display Marketconnect Bannaers" class="fas fa-info-circle"></i></label>
						<fieldset style="margin-bottom:10px" name="client-marketconnect" id="client-marketconnect">
							<div class="radio">
							<label class="template__label">
								<input type="checkbox" name="client-marketconnect" id="client-marketconnect" value="activated" {if $themesetting.clientmarketconnect|default:''=='activated' || $themesetting.id|default:'' != '1'}checked{/if}>
								Display Marketconnect Bannaers in the client area page
								<span class="checkmark"><i class="fal fa-check"></i></span>
							</label>
							</div>
						</fieldset>
						<fieldset style="margin-bottom:10px" name="services-marketconnect" id="services-marketconnect">
							<div class="radio">
							<label class="template__label">
								<input type="checkbox" name="services-marketconnect" id="services-marketconnect" value="activated" {if $themesetting.servicemarketconnect|default:''=='activated' || $themesetting.id|default:'' != '1'}checked{/if}>
								Display Marketconnect Bannaers in my services page
								<span class="checkmark"><i class="fal fa-check"></i></span>
							</label>
							</div>
						</fieldset>
						<fieldset name="domains-marketconnect" id="domains-marketconnect">
							<div class="radio">
							<label class="template__label">
								<input type="checkbox" name="domains-marketconnect" id="domains-marketconnect" value="activated" {if $themesetting.domainmarketconnect|default:''=='activated' || $themesetting.id|default:'' != '1'}checked{/if}>
								Display Marketconnect Bannaers in my domains page
								<span class="checkmark"><i class="fal fa-check"></i></span>
							</label>
							</div>
						</fieldset>
					</div>
				</div>
				<div class="col-md-6 col-12">
					<div class="form-group templates__form__control">
						<label for="cookiesbox">Cookies Consent Box  <i data-toggle="tooltip" data-placement="bottom" title="tick/enable this field to display Cookies Consent Box" class="fas fa-info-circle"></i></label>
						<fieldset name="cookiesbox" id="cookiesbox">
							<div class="radio">
							<label class="template__label">
								<input type="checkbox" name="cookiesbox" id="cookiesbox" value="activated" {if $themesetting.cookiesbox|default:''=='activated' || $themesetting.id|default:'' != '1'}checked{/if}>
								i want to show the Cookies Consent Box
								<span class="checkmark"><i class="fal fa-check"></i></span>
							</label>
							</div>
						</fieldset>
					</div>
					
					<div class="form-group">
					<label for="cookiesboxposition">Cookies Consent Box position <i data-toggle="tooltip" data-placement="bottom" title="Select the Cookies Consent Box position." class="fas fa-info-circle"></i></label>
						<select name="cookiesboxposition" id="cookiesboxposition" class="form-control input-sm">
							<option {if $themesetting.cookiesboxposition|default:''=='bottom-left-cookies'}selected{/if} value="bottom-left-cookies">bottom left</option>
							<option {if $themesetting.cookiesboxposition|default:''=='bottom-right-cookies'}selected{/if} value="bottom-right-cookies">bottom right</option>
							<option {if $themesetting.cookiesboxposition|default:''=='top-left-cookies'}selected{/if} value="top-left-cookies">top left</option>
							<option {if $themesetting.cookiesboxposition|default:''=='top-right-cookies'}selected{/if} value="top-right-cookies">top right</option>
						</select>
					</div>
					
					<div class="form-group">
						<label for="cookiesbox_header">Cookies Consent Box Header <i data-toggle="tooltip" data-placement="bottom" title="Add the cookies consent box header." class="fas fa-info-circle"></i></label>
						<input type="text" name="cookiesbox_header" id="cookiesbox_header" {if $themesetting.cookiesbox_header|default:'' == null}value="" placeholder="Leave this filed empty if you'd like to use the default Coodiv Shufy theme settings"{else}value="{$themesetting.cookiesbox_header|default:''}"{/if} class="form-control" >
					</div>
					<div class="form-group">
						<label for="cookiesboxtext">Cookies Consent Box content <i data-toggle="tooltip" data-placement="bottom" title="Add the cookies consent box content ." class="fas fa-info-circle"></i></label>
						<textarea class="form-control" id="cookiesboxtext" name="cookiesboxtext" rows="6" cols="50" placeholder="Leave this filed empty if you'd like to use the default Coodiv Shufy theme settings">{if $themesetting.cookiesboxtext|default:'' == null}{else}{$themesetting.cookiesboxtext|default:''}{/if}</textarea>
					</div>
					<div class="form-group">
						<label for="cookiesbox_link_text">Cookies Consent link text <i data-toggle="tooltip" data-placement="bottom" title="Add the cookies consent box link text." class="fas fa-info-circle"></i></label>
						<input type="text" name="cookiesbox_link_text" id="cookiesbox_link_text" {if $themesetting.cookiesbox_link_text|default:'' == null}value="" placeholder="Leave this filed empty if you'd like to use the default Coodiv Shufy theme settings"{else}value="{$themesetting.cookiesbox_link_text|default:''}"{/if} class="form-control" >
					</div>
					<div class="form-group">
						<label for="cookiesbox_link_url">Cookies Consent link URL <i data-toggle="tooltip" data-placement="bottom" title="Add the cookies consent box link URL." class="fas fa-info-circle"></i></label>
						<input type="text" name="cookiesbox_link_url" id="cookiesbox_link_url" {if $themesetting.cookiesbox_link_url|default:'' == null}value="" placeholder="Leave this filed empty if you'd like to use the default Coodiv Shufy theme settings"{else}value="{$themesetting.cookiesbox_link_url|default:''}"{/if} class="form-control" >
					</div>
					
					<div class="form-group templates__form__control">
						<label for="headerlanguage">Language dropdown placements  <i data-toggle="tooltip" data-placement="bottom" title="These Fields Are About Displaying the language dropdown" class="fas fa-info-circle"></i></label>
						<fieldset style="margin-bottom:10px" name="headerlanguage" id="headerlanguage">
							<div class="radio">
							<label class="template__label">
								<input type="checkbox" name="headerlanguage" id="headerlanguage" value="activated" {if $themesetting.headerlanguage|default:''=='activated' || $themesetting.id|default:'' != '1'}checked{/if}>
								Display the language dropdown in the header
								<span class="checkmark"><i class="fal fa-check"></i></span>
							</label>
							</div>
						</fieldset>
						<fieldset style="margin-bottom:10px" name="footerlanguagelanguage" id="footerlanguagelanguage">
							<div class="radio">
							<label class="template__label">
								<input type="checkbox" name="footerlanguagelanguage" id="footerlanguagelanguage" value="activated" {if $themesetting.footerlanguagelanguage|default:''=='activated'}checked{/if}>
								Display the language dropdown in the footer
								<span class="checkmark"><i class="fal fa-check"></i></span>
							</label>
							</div>
						</fieldset>
						<fieldset style="margin-bottom:10px" name="registerformlanguage" id="registerformlanguage">
							<div class="radio">
							<label class="template__label">
								<input type="checkbox" name="registerformlanguage" id="registerformlanguage" value="activated" {if $themesetting.registerformlanguage|default:''=='activated' || $themesetting.id|default:'' != '1'}checked{/if}>
								Display the language dropdown in the register form
								<span class="checkmark"><i class="fal fa-check"></i></span>
							</label>
							</div>
						</fieldset>
						<fieldset name="loginformlanguage" id="loginformlanguage">
							<div class="radio">
							<label class="template__label">
								<input type="checkbox" name="loginformlanguage" id="loginformlanguage" value="activated" {if $themesetting.loginformlanguage|default:''=='activated' || $themesetting.id|default:'' != '1'}checked{/if}>
								Display the language dropdown in the login form
								<span class="checkmark"><i class="fal fa-check"></i></span>
							</label>
							</div>
						</fieldset>
						
					</div>
					
					
					
					<div class="form-group templates__form__control">
						<label for="accountoverview">Clientarea homepage settings  <i data-toggle="tooltip" data-placement="bottom" title="These Fields Are About Displaying and hiding elements on clientarea homepage" class="fas fa-info-circle"></i></label>
						
						
						<fieldset style="margin-bottom:10px" name="clientareamaininformations" id="clientareamaininformations-field">
							<div class="radio">
							<label class="template__label">
								<input type="checkbox" name="clientareamaininformations" id="clientareamaininformations" value="activated" {if $themesetting.clientareamaininformations|default:''=='activated' || $themesetting.id|default:'' != '1'}checked{/if}>
								Display clientarea homepage client main informations card
								<span class="checkmark"><i class="fal fa-check"></i></span>
							</label>
							</div>
						</fieldset>
						<fieldset style="margin-bottom:10px" name="accountoverview" id="accountoverview-field">
							<div class="radio">
							<label class="template__label">
								<input type="checkbox" name="accountoverview" id="accountoverview" value="activated" {if $themesetting.accountoverview|default:''=='activated' || $themesetting.id|default:'' != '1'}checked{/if}>
								Display clientarea homepage Account Overview
								<span class="checkmark"><i class="fal fa-check"></i></span>
							</label>
							</div>
						</fieldset>
						<fieldset style="margin-bottom:10px" name="clientareaservices" id="clientareaservices-field">
							<div class="radio">
							<label class="template__label">
								<input type="checkbox" name="clientareaservices" id="clientareaservices" value="activated" {if $themesetting.clientareaservices|default:''=='activated' || $themesetting.id|default:'' != '1'}checked{/if}>
								Display clientarea homepage services card
								<span class="checkmark"><i class="fal fa-check"></i></span>
							</label>
							</div>
						</fieldset>
						<fieldset style="margin-bottom:10px" name="clientareatickets" id="clientareatickets-field">
							<div class="radio">
							<label class="template__label">
								<input type="checkbox" name="clientareatickets" id="clientareatickets" value="activated" {if $themesetting.clientareatickets|default:''=='activated' || $themesetting.id|default:'' != '1'}checked{/if}>
								Display clientarea homepage tickets card
								<span class="checkmark"><i class="fal fa-check"></i></span>
							</label>
							</div>
						</fieldset>
						<fieldset style="margin-bottom:10px" name="clientareadomains" id="clientareadomains-field">
							<div class="radio">
							<label class="template__label">
								<input type="checkbox" name="clientareadomains" id="clientareadomains" value="activated" {if $themesetting.clientareadomains|default:''=='activated' || $themesetting.id|default:'' != '1'}checked{/if}>
								Display clientarea homepage Domains card
								<span class="checkmark"><i class="fal fa-check"></i></span>
							</label>
							</div>
						</fieldset>
						<fieldset style="margin-bottom:10px" name="clientareaannouncements" id="clientareaannouncements-field">
							<div class="radio">
							<label class="template__label">
								<input type="checkbox" name="clientareaannouncements" id="clientareaannouncements" value="activated" {if $themesetting.clientareaannouncements|default:''=='activated' || $themesetting.id|default:'' != '1'}checked{/if}>
								Display clientarea homepage announcements card
								<span class="checkmark"><i class="fal fa-check"></i></span>
							</label>
							</div>
						</fieldset>
					</div>
				</div>
			</div>
			
			
			<div style="margin-top: 0" class="form-group menu__place__radio__group white__radio__group">
						<label>Login page styles  <i data-toggle="tooltip" data-placement="bottom" title="Choose login page styles." class="fas fa-info-circle"></i></label>
						<fieldset>
							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/assets/img/login-style-1.webp" alt="">
									<input type="radio" name="login-style" id="loginstyleone" value="loginstyleone" {if $themesetting.loginstyle|default:''=='loginstyleone' || $themesetting.id|default:'' != '1'}checked{/if}>
									<span class="title">Login page style 1</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/assets/img/login-style-2.webp" alt="">
									<input type="radio" name="login-style" id="loginstyletwo" value="loginstyletwo" {if $themesetting.loginstyle|default:''=='loginstyletwo'}checked{/if}>
									<span class="title">Login page style 2</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio disabled" data-toggle="tooltip" data-placement="bottom" title="New styles will added soon">
								<label>
									<img src="../modules/addons/shufyTheme/assets/img/no-item.webp" alt="">
									<input type="radio" name="login-style" id="loginstyletree" value="loginstyletree" {if $themesetting.loginstyle|default:''=='loginstyletree'}checked{/if} disabled>
									<span class="title">Login page style 3</span>
									<span class="checkmark"></span>
								</label>
							</div>
						</fieldset>
					</div>
					
					<div style="margin-top: 0" class="form-group menu__place__radio__group white__radio__group">
						<label>Register page styles  <i data-toggle="tooltip" data-placement="bottom" title="Choose register page styles." class="fas fa-info-circle"></i></label>
						<fieldset>
							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/assets/img/register-style-1.webp" alt="">
									<input type="radio" name="register-style" id="registerstyleone" value="registerstyleone" {if $themesetting.registerstyle|default:''=='registerstyleone' || $themesetting.id|default:'' != '1'}checked{/if}>
									<span class="title">Register page style 1</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/assets/img/register-style-2.webp" alt="">
									<input type="radio" name="register-style" id="registerstyletwo" value="registerstyletwo" {if $themesetting.registerstyle|default:''=='registerstyletwo'}checked{/if}>
									<span class="title">Register page style 2</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio disabled" data-toggle="tooltip" data-placement="bottom" title="New styles will added soon">
								<label>
									<img src="../modules/addons/shufyTheme/assets/img/no-item.webp" alt="">
									<input type="radio" name="register-style" id="registerstyletree" value="registerstyletree" {if $themesetting.registerstyle|default:''=='registerstyletree'}checked{/if} disabled>
									<span class="title">Register page style 3</span>
									<span class="checkmark"></span>
								</label>
							</div>
						</fieldset>
					</div>
					
					
					
					
					<div style="margin-top: 0" class="form-group menu__place__radio__group white__radio__group">
						<label>Page Loader animation  <i data-toggle="tooltip" data-placement="bottom" title="Choose register page styles." class="fas fa-info-circle"></i></label>
						<fieldset>
							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/assets/img/loader/loader-style-default.webp" alt="">
									<input type="radio" name="customthemeloader" id="default" value="default" {if $themesetting.customthemeloader|default:''=='default' || $themesetting.id|default:'' != '1'}checked{/if}>
									<span class="title">Default Loader animation</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/assets/img/loader/loader-style-1.webp" alt="">
									<input type="radio" name="customthemeloader" id="loaderstyleone" value="loaderstyleone" {if $themesetting.customthemeloader|default:''=='loaderstyleone'}checked{/if}>
									<span class="title">Style-1 Loader animation</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/assets/img/loader/loader-style-2.webp" alt="">
									<input type="radio" name="customthemeloader" id="loaderstyletwo" value="loaderstyletwo" {if $themesetting.customthemeloader|default:''=='loaderstyletwo'}checked{/if}>
									<span class="title">Style-2 Loader animation</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/assets/img/loader/loader-style-3.webp" alt="">
									<input type="radio" name="customthemeloader" id="loaderstylethree" value="loaderstylethree" {if $themesetting.customthemeloader|default:''=='loaderstylethree'}checked{/if}>
									<span class="title">Style-2 Loader animation</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/assets/img/loader/loader-style-4.webp" alt="">
									<input type="radio" name="customthemeloader" id="loaderstylefour" value="loaderstylefour" {if $themesetting.customthemeloader|default:''=='loaderstylefour'}checked{/if}>
									<span class="title">Style-2 Loader animation</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/assets/img/loader/loader-style-5.webp" alt="">
									<input type="radio" name="customthemeloader" id="loaderstylefive" value="loaderstylefive" {if $themesetting.customthemeloader|default:''=='loaderstylefive'}checked{/if}>
									<span class="title">Style-2 Loader animation</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/assets/img/loader/loader-style-6.webp" alt="">
									<input type="radio" name="customthemeloader" id="loaderstylesix" value="loaderstylesix" {if $themesetting.customthemeloader|default:''=='loaderstylesix'}checked{/if}>
									<span class="title">Style-2 Loader animation</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/assets/img/loader/loader-style-7.webp" alt="">
									<input type="radio" name="customthemeloader" id="loaderstylesaven" value="loaderstylesaven" {if $themesetting.customthemeloader|default:''=='loaderstylesaven'}checked{/if}>
									<span class="title">Style-2 Loader animation</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/assets/img/loader/loader-style-8.webp" alt="">
									<input type="radio" name="customthemeloader" id="loaderstyleeight" value="loaderstyleeight" {if $themesetting.customthemeloader|default:''=='loaderstyleeight'}checked{/if}>
									<span class="title">Style-2 Loader animation</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/assets/img/loader/loader-style-9.webp" alt="">
									<input type="radio" name="customthemeloader" id="loaderstylenighn" value="loaderstylenighn" {if $themesetting.customthemeloader|default:''=='loaderstylenighn'}checked{/if}>
									<span class="title">Style-2 Loader animation</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/assets/img/loader/loader-style-10.webp" alt="">
									<input type="radio" name="customthemeloader" id="loaderstyleteen" value="loaderstyleteen" {if $themesetting.customthemeloader|default:''=='loaderstyleteen'}checked{/if}>
									<span class="title">Style-2 Loader animation</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/assets/img/loader/loader-style-disbaled.webp" alt="">
									<input type="radio" name="customthemeloader" id="loaderdisbaled" value="loaderdisbaled" {if $themesetting.customthemeloader|default:''=='loaderdisbaled'}checked{/if}>
									<span class="title">Disable loader animation</span>
									<span class="checkmark"></span>
								</label>
							</div>
						</fieldset>
					</div>
					
					
					
					
		</div>
		
		
		<div class="section">
			<h5 class="title">SEO settings</h5>			
			<div class="row">
				<div class="col-md-6 col-12">
					<div class="form-group">
						<label for="seostitename">Website Name <i data-toggle="tooltip" data-placement="bottom" title="A name that Google may use for your homepage search results. This will default to the WHMCS site title if left blank." class="fas fa-info-circle"></i></label>
						<input type="text" name="seostitename" id="seostitename" {if $themesetting.seositename|default:'' == null}value="" placeholder="Leave this filed empty if you'd like to use the default Coodiv Shufy theme settings"{else}value="{$themesetting.seositename|default:''}"{/if} class="form-control" >
					</div>
				</div>
				<div class="col-md-6 col-12">
					<div class="form-group">
						<label for="seoaltername">Alternate Website Name <i data-toggle="tooltip" data-placement="bottom" title="An alternate name for your site. This could be an acronym or shorter version of your website name." class="fas fa-info-circle"></i></label>
						<input type="text" name="seoaltername" id="seoaltername" {if $themesetting.seoalternatewebsitename|default:'' == null}value="" placeholder="Leave this filed empty if you'd like to use the default Coodiv Shufy theme settings"{else}value="{$themesetting.seoalternatewebsitename|default:''}"{/if} class="form-control" >
					</div>
				</div>
				<div class="col-md-6 col-12">
					<div class="form-group">
						<label for="seositedesc">Website description <i data-toggle="tooltip" data-placement="bottom" title="An alternate website description for your site." class="fas fa-info-circle"></i></label>
						<input type="text" name="seositedesc" id="seositedesc" {if $themesetting.seositedescription|default:'' == null}value="" placeholder="Leave this filed empty if you'd like to use the default Coodiv Shufy theme settings"{else}value="{$themesetting.seositedescription|default:''}"{/if} class="form-control" >
					</div>
				</div>
				<div class="col-md-6 col-12">
					<div class="form-group">
						<label for="seowtype">Website Type <i data-toggle="tooltip" data-placement="bottom" title="Select which department are your website belongs to." class="fas fa-info-circle"></i></label>
						<select name="seowtype" id="seowtype" class="form-control input-sm">
							<option {if $themesetting.seowebsitetype|default:''=='Organization'}selected{/if} value="Organization">Organization</option>
							<option {if $themesetting.seowebsitetype|default:''=='Personal website'}selected{/if} value="Personal website">Personal website</option>
							<option {if $themesetting.seowebsitetype|default:''=='Hosting services website'}selected{/if} value="Hosting services website">Hosting services website</option>
							<option {if $themesetting.seowebsitetype|default:''=='eCommerce website'}selected{/if} value="eCommerce website">eCommerce website</option>
							<option {if $themesetting.seowebsitetype|default:''=='Business website'}selected{/if} value="Business website">Business website</option>
							<option {if $themesetting.seowebsitetype|default:''=='Blog website'}selected{/if} value="Blog website">Blog website</option>
							<option {if $themesetting.seowebsitetype|default:''=='Portfolio website'}selected{/if} value="Portfolio website">Portfolio website</option>
							<option {if $themesetting.seowebsitetype|default:''=='Event website'}selected{/if} value="Event website">Event website</option>
							<option {if $themesetting.seowebsitetype|default:''=='Personal website'}selected{/if} value="Personal website">Personal website</option>
							<option {if $themesetting.seowebsitetype|default:''=='Membership website'}selected{/if} value="Membership website">Membership website</option>
							<option {if $themesetting.seowebsitetype|default:''=='Nonprofit website'}selected{/if} value="Nonprofit website">Nonprofit website</option>
							<option {if $themesetting.seowebsitetype|default:''=='Informational website'}selected{/if} value="Informational website">Informational website</option>
							<option {if $themesetting.seowebsitetype|default:''=='Online forum'}selected{/if} value="Online forum">Online forum</option>
							<option {if $themesetting.seowebsitetype|default:''=='website'}selected{/if} value="website">Not from the above</option>
						</select>
					</div>
				</div>
				<div class="col-md-6 col-12">
					<div class="form-group">
						<label for="seoorgname">Organization Name <i data-toggle="tooltip" data-placement="bottom" title="Add your Organization Name to this filed." class="fas fa-info-circle"></i></label>
						<input type="text" name="seoorgname" id="seoorgname" {if $themesetting.seoorganizationname|default:'' == null}value="" placeholder="Leave this filed empty if you'd like to use the default Coodiv Shufy theme settings"{else}value="{$themesetting.seoorganizationname|default:''}"{/if} class="form-control" >
					</div>
				</div>
				<div class="col-md-6 col-12">
					<div class="form-group">
						<label for="eoorgmobile">Organization Phone Number <i data-toggle="tooltip" data-placement="bottom" title="Add your Organization Phone Number to this filed." class="fas fa-info-circle"></i></label>
						<input type="tel" name="eoorgmobile" id="eoorgmobile" {if $themesetting.seoorganizationphonenumber|default:'' == null}value="" placeholder="Leave this filed empty if you'd like to use the default Coodiv Shufy theme settings"{else}value="{$themesetting.seoorganizationphonenumber|default:''}"{/if} class="form-control" >
					</div>
				</div>
				<div class="col-md-6 col-12">
					<div class="form-group">
						<label for="seocontacttype">Contact Type <i data-toggle="tooltip" data-placement="bottom" title="Select Which Contact Type you are using in your website." class="fas fa-info-circle"></i></label>
						<select name="seocontacttype" id="seocontacttype" class="form-control input-sm">
							<option {if $themesetting.seowebsitetype|default:''=='Manually Enter Type'}selected{/if} value="Manually Enter Type">Manually Enter Type</option>
							<option {if $themesetting.seowebsitetype|default:''=='Billing Support'}selected{/if} value="Billing Support">Billing Support</option>
							<option {if $themesetting.seowebsitetype|default:''=='Customer Support'}selected{/if} value="Customer Support">Customer Support</option>
							<option {if $themesetting.seowebsitetype|default:''=='Sales'}selected{/if} value="Sales">Sales</option>
							<option {if $themesetting.seowebsitetype|default:''=='Reservations'}selected{/if} value="Reservations">Reservations</option>
							<option {if $themesetting.seowebsitetype|default:''=='Technical Support'}selected{/if} value="Technical Support">Technical Support</option>
						</select>
					</div>
				</div>
				<div class="col-md-6 col-12">
					<div class="form-group">
						<label for="seoopengraph">Default open Graph Image (fb & twitter), recommended (1200:630px or aspect ratio of 1.91:1) URL <i data-toggle="tooltip" data-placement="bottom" title="ADD Default open Graph Image URL for facebook and twitter links." class="fas fa-info-circle"></i></label>
						<input type="url" name="seoopengraph" id="seoopengraph" {if $themesetting.seoopengraph|default:'' == null}value="" placeholder="Leave this filed empty if you'd like to use the default Coodiv Shufy theme settings"{else}value="{$themesetting.seoopengraph|default:''}"{/if} class="form-control" >
					</div>
				</div>
				<div class="col-md-6 col-12">
					<div class="form-group">
						<label for="seotwittername">Twitter username (ex:@coodiv) <i data-toggle="tooltip" data-placement="bottom" title="Add your twitter username with @." class="fas fa-info-circle"></i></label>
						<input type="text" name="seotwittername" id="seotwittername" {if $themesetting.seotwitterusername|default:'' == null}value="" placeholder="@coodiv"{else}value="{$themesetting.seotwitterusername|default:''}"{/if} class="form-control" >
					</div>
				</div>
				<div class="col-md-6 col-12">
					<div class="form-group">
						<label for="seositefavicon">Website custom shortcut icon (1:1 and .ico) link <i data-toggle="tooltip" data-placement="bottom" title="Add your custom shortcut icon and sould be 1:1 and .ico link" class="fas fa-info-circle"></i></label>
						<input type="text" name="seositefavicon" id="seositefavicon" {if $themesetting.seositefavicon|default:'' == null}value="" placeholder="Your custom shortcut icon link"{else}value="{$themesetting.seositefavicon|default:''}"{/if} class="form-control" >
					</div>
				</div>
			</div>			
		</div>
		
		<div class="section">
			<h5 class="title">Custom CSS code</h5>			
				<div class="form-group">
					<label for="customcsscode">Css code <i data-toggle="tooltip" data-placement="bottom" title="If you have custom css codes just add it to this field." class="fas fa-info-circle"></i></label>
					<div class="shufytheme__css__editor" data-shufytheme-css-editor>
						<div class="shufytheme__css__editor__toolbar">
							<div class="shufytheme__css__editor__status" data-css-editor-status>
								<i class="fal fa-check-circle"></i>
								<span>CSS looks good</span>
							</div>
							<div class="shufytheme__css__editor__actions">
								<button type="button" data-css-editor-action="validate"><i class="fal fa-check-circle"></i>Validate</button>
								<button type="button" data-css-editor-action="format"><i class="fal fa-align-left"></i>Format</button>
								<button type="button" data-css-editor-action="clear"><i class="fal fa-trash-alt"></i>Clear</button>
							</div>
						</div>
						<div class="shufytheme__css__editor__body">
							<pre class="shufytheme__css__editor__lines" data-css-editor-lines>1</pre>
							<textarea class="form-control shufytheme__css__editor__textarea" id="customcsscode" name="customcsscode" rows="12" cols="50" spellcheck="false" autocomplete="off" autocapitalize="off" placeholder="Use this filed to add your custom css code to shufy theme">{$themesetting.customcsscode|default:''|escape:'html'}</textarea>
						</div>
					</div>
				</div>
		</div>
	</form>
</div>
<div class="coodiv__whmcs__admin__panel__form__footer__btns">
	<input class="coodiv__whmcs__admin__panel__form__footer__submit" type="submit" form="applythemeoption" value="Save"/>
	<a class="coodiv__whmcs__admin__panel__form__footer__cancel" href="{$modurl}&action=themeoption">Cancel</a>
</div>


<div id="resetpageoptions" class="coodiv__whmcs__admin__panel__model modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="{$modurl}&action=resetthemeoption" method="post">
				<div class="coodiv__whmcs__admin__panel__model__header">
					<h4 class="title">Reset <b>Shufy theme Genaral settings</b> options</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="fal fa-times"></i></button>
				</div>
				<div class="coodiv__whmcs__admin__panel__model__body">
					 <p>You are trying to Reset Shufy theme Genaral settings, <b class="red">Please not that this action can not be undone!</b>. Please confirm, to reset Shufy theme Genaral settings completly.</p>
				</div>
				<div class="coodiv__whmcs__admin__panel__model__footer">
					<button type="submit" class="confirm">Reset</button>
					<button type="button" class="cancel" data-dismiss="modal">Close</button>
				</div>
            </form>
        </div>
    </div>
</div>

<div id="exportpageoptions" class="coodiv__whmcs__admin__panel__model modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="exportForm" action="{$modurl}&action=exportthemeoption" method="post">
				<div class="coodiv__whmcs__admin__panel__model__header">
					<h4 class="title">Export <b>Shufy theme Genaral settings</b> options</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="fal fa-times"></i></button>
				</div>
				<div class="coodiv__whmcs__admin__panel__model__body">
					 <p>You are trying to export Shufy theme General settings, <b class="red">you will download a CSV file!</b>. Please do NOT edit it To avoid any problem that may occur in the future.</p>
				</div>
				<div class="coodiv__whmcs__admin__panel__model__footer">
					<button type="submit" class="confirm" >Export Data</button>
					<button type="button" class="cancel" data-dismiss="modal">Close</button>
				</div>
            </form>
        </div>
    </div>
</div>

<div id="importpageoptions" class="coodiv__whmcs__admin__panel__model modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="exportForm" action="{$modurl}&action=importthemeoption" method="post" enctype="multipart/form-data">
				<div class="coodiv__whmcs__admin__panel__model__header">
					<h4 class="title">Import <b>Shufy theme Genaral settings</b> options</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="fal fa-times"></i></button>
				</div>
				<div class="coodiv__whmcs__admin__panel__model__body">
					 <p>You are trying to Import Shufy theme General settings options, <b class="red">Please check that the file name is shufytheme_genaralsettings_exported_data.CSV!</b>. If you upload a different file to the page option that may create issues with your system and <b>Coodiv is not responsible for it.</b></p>
					 <p>Please note that, <b class="red">All of the options in this page will be overwrited with the uploaded file!</b>. and that action can not be undone!</p>
				
					<div class="form-group">
						<label for="defaultlogolinktagline">Attach CSV file</label>
						<input class="form-control file-input" type="file" name="uploaded_file" id="uploaded_file" accept=".csv" required>
					</div>
				
				</div>
				<div class="coodiv__whmcs__admin__panel__model__footer">
					<button type="submit" class="confirm" >Upload and Overwrite</button>
					<button type="button" class="cancel" data-dismiss="modal">Close</button>
				</div>
            </form>
        </div>
    </div>
</div>

			  



