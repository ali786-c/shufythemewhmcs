<div class="coodiv__main__hero">
<div class="coodiv__main__hero__breadcrumbs">{$breadcrumbs}</div>
<div class="row justify-content-between">
<div class="col-md-8 col-12">
<h5 class="coodiv__main__hero__title">Edit {$iteminfo.title|default:''} Menu Items</h5>
<p class="coodiv__main__hero__sub__title">You do not need to create complicated WHMCS hooks to create or edit menus anymore, Coodiv Primary Menu manager gives you convenient options to set up your theme main navigation.</p>
</div>
<div class="col-md-4"></div>
</div>
</div>

<form id="editmenuform" action="{$modurl}&action=doedititem" method="post" autocomplete="off">
<input type="hidden" name="itemid" value="{$iteminfo.id|default:''}">
<input type="hidden" name="groupid" value="{$iteminfo.groupid|default:''}">
<input type="hidden" name="parentid" value="{$iteminfo.parentid|default:''}">
<input type="hidden" name="translationrecords" value="{$itemtranslationrecords|default:''}">
  <div class="row">
    <div class="col-md-8 col-12">
       <div class="add__new__menu__form__groups">
			<div class="add__new__menu__form__groups__header">
				<h5 class="title"><i class="fal fa-pen"></i> Edit Menu Item</h5>
					<div class="add__new__menu__form__groups__header__options">
					<div class="target__radio__container">
					<span class="target__radio__title">Target Blank:</span>
					<div class="target__radiogroup">
                            <input type="radio" name="targetwindow" id="targetwindowself" value="_self" {if $iteminfo.targetwindow|default:''=='_self'}checked{/if}>
							<label for="targetwindowself">Disabled</label>
                            <input type="radio" name="targetwindow" id="targetwindowblank" value="_blank" {if $iteminfo.targetwindow|default:''=='_blank'}checked{/if}>
							<label for="targetwindowblank">Enabled</label>
                            <span class="selection-indicator"></span>
					</div>
                    </div>
                    </div>
	         </div>
			 
			 <div class="add__new__menu__form__groups__body section">
					<h5 class="title">Menu Item Settings</h5>
					<div class="form-group">
                        <label for="target">Type <i data-toggle="tooltip" data-placement="bottom" title="Choose the menu type that you would like to manage. Learn more about types in our documentation." class="fas fa-info-circle"></i></label>
                        <div class="row">
                            <div class="col-lg-6">
                                    <select name="urltype" id="urltype" class="form-control input-sm">
                                        <option value="clientarea-off"{if $iteminfo.urltype|default:''=='clientarea-off' || $iteminfo.urltype|default:''=='clientarea-on'} selected{/if}>WHMCS Core URL</option>
                                        <option value="customurl"{if $iteminfo.urltype|default:''=='customurl'} selected{/if}>External or Custom URL</option>
                                    </select>
                            </div>
						</div>
					</div>
					<div class="form-group">
                        <label for="target">URL <i data-toggle="tooltip" data-placement="bottom" title="Displays a predefined list of WHMCS pages to choose from. The menu item URL will be set automatically based on the selected page or you can use you custom link" class="fas fa-info-circle"></i></label>
                        <div class="row">
                         <div class="col-lg-6">
                                    <select name="clientarea-off" id="clientarea-off" class="form-control input-sm" data-current-url="{$iteminfo.url_for_select|default:''|escape:'html'}" style="display:{if $iteminfo.urltype|default:''!='customurl'}block{else}none{/if};">
                                        <option value="index.php"{if $iteminfo.url_for_select|default:''=='index.php'} selected{/if}>Portal Home</option>
                                        <option value="downloads.php"{if $iteminfo.url_for_select|default:''=='downloads.php'} selected{/if}>Downloads</option>
                                        <option value="knowledgebase.php"{if $iteminfo.url_for_select|default:''=='knowledgebase.php'} selected{/if}>Knowledgebase</option>
                                        <option value="domainchecker.php"{if $iteminfo.url_for_select|default:''=='domainchecker.php'} selected{/if}>Domain Checker</option>
                                        <option value="cart.php"{if $iteminfo.url_for_select|default:''=='cart.php'} selected{/if}>Order</option>
                                        <option value="announcements.php"{if $iteminfo.url_for_select|default:''=='announcements.php'} selected{/if}>Announcements</option>
                                        <option value="submitticket.php"{if $iteminfo.url_for_select|default:''=='submitticket.php'} selected{/if}>Open New Ticket</option>
                                        <option value="affiliates.php"{if $iteminfo.url_for_select|default:''=='affiliates.php'} selected{/if}>Affiliates</option>
                                        <option value="contact.php"{if $iteminfo.url_for_select|default:''=='contact.php'} selected{/if}>Contact Us</option>
                                        <option value="login.php"{if $iteminfo.url_for_select|default:''=='login.php'} selected{/if}>Login Page</option>
										<option value="clientarea.php"{if $iteminfo.url_for_select|default:''=='clientarea.php'} selected{/if}>Client Summary</option>
                                        <option value="networkissues.php"{if $iteminfo.url_for_select|default:''=='networkissues.php'} selected{/if}>Network Issues</option>
                                        <option value="serverstatus.php"{if $iteminfo.url_for_select|default:''=='serverstatus.php'} selected{/if}>Servers Status</option>
                                        <option value="supporttickets.php"{if $iteminfo.url_for_select|default:''=='supporttickets.php'} selected{/if}>Support Tickets</option>
                                        <option value="clientarea.php?action=products"{if $iteminfo.url_for_select|default:''=='clientarea.php?action=products'} selected{/if}>My Services</option>
                                        <option value="cart.php?gid=addons"{if $iteminfo.url_for_select|default:''=='cart.php?gid=addons'} selected{/if}>View Available Addons</option>
                                        <option value="clientarea.php?action=domains"{if $iteminfo.url_for_select|default:''=='clientarea.php?action=domains'} selected{/if}>My Domain</option>
                                        <option value="cart.php?gid=renewals"{if $iteminfo.url_for_select|default:''=='cart.php?gid=renewals'} selected{/if}>Renew Domains</option>
                                        <option value="clientarea.php?action=invoices"{if $iteminfo.url_for_select|default:''=='clientarea.php?action=invoices'} selected{/if}>My Invoices</option>
                                        <option value="clientarea.php?action=creditcard"{if $iteminfo.url_for_select|default:''=='clientarea.php?action=creditcard'} selected{/if}>Manage Credit Card</option>
                                        <option value="clientarea.php?action=addfunds"{if $iteminfo.url_for_select|default:''=='clientarea.php?action=addfunds'} selected{/if}>Add Funds</option>
                                        <option value="clientarea.php?action=quotes"{if $iteminfo.url_for_select|default:''=='clientarea.php?action=quotes'} selected{/if}>My Quotes</option>
                                        <option value="clientarea.php?action=masspay&amp;all=true"{if $iteminfo.url_for_select|default:''=='clientarea.php?action=masspay&all=true'} selected{/if}>Mass Payment</option>
                                        <option value="clientarea.php?action=details"{if $iteminfo.url_for_select|default:''=='clientarea.php?action=details'} selected{/if}>Edit Account Details</option>
                                        <option value="clientarea.php?action=contacts"{if $iteminfo.url_for_select|default:''=='clientarea.php?action=contacts'} selected{/if}>Contacts/Sub-Accounts</option>
                                        <option value="clientarea.php?action=emails"{if $iteminfo.url_for_select|default:''=='clientarea.php?action=emails'} selected{/if}>Email History</option>
                                        <option value="clientarea.php?action=changepw"{if $iteminfo.url_for_select|default:''=='clientarea.php?action=changepw'} selected{/if}>Change Password</option>
                                        <option value="clientarea.php?action=security"{if $iteminfo.url_for_select|default:''=='clientarea.php?action=security'} selected{/if}>Security Settings</option>
                                        <option value="logout.php"{if $iteminfo.url_for_select|default:''=='logout.php'} selected{/if}>Logout</option>
                                        <option value="register.php"{if $iteminfo.url_for_select|default:''=='register.php'} selected{/if}>Register Account</option>
                                        <option value="pwreset.php"{if $iteminfo.url_for_select|default:''=='pwreset.php'} selected{/if}>Forgot Password</option>
                                        <option value="cart.php?a=add&amp;domain=register"{if $iteminfo.url_for_select|default:''=='cart.php?a=add&domain=register'} selected{/if}>Register a New Domain</option>
                                        <option value="cart.php?a=add&amp;domain=transfer"{if $iteminfo.url_for_select|default:''=='cart.php?a=add&domain=transfer'} selected{/if}>Transfer Domains to Us</option>
                                        <option value="cart.php?a=view"{if $iteminfo.url_for_select|default:''=='cart.php?a=view'} selected{/if}>View Cart</option>
                                    </select>
                                    <script>
                                    $(document).ready(function() {
                                        var coreUrlSelect = $('#clientarea-off');
                                        var currentUrl = coreUrlSelect.data('current-url');
                                        if (currentUrl) {
                                            coreUrlSelect.val(currentUrl);
                                        }
                                    });
                                    </script>
                                    <input type="text" name="customurl" id="customurl" class="form-control input-sm" placeholder="Specify anything here to be used as the URL.." {if $iteminfo.urltype|default:''=='customurl'}value="{$iteminfo.url|default:''}"{/if} style="display:{if $iteminfo.urltype|default:''=='customurl'}block{else}none{/if};">
                                </div>
                            </div>
                        </div>
				</div>
				<div class="add__new__menu__form__groups__body section">
					<h5 class="title">Menu Item title</h5>
					<div class="row">
						<div class="col-lg-6 col-12">
							<div class="form-group">
								<label for="title">Custom String title <i data-toggle="tooltip" data-placement="bottom" title="Use the custom title string, translation is not available yet" class="fas fa-info-circle"></i></label>
								<input type="text" name="title" id="title" value="{$iteminfo.title|default:''}" class="form-control input-sm" placeholder="" required>
							</div>
						</div>
						<div class="col-lg-6 col-12">
							<div class="form-group">
								<label for="title">Menu icon, <b>Only icon class</b> Use <a target="_blank" href="https://fontawesome.com/v5/search">FontAwesome</a><i data-toggle="tooltip" data-placement="bottom" title="Use icon for your menu, please not that you need to add only the class ex: fal fa-home" class="fas fa-info-circle"></i></label>
								<div style="position:relative">
								<input type="text" name="css_icon" id="inputGroupIconshufytheme" value="{$iteminfo.css_icon|default:''}" class="form-control input-sm" placeholder="eg. fa-solid fa-house">
								<span style="border-radius: 4px;position: absolute;top: 50%;transform: translateY(-50%);right: 6px;border: 1px solid #e1e7eb;height: 35px;width: 35px;display: flex;align-items: center;justify-content: center;font-size: 15px;" class="icon__display__shufytheme"></span>
								</div>
							</div>
						</div>
						
						<script>
						$(document).ready(function() {
							var inputGroupIcon = $('#inputGroupIconshufytheme');
							if (inputGroupIcon.length) {
								inputGroupIcon.iconpicker({
								title: false, 
								selected: false, 
								defaultValue: false, 
								placement: 'bottom', 
								collision: 'none', 
								animation: true, 
								hideOnSelect: false,
								showFooter: false,
								component: '.icon__display__shufytheme'
							});
							}
						});
						</script>
						<link rel="stylesheet" type="text/css" href="../modules/addons/shufyTheme/assets/apps/fontawesome-iconpicker.min.css" />
						<script type="text/javascript" src="../modules/addons/shufyTheme/assets/apps/fontawesome-iconpicker.min.js"></script>


					</div>
				</div>
				
				<div class="add__new__menu__form__groups__body section">
					<h5 class="title">Menu Item title translation</h5>
					<div role="tabpanel" class="tab-pane coodiv-menu-translations-tabs" id="translations">
						<div class="clear-line-20"></div>
						<div class="panel-group" id="translationpanels" role="tablist" aria-multiselectable="true">
							<div class="row flexrow">
							{foreach from=$languages item=language}
							<div class="col-md-4 col-12">
							<input type="hidden" name="translation_languages[]" value="{$language}">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="heading_{$language}">
									<h4 class="panel-title">
										<a role="button" data-toggle="collapse" data-parent="#translationpanels" href="#{$language}" aria-expanded="true" aria-controls="{$language}">
										{$language|ucfirst}
										</a>
									</h4>
								</div>
								<div id="{$language}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading_{$language}">
									<div class="panel-body">
										<div class="form-horizontal">
											<div class="form-group">
												<label for="translation_title[{$language}]">Item Title in {$language|ucfirst} language <i data-toggle="tooltip" data-placement="bottom" title="Use the custom title string, translation is not available yet" class="fas fa-info-circle"></i></label>
												<input type="text" name="translation_title[{$language}]" class="form-control" id="translation_title[{$language}]" value="{$itemtranslations.title.$language|default:''}" placeholder="">
											</div>
										</div>
									</div>
								</div>
							</div>
							</div>
							{/foreach}
							</div>
						</div>
					</div>
				</div>
				
				<div class="add__new__menu__form__groups__body section">
					<h5 class="title mb-0">Additionel filed for the item</h5>
					<div class="form-group templates__form__control">
					<label for="badge">Alerts numbers  <i data-toggle="tooltip" data-placement="bottom" title="You can show the number of totaldomains as a badge for the item" class="fas fa-info-circle"></i></label>
					<fieldset name="badge" id="badge">
						<div class="radio">
							<label class="template__label">
								<input type="radio" name="badge" value="totalservices" {if $iteminfo.badge|default:''=='totalservices'} checked{/if}>
								Total Products/Services
								<span class="checkmark"><i class="fal fa-check"></i></span>
							</label>
						</div>
						<div class="radio">
							<label class="template__label">
								<input type="radio" name="badge" value="activeservices" {if $iteminfo.badge|default:''=='activeservices'} checked{/if}>
								Active Products/Services
								<span class="checkmark"><i class="fal fa-check"></i></span>
							</label>
						</div>
						<div class="radio">
							<label class="template__label">
								<input type="radio" name="badge" value="totaldomains" {if $iteminfo.badge|default:''=='totaldomains'} checked{/if}>
								Total Domains
								<span class="checkmark"><i class="fal fa-check"></i></span>
							</label>
						</div>
						<div class="radio">
							<label class="template__label">
								<input type="radio" name="badge" value="activedomains" {if $iteminfo.badge|default:''=='activedomains'} checked{/if}>
								Active Domains
								<span class="checkmark"><i class="fal fa-check"></i></span>
							</label>
						</div>
						<div class="radio">
							<label class="template__label">
								<input type="radio" name="badge" value="dueinvoices" {if $iteminfo.badge|default:''=='dueinvoices'} checked{/if}>
								Due Invoices
								<span class="checkmark"><i class="fal fa-check"></i></span>
							</label>
						</div>
						<div class="radio">
							<label class="template__label">
								<input type="radio" name="badge" value="overdueinvoices" {if $iteminfo.badge|default:''=='overdueinvoices'} checked{/if}>
								Overdue Invoices
								<span class="checkmark"><i class="fal fa-check"></i></span>
							</label>
						</div>
						<div class="radio">
							<label class="template__label">
								<input type="radio" name="badge" value="activetickets" {if $iteminfo.badge|default:''=='activetickets'} checked{/if}>
								Active Tickets
								<span class="checkmark"><i class="fal fa-check"></i></span>
							</label>
						</div>
						<div class="radio">
							<label class="template__label">
								<input type="radio" name="badge" value="shoppingcartitems" {if $iteminfo.badge|default:''=='shoppingcartitems'} checked{/if}>
								Shopping Cart Items
								<span class="checkmark"><i class="fal fa-check"></i></span>
							</label>
						</div>
						<div class="radio">
							<label class="template__label">
								<input type="radio" name="badge" value="none" {if $iteminfo.badge|default:''=='none'} checked{/if} >
								None
								<span class="checkmark"><i class="fal fa-check"></i></span>
							</label>
						</div>
					</fieldset>
				</div>
				</div>	
				
				
           </div>
       </div>
	   
       <div class="col-md-4 col-12">
           <div class="add__new__menu__form__groups__sidebar">	
			   <div class="form-group">
					<label for="title">Menu order ID <i data-toggle="tooltip" data-placement="bottom" title="Use the custom title string, translation is not available yet" class="fas fa-info-circle"></i></label>
					<input type="number" name="menuidorder" id="menuidorder" class="form-control input-sm" value="{$iteminfo.reorder|default:''}" required>
				</div>
                <div class="form-group">
					 <label for="accesslevel">Display Rule <i data-toggle="tooltip" data-placement="bottom" title="Assign the currently managed menu to the specific display rule." class="fas fa-info-circle"></i></label>
					  <select name="accesslevel" id="accesslevel" class="form-control input-sm">
						<optgroup label="Common Display Rule">
							<option {if $iteminfo.accesslevel|default:''=='1'} selected{/if} value="1">Always Active</option>
							<option {if $iteminfo.accesslevel|default:''=='2'} selected{/if} value="2">Active for Guest Only</option>
							<option {if $iteminfo.accesslevel|default:''=='3'} selected{/if} value="3">Active for Client Only</option>
							<option {if $iteminfo.accesslevel|default:''=='8'} selected{/if} value="8">Active for Affiliates only</option>
						</optgroup>
						<optgroup label="Active only for clients who have:">
							<option {if $iteminfo.accesslevel|default:''=='4'} selected{/if} value="4">Active Product(s)</option>
							<option {if $iteminfo.accesslevel|default:''=='5'} selected{/if} value="5">Overdue Invoice(s)</option>
							<option {if $iteminfo.accesslevel|default:''=='6'} selected{/if} value="6">Active Ticket(s)</option>
							<option {if $iteminfo.accesslevel|default:''=='7'} selected{/if} value="7">Active Domain(s)</option>
						</optgroup>
					  </select>
                </div>
				<div class="form-group">
					<label for="title">Additional classes <i data-toggle="tooltip" data-placement="bottom" title="Specify classes for this menu item" class="fas fa-info-circle"></i></label>
					<input type="text" name="css_class" id="css_class" class="form-control input-sm" value="{$iteminfo.css_class|default:''}" placeholder="leave this field empty for the default menu classes">
				</div>
				<div class="form-group">
					<label for="title">Additional ID <i data-toggle="tooltip" data-placement="bottom" title="Specify ID for this menu item" class="fas fa-info-circle"></i></label>
					<input type="text" name="css_id" id="css_id" class="form-control input-sm" value="{$iteminfo.css_id|default:''}" placeholder="leave this field empty for the default menu ID">
				</div>
            </div>
      </div>
    </div>
