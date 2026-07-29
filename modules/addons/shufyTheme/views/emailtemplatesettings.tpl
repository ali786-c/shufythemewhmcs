{if $smarty.get.success|default:'' == 1}
	<div class="settings__popupalert__coodiv alert alert-success alert-dismissible show" role="alert">
	  <span class="alert__progress"></span>
	  <span class="icon"><i class="fal fa-check-circle"></i></span>
	  <div class="text">
	  <strong>Success!</strong> Email template settings have been saved successfully.
	  </div>
	  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		<span aria-hidden="true">&times;</span>
	  </button>
	</div>
{/if}
{if $smarty.get.error|default:'' == 1}
	<div class="settings__popupalert__coodiv alert alert-danger alert-dismissible show" role="alert">
		<span class="alert__progress"></span>
		<span class="icon"><i class="fal fa-times-circle"></i></span>
		<div class="text">
		<strong>Error!</strong>
		Something went wrong while saving the settings. Please try again.
		</div>
		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
{/if}
{if $smarty.get.error|default:'' == extensionfileerror}
	<div class="settings__popupalert__coodiv alert alert-danger alert-dismissible show" role="alert">
		<span class="alert__progress"></span>
		<span class="icon"><i class="fal fa-times-circle"></i></span>
		<div class="text">
		<strong>Error!</strong>
		Something went wrong with your email template extension folder, please check the folder or download the latest addon version
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
				<h5 class="coodiv__main__hero__title">ShufyTheme Email template settings</h5>
				<p class="coodiv__main__hero__sub__title">ShufyTheme Email Template provides a modern, clean, and fully responsive design for all WHMCS system emails. It enhances readability, improves branding, and ensures consistent styling across all client communications. The template is easy to customize, supports WHMCS merge fields, and works seamlessly with all ShufyTheme features.</p>
				
			</div>
			<div class="col-md-7 col-12 btn__container">
			</div>
		</div>
		

		<ul class="nav nav-tabs admin-tabs coodiv__adminpanel__tabs__ui" role="tablist">
			<li class="active"><a class="tab-top" href="#tab1" role="tab" data-toggle="tab" id="tabLink1" data-tab-id="1">General</a></li>
			<li><a class="tab-top" href="#tab2" role="tab" data-toggle="tab" id="tabLink2" data-tab-id="2">Social links</a></li>
			<li><a class="tab-top" href="#tab3" role="tab" data-toggle="tab" id="tabLink3" data-tab-id="3">Footer</a></li>
			<li><a class="tab-top" href="#tab4" role="tab" data-toggle="tab" id="tabLink4" data-tab-id="4">Themes</a></li>
			<li class="ml-auto"><a class="tab-top" href="{$modurl}&action=extentions">More extensions</a></li>
		</ul>
	</div>
	

		
	<form id="applyemailtemplatesettings" class="full__fieldset__area default__form__panel__cart coodiv__whmcs__admin__panel__form" action="{$modurl}&action=applyemailtemplatesettings" method="post">
	<input type="hidden" name="itemid" value="1">
	<div class="tab-content">
		<div class="tab-pane active" id="tab1">
			<div class="section">
				<h5 class="title">Email template logo & header settings</h5>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="emailtemplatelogolinklight">Email template default logo<i data-toggle="tooltip" data-placement="bottom" title="Add your custom logo link in this field to display it in the email template." class="fas fa-info-circle"></i></label>
							<input type="text" name="emailtemplatelogolinklight" id="emailtemplatelogolinklight" {if $emailtemplatesettings.emailtemplatelogolinklight|default:'' == null}value="" placeholder="Leave this filed empty if you'd like to use the default ShufyTheme settings"{else}value="{$emailtemplatesettings.emailtemplatelogolinklight|default:''}"{/if} class="form-control" >
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="emailtemplatelogolinkdark">Email template dark mode logo <i data-toggle="tooltip" data-placement="bottom" title="Add your custom dark logo link in this field to display it in the email template." class="fas fa-info-circle"></i></label>
							<input type="text" name="emailtemplatelogolinkdark" id="emailtemplatelogolinkdark" {if $emailtemplatesettings.emailtemplatelogolinkdark|default:'' == null}value="" placeholder="Leave this filed empty if you'd like to use the default ShufyTheme settings"{else}value="{$emailtemplatesettings.emailtemplatelogolinkdark|default:''}"{/if} class="form-control" >
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="tab-pane" id="tab2">
			<div class="section">
				<h5 class="title">Email template social icons links</h5>
				<div class="row">
					<div class="col-md-4 col-12">
						<div class="form-group">
							<label for="emailtemplatefacebooklink">Your company facebook link <i data-toggle="tooltip" data-placement="bottom" title="Add your company facebook page link" class="fas fa-info-circle"></i></label>
							<input type="text" name="emailtemplatefacebooklink" id="emailtemplatefacebooklink" {if $emailtemplatesettings.emailtemplatefacebooklink|default:'' == null}value="" placeholder="Leave this filed empty if you'd like hide this in the email template"{else}value="{$emailtemplatesettings.emailtemplatefacebooklink|default:''}"{/if} class="form-control" >
						</div>
						<div class="form-group">
							<label for="emailtemplatetwitterlink">Your company twitter link <i data-toggle="tooltip" data-placement="bottom" title="Add your company twitter page link" class="fas fa-info-circle"></i></label>
							<input type="text" name="emailtemplatetwitterlink" id="emailtemplatetwitterlink" {if $emailtemplatesettings.emailtemplatetwitterlink|default:'' == null}value="" placeholder="Leave this filed empty if you'd like hide this in the email template"{else}value="{$emailtemplatesettings.emailtemplatetwitterlink|default:''}"{/if} class="form-control" >
						</div>				
					</div>
					<div class="col-md-4 col-12">
						<div class="form-group">
							<label for="emailtemplatelinkedinlink">Your company linkedin link <i data-toggle="tooltip" data-placement="bottom" title="Add your company linkedin page link" class="fas fa-info-circle"></i></label>
							<input type="text" name="emailtemplatelinkedinlink" id="emailtemplatelinkedinlink" {if $emailtemplatesettings.emailtemplatelinkedinlink|default:'' == null}value="" placeholder="Leave this filed empty if you'd like hide this in the email template"{else}value="{$emailtemplatesettings.emailtemplatelinkedinlink|default:''}"{/if} class="form-control" >
						</div>
						<div class="form-group">
							<label for="emailtemplateyoutubelink">Your company Whatsapp number <i data-toggle="tooltip" data-placement="bottom" title="Add your company Whatsapp number" class="fas fa-info-circle"></i></label>
							<input type="text" name="emailtemplateyoutubelink" id="emailtemplateyoutubelink" {if $emailtemplatesettings.emailtemplateyoutubelink|default:'' == null}value="" placeholder="Leave this filed empty if you'd like hide this in the email template"{else}value="{$emailtemplatesettings.emailtemplateyoutubelink|default:''}"{/if} class="form-control" >
						</div>
					</div>
					<div class="col-md-4 col-12">
						
						<div class="form-group">
							<label for="emailtemplateinstagramlink">Your company instagram link <i data-toggle="tooltip" data-placement="bottom" title="Add your company instagram page link" class="fas fa-info-circle"></i></label>
							<input type="text" name="emailtemplateinstagramlink" id="emailtemplateinstagramlink" {if $emailtemplatesettings.emailtemplateinstagramlink|default:'' == null}value="" placeholder="Leave this filed empty if you'd like hide this in the email template"{else}value="{$emailtemplatesettings.emailtemplateinstagramlink|default:''}"{/if} class="form-control" >
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="tab-pane" id="tab3">
		
			<div class="section">
				<h5 class="title">Email template Footer settings</h5>
				
					<div class="form-group">
						<label for="emailtemplatecopyrighttext">Copyright text <i data-toggle="tooltip" data-placement="bottom" title="Add here your Copyright to display it in the footer of the email template" class="fas fa-info-circle"></i></label>
						<textarea class="form-control" id="emailtemplatecopyrighttext" name="emailtemplatecopyrighttext" rows="4" cols="50" placeholder="Leave this filed empty if you'd like hide this in the email template">{if $emailtemplatesettings.emailtemplatecopyrighttext|default:'' == null}{else}{$emailtemplatesettings.emailtemplatecopyrighttext|default:''}{/if}</textarea>
					</div>
					
					<div class="row">
						<div class="col-md-4 col-12">
							<div class="form-group">
								<label for="emailtemplateheadertext">Email template footer text<i data-toggle="tooltip" data-placement="bottom" title="Add here your text to display it in the footer of the email template" class="fas fa-info-circle"></i></label>
								<input type="text" name="emailtemplateheadertext" id="emailtemplateheadertext" {if $emailtemplatesettings.emailtemplateheadertext|default:'' == null}value="" placeholder="Leave this filed empty if you'd like hide this in the email template"{else}value="{$emailtemplatesettings.emailtemplateheadertext|default:''}"{/if} class="form-control" >
							</div>
						</div>
			
						<div class="col-md-4 col-12">
							<div class="form-group">
								<label for="emailtemplateheaderlinktext">Email template footer link text <i data-toggle="tooltip" data-placement="bottom" title="Add here your link text to display it in the footer of the email template." class="fas fa-info-circle"></i></label>
								<input type="text" name="emailtemplateheaderlinktext" id="emailtemplateheaderlinktext" {if $emailtemplatesettings.emailtemplateheaderlinktext|default:'' == null}value="" placeholder="Leave this filed empty if you'd like hide this in the email template"{else}value="{$emailtemplatesettings.emailtemplateheaderlinktext|default:''}"{/if} class="form-control" >
							</div>
						</div>
				
						<div class="col-md-4 col-12">
							<div class="form-group">
								<label for="emailtemplateheaderlink">Email template footer link URL <i data-toggle="tooltip" data-placement="bottom" title="Add here your link URL text to display it in the footer of the email template." class="fas fa-info-circle"></i></label>
								<input type="text" name="emailtemplateheaderlink" id="emailtemplateheaderlink" {if $emailtemplatesettings.emailtemplateheaderlink|default:'' == null}value="" placeholder="Leave this filed empty if you'd like hide this in the email template"{else}value="{$emailtemplatesettings.emailtemplateheaderlink|default:''}"{/if} class="form-control" >
							</div>
						</div>
					</div>
						
					
					
					
					<div class="add__new__menu__form__groups__body section">
						<h5 class="title">Email template links</h5>
						<div role="tabpanel" class="tab-pane coodiv-menu-translations-tabs" id="emaillinkswrapper">
							<div class="panel-group" id="emaillinkspanels" role="tablist" aria-multiselectable="true">
								<div class="row flexrow">
									<div class="col-md-3 col-12">
										<div class="panel panel-default">
											<div class="panel-heading" role="tab" id="heading_textone">
												<h4 class="panel-title">
													<a role="button" data-toggle="collapse" data-parent="#emaillinkspanels" href="#footertextone" aria-expanded="true" aria-controls="footertextone">
													link #1
													</a>
												</h4>
											</div>
											<div id="footertextone" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading_textone">
												<div class="panel-body">
													<div class="form-horizontal">
														<div class="form-group">
															<label for="emailtemplatefooterlinkone">Name <i data-toggle="tooltip" data-placement="bottom" title="Use the custom title string, translation is not available yet" class="fas fa-info-circle"></i></label>
															<input type="text" name="emailtemplatefooterlinkone" class="form-control" id="emailtemplatefooterlinkone" {if $emailtemplatesettings.emailtemplatefooterlinkone|default:'' == null}value="" placeholder="Leave this filed empty if you'd like to not use it"{else}value="{$emailtemplatesettings.emailtemplatefooterlinkone|default:''}"{/if}>
														</div>
														<div class="form-group">
															<label for="emailtemplatefooterlinkoneurl">URL <i data-toggle="tooltip" data-placement="bottom" title="add URL for this link" class="fas fa-info-circle"></i></label>
															<input type="text" name="emailtemplatefooterlinkoneurl" class="form-control" id="emailtemplatefooterlinkoneurl" {if $emailtemplatesettings.emailtemplatefooterlinkoneurl|default:'' == null}value="" placeholder="Leave this filed empty if you'd like to not use it"{else}value="{$emailtemplatesettings.emailtemplatefooterlinkoneurl|default:''}"{/if}>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									
									
									<div class="col-md-3 col-12">
										<div class="panel panel-default">
											<div class="panel-heading" role="tab" id="heading_texttwo">
												<h4 class="panel-title">
													<a role="button" data-toggle="collapse" data-parent="#emaillinkspanels" href="#footertexttwo" aria-expanded="true" aria-controls="footertexttwo">
													link #2
													</a>
												</h4>
											</div>
											<div id="footertexttwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading_texttwo">
												<div class="panel-body">
													<div class="form-horizontal">
														<div class="form-group">
															<label for="emailtemplatefooterlinktwo">Name <i data-toggle="tooltip" data-placement="bottom" title="Use the custom title string, translation is not available yet" class="fas fa-info-circle"></i></label>
															<input type="text" name="emailtemplatefooterlinktwo" class="form-control" id="emailtemplatefooterlinktwo" {if $emailtemplatesettings.emailtemplatefooterlinktwo|default:'' == null}value="" placeholder="Leave this filed empty if you'd like to not use it"{else}value="{$emailtemplatesettings.emailtemplatefooterlinktwo|default:''}"{/if}>
														</div>
														<div class="form-group">
															<label for="emailtemplatefooterlinktwourl">URL <i data-toggle="tooltip" data-placement="bottom" title="add URL for this link" class="fas fa-info-circle"></i></label>
															<input type="text" name="emailtemplatefooterlinktwourl" class="form-control" id="emailtemplatefooterlinktwourl" {if $emailtemplatesettings.emailtemplatefooterlinktwourl|default:'' == null}value="" placeholder="Leave this filed empty if you'd like to not use it"{else}value="{$emailtemplatesettings.emailtemplatefooterlinktwourl|default:''}"{/if}>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									
									
									<div class="col-md-3 col-12">
										<div class="panel panel-default">
											<div class="panel-heading" role="tab" id="heading_textthree">
												<h4 class="panel-title">
													<a role="button" data-toggle="collapse" data-parent="#emaillinkspanels" href="#footertextthree" aria-expanded="true" aria-controls="footertextthree">
													link #3
													</a>
												</h4>
											</div>
											<div id="footertextthree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading_textthree">
												<div class="panel-body">
													<div class="form-horizontal">
														<div class="form-group">
															<label for="emailtemplatefooterlinkthree">Name <i data-toggle="tooltip" data-placement="bottom" title="Use the custom title string, translation is not available yet" class="fas fa-info-circle"></i></label>
															<input type="text" name="emailtemplatefooterlinkthree" class="form-control" id="emailtemplatefooterlinkthree" {if $emailtemplatesettings.emailtemplatefooterlinkthree|default:'' == null}value="" placeholder="Leave this filed empty if you'd like to not use it"{else}value="{$emailtemplatesettings.emailtemplatefooterlinkthree|default:''}"{/if}>
														</div>
														<div class="form-group">
															<label for="emailtemplatefooterlinkthreeurl">URL <i data-toggle="tooltip" data-placement="bottom" title="add URL for this link" class="fas fa-info-circle"></i></label>
															<input type="text" name="emailtemplatefooterlinkthreeurl" class="form-control" id="emailtemplatefooterlinkthreeurl" {if $emailtemplatesettings.emailtemplatefooterlinkthreeurl|default:'' == null}value="" placeholder="Leave this filed empty if you'd like to not use it"{else}value="{$emailtemplatesettings.emailtemplatefooterlinkthreeurl|default:''}"{/if}>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									
									
									<div class="col-md-3 col-12">
										<div class="panel panel-default">
											<div class="panel-heading" role="tab" id="heading_textfour">
												<h4 class="panel-title">
													<a role="button" data-toggle="collapse" data-parent="#emaillinkspanels" href="#footertextfour" aria-expanded="true" aria-controls="footertextfour">
													link #4
													</a>
												</h4>
											</div>
											<div id="footertextfour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading_textfour">
												<div class="panel-body">
													<div class="form-horizontal">
														<div class="form-group">
															<label for="emailtemplatefooterlinktfour">Name <i data-toggle="tooltip" data-placement="bottom" title="Use the custom title string, translation is not available yet" class="fas fa-info-circle"></i></label>
															<input type="text" name="emailtemplatefooterlinktfour" class="form-control" id="emailtemplatefooterlinktfour" {if $emailtemplatesettings.emailtemplatefooterlinktfour|default:'' == null}value="" placeholder="Leave this filed empty if you'd like to not use it"{else}value="{$emailtemplatesettings.emailtemplatefooterlinktfour|default:''}"{/if}>
														</div>
														<div class="form-group">
															<label for="emailtemplatefooterlinktfoururl">URL <i data-toggle="tooltip" data-placement="bottom" title="add URL for this link" class="fas fa-info-circle"></i></label>
															<input type="text" name="emailtemplatefooterlinktfoururl" class="form-control" id="emailtemplatefooterlinktfoururl" {if $emailtemplatesettings.emailtemplatefooterlinktfoururl|default:'' == null}value="" placeholder="Leave this filed empty if you'd like to not use it"{else}value="{$emailtemplatesettings.emailtemplatefooterlinktfoururl|default:''}"{/if}>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									
									
									
								</div>
							</div>
						</div>
					</div>
			</div>			
							
		</div>
		<div class="tab-pane" id="tab4">
			<div class="section">
				<div class="form-group menu__place__radio__group white__radio__group email__template__radio__group">
					<div class="email__template__radio__themes__group">
						<div class="email__template__radio__themes__group__header">
							<h5 class="email__template__radio__themes__group__header__title">Shufytheme Basic Email Template Themes</h5>
							<p class="email__template__radio__themes__group__header__subtitle">Below, you will find the Shufytheme basic email templates. You can choose the one that best suits your brand.</p>
						</div>
						
						<fieldset>
							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/extentions/shufytheme-email-template/themes/themes-preview/basic-theme.webp" alt="">
									<input type="radio" name="emailtemplatetheme" id="emailtemplatethemebasic" value="emailtemplatethemebasic" {if $emailtemplatesettings.emailtemplatetheme|default:''=='emailtemplatethemebasic' || $emailtemplatesettings.id|default:'' != '1'}checked{/if}>
									<span class="title">Basic Theme</span>
									<span class="checkmark"></span>
								</label>
							</div>
							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/extentions/shufytheme-email-template/themes/themes-preview/basic-theme-blue.webp" alt="">
									<input type="radio" name="emailtemplatetheme" id="emailtemplatethemebasicblue" value="emailtemplatethemebasicblue" {if $emailtemplatesettings.emailtemplatetheme|default:''=='emailtemplatethemebasicblue'}checked{/if}>
									<span class="title">Basic Theme Default</span>
									<span class="checkmark"></span>
								</label>
							</div>
							
							
							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/extentions/shufytheme-email-template/themes/themes-preview/basic-theme-green.webp" alt="">
									<input type="radio" name="emailtemplatetheme" id="emailtemplatethemebasicgreen" value="emailtemplatethemebasicgreen" {if $emailtemplatesettings.emailtemplatetheme|default:''=='emailtemplatethemebasicgreen'}checked{/if}>
									<span class="title">Basic Theme Green</span>
									<span class="checkmark"></span>
								</label>
							</div>
							
							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/extentions/shufytheme-email-template/themes/themes-preview/basic-theme-purple.webp" alt="">
									<input type="radio" name="emailtemplatetheme" id="emailtemplatethemebasicpurple" value="emailtemplatethemebasicpurple" {if $emailtemplatesettings.emailtemplatetheme|default:''=='emailtemplatethemebasicpurple'}checked{/if}>
									<span class="title">Basic Theme Purple</span>
									<span class="checkmark"></span>
								</label>
							</div>
							
							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/extentions/shufytheme-email-template/themes/themes-preview/basic-theme-red.webp" alt="">
									<input type="radio" name="emailtemplatetheme" id="emailtemplatethemebasicred" value="emailtemplatethemebasicred" {if $emailtemplatesettings.emailtemplatetheme|default:''=='emailtemplatethemebasicred'}checked{/if}>
									<span class="title">Basic Theme Red</span>
									<span class="checkmark"></span>
								</label>
							</div>
							
							
							
						</fieldset>
					
					</div>
					
					
					<div class="email__template__radio__themes__group">
						<div class="email__template__radio__themes__group__header">
							<h5 class="email__template__radio__themes__group__header__title">Shufytheme Basic Expanded Email Template Themes</h5>
							<p class="email__template__radio__themes__group__header__subtitle">Below, you will find the Shufytheme basic Expanded email templates. You can choose the one that best suits your brand.</p>
						</div>
						<fieldset>
							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/extentions/shufytheme-email-template/themes/themes-preview/basic-expanded-blue.webp" alt="">
									<input type="radio" name="emailtemplatetheme" id="emailtemplatethemebasicexpandedblue" value="emailtemplatethemebasicexpandedblue" {if $emailtemplatesettings.emailtemplatetheme|default:''=='emailtemplatethemebasicexpandedblue'}checked{/if}>
									<span class="title">Basic Expanded Theme Default</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/extentions/shufytheme-email-template/themes/themes-preview/basic-expanded-green.webp" alt="">
									<input type="radio" name="emailtemplatetheme" id="emailtemplatethemebasicexpandedgreen" value="emailtemplatethemebasicexpandedgreen" {if $emailtemplatesettings.emailtemplatetheme|default:''=='emailtemplatethemebasicexpandedgreen'}checked{/if}>
									<span class="title">Basic Expanded Theme Green</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/extentions/shufytheme-email-template/themes/themes-preview/basic-expanded-purple.webp" alt="">
									<input type="radio" name="emailtemplatetheme" id="emailtemplatethemebasicexpandedpurple" value="emailtemplatethemebasicexpandedpurple" {if $emailtemplatesettings.emailtemplatetheme|default:''=='emailtemplatethemebasicexpandedpurple'}checked{/if}>
									<span class="title">Basic Expanded Theme Purple</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/extentions/shufytheme-email-template/themes/themes-preview/basic-expanded-red.webp" alt="">
									<input type="radio" name="emailtemplatetheme" id="emailtemplatethemebasicexpandedred" value="emailtemplatethemebasicexpandedred" {if $emailtemplatesettings.emailtemplatetheme|default:''=='emailtemplatethemebasicexpandedred'}checked{/if}>
									<span class="title">Basic Expanded Theme Red</span>
									<span class="checkmark"></span>
								</label>
							</div>
						</fieldset>
					</div>
					
					
					
					<div class="email__template__radio__themes__group">
						<div class="email__template__radio__themes__group__header">
							<h5 class="email__template__radio__themes__group__header__title">Shufytheme Expanded Modern Email Template Themes</h5>
							<p class="email__template__radio__themes__group__header__subtitle">Below, you will find the Shufytheme Expanded Modern email templates. You can choose the one that best suits your brand.</p>
						</div>
						<fieldset>
							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/extentions/shufytheme-email-template/themes/themes-preview/modern-expanded-blue.webp" alt="">
									<input type="radio" name="emailtemplatetheme" id="emailtemplatethememodernexpandedblue" value="emailtemplatethememodernexpandedblue" {if $emailtemplatesettings.emailtemplatetheme|default:''=='emailtemplatethememodernexpandedblue'}checked{/if}>
									<span class="title">Modern Expanded Theme Default</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/extentions/shufytheme-email-template/themes/themes-preview/modern-expanded-green.webp" alt="">
									<input type="radio" name="emailtemplatetheme" id="emailtemplatethememodernexpandedgreen" value="emailtemplatethememodernexpandedgreen" {if $emailtemplatesettings.emailtemplatetheme|default:''=='emailtemplatethememodernexpandedgreen'}checked{/if}>
									<span class="title">Modern Expanded Theme Green</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/extentions/shufytheme-email-template/themes/themes-preview/modern-expanded-purple.webp" alt="">
									<input type="radio" name="emailtemplatetheme" id="emailtemplatethememodernexpandedpurple" value="emailtemplatethememodernexpandedpurple" {if $emailtemplatesettings.emailtemplatetheme|default:''=='emailtemplatethememodernexpandedpurple'}checked{/if}>
									<span class="title">Modern Expanded Theme Purple</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/extentions/shufytheme-email-template/themes/themes-preview/modern-expanded-red.webp" alt="">
									<input type="radio" name="emailtemplatetheme" id="emailtemplatethememodernexpandedred" value="emailtemplatethememodernexpandedred" {if $emailtemplatesettings.emailtemplatetheme|default:''=='emailtemplatethememodernexpandedred'}checked{/if}>
									<span class="title">Modern Expanded Theme Red</span>
									<span class="checkmark"></span>
								</label>
							</div>
						</fieldset>
					</div>
					
					
					<div class="email__template__radio__themes__group">
						<div class="email__template__radio__themes__group__header">
							<h5 class="email__template__radio__themes__group__header__title">Shufytheme Expanded Email Template Themes</h5>
							<p class="email__template__radio__themes__group__header__subtitle">Below, you will find the Shufytheme Expanded email templates. You can choose the one that best suits your brand.</p>
						</div>
						<fieldset>
							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/extentions/shufytheme-email-template/themes/themes-preview/expanded-blue.webp" alt="">
									<input type="radio" name="emailtemplatetheme" id="emailtemplatethemeexpandedblue" value="emailtemplatethemeexpandedblue" {if $emailtemplatesettings.emailtemplatetheme|default:''=='emailtemplatethemeexpandedblue'}checked{/if}>
									<span class="title">Expanded Theme Default</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/extentions/shufytheme-email-template/themes/themes-preview/expanded-green.webp" alt="">
									<input type="radio" name="emailtemplatetheme" id="emailtemplatethemeexpandedgreen" value="emailtemplatethemeexpandedgreen" {if $emailtemplatesettings.emailtemplatetheme|default:''=='emailtemplatethemeexpandedgreen'}checked{/if}>
									<span class="title">Expanded Theme Green</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/extentions/shufytheme-email-template/themes/themes-preview/expanded-purple.webp" alt="">
									<input type="radio" name="emailtemplatetheme" id="emailtemplatethemeexpandedpurple" value="emailtemplatethemeexpandedpurple" {if $emailtemplatesettings.emailtemplatetheme|default:''=='emailtemplatethemeexpandedpurple'}checked{/if}>
									<span class="title">Expanded Theme Purple</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/extentions/shufytheme-email-template/themes/themes-preview/expanded-red.webp" alt="">
									<input type="radio" name="emailtemplatetheme" id="emailtemplatethemeexpandedred" value="emailtemplatethemeexpandedred" {if $emailtemplatesettings.emailtemplatetheme|default:''=='emailtemplatethemeexpandedred'}checked{/if}>
									<span class="title">Expanded Theme Red</span>
									<span class="checkmark"></span>
								</label>
							</div>
						</fieldset>
					</div>
					
					
					<div class="email__template__radio__themes__group">
						<div class="email__template__radio__themes__group__header">
							<h5 class="email__template__radio__themes__group__header__title">Shufytheme Default Email Template Themes</h5>
							<p class="email__template__radio__themes__group__header__subtitle">Below, you will find the Shufytheme Default email templates. You can choose the one that best suits your brand.</p>
						</div>
						<fieldset>
							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/extentions/shufytheme-email-template/themes/themes-preview/default-blue.webp" alt="">
									<input type="radio" name="emailtemplatetheme" id="emailtemplatethemedefaultblue" value="emailtemplatethemedefaultblue" {if $emailtemplatesettings.emailtemplatetheme|default:''=='emailtemplatethemedefaultblue'}checked{/if}>
									<span class="title">Default Theme Blue</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/extentions/shufytheme-email-template/themes/themes-preview/default-green.webp" alt="">
									<input type="radio" name="emailtemplatetheme" id="emailtemplatethemedefaultgreen" value="emailtemplatethemedefaultgreen" {if $emailtemplatesettings.emailtemplatetheme|default:''=='emailtemplatethemedefaultgreen'}checked{/if}>
									<span class="title">Default Theme Green</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/extentions/shufytheme-email-template/themes/themes-preview/default-purple.webp" alt="">
									<input type="radio" name="emailtemplatetheme" id="emailtemplatethemedefaultpurple" value="emailtemplatethemedefaultpurple" {if $emailtemplatesettings.emailtemplatetheme|default:''=='emailtemplatethemedefaultpurple'}checked{/if}>
									<span class="title">Default Theme Purple</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/extentions/shufytheme-email-template/themes/themes-preview/default-red.webp" alt="">
									<input type="radio" name="emailtemplatetheme" id="emailtemplatethemedefaultred" value="emailtemplatethemedefaultred" {if $emailtemplatesettings.emailtemplatetheme|default:''=='emailtemplatethemedefaultred'}checked{/if}>
									<span class="title">Default Theme Red</span>
									<span class="checkmark"></span>
								</label>
							</div>
						</fieldset>
					</div>
					
					
					
					<div class="email__template__radio__themes__group">
						<div class="email__template__radio__themes__group__header">
							<h5 class="email__template__radio__themes__group__header__title">Shufytheme Basic Colors Email Template Themes</h5>
							<p class="email__template__radio__themes__group__header__subtitle">Below, you will find the Shufytheme Basic Colors email templates. You can choose the one that best suits your brand.</p>
						</div>
						<fieldset>
							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/extentions/shufytheme-email-template/themes/themes-preview/basic-colors-blue.webp" alt="">
									<input type="radio" name="emailtemplatetheme" id="emailtemplatethemebasiccolorsblue" value="emailtemplatethemebasiccolorsblue" {if $emailtemplatesettings.emailtemplatetheme|default:''=='emailtemplatethemebasiccolorsblue'}checked{/if}>
									<span class="title">Basic Colors Theme Blue</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/extentions/shufytheme-email-template/themes/themes-preview/basic-colors-green.webp" alt="">
									<input type="radio" name="emailtemplatetheme" id="emailtemplatethemebasiccolorsgreen" value="emailtemplatethemebasiccolorsgreen" {if $emailtemplatesettings.emailtemplatetheme|default:''=='emailtemplatethemebasiccolorsgreen'}checked{/if}>
									<span class="title">Basic Colors Theme Green</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/extentions/shufytheme-email-template/themes/themes-preview/basic-colors-purple.webp" alt="">
									<input type="radio" name="emailtemplatetheme" id="emailtemplatethemebasiccolorspurple" value="emailtemplatethemebasiccolorspurple" {if $emailtemplatesettings.emailtemplatetheme|default:''=='emailtemplatethemebasiccolorspurple'}checked{/if}>
									<span class="title">Basic Colors Theme Purple</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/extentions/shufytheme-email-template/themes/themes-preview/basic-colors-red.webp" alt="">
									<input type="radio" name="emailtemplatetheme" id="emailtemplatethemebasiccolorsred" value="emailtemplatethemebasiccolorsred" {if $emailtemplatesettings.emailtemplatetheme|default:''=='emailtemplatethemebasiccolorsred'}checked{/if}>
									<span class="title">Basic Colors Theme Red</span>
									<span class="checkmark"></span>
								</label>
							</div>
						</fieldset>
					</div>
					
					
					
					<div class="email__template__radio__themes__group">
						<div class="email__template__radio__themes__group__header">
							<h5 class="email__template__radio__themes__group__header__title">Shufytheme Colors Email Template Themes</h5>
							<p class="email__template__radio__themes__group__header__subtitle">Below, you will find the Shufytheme Colors email templates. You can choose the one that best suits your brand.</p>
						</div>
						<fieldset>
							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/extentions/shufytheme-email-template/themes/themes-preview/colors-blue.webp" alt="">
									<input type="radio" name="emailtemplatetheme" id="emailtemplatethemecolorsblue" value="emailtemplatethemecolorsblue" {if $emailtemplatesettings.emailtemplatetheme|default:''=='emailtemplatethemecolorsblue'}checked{/if}>
									<span class="title">Colors Theme Blue</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/extentions/shufytheme-email-template/themes/themes-preview/colors-green.webp" alt="">
									<input type="radio" name="emailtemplatetheme" id="emailtemplatethemecolorsgreen" value="emailtemplatethemecolorsgreen" {if $emailtemplatesettings.emailtemplatetheme|default:''=='emailtemplatethemecolorsgreen'}checked{/if}>
									<span class="title">Colors Theme Green</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/extentions/shufytheme-email-template/themes/themes-preview/colors-purple.webp" alt="">
									<input type="radio" name="emailtemplatetheme" id="emailtemplatethemecolorspurple" value="emailtemplatethemecolorspurple" {if $emailtemplatesettings.emailtemplatetheme|default:''=='emailtemplatethemecolorspurple'}checked{/if}>
									<span class="title">Colors Theme Purple</span>
									<span class="checkmark"></span>
								</label>
							</div>

							<div class="radio">
								<label>
									<img src="../modules/addons/shufyTheme/extentions/shufytheme-email-template/themes/themes-preview/colors-red.webp" alt="">
									<input type="radio" name="emailtemplatetheme" id="emailtemplatethemecolorsred" value="emailtemplatethemecolorsred" {if $emailtemplatesettings.emailtemplatetheme|default:''=='emailtemplatethemecolorsred'}checked{/if}>
									<span class="title">Colors Theme Red</span>
									<span class="checkmark"></span>
								</label>
							</div>
						</fieldset>
					</div>
					
					
					
					
					
					
					
					
					
				</div>
			</div>
		</div>
	</div>



	
	</form>
</div>
<div class="coodiv__whmcs__admin__panel__form__footer__btns">
	<input class="coodiv__whmcs__admin__panel__form__footer__submit" type="submit" form="applyemailtemplatesettings" value="Save & apply email template settings"/>
	<a class="coodiv__whmcs__admin__panel__form__footer__cancel" href="{$modurl}&action=emailtemplatesettings">Cancel</a>
</div>

  
			  
