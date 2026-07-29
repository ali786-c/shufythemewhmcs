{if $smarty.get.genaralsettingsreset|default:'' == 1}
<div class="settings__popupalert__coodiv alert alert-success alert-dismissible show" role="alert">
  <span class="alert__progress"></span>
  <span class="icon"><i class="fal fa-check-circle"></i></span>
  <div class="text">
  <strong>Success!</strong> Shufytheme Colors settings options has been reset successfully.
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
  <strong>Success!</strong> Shufytheme Colors settings options has been saved successfully.
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
				<h5 class="coodiv__main__hero__title">Shufy Theme Styles & colors settings</h5>
				<p class="coodiv__main__hero__sub__title">You do not need to create complicated WHMCS hooks to create or edit menus anymore, Coodiv Primary Menu manager gives you convenient options to set up your theme main navigation.</p>
			</div>
			<div class="col-md-7 col-12 btn__container">
				<a href="#exportpageoptions" data-toggle="modal" class="add__new__group__btn"><i class="fas fa-inbox-out"></i>Export Options</a>
				<a href="#importpageoptions" data-toggle="modal" class="add__new__group__btn"><i class="fas fa-inbox-in"></i>Import Options</a>
				<a href="#resetpageoptions" data-toggle="modal" class="add__new__group__btn cancel"><i class="fas fa-redo-alt"></i>Reset Options</a>
			</div>
		</div>
	
		<ul class="navbar-nav coodiv__main__hero__nav">
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=themeoption">Genaral</a></li>
		  <li class="nav-item active"><a class="nav-link">Colors</a></li>
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
	<form id="applythemecolor" class="full__fieldset__area default__form__panel__cart coodiv__whmcs__admin__panel__form shufytheme__ajax__save" action="{$modurl}&action=applythemecolor" method="post">
		<input type="hidden" name="itemid" value="1">
		
		<div class="section">
			<h5 class="title">Dark & light mode settings</h5>
			<div class="row">
				<div class="col-md-6 col-12">
					<div class="form-group templates__form__control">
						<label for="darkmodefault">Dark mode  <i data-toggle="tooltip" data-placement="bottom" title="tick/enable this field to Active dark mode in website by default" class="fas fa-info-circle"></i></label>
						<fieldset name="darkmodefault" id="darkmodefault">
							<div class="radio">
							<label class="template__label">
								<input type="checkbox" name="darkmodefault" id="darkmodefault" value="activated" {if $themecolorsetting.darkmodefault|default:''=='activated'}checked{/if}>
								Active dark mode in website by default
								<span class="checkmark"><i class="fal fa-check"></i></span>
						<div class="form-group">
							<label for="name">Main Background color </label>
							<input class="form-control color-picker" id="backroundone" name="backroundone" {if $themecolorsetting.backroundone|default:'' == null}value="#fcfdfe"{else}value="{$themecolorsetting.backroundone|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 2 Background color </label>
							<input class="form-control color-picker" id="backroundtwo" name="backroundtwo" {if $themecolorsetting.backroundtwo|default:'' == null}value="#f5faff"{else}value="{$themecolorsetting.backroundtwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 3 Background color </label>
							<input class="form-control color-picker" id="backroundtree" name="backroundtree" {if $themecolorsetting.backroundtree|default:'' == null}value="#cfecf4"{else}value="{$themecolorsetting.backroundtree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 4 Background color </label>
							<input class="form-control color-picker" id="backroundfour" name="backroundfour" {if $themecolorsetting.backroundfour|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.backroundfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 5 Background color </label>
							<input class="form-control color-picker" id="backroundfive" name="backroundfive" {if $themecolorsetting.backroundfive|default:'' == null}value="#23d4eb"{else}value="{$themecolorsetting.backroundfive|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 6 Background color </label>
							<input class="form-control color-picker" id="backroundsix" name="backroundsix" {if $themecolorsetting.backroundsix|default:'' == null}value="#c6e3eb"{else}value="{$themecolorsetting.backroundsix|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 7 Background color </label>
							<input class="form-control color-picker" id="backroundsaven" name="backroundsaven" {if $themecolorsetting.backroundsaven|default:'' == null}value="#fff"{else}value="{$themecolorsetting.backroundsaven|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 8 Background color </label>
							<input class="form-control color-picker" id="backroundeight" name="backroundeight" {if $themecolorsetting.backroundeight|default:'' == null}value="#f4fcff"{else}value="{$themecolorsetting.backroundeight|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 9 Background color </label>
							<input class="form-control color-picker" id="backroundnine" name="backroundnine" {if $themecolorsetting.backroundnine|default:'' == null}value="#13274b"{else}value="{$themecolorsetting.backroundnine|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 10 Background color </label>
							<input class="form-control color-picker" id="backroundten" name="backroundten" {if $themecolorsetting.backroundten|default:'' == null}value="#bbe4f0"{else}value="{$themecolorsetting.backroundten|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 11 Background color </label>
							<input class="form-control color-picker" id="backroundeleven" name="backroundeleven" {if $themecolorsetting.backroundeleven|default:'' == null}value="#0cbcd3"{else}value="{$themecolorsetting.backroundeleven|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 12 Background color </label>
							<input class="form-control color-picker" id="backroundtwelve" name="backroundtwelve" {if $themecolorsetting.backroundtwelve|default:'' == null}value="#0bb7d0"{else}value="{$themecolorsetting.backroundtwelve|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 13 Background color </label>
							<input class="form-control color-picker" id="backroundthirteen" name="backroundthirteen" {if $themecolorsetting.backroundthirteen|default:'' == null}value="#0aafc5"{else}value="{$themecolorsetting.backroundthirteen|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 14 Background color </label>
							<input class="form-control color-picker" id="backroundfourteen" name="backroundfourteen" {if $themecolorsetting.backroundfourteen|default:'' == null}value="#fff"{else}value="{$themecolorsetting.backroundfourteen|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 15 Background color </label>
							<input class="form-control color-picker" id="backroundfifteen" name="backroundfifteen" {if $themecolorsetting.backroundfifteen|default:'' == null}value="#834ce4"{else}value="{$themecolorsetting.backroundfifteen|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Primary button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background</label>
							<input class="form-control color-picker" id="btnprimarybg" name="btnprimarybg" {if $themecolorsetting.btnprimarybg|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.btnprimarybg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border</label>
							<input class="form-control color-picker" id="btnprimaryborder" name="btnprimaryborder" {if $themecolorsetting.btnprimaryborder|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.btnprimaryborder|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color</label>
							<input class="form-control color-picker" id="btnprimarycolor" name="btnprimarycolor" {if $themecolorsetting.btnprimarycolor|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimarycolor|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background hover</label>
							<input class="form-control color-picker" id="btnprimarybghover" name="btnprimarybghover" {if $themecolorsetting.btnprimarybghover|default:'' == null}value="#09aabf"{else}value="{$themecolorsetting.btnprimarybghover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border hover</label>
							<input class="form-control color-picker" id="btnprimaryborderhover" name="btnprimaryborderhover" {if $themecolorsetting.btnprimaryborderhover|default:'' == null}value="#09aabf"{else}value="{$themecolorsetting.btnprimaryborderhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color hover</label>
							<input class="form-control color-picker" id="btnprimarycolorhover" name="btnprimarycolorhover" {if $themecolorsetting.btnprimarycolorhover|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimarycolorhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Primary Light button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary Light btn background</label>
							<input class="form-control color-picker" id="btnprimarylightbg" name="btnprimarylightbg" {if $themecolorsetting.btnprimarylightbg|default:'' == null}value="#f9f9f9"{else}value="{$themecolorsetting.btnprimarylightbg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary Light btn border</label>
							<input class="form-control color-picker" id="btnprimarylightborder" name="btnprimarylightborder" {if $themecolorsetting.btnprimarylightborder|default:'' == null}value="#f9f9f9"{else}value="{$themecolorsetting.btnprimarylightborder|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary Light btn color</label>
							<input class="form-control color-picker" id="btnprimarylightcolor" name="btnprimarylightcolor" {if $themecolorsetting.btnprimarylightcolor|default:'' == null}value="#5792a2"{else}value="{$themecolorsetting.btnprimarylightcolor|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary Light btn background hover</label>
							<input class="form-control color-picker" id="btnprimarylightbghover" name="btnprimarylightbghover" {if $themecolorsetting.btnprimarylightbghover|default:'' == null}value="#f4f4f4"{else}value="{$themecolorsetting.btnprimarylightbghover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary Light btn border hover</label>
							<input class="form-control color-picker" id="btnprimarylightborderhover" name="btnprimarylightborderhover" {if $themecolorsetting.btnprimarylightborderhover|default:'' == null}value="#f4f4f4"{else}value="{$themecolorsetting.btnprimarylightborderhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary Light btn color hover</label>
							<input class="form-control color-picker" id="btnprimarylightcolorhover" name="btnprimarylightcolorhover" {if $themecolorsetting.btnprimarylightcolorhover|default:'' == null}value="#7e8299"{else}value="{$themecolorsetting.btnprimarylightcolorhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Default button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Default btn background</label>
							<input class="form-control color-picker" id="btndefaultbg" name="btndefaultbg" {if $themecolorsetting.btndefaultbg|default:'' == null}value="#f9f9f9"{else}value="{$themecolorsetting.btndefaultbg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Default btn border</label>
							<input class="form-control color-picker" id="btndefaultborder" name="btndefaultborder" {if $themecolorsetting.btndefaultborder|default:'' == null}value="#f9f9f9"{else}value="{$themecolorsetting.btndefaultborder|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Default btn color</label>
							<input class="form-control color-picker" id="btndefaultcolor" name="btndefaultcolor" {if $themecolorsetting.btndefaultcolor|default:'' == null}value="#7e8299"{else}value="{$themecolorsetting.btndefaultcolor|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Default btn background hover</label>
							<input class="form-control color-picker" id="btndefaultbghover" name="btndefaultbghover" {if $themecolorsetting.btndefaultbghover|default:'' == null}value="#f4f4f4"{else}value="{$themecolorsetting.btndefaultbghover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Default btn border hover</label>
							<input class="form-control color-picker" id="btndefaultborderhover" name="btndefaultborderhover" {if $themecolorsetting.btndefaultborderhover|default:'' == null}value="#f4f4f4"{else}value="{$themecolorsetting.btndefaultborderhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Default btn color hover</label>
							<input class="form-control color-picker" id="btndefaultcolorhover" name="btndefaultcolorhover" {if $themecolorsetting.btndefaultcolorhover|default:'' == null}value="#7e8299"{else}value="{$themecolorsetting.btndefaultcolorhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Primary outline button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary outline btn background</label>
							<input class="form-control color-picker" id="btnprimaryoutlinebg" name="btnprimaryoutlinebg" {if $themecolorsetting.btnprimaryoutlinebg|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimaryoutlinebg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary outline btn border</label>
							<input class="form-control color-picker" id="btnprimaryoutlineborder" name="btnprimaryoutlineborder" {if $themecolorsetting.btnprimaryoutlineborder|default:'' == null}value="#09aabf"{else}value="{$themecolorsetting.btnprimaryoutlineborder|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary outline btn color</label>
							<input class="form-control color-picker" id="btnprimaryoutlinecolor" name="btnprimaryoutlinecolor" {if $themecolorsetting.btnprimaryoutlinecolor|default:'' == null}value="#09aabf"{else}value="{$themecolorsetting.btnprimaryoutlinecolor|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary outline btn background hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinebghover" name="btnprimaryoutlinebghover" {if $themecolorsetting.btnprimaryoutlinebghover|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.btnprimaryoutlinebghover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary outline btn border hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlineborderhover" name="btnprimaryoutlineborderhover" {if $themecolorsetting.btnprimaryoutlineborderhover|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.btnprimaryoutlineborderhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary outline btn color hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinecolorhover" name="btnprimaryoutlinecolorhover" {if $themecolorsetting.btnprimaryoutlinecolorhover|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimaryoutlinecolorhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">primary outline white button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary outline white btn background</label>
							<input class="form-control color-picker" id="btnprimaryoutlinewhitebg" name="btnprimaryoutlinewhitebg" {if $themecolorsetting.btnprimaryoutlinewhitebg|default:'' == null}value="transparent"{else}value="{$themecolorsetting.btnprimaryoutlinewhitebg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary outline white btn border</label>
							<input class="form-control color-picker" id="btnprimaryoutlinewhiteborder" name="btnprimaryoutlinewhiteborder" {if $themecolorsetting.btnprimaryoutlinewhiteborder|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimaryoutlinewhiteborder|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary outline white btn color</label>
							<input class="form-control color-picker" id="btnprimaryoutlinewhitecolor" name="btnprimaryoutlinewhitecolor" {if $themecolorsetting.btnprimaryoutlinewhitecolor|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimaryoutlinewhitecolor|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary outline white btn background hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinewhitebghover" name="btnprimaryoutlinewhitebghover" {if $themecolorsetting.btnprimaryoutlinewhitebghover|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimaryoutlinewhitebghover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary outline white btn border hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinewhiteborderhover" name="btnprimaryoutlinewhiteborderhover" {if $themecolorsetting.btnprimaryoutlinewhiteborderhover|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimaryoutlinewhiteborderhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary outline white btn color hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinewhitecolorhover" name="btnprimaryoutlinewhitecolorhover" {if $themecolorsetting.btnprimaryoutlinewhitecolorhover|default:'' == null}value="#0e1019"{else}value="{$themecolorsetting.btnprimaryoutlinewhitecolorhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Primary outline light button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary outline light btn background</label>
							<input class="form-control color-picker" id="btnprimaryoutlinelightbg" name="btnprimaryoutlinelightbg" {if $themecolorsetting.btnprimaryoutlinelightbg|default:'' == null}value="transparent"{else}value="{$themecolorsetting.btnprimaryoutlinelightbg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary outline light btn border</label>
							<input class="form-control color-picker" id="btnprimaryoutlinelightborder" name="btnprimaryoutlinelightborder" {if $themecolorsetting.btnprimaryoutlinelightborder|default:'' == null}value="#16c2d8"{else}value="{$themecolorsetting.btnprimaryoutlinelightborder|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary outline light btn color</label>
							<input class="form-control color-picker" id="btnprimaryoutlinelightcolor" name="btnprimaryoutlinelightcolor" {if $themecolorsetting.btnprimaryoutlinelightcolor|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimaryoutlinelightcolor|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary outline light btn background hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinelightbghover" name="btnprimaryoutlinelightbghover" {if $themecolorsetting.btnprimaryoutlinelightbghover|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimaryoutlinelightbghover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary outline light btn border hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinelightborderhover" name="btnprimaryoutlinelightborderhover" {if $themecolorsetting.btnprimaryoutlinelightborderhover|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimaryoutlinelightborderhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary outline light btn color hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinelightcolorhover" name="btnprimaryoutlinelightcolorhover" {if $themecolorsetting.btnprimaryoutlinelightcolorhover|default:'' == null}value="#0e1019"{else}value="{$themecolorsetting.btnprimaryoutlinelightcolorhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">light button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light btn background</label>
							<input class="form-control color-picker" id="btnlightbg" name="btnlightbg" {if $themecolorsetting.btnlightbg|default:'' == null}value="#f9f9f9"{else}value="{$themecolorsetting.btnlightbg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light btn border</label>
							<input class="form-control color-picker" id="btnlightborder" name="btnlightborder" {if $themecolorsetting.btnlightborder|default:'' == null}value="#f9f9f9"{else}value="{$themecolorsetting.btnlightborder|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light btn color</label>
							<input class="form-control color-picker" id="btnlightcolor" name="btnlightcolor" {if $themecolorsetting.btnlightcolor|default:'' == null}value="#7e8299"{else}value="{$themecolorsetting.btnlightcolor|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light btn background hover</label>
							<input class="form-control color-picker" id="btnlightbghover" name="btnlightbghover" {if $themecolorsetting.btnlightbghover|default:'' == null}value="#f4f4f4"{else}value="{$themecolorsetting.btnlightbghover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light btn border hover</label>
							<input class="form-control color-picker" id="btnlightborderhover" name="btnlightborderhover" {if $themecolorsetting.btnlightborderhover|default:'' == null}value="#f4f4f4"{else}value="{$themecolorsetting.btnlightborderhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light btn color hover</label>
							<input class="form-control color-picker" id="btnlightcolorhover" name="btnlightcolorhover" {if $themecolorsetting.btnlightcolorhover|default:'' == null}value="#7e8299"{else}value="{$themecolorsetting.btnlightcolorhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">lighter button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">lighter btn background</label>
							<input class="form-control color-picker" id="btnlighterbg" name="btnlighterbg" {if $themecolorsetting.btnlighterbg|default:'' == null}value="#fcfcfc"{else}value="{$themecolorsetting.btnlighterbg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">lighter btn border</label>
							<input class="form-control color-picker" id="btnlighterborder" name="btnlighterborder" {if $themecolorsetting.btnlighterborder|default:'' == null}value="#fcfcfc"{else}value="{$themecolorsetting.btnlighterborder|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">lighter btn color</label>
							<input class="form-control color-picker" id="btnlightercolor" name="btnlightercolor" {if $themecolorsetting.btnlightercolor|default:'' == null}value="#7e8299"{else}value="{$themecolorsetting.btnlightercolor|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">lighter btn background hover</label>
							<input class="form-control color-picker" id="btnlighterbghover" name="btnlighterbghover" {if $themecolorsetting.btnlighterbghover|default:'' == null}value="#f9f9f9"{else}value="{$themecolorsetting.btnlighterbghover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">lighter btn border hover</label>
							<input class="form-control color-picker" id="btnlighterborderhover" name="btnlighterborderhover" {if $themecolorsetting.btnlighterborderhover|default:'' == null}value="#f9f9f9"{else}value="{$themecolorsetting.btnlighterborderhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">lighter btn color hover</label>
							<input class="form-control color-picker" id="btnlightercolorhover" name="btnlightercolorhover" {if $themecolorsetting.btnlightercolorhover|default:'' == null}value="#7e8299"{else}value="{$themecolorsetting.btnlightercolorhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Texts Colors <small>Headings, Texts, Borders, Tags Colors & More ...</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Headings Text Color </label>
							<input class="form-control color-picker" id="textstagscoloroneheading" name="textstagscoloroneheading" {if $themecolorsetting.textstagscoloroneheading|default:'' == null}value="#161c2d"{else}value="{$themecolorsetting.textstagscoloroneheading|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Headings Hover Text Color </label>
							<input class="form-control color-picker" id="textstagscoloroneheadinghover" name="textstagscoloroneheadinghover" {if $themecolorsetting.textstagscoloroneheadinghover|default:'' == null}value="#5b6278"{else}value="{$themecolorsetting.textstagscoloroneheadinghover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Headings Text Color <strong>gray</strong> </label>
							<input class="form-control color-picker" id="textstagscoloroneheadinggray" name="textstagscoloroneheadinggray" {if $themecolorsetting.textstagscoloroneheadinggray|default:'' == null}value="#b5b5c3"{else}value="{$themecolorsetting.textstagscoloroneheadinggray|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sub Headings Text Color</label>
							<input class="form-control color-picker" id="textstagscoloronesubheading" name="textstagscoloronesubheading" {if $themecolorsetting.textstagscoloronesubheading|default:'' == null}value="#a6adc2"{else}value="{$themecolorsetting.textstagscoloronesubheading|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Color Texts</label>
							<input class="form-control color-picker" id="textstagscoloronetextcolor" name="textstagscoloronetextcolor" {if $themecolorsetting.textstagscoloronetextcolor|default:'' == null}value="#161c2d"{else}value="{$themecolorsetting.textstagscoloronetextcolor|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Color Texts Opacity</label>
							<input class="form-control color-picker" id="textstagscoloronetextcoloropacity" name="textstagscoloronetextcoloropacity" {if $themecolorsetting.textstagscoloronetextcoloropacity|default:'' == null}value="#8b93a9"{else}value="{$themecolorsetting.textstagscoloronetextcoloropacity|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Border Color</label>
							<input class="form-control color-picker" id="textstagscoloroneborder" name="textstagscoloroneborder" {if $themecolorsetting.textstagscoloroneborder|default:'' == null}value="#e7e9ed"{else}value="{$themecolorsetting.textstagscoloroneborder|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Border Color Light</label>
							<input class="form-control color-picker" id="textstagscoloroneborderlight" name="textstagscoloroneborderlight" {if $themecolorsetting.textstagscoloroneborderlight|default:'' == null}value="#eceff9"{else}value="{$themecolorsetting.textstagscoloroneborderlight|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Link Color</label>
							<input class="form-control color-picker" id="textstagscoloronelink" name="textstagscoloronelink" {if $themecolorsetting.textstagscoloronelink|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.textstagscoloronelink|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Link Hover Color</label>
							<input class="form-control color-picker" id="textstagscoloronelinkhover" name="textstagscoloronelinkhover" {if $themecolorsetting.textstagscoloronelinkhover|default:'' == null}value="#088d9f"{else}value="{$themecolorsetting.textstagscoloronelinkhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Sidebar colors Schemes <small>Default</small></h6>
				<div class="row">
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar background </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultonebg" name="sidebarcolorsdefaultonebg" {if $themecolorsetting.sidebarcolorsdefaultonebg|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdefaultonebg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar extend button background </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultoneextendbtnbg" name="sidebarcolorsdefaultoneextendbtnbg" {if $themecolorsetting.sidebarcolorsdefaultoneextendbtnbg|default:'' == null}value="#f6f5fb"{else}value="{$themecolorsetting.sidebarcolorsdefaultoneextendbtnbg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar item background </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultoneitembg" name="sidebarcolorsdefaultoneitembg" {if $themecolorsetting.sidebarcolorsdefaultoneitembg|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdefaultoneitembg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar item hover background </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultoneitemhoverbg" name="sidebarcolorsdefaultoneitemhoverbg" {if $themecolorsetting.sidebarcolorsdefaultoneitemhoverbg|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdefaultoneitemhoverbg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar item color <strong>text</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultoneitemtext" name="sidebarcolorsdefaultoneitemtext" {if $themecolorsetting.sidebarcolorsdefaultoneitemtext|default:'' == null}value="#161c2d"{else}value="{$themecolorsetting.sidebarcolorsdefaultoneitemtext|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar item color <strong>icon</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultoneitemicon" name="sidebarcolorsdefaultoneitemicon" {if $themecolorsetting.sidebarcolorsdefaultoneitemicon|default:'' == null}value="#161c2d"{else}value="{$themecolorsetting.sidebarcolorsdefaultoneitemicon|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar item hover color <strong>text</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultoneitemtexthover" name="sidebarcolorsdefaultoneitemtexthover" {if $themecolorsetting.sidebarcolorsdefaultoneitemtexthover|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.sidebarcolorsdefaultoneitemtexthover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar item hover color <strong>icon</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultoneitemiconhover" name="sidebarcolorsdefaultoneitemiconhover" {if $themecolorsetting.sidebarcolorsdefaultoneitemiconhover|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.sidebarcolorsdefaultoneitemiconhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar dropdown background </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultonedropdownbg" name="sidebarcolorsdefaultonedropdownbg" {if $themecolorsetting.sidebarcolorsdefaultonedropdownbg|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdefaultonedropdownbg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar dropdown title color </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultonedropdowntitle" name="sidebarcolorsdefaultonedropdowntitle" {if $themecolorsetting.sidebarcolorsdefaultonedropdowntitle|default:'' == null}value="#18191a"{else}value="{$themecolorsetting.sidebarcolorsdefaultonedropdowntitle|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar dropdown item Background </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultonedropdownitembg" name="sidebarcolorsdefaultonedropdownitembg" {if $themecolorsetting.sidebarcolorsdefaultonedropdownitembg|default:'' == null}value="#f9f8fa"{else}value="{$themecolorsetting.sidebarcolorsdefaultonedropdownitembg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar dropdown item color <strong>text</strong> </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultonedropdownitemtext" name="sidebarcolorsdefaultonedropdownitemtext" {if $themecolorsetting.sidebarcolorsdefaultonedropdownitemtext|default:'' == null}value="#758085"{else}value="{$themecolorsetting.sidebarcolorsdefaultonedropdownitemtext|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar dropdown item color <strong>icon</strong> </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultonedropdownitemicon" name="sidebarcolorsdefaultonedropdownitemicon" {if $themecolorsetting.sidebarcolorsdefaultonedropdownitemicon|default:'' == null}value="#758085"{else}value="{$themecolorsetting.sidebarcolorsdefaultonedropdownitemicon|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar dropdown item hover color <strong>text</strong> </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultonedropdownitemtexthover" name="sidebarcolorsdefaultonedropdownitemtexthover" {if $themecolorsetting.sidebarcolorsdefaultonedropdownitemtexthover|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.sidebarcolorsdefaultonedropdownitemtexthover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar dropdown item hover color <strong>icon</strong> </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultonedropdownitemiconhover" name="sidebarcolorsdefaultonedropdownitemiconhover" {if $themecolorsetting.sidebarcolorsdefaultonedropdownitemiconhover|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.sidebarcolorsdefaultonedropdownitemiconhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Sidebar colors Schemes <small>Dark</small></h6>
				<div class="row">
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar background </label>
							<input class="form-control color-picker" id="sidebarcolorsdarkonebg" name="sidebarcolorsdarkonebg" {if $themecolorsetting.sidebarcolorsdarkonebg|default:'' == null}value="#151718"{else}value="{$themecolorsetting.sidebarcolorsdarkonebg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar extend button background </label>
							<input class="form-control color-picker" id="sidebarcolorsdarkoneextendbtnbg" name="sidebarcolorsdarkoneextendbtnbg" {if $themecolorsetting.sidebarcolorsdarkoneextendbtnbg|default:'' == null}value="#2d3031"{else}value="{$themecolorsetting.sidebarcolorsdarkoneextendbtnbg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar item background </label>
							<input class="form-control color-picker" id="sidebarcolorsdarkoneitembg" name="sidebarcolorsdarkoneitembg" {if $themecolorsetting.sidebarcolorsdarkoneitembg|default:'' == null}value="#2d3031"{else}value="{$themecolorsetting.sidebarcolorsdarkoneitembg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar item hover background </label>
							<input class="form-control color-picker" id="sidebarcolorsdarkoneitemhoverbg" name="sidebarcolorsdarkoneitemhoverbg" {if $themecolorsetting.sidebarcolorsdarkoneitemhoverbg|default:'' == null}value="#2d3031"{else}value="{$themecolorsetting.sidebarcolorsdarkoneitemhoverbg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar item color <strong>text</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdarkoneitemtext" name="sidebarcolorsdarkoneitemtext" {if $themecolorsetting.sidebarcolorsdarkoneitemtext|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdarkoneitemtext|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar item color <strong>icon</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdarkoneitemicon" name="sidebarcolorsdarkoneitemicon" {if $themecolorsetting.sidebarcolorsdarkoneitemicon|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdarkoneitemicon|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar item hover color <strong>text</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdarkoneitemtexthover" name="sidebarcolorsdarkoneitemtexthover" {if $themecolorsetting.sidebarcolorsdarkoneitemtexthover|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.sidebarcolorsdarkoneitemtexthover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar item hover color <strong>icon</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdarkoneitemiconhover" name="sidebarcolorsdarkoneitemiconhover" {if $themecolorsetting.sidebarcolorsdarkoneitemiconhover|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.sidebarcolorsdarkoneitemiconhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar dropdown background </label>
							<input class="form-control color-picker" id="sidebarcolorsdarkonedropdownbg" name="sidebarcolorsdarkonedropdownbg" {if $themecolorsetting.sidebarcolorsdarkonedropdownbg|default:'' == null}value="#0e0e0f"{else}value="{$themecolorsetting.sidebarcolorsdarkonedropdownbg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar dropdown title color </label>
							<input class="form-control color-picker" id="sidebarcolorsdarkonedropdowntitle" name="sidebarcolorsdarkonedropdowntitle" {if $themecolorsetting.sidebarcolorsdarkonedropdowntitle|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdarkonedropdowntitle|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar dropdown item Background </label>
							<input class="form-control color-picker" id="sidebarcolorsdarkonedropdownitembg" name="sidebarcolorsdarkonedropdownitembg" {if $themecolorsetting.sidebarcolorsdarkonedropdownitembg|default:'' == null}value="#1a1a1c"{else}value="{$themecolorsetting.sidebarcolorsdarkonedropdownitembg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar dropdown item color <strong>text</strong> </label>
							<input class="form-control color-picker" id="sidebarcolorsdarkonedropdownitemtext" name="sidebarcolorsdarkonedropdownitemtext" {if $themecolorsetting.sidebarcolorsdarkonedropdownitemtext|default:'' == null}value="#758085"{else}value="{$themecolorsetting.sidebarcolorsdarkonedropdownitemtext|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar dropdown item color <strong>icon</strong> </label>
							<input class="form-control color-picker" id="sidebarcolorsdarkonedropdownitemicon" name="sidebarcolorsdarkonedropdownitemicon" {if $themecolorsetting.sidebarcolorsdarkonedropdownitemicon|default:'' == null}value="#758085"{else}value="{$themecolorsetting.sidebarcolorsdarkonedropdownitemicon|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar dropdown item color <strong>text</strong> </label>
							<input class="form-control color-sidebarcolorsdarkonedropdownitemtexthover" id="sidebarcolorsdarkonedropdownitemtexthover" name="sidebarcolorsdarkonedropdownitemtexthover" {if $themecolorsetting.sidebarcolorsdarkonedropdownitemtexthover|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdarkonedropdownitemiconhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar dropdown item color <strong>icon</strong> </label>
							<input class="form-control color-picker" id="sidebarcolorsdarkonedropdownitemiconhover" name="sidebarcolorsdarkonedropdownitemiconhover" {if $themecolorsetting.sidebarcolorsdarkonedropdownitemiconhover|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdarkonedropdownitemiconhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>Primary</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">primary background </label>
							<input class="form-control color-picker" id="alertbgprimary" name="alertbgprimary" {if $themecolorsetting.alertbgprimary|default:'' == null}value="#e2e1f7"{else}value="{$themecolorsetting.alertbgprimary|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">primary color </label>
							<input class="form-control color-picker" id="alertcolorprimary" name="alertcolorprimary" {if $themecolorsetting.alertcolorprimary|default:'' == null}value="#473bf0"{else}value="{$themecolorsetting.alertcolorprimary|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>secondary</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">secondary background </label>
							<input class="form-control color-picker" id="alertbgsecondary" name="alertbgsecondary" {if $themecolorsetting.alertbgsecondary|default:'' == null}value="#f9f9f9"{else}value="{$themecolorsetting.alertbgsecondary|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">secondary color </label>
							<input class="form-control color-picker" id="alertcolorsecondary" name="alertcolorsecondary" {if $themecolorsetting.alertcolorsecondary|default:'' == null}value="#7e8299"{else}value="{$themecolorsetting.alertcolorsecondary|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>success</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">success background </label>
							<input class="form-control color-picker" id="alertbgsuccess" name="alertbgsuccess" {if $themecolorsetting.alertbgsuccess|default:'' == null}value="#e8fff3"{else}value="{$themecolorsetting.alertbgsuccess|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">success color </label>
							<input class="form-control color-picker" id="alertcolorsuccess" name="alertcolorsuccess" {if $themecolorsetting.alertcolorsuccess|default:'' == null}value="#50cd89"{else}value="{$themecolorsetting.alertcolorsuccess|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>danger</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">danger background </label>
							<input class="form-control color-picker" id="alertbgdanger" name="alertbgdanger" {if $themecolorsetting.alertbgdanger|default:'' == null}value="#f7d4d6"{else}value="{$themecolorsetting.alertbgdanger|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">danger color </label>
							<input class="form-control color-picker" id="alertcolordanger" name="alertcolordanger" {if $themecolorsetting.alertcolordanger|default:'' == null}value="#d92632"{else}value="{$themecolorsetting.alertcolordanger|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>warning</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">warning background </label>
							<input class="form-control color-picker" id="alertbgwarning" name="alertbgwarning" {if $themecolorsetting.alertbgwarning|default:'' == null}value="#fdf2e2"{else}value="{$themecolorsetting.alertbgwarning|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">warning color </label>
							<input class="form-control color-picker" id="alertcolorwarning" name="alertcolorwarning" {if $themecolorsetting.alertcolorwarning|default:'' == null}value="#f0ad4e"{else}value="{$themecolorsetting.alertcolorwarning|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>info</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">info background </label>
							<input class="form-control color-picker" id="alertbginfo" name="alertbginfo" {if $themecolorsetting.alertbginfo|default:'' == null}value="#c4e7f2"{else}value="{$themecolorsetting.alertbginfo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">info color </label>
							<input class="form-control color-picker" id="alertcolorinfo" name="alertcolorinfo" {if $themecolorsetting.alertcolorinfo|default:'' == null}value="#4aadcb"{else}value="{$themecolorsetting.alertcolorinfo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>light</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light background </label>
							<input class="form-control color-picker" id="alertbglight" name="alertbglight" {if $themecolorsetting.alertbglight|default:'' == null}value="#f8f9fa"{else}value="{$themecolorsetting.alertbglight|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light color </label>
							<input class="form-control color-picker" id="alertcolorlight" name="alertcolorlight" {if $themecolorsetting.alertcolorlight|default:'' == null}value="#212529"{else}value="{$themecolorsetting.alertcolorlight|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>dark</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">dark background </label>
							<input class="form-control color-picker" id="alertbgdark" name="alertbgdark" {if $themecolorsetting.alertbgdark|default:'' == null}value="#343a40"{else}value="{$themecolorsetting.alertbgdark|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">dark color </label>
							<input class="form-control color-picker" id="alertcolordark" name="alertcolordark" {if $themecolorsetting.alertcolordark|default:'' == null}value="#fff"{else}value="{$themecolorsetting.alertcolordark|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			
			
			
		</div>
		
		
		<div class="section {if $themecolorsetting.dafaultthemecolor|default:''=='theme-style-two'}d-block{else}d-none{/if}" id="custom-colors-schemes-two">
			<h5 class="title">Custom Green Theme Color Schemes</h5>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Backgrounds Colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Main Background color </label>
							<input class="form-control color-picker" id="backroundonetwo" name="backroundonetwo" {if $themecolorsetting.backroundonetwo|default:'' == null}value="#fcfdfe"{else}value="{$themecolorsetting.backroundonetwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 2 Background color </label>
							<input class="form-control color-picker" id="backroundtwotwo" name="backroundtwotwo" {if $themecolorsetting.backroundtwotwo|default:'' == null}value="#f5fffb"{else}value="{$themecolorsetting.backroundtwotwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 3 Background color </label>
							<input class="form-control color-picker" id="backroundtreetwo" name="backroundtreetwo" {if $themecolorsetting.backroundtreetwo|default:'' == null}value="#d7f8f2"{else}value="{$themecolorsetting.backroundtreetwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 4 Background color </label>
							<input class="form-control color-picker" id="backroundfourtwo" name="backroundfourtwo" {if $themecolorsetting.backroundfourtwo|default:'' == null}value="#84c0b5"{else}value="{$themecolorsetting.backroundfourtwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 5 Background color </label>
							<input class="form-control color-picker" id="backroundfivetwo" name="backroundfivetwo" {if $themecolorsetting.backroundfivetwo|default:'' == null}value="#6aa298"{else}value="{$themecolorsetting.backroundfivetwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 6 Background color </label>
							<input class="form-control color-picker" id="backroundsixtwo" name="backroundsixtwo" {if $themecolorsetting.backroundsixtwo|default:'' == null}value="#cae6e1"{else}value="{$themecolorsetting.backroundsixtwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 7 Background color </label>
							<input class="form-control color-picker" id="backroundsaventwo" name="backroundsaventwo" {if $themecolorsetting.backroundsaventwo|default:'' == null}value="#fff"{else}value="{$themecolorsetting.backroundsaventwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 8 Background color </label>
							<input class="form-control color-picker" id="backroundeighttwo" name="backroundeighttwo" {if $themecolorsetting.backroundeighttwo|default:'' == null}value="#f2fdfb"{else}value="{$themecolorsetting.backroundeighttwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 9 Background color </label>
							<input class="form-control color-picker" id="backroundninetwo" name="backroundninetwo" {if $themecolorsetting.backroundninetwo|default:'' == null}value="#06352d"{else}value="{$themecolorsetting.backroundninetwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 10 Background color </label>
							<input class="form-control color-picker" id="backroundtentwo" name="backroundtentwo" {if $themecolorsetting.backroundtentwo|default:'' == null}value="#cae8e2"{else}value="{$themecolorsetting.backroundtentwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 11 Background color </label>
							<input class="form-control color-picker" id="backroundeleventwo" name="backroundeleventwo" {if $themecolorsetting.backroundeleventwo|default:'' == null}value="#30a18d"{else}value="{$themecolorsetting.backroundeleventwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 12 Background color </label>
							<input class="form-control color-picker" id="backroundtwelvetwo" name="backroundtwelvetwo" {if $themecolorsetting.backroundtwelvetwo|default:'' == null}value="#3dac99"{else}value="{$themecolorsetting.backroundtwelvetwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 13 Background color </label>
							<input class="form-control color-picker" id="backroundthirteentwo" name="backroundthirteentwo" {if $themecolorsetting.backroundthirteentwo|default:'' == null}value="#44b6a2"{else}value="{$themecolorsetting.backroundthirteentwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 14 Background color </label>
							<input class="form-control color-picker" id="backroundfourteentwo" name="backroundfourteentwo" {if $themecolorsetting.backroundfourteentwo|default:'' == null}value="#fff"{else}value="{$themecolorsetting.backroundfourteentwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 15 Background color </label>
							<input class="form-control color-picker" id="backroundfifteentwo" name="backroundfifteentwo" {if $themecolorsetting.backroundfifteentwo|default:'' == null}value="#834ce4"{else}value="{$themecolorsetting.backroundfifteentwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Primary button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background</label>
							<input class="form-control color-picker" id="btnprimarybgtwo" name="btnprimarybgtwo" {if $themecolorsetting.btnprimarybgtwo|default:'' == null}value="#44b6a2"{else}value="{$themecolorsetting.btnprimarybgtwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border</label>
							<input class="form-control color-picker" id="btnprimarybordertwo" name="btnprimarybordertwo" {if $themecolorsetting.btnprimarybordertwo|default:'' == null}value="#44b6a2"{else}value="{$themecolorsetting.btnprimarybordertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color</label>
							<input class="form-control color-picker" id="btnprimarycolortwo" name="btnprimarycolortwo" {if $themecolorsetting.btnprimarycolortwo|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimarycolortwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background hover</label>
							<input class="form-control color-picker" id="btnprimarybghovertwo" name="btnprimarybghovertwo" {if $themecolorsetting.btnprimarybghovertwo|default:'' == null}value="#39a18f"{else}value="{$themecolorsetting.btnprimarybghovertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border hover</label>
							<input class="form-control color-picker" id="btnprimaryborderhovertwo" name="btnprimaryborderhovertwo" {if $themecolorsetting.btnprimaryborderhovertwo|default:'' == null}value="#39a18f"{else}value="{$themecolorsetting.btnprimaryborderhovertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color hover</label>
							<input class="form-control color-picker" id="btnprimarycolorhovertwo" name="btnprimarycolorhovertwo" {if $themecolorsetting.btnprimarycolorhovertwo|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimarycolorhovertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Primary Light button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background</label>
							<input class="form-control color-picker" id="btnprimarylightbgtwo" name="btnprimarylightbgtwo" {if $themecolorsetting.btnprimarylightbgtwo|default:'' == null}value="#f9f9f9"{else}value="{$themecolorsetting.btnprimarylightbgtwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border</label>
							<input class="form-control color-picker" id="btnprimarylightbordertwo" name="btnprimarylightbordertwo" {if $themecolorsetting.btnprimarylightbordertwo|default:'' == null}value="#f9f9f9"{else}value="{$themecolorsetting.btnprimarylightbordertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color</label>
							<input class="form-control color-picker" id="btnprimarylightcolortwo" name="btnprimarylightcolortwo" {if $themecolorsetting.btnprimarylightcolortwo|default:'' == null}value="#71baad"{else}value="{$themecolorsetting.btnprimarylightcolortwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background hover</label>
							<input class="form-control color-picker" id="btnprimarylightbghovertwo" name="btnprimarylightbghovertwo" {if $themecolorsetting.btnprimarylightbghovertwo|default:'' == null}value="#f4f4f4"{else}value="{$themecolorsetting.btnprimarylightbghovertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border hover</label>
							<input class="form-control color-picker" id="btnprimarylightborderhovertwo" name="btnprimarylightborderhovertwo" {if $themecolorsetting.btnprimarylightborderhovertwo|default:'' == null}value="#f4f4f4"{else}value="{$themecolorsetting.btnprimarylightborderhovertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color hover</label>
							<input class="form-control color-picker" id="btnprimarylightcolorhovertwo" name="btnprimarylightcolorhovertwo" {if $themecolorsetting.btnprimarylightcolorhovertwo|default:'' == null}value="#7e8299"{else}value="{$themecolorsetting.btnprimarylightcolorhovertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Default button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background</label>
							<input class="form-control color-picker" id="btndefaultbgtwo" name="btndefaultbgtwo" {if $themecolorsetting.btndefaultbgtwo|default:'' == null}value="#F9F9F9"{else}value="{$themecolorsetting.btndefaultbgtwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border</label>
							<input class="form-control color-picker" id="btndefaultbordertwo" name="btndefaultbordertwo" {if $themecolorsetting.btndefaultbordertwo|default:'' == null}value="#F9F9F9"{else}value="{$themecolorsetting.btndefaultbordertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color</label>
							<input class="form-control color-picker" id="btndefaultcolortwo" name="btndefaultcolortwo" {if $themecolorsetting.btndefaultcolortwo|default:'' == null}value="#7E8299"{else}value="{$themecolorsetting.btndefaultcolortwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background hover</label>
							<input class="form-control color-picker" id="btndefaultbghovertwo" name="btndefaultbghovertwo" {if $themecolorsetting.btndefaultbghovertwo|default:'' == null}value="#F9F9F9"{else}value="{$themecolorsetting.btndefaultbghovertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border hover</label>
							<input class="form-control color-picker" id="btndefaultborderhovertwo" name="btndefaultborderhovertwo" {if $themecolorsetting.btndefaultborderhovertwo|default:'' == null}value="#F9F9F9"{else}value="{$themecolorsetting.btndefaultborderhovertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color hover</label>
							<input class="form-control color-picker" id="btndefaultcolorhovertwo" name="btndefaultcolorhovertwo" {if $themecolorsetting.btndefaultcolorhovertwo|default:'' == null}value="#7E8299"{else}value="{$themecolorsetting.btndefaultcolorhovertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Primary outline button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background</label>
							<input class="form-control color-picker" id="btnprimaryoutlinebgtwo" name="btnprimaryoutlinebgtwo" {if $themecolorsetting.btnprimaryoutlinebgtwo|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimaryoutlinebgtwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border</label>
							<input class="form-control color-picker" id="btnprimaryoutlinebordertwo" name="btnprimaryoutlinebordertwo" {if $themecolorsetting.btnprimaryoutlinebordertwo|default:'' == null}value="#39a18f"{else}value="{$themecolorsetting.btnprimaryoutlinebordertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color</label>
							<input class="form-control color-picker" id="btnprimaryoutlinecolortwo" name="btnprimaryoutlinecolortwo" {if $themecolorsetting.btnprimaryoutlinecolortwo|default:'' == null}value="#39a18f"{else}value="{$themecolorsetting.btnprimaryoutlinecolortwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinebghovertwo" name="btnprimaryoutlinebghovertwo" {if $themecolorsetting.btnprimaryoutlinebghovertwo|default:'' == null}value="#39a18f"{else}value="{$themecolorsetting.btnprimaryoutlinebghovertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlineborderhovertwo" name="btnprimaryoutlineborderhovertwo" {if $themecolorsetting.btnprimaryoutlineborderhovertwo|default:'' == null}value="#39a18f"{else}value="{$themecolorsetting.btnprimaryoutlineborderhovertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinecolorhovertwo" name="btnprimaryoutlinecolorhovertwo" {if $themecolorsetting.btnprimaryoutlinecolorhovertwo|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimaryoutlinecolorhovertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">primary outline white button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background</label>
							<input class="form-control color-picker" id="btnprimaryoutlinewhitebgtwo" name="btnprimaryoutlinewhitebgtwo" {if $themecolorsetting.btnprimaryoutlinewhitebgtwo|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimaryoutlinewhitebgtwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border</label>
							<input class="form-control color-picker" id="btnprimaryoutlinewhitebordertwo" name="btnprimaryoutlinewhitebordertwo" {if $themecolorsetting.btnprimaryoutlinewhitebordertwo|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimaryoutlinewhitebordertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color</label>
							<input class="form-control color-picker" id="btnprimaryoutlinewhitecolortwo" name="btnprimaryoutlinewhitecolortwo" {if $themecolorsetting.btnprimaryoutlinewhitecolortwo|default:'' == null}value="#39a18f"{else}value="{$themecolorsetting.btnprimaryoutlinewhitecolortwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinewhitebghovertwo" name="btnprimaryoutlinewhitebghovertwo" {if $themecolorsetting.btnprimaryoutlinewhitebghovertwo|default:'' == null}value="#39a18f"{else}value="{$themecolorsetting.btnprimaryoutlinewhitebghovertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinewhiteborderhovertwo" name="btnprimaryoutlinewhiteborderhovertwo" {if $themecolorsetting.btnprimaryoutlinewhiteborderhovertwo|default:'' == null}value="#39a18f"{else}value="{$themecolorsetting.btnprimaryoutlinewhiteborderhovertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinewhitecolorhovertwo" name="btnprimaryoutlinewhitecolorhovertwo" {if $themecolorsetting.btnprimaryoutlinewhitecolorhovertwo|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimaryoutlinewhitecolorhovertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Primary outline light button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background</label>
							<input class="form-control color-picker" id="btnprimaryoutlinelightbgtwo" name="btnprimaryoutlinelightbgtwo" {if $themecolorsetting.btnprimaryoutlinelightbgtwo|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimaryoutlinelightbgtwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border</label>
							<input class="form-control color-picker" id="btnprimaryoutlinelightbordertwo" name="btnprimaryoutlinelightbordertwo" {if $themecolorsetting.btnprimaryoutlinelightbordertwo|default:'' == null}value="#39a18f"{else}value="{$themecolorsetting.btnprimaryoutlinelightbordertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color</label>
							<input class="form-control color-picker" id="btnprimaryoutlinelightcolortwo" name="btnprimaryoutlinelightcolortwo" {if $themecolorsetting.btnprimaryoutlinelightcolortwo|default:'' == null}value="#39a18f"{else}value="{$themecolorsetting.btnprimaryoutlinelightcolortwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinelightbghovertwo" name="btnprimaryoutlinelightbghovertwo" {if $themecolorsetting.btnprimaryoutlinelightbghovertwo|default:'' == null}value="#39a18f"{else}value="{$themecolorsetting.btnprimaryoutlinelightbghovertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinelightborderhovertwo" name="btnprimaryoutlinelightborderhovertwo" {if $themecolorsetting.btnprimaryoutlinelightborderhovertwo|default:'' == null}value="#39a18f"{else}value="{$themecolorsetting.btnprimaryoutlinelightborderhovertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinelightcolorhovertwo" name="btnprimaryoutlinelightcolorhovertwo" {if $themecolorsetting.btnprimaryoutlinelightcolorhovertwo|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimaryoutlinelightcolorhovertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">light button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light btn background</label>
							<input class="form-control color-picker" id="btnlightbgtwo" name="btnlightbgtwo" {if $themecolorsetting.btnlightbgtwo|default:'' == null}value="#F9F9F9"{else}value="{$themecolorsetting.btnlightbgtwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light btn border</label>
							<input class="form-control color-picker" id="btnlightbordertwo" name="btnlightbordertwo" {if $themecolorsetting.btnlightbordertwo|default:'' == null}value="#F9F9F9"{else}value="{$themecolorsetting.btnlightbordertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light btn color</label>
							<input class="form-control color-picker" id="btnlightcolortwo" name="btnlightcolortwo" {if $themecolorsetting.btnlightcolortwo|default:'' == null}value="#7E8299"{else}value="{$themecolorsetting.btnlightcolortwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light btn background hover</label>
							<input class="form-control color-picker" id="btnlightbghovertwo" name="btnlightbghovertwo" {if $themecolorsetting.btnlightbghovertwo|default:'' == null}value="#F4F4F4"{else}value="{$themecolorsetting.btnlightbghovertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light btn border hover</label>
							<input class="form-control color-picker" id="btnlightborderhovertwo" name="btnlightborderhovertwo" {if $themecolorsetting.btnlightborderhovertwo|default:'' == null}value="#F4F4F4"{else}value="{$themecolorsetting.btnlightborderhovertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light btn color hover</label>
							<input class="form-control color-picker" id="btnlightcolorhovertwo" name="btnlightcolorhovertwo" {if $themecolorsetting.btnlightcolorhovertwo|default:'' == null}value="#7E8299"{else}value="{$themecolorsetting.btnlightcolorhovertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">lighter button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">lighter btn background</label>
							<input class="form-control color-picker" id="btnlighterbgtwo" name="btnlighterbgtwo" {if $themecolorsetting.btnlighterbgtwo|default:'' == null}value="#FCFCFC"{else}value="{$themecolorsetting.btnlighterbgtwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">lighter btn border</label>
							<input class="form-control color-picker" id="btnlighterbordertwo" name="btnlighterbordertwo" {if $themecolorsetting.btnlighterbordertwo|default:'' == null}value="#FCFCFC"{else}value="{$themecolorsetting.btnlighterbordertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">lighter btn color</label>
							<input class="form-control color-picker" id="btnlightercolortwo" name="btnlightercolortwo" {if $themecolorsetting.btnlightercolortwo|default:'' == null}value="#7E8299"{else}value="{$themecolorsetting.btnlightercolortwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">lighter btn background hover</label>
							<input class="form-control color-picker" id="btnlighterbghovertwo" name="btnlighterbghovertwo" {if $themecolorsetting.btnlighterbghovertwo|default:'' == null}value="#F9F9F9"{else}value="{$themecolorsetting.btnlighterbghovertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">lighter btn border hover</label>
							<input class="form-control color-picker" id="btnlighterborderhovertwo" name="btnlighterborderhovertwo" {if $themecolorsetting.btnlighterborderhovertwo|default:'' == null}value="#F9F9F9"{else}value="{$themecolorsetting.btnlighterborderhovertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">lighter btn color hover</label>
							<input class="form-control color-picker" id="btnlightercolorhovertwo" name="btnlightercolorhovertwo" {if $themecolorsetting.btnlightercolorhovertwo|default:'' == null}value="#7E8299"{else}value="{$themecolorsetting.btnlightercolorhovertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Texts Colors <small>Headings, Texts, Borders, Tags Colors & More ...</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Headings Text Color </label>
							<input class="form-control color-picker" id="textstagscolortwoheading" name="textstagscolortwoheading" {if $themecolorsetting.textstagscolortwoheading|default:'' == null}value="#161c2d"{else}value="{$themecolorsetting.textstagscolortwoheading|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Headings Hover Text Color </label>
							<input class="form-control color-picker" id="textstagscolortwoheadinghover" name="textstagscolortwoheadinghover" {if $themecolorsetting.textstagscolortwoheadinghover|default:'' == null}value="#5b6278"{else}value="{$themecolorsetting.textstagscolortwoheadinghover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Headings Text Color <strong>gray</strong> </label>
							<input class="form-control color-picker" id="textstagscolortwoheadinggray" name="textstagscolortwoheadinggray" {if $themecolorsetting.textstagscolortwoheadinggray|default:'' == null}value="#b5b5c3"{else}value="{$themecolorsetting.textstagscolortwoheadinggray|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sub Headings Text Color</label>
							<input class="form-control color-picker" id="textstagscolortwosubheading" name="textstagscolortwosubheading" {if $themecolorsetting.textstagscolortwosubheading|default:'' == null}value="#a6adc2"{else}value="{$themecolorsetting.textstagscolortwosubheading|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Color Texts</label>
							<input class="form-control color-picker" id="textstagscolortwotextcolor" name="textstagscolortwotextcolor" {if $themecolorsetting.textstagscolortwotextcolor|default:'' == null}value="#161c2d"{else}value="{$themecolorsetting.textstagscolortwotextcolor|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Color Texts Opacity</label>
							<input class="form-control color-picker" id="textstagscolortwotextcoloropacity" name="textstagscolortwotextcoloropacity" {if $themecolorsetting.textstagscolortwotextcoloropacity|default:'' == null}value="#8b93a9"{else}value="{$themecolorsetting.textstagscolortwotextcoloropacity|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Border Color</label>
							<input class="form-control color-picker" id="textstagscolortwoborder" name="textstagscolortwoborder" {if $themecolorsetting.textstagscolortwoborder|default:'' == null}value="#e7e9ed"{else}value="{$themecolorsetting.textstagscolortwoborder|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Border Color Light</label>
							<input class="form-control color-picker" id="textstagscolortwoborderlight" name="textstagscolortwoborderlight" {if $themecolorsetting.textstagscolortwoborderlight|default:'' == null}value="#eceff9"{else}value="{$themecolorsetting.textstagscolortwoborderlight|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Link Color</label>
							<input class="form-control color-picker" id="textstagscolortwolink" name="textstagscolortwolink" {if $themecolorsetting.textstagscolortwolink|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.textstagscolortwolink|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Link Hover Color</label>
							<input class="form-control color-picker" id="textstagscolortwolinkhover" name="textstagscolortwolinkhover" {if $themecolorsetting.textstagscolortwolinkhover|default:'' == null}value="#088d9f"{else}value="{$themecolorsetting.textstagscolortwolinkhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Sidebar colors Schemes <small>Default</small></h6>
				<div class="row">
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar background </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaulttwobg" name="sidebarcolorsdefaulttwobg" {if $themecolorsetting.sidebarcolorsdefaulttwobg|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdefaulttwobg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar extend button background </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaulttwoextendbtnbg" name="sidebarcolorsdefaulttwoextendbtnbg" {if $themecolorsetting.sidebarcolorsdefaulttwoextendbtnbg|default:'' == null}value="#f6f5fb"{else}value="{$themecolorsetting.sidebarcolorsdefaulttwoextendbtnbg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar item background </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaulttwoitembg" name="sidebarcolorsdefaulttwoitembg" {if $themecolorsetting.sidebarcolorsdefaulttwoitembg|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdefaulttwoitembg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar item hover background </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaulttwoitemhoverbg" name="sidebarcolorsdefaulttwoitemhoverbg" {if $themecolorsetting.sidebarcolorsdefaulttwoitemhoverbg|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdefaulttwoitemhoverbg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar item color <strong>text</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdefaulttwoitemtext" name="sidebarcolorsdefaulttwoitemtext" {if $themecolorsetting.sidebarcolorsdefaulttwoitemtext|default:'' == null}value="#161c2d"{else}value="{$themecolorsetting.sidebarcolorsdefaulttwoitemtext|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar item color <strong>icon</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdefaulttwoitemicon" name="sidebarcolorsdefaulttwoitemicon" {if $themecolorsetting.sidebarcolorsdefaulttwoitemicon|default:'' == null}value="#161c2d"{else}value="{$themecolorsetting.sidebarcolorsdefaulttwoitemicon|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar item hover color <strong>text</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdefaulttwoitemtexthover" name="sidebarcolorsdefaulttwoitemtexthover" {if $themecolorsetting.sidebarcolorsdefaulttwoitemtexthover|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.sidebarcolorsdefaulttwoitemtexthover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar item hover color <strong>icon</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdefaulttwoitemiconhover" name="sidebarcolorsdefaulttwoitemiconhover" {if $themecolorsetting.sidebarcolorsdefaulttwoitemiconhover|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.sidebarcolorsdefaulttwoitemiconhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar dropdown background </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaulttwodropdownbg" name="sidebarcolorsdefaulttwodropdownbg" {if $themecolorsetting.sidebarcolorsdefaulttwodropdownbg|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdefaulttwodropdownbg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar dropdown title color </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaulttwodropdowntitle" name="sidebarcolorsdefaulttwodropdowntitle" {if $themecolorsetting.sidebarcolorsdefaulttwodropdowntitle|default:'' == null}value="#18191a"{else}value="{$themecolorsetting.sidebarcolorsdefaulttwodropdowntitle|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar dropdown item Background </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaulttwodropdownitemtext" name="sidebarcolorsdefaulttwodropdownitemtext" {if $themecolorsetting.sidebarcolorsdefaulttwodropdownitemtext|default:'' == null}value="#f9f8fa"{else}value="{$themecolorsetting.sidebarcolorsdefaulttwodropdownitemtext|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar dropdown item color <strong>text</strong> </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaulttwodropdownitemicon" name="sidebarcolorsdefaulttwodropdownitemicon" {if $themecolorsetting.sidebarcolorsdefaulttwodropdownitemicon|default:'' == null}value="#758085"{else}value="{$themecolorsetting.sidebarcolorsdefaulttwodropdownitemicon|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar dropdown item color <strong>icon</strong> </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaulttwodropdownitemicon" name="sidebarcolorsdefaulttwodropdownitemicon" {if $themecolorsetting.sidebarcolorsdefaulttwodropdownitemicon|default:'' == null}value="#758085"{else}value="{$themecolorsetting.sidebarcolorsdefaulttwodropdownitemicon|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar dropdown item hover color <strong>text</strong> </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaulttwodropdownitemtexthover" name="sidebarcolorsdefaulttwodropdownitemtexthover" {if $themecolorsetting.sidebarcolorsdefaulttwodropdownitemtexthover|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.sidebarcolorsdefaulttwodropdownitemtexthover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar dropdown item hover color <strong>icon</strong> </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaulttwodropdownitemiconhover" name="sidebarcolorsdefaulttwodropdownitemiconhover" {if $themecolorsetting.sidebarcolorsdefaulttwodropdownitemiconhover|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.sidebarcolorsdefaulttwodropdownitemiconhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Sidebar colors Schemes <small>Dark</small></h6>
				<div class="row">
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar background </label>
							<input class="form-control color-picker" id="sidebarcolorsdarktwobg" name="sidebarcolorsdarktwobg" {if $themecolorsetting.sidebarcolorsdarktwobg|default:'' == null}value="#151718"{else}value="{$themecolorsetting.sidebarcolorsdarktwobg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar extend button background </label>
							<input class="form-control color-picker" id="sidebarcolorsdarktwoextendbtnbg" name="sidebarcolorsdarktwoextendbtnbg" {if $themecolorsetting.sidebarcolorsdarktwoextendbtnbg|default:'' == null}value="#2d3031"{else}value="{$themecolorsetting.sidebarcolorsdarktwoextendbtnbg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar item background </label>
							<input class="form-control color-picker" id="sidebarcolorsdarktwoitembg" name="sidebarcolorsdarktwoitembg" {if $themecolorsetting.sidebarcolorsdarktwoitembg|default:'' == null}value="#2d3031"{else}value="{$themecolorsetting.sidebarcolorsdarktwoitembg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar item hover background </label>
							<input class="form-control color-picker" id="sidebarcolorsdarktwoitemhoverbg" name="sidebarcolorsdarktwoitemhoverbg" {if $themecolorsetting.sidebarcolorsdarktwoitemhoverbg|default:'' == null}value="#2d3031"{else}value="{$themecolorsetting.sidebarcolorsdarktwoitemhoverbg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar item color <strong>text</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdarktwoitemtext" name="sidebarcolorsdarktwoitemtext" {if $themecolorsetting.sidebarcolorsdarktwoitemtext|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdarktwoitemtext|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar item color <strong>icon</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdarktwoitemicon" name="sidebarcolorsdarktwoitemicon" {if $themecolorsetting.sidebarcolorsdarktwoitemicon|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdarktwoitemicon|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar item hover color <strong>text</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdarktwoitemtexthover" name="sidebarcolorsdarktwoitemtexthover" {if $themecolorsetting.sidebarcolorsdarktwoitemtexthover|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.sidebarcolorsdarktwoitemtexthover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar item hover color <strong>icon</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdarktwoitemiconhover" name="sidebarcolorsdarktwoitemiconhover" {if $themecolorsetting.sidebarcolorsdarktwoitemiconhover|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.sidebarcolorsdarktwoitemiconhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar dropdown background </label>
							<input class="form-control color-picker" id="sidebarcolorsdarktwodropdownbg" name="sidebarcolorsdarktwodropdownbg" {if $themecolorsetting.sidebarcolorsdarktwodropdownbg|default:'' == null}value="#0e0e0f"{else}value="{$themecolorsetting.sidebarcolorsdarktwodropdownbg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar dropdown title color </label>
							<input class="form-control color-picker" id="sidebarcolorsdarktwodropdowntitle" name="sidebarcolorsdarktwodropdowntitle" {if $themecolorsetting.sidebarcolorsdarktwodropdowntitle|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdarktwodropdowntitle|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar dropdown item Background </label>
							<input class="form-control color-picker" id="sidebarcolorsdarktwodropdownitembg" name="sidebarcolorsdarktwodropdownitembg" {if $themecolorsetting.sidebarcolorsdarktwodropdownitembg|default:'' == null}value="#1a1a1c"{else}value="{$themecolorsetting.sidebarcolorsdarktwodropdownitembg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar dropdown item color <strong>text</strong> </label>
							<input class="form-control color-picker" id="sidebarcolorsdarktwodropdownitemtext" name="sidebarcolorsdarktwodropdownitemtext" {if $themecolorsetting.sidebarcolorsdarktwodropdownitemtext|default:'' == null}value="#758085"{else}value="{$themecolorsetting.sidebarcolorsdarktwodropdownitemtext|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar dropdown item color <strong>icon</strong> </label>
							<input class="form-control color-picker" id="sidebarcolorsdarktwodropdownitemicon" name="sidebarcolorsdarktwodropdownitemicon" {if $themecolorsetting.sidebarcolorsdarktwodropdownitemicon|default:'' == null}value="#758085"{else}value="{$themecolorsetting.sidebarcolorsdarktwodropdownitemicon|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar dropdown item color <strong>text</strong> </label>
							<input class="form-control color-sidebarcolorsdarktwodropdownitemtexthover" id="sidebarcolorsdarktwodropdownitemtexthover" name="sidebarcolorsdarktwodropdownitemtexthover" {if $themecolorsetting.sidebarcolorsdarktwodropdownitemtexthover|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdarktwodropdownitemiconhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar dropdown item color <strong>icon</strong> </label>
							<input class="form-control color-picker" id="sidebarcolorsdarktwodropdownitemiconhover" name="sidebarcolorsdarktwodropdownitemiconhover" {if $themecolorsetting.sidebarcolorsdarktwodropdownitemiconhover|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdarktwodropdownitemiconhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>Primary</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">primary background </label>
							<input class="form-control color-picker" id="alertbgprimarytwo" name="alertbgprimarytwo" {if $themecolorsetting.alertbgprimarytwo|default:'' == null}value="#E2E1F7"{else}value="{$themecolorsetting.alertbgprimarytwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">primary color </label>
							<input class="form-control color-picker" id="alertcolorprimarytwo" name="alertcolorprimarytwo" {if $themecolorsetting.alertcolorprimarytwo|default:'' == null}value="#473BF0"{else}value="{$themecolorsetting.alertcolorprimarytwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>secondary</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">secondary background </label>
							<input class="form-control color-picker" id="alertbgsecondarytwo" name="alertbgsecondarytwo" {if $themecolorsetting.alertbgsecondarytwo|default:'' == null}value="#F9F9F9"{else}value="{$themecolorsetting.alertbgsecondarytwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">secondary color </label>
							<input class="form-control color-picker" id="alertcolorsecondarytwo" name="alertcolorsecondarytwo" {if $themecolorsetting.alertcolorsecondarytwo|default:'' == null}value="#7E8299"{else}value="{$themecolorsetting.alertcolorsecondarytwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>success</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">success background </label>
							<input class="form-control color-picker" id="alertbgsuccesstwo" name="alertbgsuccesstwo" {if $themecolorsetting.alertbgsuccesstwo|default:'' == null}value="#E8FFF3"{else}value="{$themecolorsetting.alertbgsuccesstwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">success color </label>
							<input class="form-control color-picker" id="alertcolorsuccesstwo" name="alertcolorsuccesstwo" {if $themecolorsetting.alertcolorsuccesstwo|default:'' == null}value="#50CD89"{else}value="{$themecolorsetting.alertcolorsuccesstwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>danger</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">danger background </label>
							<input class="form-control color-picker" id="alertbgdangertwo" name="alertbgdangertwo" {if $themecolorsetting.alertbgdangertwo|default:'' == null}value="#F7D4D6"{else}value="{$themecolorsetting.alertbgdangertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">danger color </label>
							<input class="form-control color-picker" id="alertcolordangertwo" name="alertcolordangertwo" {if $themecolorsetting.alertcolordangertwo|default:'' == null}value="#D92632"{else}value="{$themecolorsetting.alertcolordangertwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>warning</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">warning background </label>
							<input class="form-control color-picker" id="alertbgwarningtwo" name="alertbgwarningtwo" {if $themecolorsetting.alertbgwarningtwo|default:'' == null}value="#FDF2E2"{else}value="{$themecolorsetting.alertbgwarningtwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">warning color </label>
							<input class="form-control color-picker" id="alertcolorwarningtwo" name="alertcolorwarningtwo" {if $themecolorsetting.alertcolorwarningtwo|default:'' == null}value="#F0AD4E"{else}value="{$themecolorsetting.alertcolorwarningtwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>info</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">info background </label>
							<input class="form-control color-picker" id="alertbginfotwo" name="alertbginfotwo" {if $themecolorsetting.alertbginfotwo|default:'' == null}value="#C4E7F2"{else}value="{$themecolorsetting.alertbginfotwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">info color </label>
							<input class="form-control color-picker" id="alertcolorinfotwo" name="alertcolorinfotwo" {if $themecolorsetting.alertcolorinfotwo|default:'' == null}value="#4AADCB"{else}value="{$themecolorsetting.alertcolorinfotwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>light</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light background </label>
							<input class="form-control color-picker" id="alertbglighttwo" name="alertbglighttwo" {if $themecolorsetting.alertbglighttwo|default:'' == null}value="#F8F9FA"{else}value="{$themecolorsetting.alertbglighttwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light color </label>
							<input class="form-control color-picker" id="alertcolorlighttwo" name="alertcolorlighttwo" {if $themecolorsetting.alertcolorlighttwo|default:'' == null}value="#212529"{else}value="{$themecolorsetting.alertcolorlighttwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>dark</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">dark background </label>
							<input class="form-control color-picker" id="alertbgdarktwo" name="alertbgdarktwo" {if $themecolorsetting.alertbgdarktwo|default:'' == null}value="#343A40"{else}value="{$themecolorsetting.alertbgdarktwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">dark color </label>
							<input class="form-control color-picker" id="alertcolordarktwo" name="alertcolordarktwo" {if $themecolorsetting.alertcolordarktwo|default:'' == null}value="#FFFFFF"{else}value="{$themecolorsetting.alertcolordarktwo|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			
		</div>
		
		<div class="section {if $themecolorsetting.dafaultthemecolor|default:''=='theme-style-three'}d-block{else}d-none{/if}" id="custom-colors-schemes-three">
			<h5 class="title">Custom Purple Theme Color Schemes</h5>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Backgrounds Colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Main Background color </label>
							<input class="form-control color-picker" id="backroundonethree" name="backroundonethree" {if $themecolorsetting.backroundonethree|default:'' == null}value="#ffffff"{else}value="{$themecolorsetting.backroundonethree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 2 Background color </label>
							<input class="form-control color-picker" id="backroundtwothree" name="backroundtwothree" {if $themecolorsetting.backroundtwothree|default:'' == null}value="#f9f2fd"{else}value="{$themecolorsetting.backroundtwothree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 3 Background color </label>
							<input class="form-control color-picker" id="backroundtreethree" name="backroundtreethree" {if $themecolorsetting.backroundtreethree|default:'' == null}value="#ebd4f6"{else}value="{$themecolorsetting.backroundtreethree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 4 Background color </label>
							<input class="form-control color-picker" id="backroundfourthree" name="backroundfourthree" {if $themecolorsetting.backroundfourthree|default:'' == null}value="#cbb2d8"{else}value="{$themecolorsetting.backroundfourthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 5 Background color </label>
							<input class="form-control color-picker" id="backroundfivethree" name="backroundfivethree" {if $themecolorsetting.backroundfivethree|default:'' == null}value="#f69fbd"{else}value="{$themecolorsetting.backroundfivethree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 6 Background color </label>
							<input class="form-control color-picker" id="backroundsixthree" name="backroundsixthree" {if $themecolorsetting.backroundsixthree|default:'' == null}value="#e0cde9"{else}value="{$themecolorsetting.backroundsixthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 7 Background color </label>
							<input class="form-control color-picker" id="backroundsaventhree" name="backroundsaventhree" {if $themecolorsetting.backroundsaventhree|default:'' == null}value="#fff"{else}value="{$themecolorsetting.backroundsaventhree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 8 Background color </label>
							<input class="form-control color-picker" id="backroundeightthree" name="backroundeightthree" {if $themecolorsetting.backroundeightthree|default:'' == null}value="#f6eff9"{else}value="{$themecolorsetting.backroundeightthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 9 Background color </label>
							<input class="form-control color-picker" id="backroundninethree" name="backroundninethree" {if $themecolorsetting.backroundninethree|default:'' == null}value="#3d214c"{else}value="{$themecolorsetting.backroundninethree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 10 Background color </label>
							<input class="form-control color-picker" id="backroundtenthree" name="backroundtenthree" {if $themecolorsetting.backroundtenthree|default:'' == null}value="#dbcbe3"{else}value="{$themecolorsetting.backroundtenthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 11 Background color </label>
							<input class="form-control color-picker" id="backroundeleventhree" name="backroundeleventhree" {if $themecolorsetting.backroundeleventhree|default:'' == null}value="#9d58c0"{else}value="{$themecolorsetting.backroundeleventhree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 12 Background color </label>
							<input class="form-control color-picker" id="backroundtwelvethree" name="backroundtwelvethree" {if $themecolorsetting.backroundtwelvethree|default:'' == null}value="#522e64"{else}value="{$themecolorsetting.backroundtwelvethree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 13 Background color </label>
							<input class="form-control color-picker" id="backroundthirteenthree" name="backroundthirteenthree" {if $themecolorsetting.backroundthirteenthree|default:'' == null}value="#763895"{else}value="{$themecolorsetting.backroundthirteenthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 14 Background color </label>
							<input class="form-control color-picker" id="backroundfourteenthree" name="backroundfourteenthree" {if $themecolorsetting.backroundfourteenthree|default:'' == null}value="#fff"{else}value="{$themecolorsetting.backroundfourteenthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 15 Background color </label>
							<input class="form-control color-picker" id="backroundfifteenthree" name="backroundfifteenthree" {if $themecolorsetting.backroundfifteenthree|default:'' == null}value="#834ce4"{else}value="{$themecolorsetting.backroundfifteenthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Primary button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background</label>
							<input class="form-control color-picker" id="btnprimarybgthree" name="btnprimarybgthree" {if $themecolorsetting.btnprimarybgthree|default:'' == null}value="#825d95"{else}value="{$themecolorsetting.btnprimarybgthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border</label>
							<input class="form-control color-picker" id="btnprimaryborderthree" name="btnprimaryborderthree" {if $themecolorsetting.btnprimaryborderthree|default:'' == null}value="#825d95"{else}value="{$themecolorsetting.btnprimaryborderthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color</label>
							<input class="form-control color-picker" id="btnprimarycolorthree" name="btnprimarycolorthree" {if $themecolorsetting.btnprimarycolorthree|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimarycolorthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background hover</label>
							<input class="form-control color-picker" id="btnprimarybghoverthree" name="btnprimarybghoverthree" {if $themecolorsetting.btnprimarybghoverthree|default:'' == null}value="#5c3a6e"{else}value="{$themecolorsetting.btnprimarybghoverthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border hover</label>
							<input class="form-control color-picker" id="btnprimaryborderhoverthree" name="btnprimaryborderhoverthree" {if $themecolorsetting.btnprimaryborderhoverthree|default:'' == null}value="#5c3a6e"{else}value="{$themecolorsetting.btnprimaryborderhoverthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color hover</label>
							<input class="form-control color-picker" id="btnprimarycolorhoverthree" name="btnprimarycolorhoverthree" {if $themecolorsetting.btnprimarycolorhoverthree|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimarycolorhoverthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Primary Light button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background</label>
							<input class="form-control color-picker" id="btnprimarylightbgthree" name="btnprimarylightbgthree" {if $themecolorsetting.btnprimarylightbgthree|default:'' == null}value="#f9f9f9"{else}value="{$themecolorsetting.btnprimarylightbgthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border</label>
							<input class="form-control color-picker" id="btnprimarylightborderthree" name="btnprimarylightborderthree" {if $themecolorsetting.btnprimarylightborderthree|default:'' == null}value="#f9f9f9"{else}value="{$themecolorsetting.btnprimarylightborderthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color</label>
							<input class="form-control color-picker" id="btnprimarylightcolorthree" name="btnprimarylightcolorthree" {if $themecolorsetting.btnprimarylightcolorthree|default:'' == null}value="#825d95"{else}value="{$themecolorsetting.btnprimarylightcolorthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background hover</label>
							<input class="form-control color-picker" id="btnprimarylightbghoverthree" name="btnprimarylightbghoverthree" {if $themecolorsetting.btnprimarylightbghoverthree|default:'' == null}value="#f4f4f4"{else}value="{$themecolorsetting.btnprimarylightbghoverthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border hover</label>
							<input class="form-control color-picker" id="btnprimarylightborderhoverthree" name="btnprimarylightborderhoverthree" {if $themecolorsetting.btnprimarylightborderhoverthree|default:'' == null}value="#f4f4f4"{else}value="{$themecolorsetting.btnprimarylightborderhoverthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color hover</label>
							<input class="form-control color-picker" id="btnprimarylightcolorhoverthree" name="btnprimarylightcolorhoverthree" {if $themecolorsetting.btnprimarylightcolorhoverthree|default:'' == null}value="#7e8299"{else}value="{$themecolorsetting.btnprimarylightcolorhoverthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Default button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background</label>
							<input class="form-control color-picker" id="btndefaultbgthree" name="btndefaultbgthree" {if $themecolorsetting.btndefaultbgthree|default:'' == null}value="#F9F9F9"{else}value="{$themecolorsetting.btndefaultbgthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border</label>
							<input class="form-control color-picker" id="btndefaultborderthree" name="btndefaultborderthree" {if $themecolorsetting.btndefaultborderthree|default:'' == null}value="#F9F9F9"{else}value="{$themecolorsetting.btndefaultborderthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color</label>
							<input class="form-control color-picker" id="btndefaultcolorthree" name="btndefaultcolorthree" {if $themecolorsetting.btndefaultcolorthree|default:'' == null}value="#7E8299"{else}value="{$themecolorsetting.btndefaultcolorthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background hover</label>
							<input class="form-control color-picker" id="btndefaultbghoverthree" name="btndefaultbghoverthree" {if $themecolorsetting.btndefaultbghoverthree|default:'' == null}value="#F4F4F4"{else}value="{$themecolorsetting.btndefaultbghoverthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border hover</label>
							<input class="form-control color-picker" id="btndefaultborderhoverthree" name="btndefaultborderhoverthree" {if $themecolorsetting.btndefaultborderhoverthree|default:'' == null}value="#F4F4F4"{else}value="{$themecolorsetting.btndefaultborderhoverthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color hover</label>
							<input class="form-control color-picker" id="btndefaultcolorhoverthree" name="btndefaultcolorhoverthree" {if $themecolorsetting.btndefaultcolorhoverthree|default:'' == null}value="#7E8299"{else}value="{$themecolorsetting.btndefaultcolorhoverthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Primary outline button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background</label>
							<input class="form-control color-picker" id="btnprimaryoutlinebgthree" name="btnprimaryoutlinebgthree" {if $themecolorsetting.btnprimaryoutlinebgthree|default:'' == null}value="#FFFFFF"{else}value="{$themecolorsetting.btnprimaryoutlinebgthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border</label>
							<input class="form-control color-picker" id="btnprimaryoutlineborderthree" name="btnprimaryoutlineborderthree" {if $themecolorsetting.btnprimaryoutlineborderthree|default:'' == null}value="#825d95"{else}value="{$themecolorsetting.btnprimaryoutlineborderthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color</label>
							<input class="form-control color-picker" id="btnprimaryoutlinecolorthree" name="btnprimaryoutlinecolorthree" {if $themecolorsetting.btnprimaryoutlinecolorthree|default:'' == null}value="#825d95"{else}value="{$themecolorsetting.btnprimaryoutlinecolorthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinebghoverthree" name="btnprimaryoutlinebghoverthree" {if $themecolorsetting.btnprimaryoutlinebghoverthree|default:'' == null}value="#825d95"{else}value="{$themecolorsetting.btnprimaryoutlinebghoverthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlineborderhoverthree" name="btnprimaryoutlineborderhoverthree" {if $themecolorsetting.btnprimaryoutlineborderhoverthree|default:'' == null}value="#825d95"{else}value="{$themecolorsetting.btnprimaryoutlineborderhoverthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinecolorhoverthree" name="btnprimaryoutlinecolorhoverthree" {if $themecolorsetting.btnprimaryoutlinecolorhoverthree|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimaryoutlinecolorhoverthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">primary outline white button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background</label>
							<input class="form-control color-picker" id="btnprimaryoutlinewhitebgthree" name="btnprimaryoutlinewhitebgthree" {if $themecolorsetting.btnprimaryoutlinewhitebgthree|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimaryoutlinewhitebgthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border</label>
							<input class="form-control color-picker" id="btnprimaryoutlinewhiteborderthree" name="btnprimaryoutlinewhiteborderthree" {if $themecolorsetting.btnprimaryoutlinewhiteborderthree|default:'' == null}value="#825d95"{else}value="{$themecolorsetting.btnprimaryoutlinewhiteborderthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color</label>
							<input class="form-control color-picker" id="btnprimaryoutlinewhitecolorthree" name="btnprimaryoutlinewhitecolorthree" {if $themecolorsetting.btnprimaryoutlinewhitecolorthree|default:'' == null}value="#825d95"{else}value="{$themecolorsetting.btnprimaryoutlinewhitecolorthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinewhitebghoverthree" name="btnprimaryoutlinewhitebghoverthree" {if $themecolorsetting.btnprimaryoutlinewhitebghoverthree|default:'' == null}value="#825d95"{else}value="{$themecolorsetting.btnprimaryoutlinewhitebghoverthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinewhiteborderhoverthree" name="btnprimaryoutlinewhiteborderhoverthree" {if $themecolorsetting.btnprimaryoutlinewhiteborderhoverthree|default:'' == null}value="#825d95"{else}value="{$themecolorsetting.btnprimaryoutlinewhiteborderhoverthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinewhitecolorhoverthree" name="btnprimaryoutlinewhitecolorhoverthree" {if $themecolorsetting.btnprimaryoutlinewhitecolorhoverthree|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimaryoutlinewhitecolorhoverthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Primary outline light button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background</label>
							<input class="form-control color-picker" id="btnprimaryoutlinelightbgthree" name="btnprimaryoutlinelightbgthree" {if $themecolorsetting.btnprimaryoutlinelightbgthree|default:'' == null}value="#FFFFFF"{else}value="{$themecolorsetting.btnprimaryoutlinelightbgthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border</label>
							<input class="form-control color-picker" id="btnprimaryoutlinelightborderthree" name="btnprimaryoutlinelightborderthree" {if $themecolorsetting.btnprimaryoutlinelightborderthree|default:'' == null}value="#825d95"{else}value="{$themecolorsetting.btnprimaryoutlinelightborderthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color</label>
							<input class="form-control color-picker" id="btnprimaryoutlinelightcolorthree" name="btnprimaryoutlinelightcolorthree" {if $themecolorsetting.btnprimaryoutlinelightcolorthree|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimaryoutlinelightcolorthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinelightbghoverthree" name="btnprimaryoutlinelightbghoverthree" {if $themecolorsetting.btnprimaryoutlinelightbghoverthree|default:'' == null}value="#825d95"{else}value="{$themecolorsetting.btnprimaryoutlinelightbghoverthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinelightborderhoverthree" name="btnprimaryoutlinelightborderhoverthree" {if $themecolorsetting.btnprimaryoutlinelightborderhoverthree|default:'' == null}value="#825d95"{else}value="{$themecolorsetting.btnprimaryoutlinelightborderhoverthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinelightcolorhoverthree" name="btnprimaryoutlinelightcolorhoverthree" {if $themecolorsetting.btnprimaryoutlinelightcolorhoverthree|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimaryoutlinelightcolorhoverthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">light button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light btn background</label>
							<input class="form-control color-picker" id="btnlightbgthree" name="btnlightbgthree" {if $themecolorsetting.btnlightbgthree|default:'' == null}value="#F9F9F9"{else}value="{$themecolorsetting.btnlightbgthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light btn border</label>
							<input class="form-control color-picker" id="btnlightborderthree" name="btnlightborderthree" {if $themecolorsetting.btnlightborderthree|default:'' == null}value="#F9F9F9"{else}value="{$themecolorsetting.btnlightborderthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light btn color</label>
							<input class="form-control color-picker" id="btnlightcolorthree" name="btnlightcolorthree" {if $themecolorsetting.btnlightcolorthree|default:'' == null}value="#7E8299"{else}value="{$themecolorsetting.btnlightcolorthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light btn background hover</label>
							<input class="form-control color-picker" id="btnlightbghoverthree" name="btnlightbghoverthree" {if $themecolorsetting.btnlightbghoverthree|default:'' == null}value="#F4F4F4"{else}value="{$themecolorsetting.btnlightbghoverthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light btn border hover</label>
							<input class="form-control color-picker" id="btnlightborderhoverthree" name="btnlightborderhoverthree" {if $themecolorsetting.btnlightborderhoverthree|default:'' == null}value="#F4F4F4"{else}value="{$themecolorsetting.btnlightborderhoverthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light btn color hover</label>
							<input class="form-control color-picker" id="btnlightcolorhoverthree" name="btnlightcolorhoverthree" {if $themecolorsetting.btnlightcolorhoverthree|default:'' == null}value="#7E8299"{else}value="{$themecolorsetting.btnlightcolorhoverthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">lighter button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">lighter btn background</label>
							<input class="form-control color-picker" id="btnlighterbgthree" name="btnlighterbgthree" {if $themecolorsetting.btnlighterbgthree|default:'' == null}value="#FCFCFC"{else}value="{$themecolorsetting.btnlighterbgthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">lighter btn border</label>
							<input class="form-control color-picker" id="btnlighterborderthree" name="btnlighterborderthree" {if $themecolorsetting.btnlighterborderthree|default:'' == null}value="#FCFCFC"{else}value="{$themecolorsetting.btnlighterborderthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">lighter btn color</label>
							<input class="form-control color-picker" id="btnlightercolorthree" name="btnlightercolorthree" {if $themecolorsetting.btnlightercolorthree|default:'' == null}value="#7E8299"{else}value="{$themecolorsetting.btnlightercolorthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">lighter btn background hover</label>
							<input class="form-control color-picker" id="btnlighterbghoverthree" name="btnlighterbghoverthree" {if $themecolorsetting.btnlighterbghoverthree|default:'' == null}value="#F9F9F9"{else}value="{$themecolorsetting.btnlighterbghoverthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">lighter btn border hover</label>
							<input class="form-control color-picker" id="btnlighterborderhoverthree" name="btnlighterborderhoverthree" {if $themecolorsetting.btnlighterborderhoverthree|default:'' == null}value="#F9F9F9"{else}value="{$themecolorsetting.btnlighterborderhoverthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">lighter btn color hover</label>
							<input class="form-control color-picker" id="btnlightercolorhoverthree" name="btnlightercolorhoverthree" {if $themecolorsetting.btnlightercolorhoverthree|default:'' == null}value="#7E8299"{else}value="{$themecolorsetting.btnlightercolorhoverthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Texts Colors <small>Headings, Texts, Borders, Tags Colors & More ...</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Headings Text Color </label>
							<input class="form-control color-picker" id="textstagscolorthreeheading" name="textstagscolorthreeheading" {if $themecolorsetting.textstagscolorthreeheading|default:'' == null}value="#161c2d"{else}value="{$themecolorsetting.textstagscolorthreeheading|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Headings Hover Text Color </label>
							<input class="form-control color-picker" id="textstagscolorthreeheadinghover" name="textstagscolorthreeheadinghover" {if $themecolorsetting.textstagscolorthreeheadinghover|default:'' == null}value="#5b6278"{else}value="{$themecolorsetting.textstagscolorthreeheadinghover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Headings Text Color <strong>gray</strong> </label>
							<input class="form-control color-picker" id="textstagscolorthreeheadinggray" name="textstagscolorthreeheadinggray" {if $themecolorsetting.textstagscolorthreeheadinggray|default:'' == null}value="#b5b5c3"{else}value="{$themecolorsetting.textstagscolorthreeheadinggray|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sub Headings Text Color</label>
							<input class="form-control color-picker" id="textstagscolorthreesubheading" name="textstagscolorthreesubheading" {if $themecolorsetting.textstagscolorthreesubheading|default:'' == null}value="#a6adc2"{else}value="{$themecolorsetting.textstagscolorthreesubheading|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Color Texts</label>
							<input class="form-control color-picker" id="textstagscolorthreetextcolor" name="textstagscolorthreetextcolor" {if $themecolorsetting.textstagscolorthreetextcolor|default:'' == null}value="#161c2d"{else}value="{$themecolorsetting.textstagscolorthreetextcolor|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Color Texts Opacity</label>
							<input class="form-control color-picker" id="textstagscolorthreetextcoloropacity" name="textstagscolorthreetextcoloropacity" {if $themecolorsetting.textstagscolorthreetextcoloropacity|default:'' == null}value="#8b93a9"{else}value="{$themecolorsetting.textstagscolorthreetextcoloropacity|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Border Color</label>
							<input class="form-control color-picker" id="textstagscolorthreeborder" name="textstagscolorthreeborder" {if $themecolorsetting.textstagscolorthreeborder|default:'' == null}value="#e7e9ed"{else}value="{$themecolorsetting.textstagscolorthreeborder|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Border Color Light</label>
							<input class="form-control color-picker" id="textstagscolorthreeborderlight" name="textstagscolorthreeborderlight" {if $themecolorsetting.textstagscolorthreeborderlight|default:'' == null}value="#eceff9"{else}value="{$themecolorsetting.textstagscolorthreeborderlight|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Link Color</label>
							<input class="form-control color-picker" id="textstagscolorthreelink" name="textstagscolorthreelink" {if $themecolorsetting.textstagscolorthreelink|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.textstagscolorthreelink|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Link Hover Color</label>
							<input class="form-control color-picker" id="textstagscolorthreelinkhover" name="textstagscolorthreelinkhover" {if $themecolorsetting.textstagscolorthreelinkhover|default:'' == null}value="#088d9f"{else}value="{$themecolorsetting.textstagscolorthreelinkhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Sidebar colors Schemes <small>Default</small></h6>
				<div class="row">
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar background </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultthreebg" name="sidebarcolorsdefaultthreebg" {if $themecolorsetting.sidebarcolorsdefaultthreebg|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdefaultthreebg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar extend button background </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultthreeextendbtnbg" name="sidebarcolorsdefaultthreeextendbtnbg" {if $themecolorsetting.sidebarcolorsdefaultthreeextendbtnbg|default:'' == null}value="#f6f5fb"{else}value="{$themecolorsetting.sidebarcolorsdefaultthreeextendbtnbg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar item background </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultthreeitembg" name="sidebarcolorsdefaultthreeitembg" {if $themecolorsetting.sidebarcolorsdefaultthreeitembg|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdefaultthreeitembg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar item hover background </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultthreeitemhoverbg" name="sidebarcolorsdefaultthreeitemhoverbg" {if $themecolorsetting.sidebarcolorsdefaultthreeitemhoverbg|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdefaultthreeitemhoverbg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar item color <strong>text</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultthreeitemtext" name="sidebarcolorsdefaultthreeitemtext" {if $themecolorsetting.sidebarcolorsdefaultthreeitemtext|default:'' == null}value="#161c2d"{else}value="{$themecolorsetting.sidebarcolorsdefaultthreeitemtext|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar item color <strong>icon</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultthreeitemicon" name="sidebarcolorsdefaultthreeitemicon" {if $themecolorsetting.sidebarcolorsdefaultthreeitemicon|default:'' == null}value="#161c2d"{else}value="{$themecolorsetting.sidebarcolorsdefaultthreeitemicon|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar item hover color <strong>text</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultthreeitemtexthover" name="sidebarcolorsdefaultthreeitemtexthover" {if $themecolorsetting.sidebarcolorsdefaultthreeitemtexthover|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.sidebarcolorsdefaultthreeitemtexthover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar item hover color <strong>icon</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultthreeitemiconhover" name="sidebarcolorsdefaultthreeitemiconhover" {if $themecolorsetting.sidebarcolorsdefaultthreeitemiconhover|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.sidebarcolorsdefaultthreeitemiconhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar dropdown background </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultthreedropdownbg" name="sidebarcolorsdefaultthreedropdownbg" {if $themecolorsetting.sidebarcolorsdefaultthreedropdownbg|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdefaultthreedropdownbg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar dropdown title color </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultthreedropdowntitle" name="sidebarcolorsdefaultthreedropdowntitle" {if $themecolorsetting.sidebarcolorsdefaultthreedropdowntitle|default:'' == null}value="#18191a"{else}value="{$themecolorsetting.sidebarcolorsdefaultthreedropdowntitle|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar dropdown item Background </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultthreedropdownitemtext" name="sidebarcolorsdefaultthreedropdownitemtext" {if $themecolorsetting.sidebarcolorsdefaultthreedropdownitemtext|default:'' == null}value="#f9f8fa"{else}value="{$themecolorsetting.sidebarcolorsdefaultthreedropdownitemtext|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar dropdown item color <strong>text</strong> </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultthreedropdownitemicon" name="sidebarcolorsdefaultthreedropdownitemicon" {if $themecolorsetting.sidebarcolorsdefaultthreedropdownitemicon|default:'' == null}value="#758085"{else}value="{$themecolorsetting.sidebarcolorsdefaultthreedropdownitemicon|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar dropdown item color <strong>icon</strong> </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultthreedropdownitemicon" name="sidebarcolorsdefaultthreedropdownitemicon" {if $themecolorsetting.sidebarcolorsdefaultthreedropdownitemicon|default:'' == null}value="#758085"{else}value="{$themecolorsetting.sidebarcolorsdefaultthreedropdownitemicon|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar dropdown item hover color <strong>text</strong> </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultthreedropdownitemtexthover" name="sidebarcolorsdefaultthreedropdownitemtexthover" {if $themecolorsetting.sidebarcolorsdefaultthreedropdownitemtexthover|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.sidebarcolorsdefaultthreedropdownitemtexthover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar dropdown item hover color <strong>icon</strong> </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultthreedropdownitemiconhover" name="sidebarcolorsdefaultthreedropdownitemiconhover" {if $themecolorsetting.sidebarcolorsdefaultthreedropdownitemiconhover|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.sidebarcolorsdefaultthreedropdownitemiconhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Sidebar colors Schemes <small>Dark</small></h6>
				<div class="row">
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar background </label>
							<input class="form-control color-picker" id="sidebarcolorsdarkthreebg" name="sidebarcolorsdarkthreebg" {if $themecolorsetting.sidebarcolorsdarkthreebg|default:'' == null}value="#151718"{else}value="{$themecolorsetting.sidebarcolorsdarkthreebg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar extend button background </label>
							<input class="form-control color-picker" id="sidebarcolorsdarkthreeextendbtnbg" name="sidebarcolorsdarkthreeextendbtnbg" {if $themecolorsetting.sidebarcolorsdarkthreeextendbtnbg|default:'' == null}value="#2d3031"{else}value="{$themecolorsetting.sidebarcolorsdarkthreeextendbtnbg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar item background </label>
							<input class="form-control color-picker" id="sidebarcolorsdarkthreeitembg" name="sidebarcolorsdarkthreeitembg" {if $themecolorsetting.sidebarcolorsdarkthreeitembg|default:'' == null}value="#2d3031"{else}value="{$themecolorsetting.sidebarcolorsdarkthreeitembg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar item hover background </label>
							<input class="form-control color-picker" id="sidebarcolorsdarkthreeitemhoverbg" name="sidebarcolorsdarkthreeitemhoverbg" {if $themecolorsetting.sidebarcolorsdarkthreeitemhoverbg|default:'' == null}value="#2d3031"{else}value="{$themecolorsetting.sidebarcolorsdarkthreeitemhoverbg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar item color <strong>text</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdarkthreeitemtext" name="sidebarcolorsdarkthreeitemtext" {if $themecolorsetting.sidebarcolorsdarkthreeitemtext|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdarkthreeitemtext|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar item color <strong>icon</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdarkthreeitemicon" name="sidebarcolorsdarkthreeitemicon" {if $themecolorsetting.sidebarcolorsdarkthreeitemicon|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdarkthreeitemicon|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar item hover color <strong>text</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdarkthreeitemtexthover" name="sidebarcolorsdarkthreeitemtexthover" {if $themecolorsetting.sidebarcolorsdarkthreeitemtexthover|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.sidebarcolorsdarkthreeitemtexthover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar item hover color <strong>icon</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdarkthreeitemiconhover" name="sidebarcolorsdarkthreeitemiconhover" {if $themecolorsetting.sidebarcolorsdarkthreeitemiconhover|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.sidebarcolorsdarkthreeitemiconhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar dropdown background </label>
							<input class="form-control color-picker" id="sidebarcolorsdarkthreedropdownbg" name="sidebarcolorsdarkthreedropdownbg" {if $themecolorsetting.sidebarcolorsdarkthreedropdownbg|default:'' == null}value="#0e0e0f"{else}value="{$themecolorsetting.sidebarcolorsdarkthreedropdownbg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar dropdown title color </label>
							<input class="form-control color-picker" id="sidebarcolorsdarkthreedropdowntitle" name="sidebarcolorsdarkthreedropdowntitle" {if $themecolorsetting.sidebarcolorsdarkthreedropdowntitle|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdarkthreedropdowntitle|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar dropdown item Background </label>
							<input class="form-control color-picker" id="sidebarcolorsdarkthreedropdownitembg" name="sidebarcolorsdarkthreedropdownitembg" {if $themecolorsetting.sidebarcolorsdarkthreedropdownitembg|default:'' == null}value="#1a1a1c"{else}value="{$themecolorsetting.sidebarcolorsdarkthreedropdownitembg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar dropdown item color <strong>text</strong> </label>
							<input class="form-control color-picker" id="sidebarcolorsdarkthreedropdownitemtext" name="sidebarcolorsdarkthreedropdownitemtext" {if $themecolorsetting.sidebarcolorsdarkthreedropdownitemtext|default:'' == null}value="#758085"{else}value="{$themecolorsetting.sidebarcolorsdarkthreedropdownitemtext|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar dropdown item color <strong>icon</strong> </label>
							<input class="form-control color-picker" id="sidebarcolorsdarkthreedropdownitemicon" name="sidebarcolorsdarkthreedropdownitemicon" {if $themecolorsetting.sidebarcolorsdarkthreedropdownitemicon|default:'' == null}value="#758085"{else}value="{$themecolorsetting.sidebarcolorsdarkthreedropdownitemicon|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar dropdown item color <strong>text</strong> </label>
							<input class="form-control color-sidebarcolorsdarkthreedropdownitemtexthover" id="sidebarcolorsdarkthreedropdownitemtexthover" name="sidebarcolorsdarkthreedropdownitemtexthover" {if $themecolorsetting.sidebarcolorsdarkthreedropdownitemtexthover|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdarkthreedropdownitemiconhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar dropdown item color <strong>icon</strong> </label>
							<input class="form-control color-picker" id="sidebarcolorsdarkthreedropdownitemiconhover" name="sidebarcolorsdarkthreedropdownitemiconhover" {if $themecolorsetting.sidebarcolorsdarkthreedropdownitemiconhover|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdarkthreedropdownitemiconhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>Primary</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">primary background </label>
							<input class="form-control color-picker" id="alertbgprimarythree" name="alertbgprimarythree" {if $themecolorsetting.alertbgprimarythree|default:'' == null}value="#E2E1F7"{else}value="{$themecolorsetting.alertbgprimarythree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">primary color </label>
							<input class="form-control color-picker" id="alertcolorprimarythree" name="alertcolorprimarythree" {if $themecolorsetting.alertcolorprimarythree|default:'' == null}value="#473BF0"{else}value="{$themecolorsetting.alertcolorprimarythree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>secondary</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">secondary background </label>
							<input class="form-control color-picker" id="alertbgsecondarythree" name="alertbgsecondarythree" {if $themecolorsetting.alertbgsecondarythree|default:'' == null}value="#F9F9F9"{else}value="{$themecolorsetting.alertbgsecondarythree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">secondary color </label>
							<input class="form-control color-picker" id="alertcolorsecondarythree" name="alertcolorsecondarythree" {if $themecolorsetting.alertcolorsecondarythree|default:'' == null}value="#7E8299"{else}value="{$themecolorsetting.alertcolorsecondarythree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>success</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">success background </label>
							<input class="form-control color-picker" id="alertbgsuccessthree" name="alertbgsuccessthree" {if $themecolorsetting.alertbgsuccessthree|default:'' == null}value="#E8FFF3"{else}value="{$themecolorsetting.alertbgsuccessthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">success color </label>
							<input class="form-control color-picker" id="alertcolorsuccessthree" name="alertcolorsuccessthree" {if $themecolorsetting.alertcolorsuccessthree|default:'' == null}value="#50CD89"{else}value="{$themecolorsetting.alertcolorsuccessthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>danger</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">danger background </label>
							<input class="form-control color-picker" id="alertbgdangerthree" name="alertbgdangerthree" {if $themecolorsetting.alertbgdangerthree|default:'' == null}value="#F7D4D6"{else}value="{$themecolorsetting.alertbgdangerthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">danger color </label>
							<input class="form-control color-picker" id="alertcolordangerthree" name="alertcolordangerthree" {if $themecolorsetting.alertcolordangerthree|default:'' == null}value="#D92632"{else}value="{$themecolorsetting.alertcolordangerthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>warning</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">warning background </label>
							<input class="form-control color-picker" id="alertbgwarningthree" name="alertbgwarningthree" {if $themecolorsetting.alertbgwarningthree|default:'' == null}value="#FDF2E2"{else}value="{$themecolorsetting.alertbgwarningthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">warning color </label>
							<input class="form-control color-picker" id="alertcolorwarningthree" name="alertcolorwarningthree" {if $themecolorsetting.alertcolorwarningthree|default:'' == null}value="#F0AD4E"{else}value="{$themecolorsetting.alertcolorwarningthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>info</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">info background </label>
							<input class="form-control color-picker" id="alertbginfothree" name="alertbginfothree" {if $themecolorsetting.alertbginfothree|default:'' == null}value="#C4E7F2"{else}value="{$themecolorsetting.alertbginfothree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">info color </label>
							<input class="form-control color-picker" id="alertcolorinfothree" name="alertcolorinfothree" {if $themecolorsetting.alertcolorinfothree|default:'' == null}value="#4AADCB"{else}value="{$themecolorsetting.alertcolorinfothree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>light</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light background </label>
							<input class="form-control color-picker" id="alertbglightthree" name="alertbglightthree" {if $themecolorsetting.alertbglightthree|default:'' == null}value="#F8F9FA"{else}value="{$themecolorsetting.alertbglightthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light color </label>
							<input class="form-control color-picker" id="alertcolorlightthree" name="alertcolorlightthree" {if $themecolorsetting.alertcolorlightthree|default:'' == null}value="#212529"{else}value="{$themecolorsetting.alertcolorlightthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>dark</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">dark background </label>
							<input class="form-control color-picker" id="alertbgdarkthree" name="alertbgdarkthree" {if $themecolorsetting.alertbgdarkthree|default:'' == null}value="#343A40"{else}value="{$themecolorsetting.alertbgdarkthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">dark color </label>
							<input class="form-control color-picker" id="alertcolordarkthree" name="alertcolordarkthree" {if $themecolorsetting.alertcolordarkthree|default:'' == null}value="#FFFFFF"{else}value="{$themecolorsetting.alertcolordarkthree|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
		</div>
		
		<div class="section {if $themecolorsetting.dafaultthemecolor|default:''=='theme-style-four'}d-block{else}d-none{/if}" id="custom-colors-schemes-four">
			<h5 class="title">Custom Red Theme Color Schemes</h5>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Backgrounds Colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Main Background color </label>
							<input class="form-control color-picker" id="backroundonefour" name="backroundonefour" {if $themecolorsetting.backroundonefour|default:'' == null}value="#ffffff"{else}value="{$themecolorsetting.backroundonefour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 2 Background color </label>
							<input class="form-control color-picker" id="backroundtwofour" name="backroundtwofour" {if $themecolorsetting.backroundtwofour|default:'' == null}value="#f5e9ea"{else}value="{$themecolorsetting.backroundtwofour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 3 Background color </label>
							<input class="form-control color-picker" id="backroundtreefour" name="backroundtreefour" {if $themecolorsetting.backroundtreefour|default:'' == null}value="#f6d4d7"{else}value="{$themecolorsetting.backroundtreefour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 4 Background color </label>
							<input class="form-control color-picker" id="backroundfourfour" name="backroundfourfour" {if $themecolorsetting.backroundfourfour|default:'' == null}value="#e6cfd1"{else}value="{$themecolorsetting.backroundfourfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 5 Background color </label>
							<input class="form-control color-picker" id="backroundfivefour" name="backroundfivefour" {if $themecolorsetting.backroundfivefour|default:'' == null}value="#f69fbd"{else}value="{$themecolorsetting.backroundfivefour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 6 Background color </label>
							<input class="form-control color-picker" id="backroundsixfour" name="backroundsixfour" {if $themecolorsetting.backroundsixfour|default:'' == null}value="#eec3c7"{else}value="{$themecolorsetting.backroundsixfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 7 Background color </label>
							<input class="form-control color-picker" id="backroundsavenfour" name="backroundsavenfour" {if $themecolorsetting.backroundsavenfour|default:'' == null}value="#fff"{else}value="{$themecolorsetting.backroundsavenfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 8 Background color </label>
							<input class="form-control color-picker" id="backroundeightfour" name="backroundeightfour" {if $themecolorsetting.backroundeightfour|default:'' == null}value="#fbf3f4"{else}value="{$themecolorsetting.backroundeightfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 9 Background color </label>
							<input class="form-control color-picker" id="backroundninefour" name="backroundninefour" {if $themecolorsetting.backroundninefour|default:'' == null}value="#5daea8"{else}value="{$themecolorsetting.backroundninefour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 10 Background color </label>
							<input class="form-control color-picker" id="backroundtenfour" name="backroundtenfour" {if $themecolorsetting.backroundtenfour|default:'' == null}value="#eddcde"{else}value="{$themecolorsetting.backroundtenfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 11 Background color </label>
							<input class="form-control color-picker" id="backroundelevenfour" name="backroundelevenfour" {if $themecolorsetting.backroundelevenfour|default:'' == null}value="#edb3b8"{else}value="{$themecolorsetting.backroundelevenfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 12 Background color </label>
							<input class="form-control color-picker" id="backroundtwelvefour" name="backroundtwelvefour" {if $themecolorsetting.backroundtwelvefour|default:'' == null}value="#d6535f"{else}value="{$themecolorsetting.backroundtwelvefour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 13 Background color </label>
							<input class="form-control color-picker" id="backroundthirteenfour" name="backroundthirteenfour" {if $themecolorsetting.backroundthirteenfour|default:'' == null}value="#ff6a78"{else}value="{$themecolorsetting.backroundthirteenfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 14 Background color </label>
							<input class="form-control color-picker" id="backroundfourteenfour" name="backroundfourteenfour" {if $themecolorsetting.backroundfourteenfour|default:'' == null}value="#fff"{else}value="{$themecolorsetting.backroundfourteenfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Lighter 15 Background color </label>
							<input class="form-control color-picker" id="backroundfifteenfour" name="backroundfifteenfour" {if $themecolorsetting.backroundfifteenfour|default:'' == null}value="#ff6a78"{else}value="{$themecolorsetting.backroundfifteenfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Primary button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background</label>
							<input class="form-control color-picker" id="btnprimarybgfour" name="btnprimarybgfour" {if $themecolorsetting.btnprimarybgfour|default:'' == null}value="#ff6a78"{else}value="{$themecolorsetting.btnprimarybgfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border</label>
							<input class="form-control color-picker" id="btnprimaryborderfour" name="btnprimaryborderfour" {if $themecolorsetting.btnprimaryborderfour|default:'' == null}value="#ff6a78"{else}value="{$themecolorsetting.btnprimaryborderfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color</label>
							<input class="form-control color-picker" id="btnprimarycolorfour" name="btnprimarycolorfour" {if $themecolorsetting.btnprimarycolorfour|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimarycolorfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background hover</label>
							<input class="form-control color-picker" id="btnprimarybghoverfour" name="btnprimarybghoverfour" {if $themecolorsetting.btnprimarybghoverfour|default:'' == null}value="#e04857"{else}value="{$themecolorsetting.btnprimarybghoverfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border hover</label>
							<input class="form-control color-picker" id="btnprimaryborderhoverfour" name="btnprimaryborderhoverfour" {if $themecolorsetting.btnprimaryborderhoverfour|default:'' == null}value="#e04857"{else}value="{$themecolorsetting.btnprimaryborderhoverfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color hover</label>
							<input class="form-control color-picker" id="btnprimarycolorhoverfour" name="btnprimarycolorhoverfour" {if $themecolorsetting.btnprimarycolorhoverfour|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimarycolorhoverfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Primary Light button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background</label>
							<input class="form-control color-picker" id="btnprimarylightbgfour" name="btnprimarylightbgfour" {if $themecolorsetting.btnprimarylightbgfour|default:'' == null}value="#f9f9f9"{else}value="{$themecolorsetting.btnprimarylightbgfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border</label>
							<input class="form-control color-picker" id="btnprimarylightborderfour" name="btnprimarylightborderfour" {if $themecolorsetting.btnprimarylightborderfour|default:'' == null}value="#f9f9f9"{else}value="{$themecolorsetting.btnprimarylightborderfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color</label>
							<input class="form-control color-picker" id="btnprimarylightcolorfour" name="btnprimarylightcolorfour" {if $themecolorsetting.btnprimarylightcolorfour|default:'' == null}value="#ff6a78"{else}value="{$themecolorsetting.btnprimarylightcolorfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background hover</label>
							<input class="form-control color-picker" id="btnprimarylightbghoverfour" name="btnprimarylightbghoverfour" {if $themecolorsetting.btnprimarylightbghoverfour|default:'' == null}value="#f4f4f4"{else}value="{$themecolorsetting.btnprimarylightbghoverfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border hover</label>
							<input class="form-control color-picker" id="btnprimarylightborderhoverfour" name="btnprimarylightborderhoverfour" {if $themecolorsetting.btnprimarylightborderhoverfour|default:'' == null}value="#f4f4f4"{else}value="{$themecolorsetting.btnprimarylightborderhoverfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color hover</label>
							<input class="form-control color-picker" id="btnprimarylightcolorhoverfour" name="btnprimarylightcolorhoverfour" {if $themecolorsetting.btnprimarylightcolorhoverfour|default:'' == null}value="#7e8299"{else}value="{$themecolorsetting.btnprimarylightcolorhoverfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Default button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background</label>
							<input class="form-control color-picker" id="btndefaultbgfour" name="btndefaultbgfour" {if $themecolorsetting.btndefaultbgfour|default:'' == null}value="#F9F9F9"{else}value="{$themecolorsetting.btndefaultbgfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border</label>
							<input class="form-control color-picker" id="btndefaultborderfour" name="btndefaultborderfour" {if $themecolorsetting.btndefaultborderfour|default:'' == null}value="#F9F9F9"{else}value="{$themecolorsetting.btndefaultborderfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color</label>
							<input class="form-control color-picker" id="btndefaultcolorfour" name="btndefaultcolorfour" {if $themecolorsetting.btndefaultcolorfour|default:'' == null}value="#7E8299"{else}value="{$themecolorsetting.btndefaultcolorfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background hover</label>
							<input class="form-control color-picker" id="btndefaultbghoverfour" name="btndefaultbghoverfour" {if $themecolorsetting.btndefaultbghoverfour|default:'' == null}value="#F4F4F4"{else}value="{$themecolorsetting.btndefaultbghoverfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border hover</label>
							<input class="form-control color-picker" id="btndefaultborderhoverfour" name="btndefaultborderhoverfour" {if $themecolorsetting.btndefaultborderhoverfour|default:'' == null}value="#F4F4F4"{else}value="{$themecolorsetting.btndefaultborderhoverfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color hover</label>
							<input class="form-control color-picker" id="btndefaultcolorhoverfour" name="btndefaultcolorhoverfour" {if $themecolorsetting.btndefaultcolorhoverfour|default:'' == null}value="#7E8299"{else}value="{$themecolorsetting.btndefaultcolorhoverfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Primary outline button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background</label>
							<input class="form-control color-picker" id="btnprimaryoutlinebgfour" name="btnprimaryoutlinebgfour" {if $themecolorsetting.btnprimaryoutlinebgfour|default:'' == null}value="#FFFFFF"{else}value="{$themecolorsetting.btnprimaryoutlinebgfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border</label>
							<input class="form-control color-picker" id="btnprimaryoutlineborderfour" name="btnprimaryoutlineborderfour" {if $themecolorsetting.btnprimaryoutlineborderfour|default:'' == null}value="#ff6a78"{else}value="{$themecolorsetting.btnprimaryoutlineborderfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color</label>
							<input class="form-control color-picker" id="btnprimaryoutlinecolorfour" name="btnprimaryoutlinecolorfour" {if $themecolorsetting.btnprimaryoutlinecolorfour|default:'' == null}value="#ff6a78"{else}value="{$themecolorsetting.btnprimaryoutlinecolorfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinebghoverfour" name="btnprimaryoutlinebghoverfour" {if $themecolorsetting.btnprimaryoutlinebghoverfour|default:'' == null}value="#ff6a78"{else}value="{$themecolorsetting.btnprimaryoutlinebghoverfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlineborderhoverfour" name="btnprimaryoutlineborderhoverfour" {if $themecolorsetting.btnprimaryoutlineborderhoverfour|default:'' == null}value="#ff6a78"{else}value="{$themecolorsetting.btnprimaryoutlineborderhoverfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinecolorhoverfour" name="btnprimaryoutlinecolorhoverfour" {if $themecolorsetting.btnprimaryoutlinecolorhoverfour|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimaryoutlinecolorhoverfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">primary outline white button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background</label>
							<input class="form-control color-picker" id="btnprimaryoutlinewhitebgfour" name="btnprimaryoutlinewhitebgfour" {if $themecolorsetting.btnprimaryoutlinewhitebgfour|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimaryoutlinewhitebgfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border</label>
							<input class="form-control color-picker" id="btnprimaryoutlinewhiteborderfour" name="btnprimaryoutlinewhiteborderfour" {if $themecolorsetting.btnprimaryoutlinewhiteborderfour|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimaryoutlinewhiteborderfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color</label>
							<input class="form-control color-picker" id="btnprimaryoutlinewhitecolorfour" name="btnprimaryoutlinewhitecolorfour" {if $themecolorsetting.btnprimaryoutlinewhitecolorfour|default:'' == null}value="#ff6a78"{else}value="{$themecolorsetting.btnprimaryoutlinewhitecolorfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinewhitebghoverfour" name="btnprimaryoutlinewhitebghoverfour" {if $themecolorsetting.btnprimaryoutlinewhitebghoverfour|default:'' == null}value="#ff6a78"{else}value="{$themecolorsetting.btnprimaryoutlinewhitebghoverfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinewhiteborderhoverfour" name="btnprimaryoutlinewhiteborderhoverfour" {if $themecolorsetting.btnprimaryoutlinewhiteborderhoverfour|default:'' == null}value="#ff6a78"{else}value="{$themecolorsetting.btnprimaryoutlinewhiteborderhoverfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinewhitecolorhoverfour" name="btnprimaryoutlinewhitecolorhoverfour" {if $themecolorsetting.btnprimaryoutlinewhitecolorhoverfour|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimaryoutlinewhitecolorhoverfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Primary outline light button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background</label>
							<input class="form-control color-picker" id="btnprimaryoutlinelightbgfour" name="btnprimaryoutlinelightbgfour" {if $themecolorsetting.btnprimaryoutlinelightbgfour|default:'' == null}value="#FFFFFF"{else}value="{$themecolorsetting.btnprimaryoutlinelightbgfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border</label>
							<input class="form-control color-picker" id="btnprimaryoutlinelightborderfour" name="btnprimaryoutlinelightborderfour" {if $themecolorsetting.btnprimaryoutlinelightborderfour|default:'' == null}value="#ff6a78"{else}value="{$themecolorsetting.btnprimaryoutlinelightborderfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color</label>
							<input class="form-control color-picker" id="btnprimaryoutlinelightcolorfour" name="btnprimaryoutlinelightcolorfour" {if $themecolorsetting.btnprimaryoutlinelightcolorfour|default:'' == null}value="#ff6a78"{else}value="{$themecolorsetting.btnprimaryoutlinelightcolorfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn background hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinelightbghoverfour" name="btnprimaryoutlinelightbghoverfour" {if $themecolorsetting.btnprimaryoutlinelightbghoverfour|default:'' == null}value="#ff6a78"{else}value="{$themecolorsetting.btnprimaryoutlinelightbghoverfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn border hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinelightborderhoverfour" name="btnprimaryoutlinelightborderhoverfour" {if $themecolorsetting.btnprimaryoutlinelightborderhoverfour|default:'' == null}value="#ff6a78"{else}value="{$themecolorsetting.btnprimaryoutlinelightborderhoverfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Primary btn color hover</label>
							<input class="form-control color-picker" id="btnprimaryoutlinelightcolorhoverfour" name="btnprimaryoutlinelightcolorhoverfour" {if $themecolorsetting.btnprimaryoutlinelightcolorhoverfour|default:'' == null}value="#fff"{else}value="{$themecolorsetting.btnprimaryoutlinelightcolorhoverfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">light button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light btn background</label>
							<input class="form-control color-picker" id="btnlightbgfour" name="btnlightbgfour" {if $themecolorsetting.btnlightbgfour|default:'' == null}value="#F9F9F9"{else}value="{$themecolorsetting.btnlightbgfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light btn border</label>
							<input class="form-control color-picker" id="btnlightborderfour" name="btnlightborderfour" {if $themecolorsetting.btnlightborderfour|default:'' == null}value="#F9F9F9"{else}value="{$themecolorsetting.btnlightborderfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light btn color</label>
							<input class="form-control color-picker" id="btnlightcolorfour" name="btnlightcolorfour" {if $themecolorsetting.btnlightcolorfour|default:'' == null}value="#7E8299"{else}value="{$themecolorsetting.btnlightcolorfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light btn background hover</label>
							<input class="form-control color-picker" id="btnlightbghoverfour" name="btnlightbghoverfour" {if $themecolorsetting.btnlightbghoverfour|default:'' == null}value="#F4F4F4"{else}value="{$themecolorsetting.btnlightbghoverfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light btn border hover</label>
							<input class="form-control color-picker" id="btnlightborderhoverfour" name="btnlightborderhoverfour" {if $themecolorsetting.btnlightborderhoverfour|default:'' == null}value="#F4F4F4"{else}value="{$themecolorsetting.btnlightborderhoverfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light btn color hover</label>
							<input class="form-control color-picker" id="btnlightcolorhoverfour" name="btnlightcolorhoverfour" {if $themecolorsetting.btnlightcolorhoverfour|default:'' == null}value="#7E8299"{else}value="{$themecolorsetting.btnlightcolorhoverfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">lighter button colors</h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">lighter btn background</label>
							<input class="form-control color-picker" id="btnlighterbgfour" name="btnlighterbgfour" {if $themecolorsetting.btnlighterbgfour|default:'' == null}value="#FCFCFC"{else}value="{$themecolorsetting.btnlighterbgfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">lighter btn border</label>
							<input class="form-control color-picker" id="btnlighterborderfour" name="btnlighterborderfour" {if $themecolorsetting.btnlighterborderfour|default:'' == null}value="#FCFCFC"{else}value="{$themecolorsetting.btnlighterborderfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">lighter btn color</label>
							<input class="form-control color-picker" id="btnlightercolorfour" name="btnlightercolorfour" {if $themecolorsetting.btnlightercolorfour|default:'' == null}value="#7E8299"{else}value="{$themecolorsetting.btnlightercolorfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">lighter btn background hover</label>
							<input class="form-control color-picker" id="btnlighterbghoverfour" name="btnlighterbghoverfour" {if $themecolorsetting.btnlighterbghoverfour|default:'' == null}value="#F9F9F9"{else}value="{$themecolorsetting.btnlighterbghoverfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">lighter btn border hover</label>
							<input class="form-control color-picker" id="btnlighterborderhoverfour" name="btnlighterborderhoverfour" {if $themecolorsetting.btnlighterborderhoverfour|default:'' == null}value="#F9F9F9"{else}value="{$themecolorsetting.btnlighterborderhoverfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">lighter btn color hover</label>
							<input class="form-control color-picker" id="btnlightercolorhoverfour" name="btnlightercolorhoverfour" {if $themecolorsetting.btnlightercolorhoverfour|default:'' == null}value="#7E8299"{else}value="{$themecolorsetting.btnlightercolorhoverfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Texts Colors <small>Headings, Texts, Borders, Tags Colors & More ...</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Headings Text Color </label>
							<input class="form-control color-picker" id="textstagscolorfourheading" name="textstagscolorfourheading" {if $themecolorsetting.textstagscolorfourheading|default:'' == null}value="#161c2d"{else}value="{$themecolorsetting.textstagscolorfourheading|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Headings Hover Text Color </label>
							<input class="form-control color-picker" id="textstagscolorfourheadinghover" name="textstagscolorfourheadinghover" {if $themecolorsetting.textstagscolorfourheadinghover|default:'' == null}value="#5b6278"{else}value="{$themecolorsetting.textstagscolorfourheadinghover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Headings Text Color <strong>gray</strong> </label>
							<input class="form-control color-picker" id="textstagscolorfourheadinggray" name="textstagscolorfourheadinggray" {if $themecolorsetting.textstagscolorfourheadinggray|default:'' == null}value="#b5b5c3"{else}value="{$themecolorsetting.textstagscolorfourheadinggray|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sub Headings Text Color</label>
							<input class="form-control color-picker" id="textstagscolorfoursubheading" name="textstagscolorfoursubheading" {if $themecolorsetting.textstagscolorfoursubheading|default:'' == null}value="#a6adc2"{else}value="{$themecolorsetting.textstagscolorfoursubheading|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Color Texts</label>
							<input class="form-control color-picker" id="textstagscolorfourtextcolor" name="textstagscolorfourtextcolor" {if $themecolorsetting.textstagscolorfourtextcolor|default:'' == null}value="#161c2d"{else}value="{$themecolorsetting.textstagscolorfourtextcolor|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Color Texts Opacity</label>
							<input class="form-control color-picker" id="textstagscolorfourtextcoloropacity" name="textstagscolorfourtextcoloropacity" {if $themecolorsetting.textstagscolorfourtextcoloropacity|default:'' == null}value="#8b93a9"{else}value="{$themecolorsetting.textstagscolorfourtextcoloropacity|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Border Color</label>
							<input class="form-control color-picker" id="textstagscolorfourborder" name="textstagscolorfourborder" {if $themecolorsetting.textstagscolorfourborder|default:'' == null}value="#e7e9ed"{else}value="{$themecolorsetting.textstagscolorfourborder|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Border Color Light</label>
							<input class="form-control color-picker" id="textstagscolorfourborderlight" name="textstagscolorfourborderlight" {if $themecolorsetting.textstagscolorfourborderlight|default:'' == null}value="#eceff9"{else}value="{$themecolorsetting.textstagscolorfourborderlight|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Link Color</label>
							<input class="form-control color-picker" id="textstagscolorfourlink" name="textstagscolorfourlink" {if $themecolorsetting.textstagscolorfourlink|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.textstagscolorfourlink|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Link Hover Color</label>
							<input class="form-control color-picker" id="textstagscolorfourlinkhover" name="textstagscolorfourlinkhover" {if $themecolorsetting.textstagscolorfourlinkhover|default:'' == null}value="#088d9f"{else}value="{$themecolorsetting.textstagscolorfourlinkhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Sidebar colors Schemes <small>Default</small></h6>
				<div class="row">
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar background </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultfourbg" name="sidebarcolorsdefaultfourbg" {if $themecolorsetting.sidebarcolorsdefaultfourbg|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdefaultfourbg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar extend button background </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultfourextendbtnbg" name="sidebarcolorsdefaultfourextendbtnbg" {if $themecolorsetting.sidebarcolorsdefaultfourextendbtnbg|default:'' == null}value="#f6f5fb"{else}value="{$themecolorsetting.sidebarcolorsdefaultfourextendbtnbg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar item background </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultfouritembg" name="sidebarcolorsdefaultfouritembg" {if $themecolorsetting.sidebarcolorsdefaultfouritembg|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdefaultfouritembg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar item hover background </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultfouritemhoverbg" name="sidebarcolorsdefaultfouritemhoverbg" {if $themecolorsetting.sidebarcolorsdefaultfouritemhoverbg|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdefaultfouritemhoverbg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar item color <strong>text</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultfouritemtext" name="sidebarcolorsdefaultfouritemtext" {if $themecolorsetting.sidebarcolorsdefaultfouritemtext|default:'' == null}value="#161c2d"{else}value="{$themecolorsetting.sidebarcolorsdefaultfouritemtext|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar item color <strong>icon</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultfouritemicon" name="sidebarcolorsdefaultfouritemicon" {if $themecolorsetting.sidebarcolorsdefaultfouritemicon|default:'' == null}value="#161c2d"{else}value="{$themecolorsetting.sidebarcolorsdefaultfouritemicon|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar item hover color <strong>text</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultfouritemtexthover" name="sidebarcolorsdefaultfouritemtexthover" {if $themecolorsetting.sidebarcolorsdefaultfouritemtexthover|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.sidebarcolorsdefaultfouritemtexthover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar item hover color <strong>icon</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultfouritemiconhover" name="sidebarcolorsdefaultfouritemiconhover" {if $themecolorsetting.sidebarcolorsdefaultfouritemiconhover|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.sidebarcolorsdefaultfouritemiconhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar dropdown background </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultfourdropdownbg" name="sidebarcolorsdefaultfourdropdownbg" {if $themecolorsetting.sidebarcolorsdefaultfourdropdownbg|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdefaultfourdropdownbg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar dropdown title color </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultfourdropdowntitle" name="sidebarcolorsdefaultfourdropdowntitle" {if $themecolorsetting.sidebarcolorsdefaultfourdropdowntitle|default:'' == null}value="#18191a"{else}value="{$themecolorsetting.sidebarcolorsdefaultfourdropdowntitle|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar dropdown item Background </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultfourdropdownitemtext" name="sidebarcolorsdefaultfourdropdownitemtext" {if $themecolorsetting.sidebarcolorsdefaultfourdropdownitemtext|default:'' == null}value="#f9f8fa"{else}value="{$themecolorsetting.sidebarcolorsdefaultfourdropdownitemtext|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar dropdown item color <strong>text</strong> </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultfourdropdownitemicon" name="sidebarcolorsdefaultfourdropdownitemicon" {if $themecolorsetting.sidebarcolorsdefaultfourdropdownitemicon|default:'' == null}value="#758085"{else}value="{$themecolorsetting.sidebarcolorsdefaultfourdropdownitemicon|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar dropdown item color <strong>icon</strong> </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultfourdropdownitemicon" name="sidebarcolorsdefaultfourdropdownitemicon" {if $themecolorsetting.sidebarcolorsdefaultfourdropdownitemicon|default:'' == null}value="#758085"{else}value="{$themecolorsetting.sidebarcolorsdefaultfourdropdownitemicon|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar dropdown item hover color <strong>text</strong> </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultfourdropdownitemtexthover" name="sidebarcolorsdefaultfourdropdownitemtexthover" {if $themecolorsetting.sidebarcolorsdefaultfourdropdownitemtexthover|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.sidebarcolorsdefaultfourdropdownitemtexthover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Sidebar dropdown item hover color <strong>icon</strong> </label>
							<input class="form-control color-picker" id="sidebarcolorsdefaultfourdropdownitemiconhover" name="sidebarcolorsdefaultfourdropdownitemiconhover" {if $themecolorsetting.sidebarcolorsdefaultfourdropdownitemiconhover|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.sidebarcolorsdefaultfourdropdownitemiconhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Sidebar colors Schemes <small>Dark</small></h6>
				<div class="row">
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar background </label>
							<input class="form-control color-picker" id="sidebarcolorsdarkfourbg" name="sidebarcolorsdarkfourbg" {if $themecolorsetting.sidebarcolorsdarkfourbg|default:'' == null}value="#151718"{else}value="{$themecolorsetting.sidebarcolorsdarkfourbg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar extend button background </label>
							<input class="form-control color-picker" id="sidebarcolorsdarkfourextendbtnbg" name="sidebarcolorsdarkfourextendbtnbg" {if $themecolorsetting.sidebarcolorsdarkfourextendbtnbg|default:'' == null}value="#2d3031"{else}value="{$themecolorsetting.sidebarcolorsdarkfourextendbtnbg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar item background </label>
							<input class="form-control color-picker" id="sidebarcolorsdarkfouritembg" name="sidebarcolorsdarkfouritembg" {if $themecolorsetting.sidebarcolorsdarkfouritembg|default:'' == null}value="#2d3031"{else}value="{$themecolorsetting.sidebarcolorsdarkfouritembg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar item hover background </label>
							<input class="form-control color-picker" id="sidebarcolorsdarkfouritemhoverbg" name="sidebarcolorsdarkfouritemhoverbg" {if $themecolorsetting.sidebarcolorsdarkfouritemhoverbg|default:'' == null}value="#2d3031"{else}value="{$themecolorsetting.sidebarcolorsdarkfouritemhoverbg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar item color <strong>text</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdarkfouritemtext" name="sidebarcolorsdarkfouritemtext" {if $themecolorsetting.sidebarcolorsdarkfouritemtext|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdarkfouritemtext|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar item color <strong>icon</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdarkfouritemicon" name="sidebarcolorsdarkfouritemicon" {if $themecolorsetting.sidebarcolorsdarkfouritemicon|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdarkfouritemicon|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar item hover color <strong>text</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdarkfouritemtexthover" name="sidebarcolorsdarkfouritemtexthover" {if $themecolorsetting.sidebarcolorsdarkfouritemtexthover|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.sidebarcolorsdarkfouritemtexthover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar item hover color <strong>icon</strong></label>
							<input class="form-control color-picker" id="sidebarcolorsdarkfouritemiconhover" name="sidebarcolorsdarkfouritemiconhover" {if $themecolorsetting.sidebarcolorsdarkfouritemiconhover|default:'' == null}value="#0cbed5"{else}value="{$themecolorsetting.sidebarcolorsdarkfouritemiconhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar dropdown background </label>
							<input class="form-control color-picker" id="sidebarcolorsdarkfourdropdownbg" name="sidebarcolorsdarkfourdropdownbg" {if $themecolorsetting.sidebarcolorsdarkfourdropdownbg|default:'' == null}value="#0e0e0f"{else}value="{$themecolorsetting.sidebarcolorsdarkfourdropdownbg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar dropdown title color </label>
							<input class="form-control color-picker" id="sidebarcolorsdarkfourdropdowntitle" name="sidebarcolorsdarkfourdropdowntitle" {if $themecolorsetting.sidebarcolorsdarkfourdropdowntitle|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdarkfourdropdowntitle|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar dropdown item Background </label>
							<input class="form-control color-picker" id="sidebarcolorsdarkfourdropdownitembg" name="sidebarcolorsdarkfourdropdownitembg" {if $themecolorsetting.sidebarcolorsdarkfourdropdownitembg|default:'' == null}value="#1a1a1c"{else}value="{$themecolorsetting.sidebarcolorsdarkfourdropdownitembg|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar dropdown item color <strong>text</strong> </label>
							<input class="form-control color-picker" id="sidebarcolorsdarkfourdropdownitemtext" name="sidebarcolorsdarkfourdropdownitemtext" {if $themecolorsetting.sidebarcolorsdarkfourdropdownitemtext|default:'' == null}value="#758085"{else}value="{$themecolorsetting.sidebarcolorsdarkfourdropdownitemtext|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar dropdown item color <strong>icon</strong> </label>
							<input class="form-control color-picker" id="sidebarcolorsdarkfourdropdownitemicon" name="sidebarcolorsdarkfourdropdownitemicon" {if $themecolorsetting.sidebarcolorsdarkfourdropdownitemicon|default:'' == null}value="#758085"{else}value="{$themecolorsetting.sidebarcolorsdarkfourdropdownitemicon|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar dropdown item color <strong>text</strong> </label>
							<input class="form-control color-sidebarcolorsdarkfourdropdownitemtexthover" id="sidebarcolorsdarkfourdropdownitemtexthover" name="sidebarcolorsdarkfourdropdownitemtexthover" {if $themecolorsetting.sidebarcolorsdarkfourdropdownitemtexthover|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdarkfourdropdownitemiconhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-6">
						<div class="form-group">
							<label for="name">Dark Sidebar dropdown item color <strong>icon</strong> </label>
							<input class="form-control color-picker" id="sidebarcolorsdarkfourdropdownitemiconhover" name="sidebarcolorsdarkfourdropdownitemiconhover" {if $themecolorsetting.sidebarcolorsdarkfourdropdownitemiconhover|default:'' == null}value="#fff"{else}value="{$themecolorsetting.sidebarcolorsdarkfourdropdownitemiconhover|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>Primary</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">primary background </label>
							<input class="form-control color-picker" id="alertbgprimaryfour" name="alertbgprimaryfour" {if $themecolorsetting.alertbgprimaryfour|default:'' == null}value="#E2E1F7"{else}value="{$themecolorsetting.alertbgprimaryfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">primary color </label>
							<input class="form-control color-picker" id="alertcolorprimaryfour" name="alertcolorprimaryfour" {if $themecolorsetting.alertcolorprimaryfour|default:'' == null}value="#473BF0"{else}value="{$themecolorsetting.alertcolorprimaryfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>secondary</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">secondary background </label>
							<input class="form-control color-picker" id="alertbgsecondaryfour" name="alertbgsecondaryfour" {if $themecolorsetting.alertbgsecondaryfour|default:'' == null}value="#F9F9F9"{else}value="{$themecolorsetting.alertbgsecondaryfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">secondary color </label>
							<input class="form-control color-picker" id="alertcolorsecondaryfour" name="alertcolorsecondaryfour" {if $themecolorsetting.alertcolorsecondaryfour|default:'' == null}value="#7E8299"{else}value="{$themecolorsetting.alertcolorsecondaryfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>success</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">success background </label>
							<input class="form-control color-picker" id="alertbgsuccessfour" name="alertbgsuccessfour" {if $themecolorsetting.alertbgsuccessfour|default:'' == null}value="#E8FFF3"{else}value="{$themecolorsetting.alertbgsuccessfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">success color </label>
							<input class="form-control color-picker" id="alertcolorsuccessfour" name="alertcolorsuccessfour" {if $themecolorsetting.alertcolorsuccessfour|default:'' == null}value="#50CD89"{else}value="{$themecolorsetting.alertcolorsuccessfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>danger</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">danger background </label>
							<input class="form-control color-picker" id="alertbgdangerfour" name="alertbgdangerfour" {if $themecolorsetting.alertbgdangerfour|default:'' == null}value="#F7D4D6"{else}value="{$themecolorsetting.alertbgdangerfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">danger color </label>
							<input class="form-control color-picker" id="alertcolordangerfour" name="alertcolordangerfour" {if $themecolorsetting.alertcolordangerfour|default:'' == null}value="#D92632"{else}value="{$themecolorsetting.alertcolordangerfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>warning</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">warning background </label>
							<input class="form-control color-picker" id="alertbgwarningfour" name="alertbgwarningfour" {if $themecolorsetting.alertbgwarningfour|default:'' == null}value="#FDF2E2"{else}value="{$themecolorsetting.alertbgwarningfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">warning color </label>
							<input class="form-control color-picker" id="alertcolorwarningfour" name="alertcolorwarningfour" {if $themecolorsetting.alertcolorwarningfour|default:'' == null}value="#F0AD4E"{else}value="{$themecolorsetting.alertcolorwarningfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>info</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">info background </label>
							<input class="form-control color-picker" id="alertbginfofour" name="alertbginfofour" {if $themecolorsetting.alertbginfofour|default:'' == null}value="#C4E7F2"{else}value="{$themecolorsetting.alertbginfofour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">info color </label>
							<input class="form-control color-picker" id="alertcolorinfofour" name="alertcolorinfofour" {if $themecolorsetting.alertcolorinfofour|default:'' == null}value="#4AADCB"{else}value="{$themecolorsetting.alertcolorinfofour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>light</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light background </label>
							<input class="form-control color-picker" id="alertbglightfour" name="alertbglightfour" {if $themecolorsetting.alertbglightfour|default:'' == null}value="#F8F9FA"{else}value="{$themecolorsetting.alertbglightfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">light color </label>
							<input class="form-control color-picker" id="alertcolorlightfour" name="alertcolorlightfour" {if $themecolorsetting.alertcolorlightfour|default:'' == null}value="#212529"{else}value="{$themecolorsetting.alertcolorlightfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">alerts, Badges & status colors <small>dark</small></h6>
				<div class="row">
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">dark background </label>
							<input class="form-control color-picker" id="alertbgdarkfour" name="alertbgdarkfour" {if $themecolorsetting.alertbgdarkfour|default:'' == null}value="#343A40"{else}value="{$themecolorsetting.alertbgdarkfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-6">
						<div class="form-group">
							<label for="name">dark color </label>
							<input class="form-control color-picker" id="alertcolordarkfour" name="alertcolordarkfour" {if $themecolorsetting.alertcolordarkfour|default:'' == null}value="#FFFFFF"{else}value="{$themecolorsetting.alertcolordarkfour|default:''}"{/if} data-jscolor="{
								  preset: 'dark',
								  closeButton: true,
								  closeText: 'OK'}">
						</div>
					</div>
				</div>
			</div>
			
			
		</div>
	
	</form>
</div>
<div class="coodiv__whmcs__admin__panel__form__footer__btns">
	<input class="coodiv__whmcs__admin__panel__form__footer__submit" type="submit" form="applythemecolor" value="Save and apply the style"/>
	<a class="coodiv__whmcs__admin__panel__form__footer__cancel" href="{$modurl}&action=styleoptions">Cancel</a>
</div>

<div id="resetpageoptions" class="coodiv__whmcs__admin__panel__model modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="{$modurl}&action=resetstyleoptions" method="post">
				<div class="coodiv__whmcs__admin__panel__model__header">
					<h4 class="title">Reset <b>Shufy Theme Styles & colors</b> settings</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="fal fa-times"></i></button>
				</div>
				<div class="coodiv__whmcs__admin__panel__model__body">
					 <p>You are trying to Reset Shufy Theme Styles & colors settings, <b class="red">Please not that this action can not be undone!</b>. Please confirm, to reset Shufy Theme Styles & colors settings completly.</p>
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
            <form id="exportForm" action="{$modurl}&action=exportstyleoptions" method="post">
				<div class="coodiv__whmcs__admin__panel__model__header">
					<h4 class="title">Export <b>Shufy Theme Styles & colors</b> settings</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="fal fa-times"></i></button>
				</div>
				<div class="coodiv__whmcs__admin__panel__model__body">
					 <p>You are trying to export Shufy Theme Styles & colors settings, <b class="red">you will download a CSV file!</b>. Please do NOT edit it To avoid any problem that may occur in the future.</p>
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
            <form id="exportForm" action="{$modurl}&action=importstyleoptions" method="post" enctype="multipart/form-data">
				<div class="coodiv__whmcs__admin__panel__model__header">
					<h4 class="title">Import <b>Shufy Theme Styles & colors</b> settings</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="fal fa-times"></i></button>
				</div>
				<div class="coodiv__whmcs__admin__panel__model__body">
					 <p>You are trying to Import Shufy Theme Styles & colors settings, <b class="red">Please check that the file name is shufytheme_styleoptions_exported_data.CSV!</b>. If you upload a different file to the page option that may create issues with your system and <b>Coodiv is not responsible for it.</b></p>
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
			  
