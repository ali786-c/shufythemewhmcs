{if $smarty.get.success|default:'' == 1}
<div class="settings__popupalert__coodiv alert alert-success alert-dismissible show" role="alert">
  <span class="alert__progress"></span>
  <span class="icon"><i class="fal fa-check-circle"></i></span>
  <div class="text">
  <strong>Success!</strong> The extension has been activated successfully.
  </div>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	<span aria-hidden="true">&times;</span>
  </button>
</div>
{/if}
{if $smarty.get.success|default:'' == 2}
<div class="settings__popupalert__coodiv alert alert-success alert-dismissible show" role="alert">
  <span class="alert__progress"></span>
  <span class="icon"><i class="fal fa-check-circle"></i></span>
  <div class="text">
  <strong>Success!</strong> The extension has been deactivated successfully.
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
				<h5 class="coodiv__main__hero__title">ShufyTheme Extension Manager</h5>
				<p class="coodiv__main__hero__sub__title">Easily manage, install, update, and control all your Shufytheme extensions from one centralized dashboard, with full control and no technical complexity.</p>
			</div>
			<div class="col-md-7 col-12 btn__container">
				<a target="_blank" href="https://codecanyon.net/user/coodiv/portfolio" class="add__new__group__btn"><i class="fal fa-shopping-cart"></i> Explore Marketplace</a>
			</div>
		</div>
		<ul class="navbar-nav coodiv__main__hero__nav">
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=themeoption">Genaral</a></li>
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=styleoptions">Colors</a></li>
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=typpoptions">Typography</a></li>
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=layoutoptions">Layouts</a></li>
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=sidebaroptions">Sidebar</a></li>
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=footeroptions">Footer</a></li>
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=homepageoptions">Homepage</a></li>
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=listgroup">Menu</a></li> 
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=settingsbackups">Backups</a></li>
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=themehealthcheck">Health</a></li>
		  
		  
		  <li class="nav-item ml-auto active"><a class="nav-link">Extention manager</a></li> 
		</ul>
	</div>
	

	
	<div class="extentions__list__wrapper">
		<div class="row">
		
			<div class="col-md-4 col-12">
				<div class="extentions__list__item {if $shufyTheme_email_template == 'installed'}enabled{else}disabled{/if}">
					<div class="extentions__list__item__thumb">
						<div class="extentions__list__item__thumb__labels">
							
							{if $shufyTheme_email_template == "installed"}
							<span class="label active">Installed</span>
							{if $shufyTheme_email_template_activation == "activated"}
							<span class="label active">Activated</span>
							{else}
							<span class="label danger">Not Activated</span>
							{/if}
							{else}
							<span class="label danger">Not installed</span>
							{/if}
						</div>
						<img src="../modules/addons/shufyTheme/assets/img/extensions/email-template.webp" alt="shufytheme email template">
					</div>
					<div class="extentions__list__item__info">
						<h3>Shufytheme email template</h3>
						<p>A clean, modern, and fully responsive email design for WHMCS, offering improved branding and easy customization.</p>
					</div>
					<div class="extentions__list__item__footer">
						{if $shufyTheme_email_template == "installed"}
						{if $shufyTheme_email_template_activation == "activated"}
						<a href="{$modurl}&action=emailtemplatesettings" class="btn btn-default">Manage extension</a>
						<a href="#deleteemailtemplatelisence" data-toggle="modal" class="btn btn-danger">Delete extension</a>
						{else}
						<a href="{$modurl}&action=activeemailtemplate" class="btn btn-success">Activate the extension</a>
						{/if}
						{else}
						<a target="_blanc" href="https://codecanyon.net/item/shufytheme-email-template-transform-your-whmcs-emails-into-a-branded-experience/61539237" class="btn btn-primary">Purchase the extension</a>
						{/if}
					</div>
				</div>
			</div>
			
			<div class="col-md-4 col-12">
				<div class="extentions__list__item disabled">
					<div class="extentions__list__item__thumb">
						<div class="extentions__list__item__thumb__labels">
							<span class="label danger">Not available yet</span>
						</div>
						<img src="../modules/addons/shufyTheme/assets/img/extensions/advenced-invoices.webp" alt="Shufytheme WHMCS Advanced Invoices">
					</div>
					<div class="extentions__list__item__info">
						<h3>Shufytheme WHMCS Advanced Invoices</h3>
						<p>Enhances WHMCS invoices with modern, customizable, and professional designs that match your brand.</p>
					</div>
					<div class="extentions__list__item__footer">
						<p style="margin: auto">This extension is not available yet</p>
					</div>
				</div>
			</div>
			
			<div class="col-md-4 col-12">
				<div class="extentions__list__item disabled">
					<div class="extentions__list__item__thumb">
						<div class="extentions__list__item__thumb__labels">
							<span class="label danger">Not available yet</span>
						</div>
						<img src="../modules/addons/shufyTheme/assets/img/extensions/advenced-register.webp" alt="Shufytheme WHMCS Advanced Register">
					</div>
					<div class="extentions__list__item__info">
						<h3>Shufytheme WHMCS Advanced Register</h3>
						<p>upgrades the WHMCS signup process with a modern, customizable, and user-friendly registration experience.</p>
					</div>
					<div class="extentions__list__item__footer">
						<p style="margin: auto">This extension is not available yet</p>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">	
			<div class="col-md-4 col-12">
				<div class="extentions__list__item disabled">
					<div class="extentions__list__item__thumb">
						<div class="extentions__list__item__thumb__labels">
							<span class="label danger">Not available yet</span>
						</div>
						<img src="../modules/addons/shufyTheme/assets/img/extensions/page-builder.webp" alt="Shufytheme WHMCS Page Builder">
					</div>
					<div class="extentions__list__item__info">
						<h3>Shufytheme WHMCS Page Builder</h3>
						<p>lets you easily create and customize WHMCS pages with a flexible, drag-and-drop builder that matches your brand.</p>
					</div>
					<div class="extentions__list__item__footer">
						<p style="margin: auto">This extension is not available yet</p>
					</div>
				</div>
			</div>
			
			
			
			
		</div>
	</div>
</div>


<div id="deleteemailtemplatelisence" class="coodiv__whmcs__admin__panel__model modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="{$modurl}&action=deleteemailtemplatelisence" method="post">
				<div class="coodiv__whmcs__admin__panel__model__header">
					<h4 class="title">Delete the ShufyTheme Email template license</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="fal fa-times"></i></button>
				</div>
				<div class="coodiv__whmcs__admin__panel__model__body">
					 <p>You are trying to delete the ShufyTheme Email template license. <b class="red">Please note that this action cannot be undone</b>.  Please confirm that you want to reset and delete the ShufyTheme Email template options and license from this WHMCS installation.</p>
				</div>
				<div class="coodiv__whmcs__admin__panel__model__footer">
					<button type="submit" class="confirm">Delete</button>
					<button type="button" class="cancel" data-dismiss="modal">Close</button>
				</div>
            </form>
        </div>
    </div>
</div>