</form>
					
					
<div class="coodiv__whmcs__admin__panel__form__footer__btns">
     <input class="coodiv__whmcs__admin__panel__form__footer__submit" type="submit" name="close" form="editmenuform" value="Save"/>
     <a href="#delete__menu__item" data-toggle="modal" class="coodiv__whmcs__admin__panel__form__footer__submit delete__item">Delete menu</a>
</div>



<div id="delete__menu__item" class="coodiv__whmcs__admin__panel__model modal fade delete__item">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="{$modurl}&action=deleteitem&id={$iteminfo.id|default:''}&groupid={$iteminfo.groupid|default:''}" method="post">
            <div class="coodiv__whmcs__admin__panel__model__header">
                <h4 class="title">Remove menu item completly</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="fal fa-times"></i></button>
            </div>
            <div class="coodiv__whmcs__admin__panel__model__body">
			     <p>You are trying to remove <strong>{$iteminfo.title|default:''}</strong> menus item, <b class="red">this action can not be undone!</b>. Please confirm, to remove <strong>{$iteminfo.title|default:''}</strong> menu completly.</p>
            </div>
            <div class="coodiv__whmcs__admin__panel__model__footer">
				<button type="submit" class="confirm">Delete This Menu</button>
                <button type="button" class="cancel" data-dismiss="modal">Cancel</button>
            </div>
            </form>
        </div>
    </div>
</div>
