{if $smarty.get.genaralsettingsreset|default:'' == 1}
<div class="settings__popupalert__coodiv alert alert-success alert-dismissible show" role="alert">
  <span class="alert__progress"></span>
  <span class="icon"><i class="fal fa-check-circle"></i></span>
  <div class="text">
  <strong>Success!</strong> Shufytheme Typography settings options has been reset successfully.
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
  <strong>Success!</strong> Shufytheme Typography settings options has been saved successfully.
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
				<h5 class="coodiv__main__hero__title">Shufy Theme Typography settings</h5>
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
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=styleoptions">Color</a></li>
		  <li class="nav-item active"><a class="nav-link">Typography</a></li>
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=layoutoptions">Layouts</a></li>
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=sidebaroptions">Sidebar</a></li>
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=footeroptions">Footer</a></li>
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=homepageoptions">Homepage</a></li>
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=listgroup">Menu</a></li> 
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=settingsbackups">Backups</a></li>
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=themehealthcheck">Health</a></li>
		  
		  <li class="nav-item ml-auto"><a href="{$modurl}&action=extentions" class="nav-link">Extention manager</a></li>
		  
		</ul>
	</div>
	<form id="applythemetype" class="full__fieldset__area default__form__panel__cart coodiv__whmcs__admin__panel__form shufytheme__ajax__save" action="{$modurl}&action=applytyppoptions" method="post">
		<div class="section">
			<h5 class="title">Typography settings</h5>
			<div class="form-group-wrapper-shadow">
				<div class="row">
					<div class="col-md-6 col-12">
						<h6 class="sub-title">Dafault Font Family</h6>
						<div class="form-group">
						<label for="target">Use google font face <i data-toggle="tooltip" data-placement="bottom" title="Choose from bellow the font that you want to use" class="fas fa-info-circle"></i></label>
							<select name="themesettingtyponame" id="themesettingtyponame" class="form-control input-sm">
								<option {if $themetyposetting.themesettingtyponame|default:''=='inter' || $themetyposetting.id|default:'' != '1'}selected{/if} value="inter">Inter Tight</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='lato'}selected{/if} value="lato">Lato</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='abhaya'}selected{/if} value="abhaya">Abhaya Libre</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='merriweather'}selected{/if} value="merriweather">Merriweather</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='alegreya'}selected{/if} value="alegreya">Alegreya</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='montserrat'}selected{/if} value="montserrat">Montserrat</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='aleo'}selected{/if} value="aleo">Aleo</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='muli'}selected{/if} value="muli">Muli</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='arapey'}selected{/if} value="arapey">Arapey</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='nunito'}selected{/if} value="nunito">Nunito</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='asap'}selected{/if} value="asap">Asap Condensed</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='assistant'}selected{/if} value="assistant">Assistant</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='open-sans'}selected{/if} value="open-sans">Open Sans</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='barlow'}selected{/if} value="barlow">Barlow</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='oswald'}selected{/if} value="oswald">Oswald</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='bitter'}selected{/if} value="bitter">Bitter</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='poppins'}selected{/if} value="poppins">Poppins</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='brawler'}selected{/if} value="brawler">Brawler</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='roboto'}selected{/if} value="roboto">Roboto</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='caladea'}selected{/if} value="caladea">Caladea</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='rokkitt'}selected{/if} value="rokkitt">ROKKITT</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='carme'}selected{/if} value="carme">Carme</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='rubik'}selected{/if} value="rubik">Rubik</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='encode'}selected{/if} value="encode">Encode Sans Semi Condensed</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='enriqueta'}selected{/if} value="enriqueta">Enriqueta</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='source-sans-pro'}selected{/if} value="source-sans-pro">Source Sans Pro</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='frank-ruhl-libre'}selected{/if} value="frank-ruhl-libre">Frank Ruhl Libre</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='spectral'}selected{/if} value="spectral">Spectral</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='work-sans'}selected{/if} value="Work-sans">Work Sans</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='gelasio'}selected{/if} value="gelasio">Gelasio</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='headland-one'}selected{/if} value="headland-one">Headland One</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='ubuntu'}selected{/if} value="ubuntu">Ubuntu</option>
								<option {if $themetyposetting.themesettingtyponame|default:''=='exo'}selected{/if} value="exo">Exo</option>
							</select>
						</div>
					</div>
					<div class="col-md-6 col-12">
						<h6 class="sub-title">RTL Font Family</h6>
						<div class="form-group">
						<label for="target">Use google font face <i data-toggle="tooltip" data-placement="bottom" title="Choose from bellow the font that you want to use for RTL users." class="fas fa-info-circle"></i></label>
							<select name="themesettingtyponamertl" id="themesettingtyponamertl" class="form-control input-sm">
								<option {if $themetyposetting.themesettingtyponamertl|default:''=='cairo' || $themetyposetting.id|default:'' != '1'}selected{/if} value="cairo">cairo</option>
								<option {if $themetyposetting.themesettingtyponamertl|default:''=='kufam'}selected{/if} value="kufam">kufam</option>
								<option {if $themetyposetting.themesettingtyponamertl|default:''=='tajawal'}selected{/if} value="tajawal">tajawal</option>
								<option {if $themetyposetting.themesettingtyponamertl|default:''=='rubik'}selected{/if} value="rubik">rubik</option>
								<option {if $themetyposetting.themesettingtyponamertl|default:''=='noto'}selected{/if} value="noto">noto</option>
							</select>
						</div>
					</div>
				</div>
				
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Shufy Theme Font sizes</h6>
				<div class="row">
				<div class="col-md-3 col-6">
				<div class="form-group">
					<label for="target">Shufy Theme Font size 1<i data-toggle="tooltip" data-placement="bottom" title="Customize the font size for text coodiv-text-1 font size" class="fas fa-info-circle"></i></label>
					<div class="font-size-input px">
						<input type="number" name="themesettingtyposhufysizeone" id="themesettingtyposhufysizeone" {if $themetyposetting.themesettingtyposhufysizeone|default:'' == null}value="" placeholder="Leave empty for default settings"{else}value="{$themetyposetting.themesettingtyposhufysizeone|default:''}"{/if} class="form-control" >
					</div>
				</div>
				</div>
				<div class="col-md-3 col-6">
				<div class="form-group">
					<label for="target">Shufy Theme Font size 2<i data-toggle="tooltip" data-placement="bottom" title="Customize the font size for text coodiv-text-2 font size." class="fas fa-info-circle"></i></label>
					<div class="font-size-input px">
						<input type="number" name="themesettingtyposhufysizetwo" id="themesettingtyposhufysizetwo" {if $themetyposetting.themesettingtyposhufysizetwo|default:'' == null}value="" placeholder="Leave empty for default settings"{else}value="{$themetyposetting.themesettingtyposhufysizetwo|default:''}"{/if} class="form-control" >
					</div>
				</div>
				</div>
				<div class="col-md-3 col-6">
				<div class="form-group">
					<label for="target">Shufy Theme Font size 3<i data-toggle="tooltip" data-placement="bottom" title="Customize the font size for text coodiv-text-3 font size." class="fas fa-info-circle"></i></label>
					<div class="font-size-input px">
						<input type="number" name="themesettingtyposhufysizethree" id="themesettingtyposhufysizethree" {if $themetyposetting.themesettingtyposhufysizethree|default:'' == null}value="" placeholder="Leave empty for default settings"{else}value="{$themetyposetting.themesettingtyposhufysizethree|default:''}"{/if} class="form-control" >
					</div>
				</div>
				</div>
				<div class="col-md-3 col-6">
				<div class="form-group">
					<label for="target">Shufy Theme Font size 4<i data-toggle="tooltip" data-placement="bottom" title="Customize the font size for text coodiv-text-4 font size." class="fas fa-info-circle"></i></label>
					<div class="font-size-input px">
						<input type="number" name="themesettingtyposhufysizefour" id="themesettingtyposhufysizefour" {if $themetyposetting.themesettingtyposhufysizefour|default:'' == null}value="" placeholder="Leave empty for default settings"{else}value="{$themetyposetting.themesettingtyposhufysizefour|default:''}"{/if} class="form-control" >
					</div>
				</div>
				</div>
				<div class="col-md-3 col-6">
				<div class="form-group">
					<label for="target">Shufy Theme Font size 5<i data-toggle="tooltip" data-placement="bottom" title="Customize the font size for text coodiv-text-5 font size." class="fas fa-info-circle"></i></label>
					<div class="font-size-input px">
						<input type="number" name="themesettingtyposhufysizefive" id="themesettingtyposhufysizefive" {if $themetyposetting.themesettingtyposhufysizefive|default:'' == null}value="" placeholder="Leave empty for default settings"{else}value="{$themetyposetting.themesettingtyposhufysizefive|default:''}"{/if} class="form-control" >
					</div>
				</div>
				</div>
				<div class="col-md-3 col-6">
				<div class="form-group">
					<label for="target">Shufy Theme Font size 6<i data-toggle="tooltip" data-placement="bottom" title="Customize the font size for text coodiv-text-6 font size." class="fas fa-info-circle"></i></label>
					<div class="font-size-input px">
						<input type="number" name="themesettingtyposhufysizesix" id="themesettingtyposhufysizesix" {if $themetyposetting.themesettingtyposhufysizesix|default:'' == null}value="" placeholder="Leave empty for default settings"{else}value="{$themetyposetting.themesettingtyposhufysizesix|default:''}"{/if} class="form-control" >
					</div>
				</div>
				</div>
				<div class="col-md-3 col-6">
				<div class="form-group">
					<label for="target">Shufy Theme Font size 7<i data-toggle="tooltip" data-placement="bottom" title="Customize the font size for text coodiv-text-7 font size." class="fas fa-info-circle"></i></label>
					<div class="font-size-input px">
						<input type="number" name="themesettingtyposhufysizesaven" id="themesettingtyposhufysizesaven" {if $themetyposetting.themesettingtyposhufysizesaven|default:'' == null}value="" placeholder="Leave empty for default settings"{else}value="{$themetyposetting.themesettingtyposhufysizesaven|default:''}"{/if} class="form-control" >
					</div>
				</div>
				</div>
				<div class="col-md-3 col-6">
				<div class="form-group">
					<label for="target">Shufy Theme Font size 8<i data-toggle="tooltip" data-placement="bottom" title="Customize the font size for text coodiv-text-8 font size." class="fas fa-info-circle"></i></label>
					<div class="font-size-input px">
						<input type="number" name="themesettingtyposhufysizeeight" id="themesettingtyposhufysizeeight" {if $themetyposetting.themesettingtyposhufysizeeight|default:'' == null}value="" placeholder="Leave empty for default settings"{else}value="{$themetyposetting.themesettingtyposhufysizeeight|default:''}"{/if} class="form-control" >
					</div>
				</div>
				</div>
				<div class="col-md-3 col-6">
				<div class="form-group">
					<label for="target">Shufy Theme Font size 9<i data-toggle="tooltip" data-placement="bottom" title="Customize the font size for text coodiv-text-9 font size." class="fas fa-info-circle"></i></label>
					<div class="font-size-input px">
						<input type="number" name="themesettingtyposhufysizenigne" id="themesettingtyposhufysizenigne" {if $themetyposetting.themesettingtyposhufysizenigne|default:'' == null}value="" placeholder="Leave empty for default settings"{else}value="{$themetyposetting.themesettingtyposhufysizenigne|default:''}"{/if} class="form-control" >
					</div>
				</div>
				</div>
				<div class="col-md-3 col-6">
				<div class="form-group">
					<label for="target">Shufy Theme Font size 10<i data-toggle="tooltip" data-placement="bottom" title="Customize the font size for text coodiv-text-10 font size." class="fas fa-info-circle"></i></label>
					<div class="font-size-input px">
						<input type="number" name="themesettingtyposhufysizeteen" id="themesettingtyposhufysizeteen" {if $themetyposetting.themesettingtyposhufysizeteen|default:'' == null}value="" placeholder="Leave empty for default settings"{else}value="{$themetyposetting.themesettingtyposhufysizeteen|default:''}"{/if} class="form-control" >
					</div>
				</div>
				</div>
				<div class="col-md-3 col-6">
				<div class="form-group">
					<label for="target">Shufy Theme Font size 11<i data-toggle="tooltip" data-placement="bottom" title="Customize the font size for text coodiv-text-11 font size." class="fas fa-info-circle"></i></label>
					<div class="font-size-input px">
						<input type="number" name="themesettingtyposhufysizeeleven" id="themesettingtyposhufysizeeleven" {if $themetyposetting.themesettingtyposhufysizeeleven|default:'' == null}value="" placeholder="Leave empty for default settings"{else}value="{$themetyposetting.themesettingtyposhufysizeeleven|default:''}"{/if} class="form-control" >
					</div>
				</div>
				</div>
				<div class="col-md-3 col-6">
				<div class="form-group">
					<label for="target">Shufy Theme Font size 12<i data-toggle="tooltip" data-placement="bottom" title="Customize the font size for text coodiv-text-12 font size." class="fas fa-info-circle"></i></label>
					<div class="font-size-input px">
						<input type="number" name="themesettingtyposhufysizetwelve" id="themesettingtyposhufysizetwelve" {if $themetyposetting.themesettingtyposhufysizetwelve|default:'' == null}value="" placeholder="Leave empty for default settings"{else}value="{$themetyposetting.themesettingtyposhufysizetwelve|default:''}"{/if} class="form-control" >
					</div>
				</div>
				</div>
				<div class="col-md-3 col-6">
				<div class="form-group">
					<label for="target">Shufy Theme Font size 13<i data-toggle="tooltip" data-placement="bottom" title="Customize the font size for text coodiv-text-13 font size." class="fas fa-info-circle"></i></label>
					<div class="font-size-input px">
						<input type="number" name="themesettingtyposhufysizetherteen" id="themesettingtyposhufysizetherteen" {if $themetyposetting.themesettingtyposhufysizetherteen|default:'' == null}value="" placeholder="Leave empty for default settings"{else}value="{$themetyposetting.themesettingtyposhufysizetherteen|default:''}"{/if} class="form-control" >
					</div>
				</div>
				</div>
				
				</div>
			</div>
			
			<div class="form-group-wrapper-shadow">
				<h6 class="sub-title">Shufy Theme tags Font sizes</h6>
				<div class="row">
				<div class="col-md-3 col-6">
				<div class="form-group">
					<label for="target">H1 <i data-toggle="tooltip" data-placement="bottom" title="Customize the font size for h1 tag." class="fas fa-info-circle"></i></label>
					<div class="font-size-input px">
						<input type="number" name="themesettingtypohone" id="themesettingtypohone" {if $themetyposetting.themesettingtypohone|default:'' == null}value="" placeholder="Leave empty for default settings"{else}value="{$themetyposetting.themesettingtypohone|default:''}"{/if} class="form-control" >
					</div>
				</div>
				</div>
				<div class="col-md-3 col-6">
				<div class="form-group">
					<label for="target">H2 <i data-toggle="tooltip" data-placement="bottom" title="Customize the font size for h2 tag." class="fas fa-info-circle"></i></label>
					<div class="font-size-input px">
						<input type="number" name="themesettingtypohtwo" id="themesettingtypohtwo" {if $themetyposetting.themesettingtypohtwo|default:'' == null}value="" placeholder="Leave empty for default settings"{else}value="{$themetyposetting.themesettingtypohtwo|default:''}"{/if} class="form-control" >
					</div>
				</div>
				</div>
				<div class="col-md-3 col-6">
				<div class="form-group">
					<label for="target">H3 <i data-toggle="tooltip" data-placement="bottom" title="Customize the font size for h3 tag." class="fas fa-info-circle"></i></label>
					<div class="font-size-input px">
						<input type="number" name="themesettingtypohthree" id="themesettingtypohthree" {if $themetyposetting.themesettingtypohthree|default:'' == null}value="" placeholder="Leave empty for default settings"{else}value="{$themetyposetting.themesettingtypohthree|default:''}"{/if} class="form-control" >
					</div>
				</div>
				</div>
				<div class="col-md-3 col-6">
				<div class="form-group">
					<label for="target">H4 <i data-toggle="tooltip" data-placement="bottom" title="Customize the font size for h4 tag." class="fas fa-info-circle"></i></label>
					<div class="font-size-input px">
						<input type="number" name="themesettingtypohfour" id="themesettingtypohfour" {if $themetyposetting.themesettingtypohfour|default:'' == null}value="" placeholder="Leave empty for default settings"{else}value="{$themetyposetting.themesettingtypohfour|default:''}"{/if} class="form-control" >
					</div>
				</div>
				</div>
				<div class="col-md-3 col-6">
				<div class="form-group">
					<label for="target">H5 <i data-toggle="tooltip" data-placement="bottom" title="Customize the font size for h5 tag." class="fas fa-info-circle"></i></label>
					<div class="font-size-input px">
						<input type="number" name="themesettingtypohfive" id="themesettingtypohfive" {if $themetyposetting.themesettingtypohfive|default:'' == null}value="" placeholder="Leave empty for default settings"{else}value="{$themetyposetting.themesettingtypohfive|default:''}"{/if} class="form-control" >
					</div>
				</div>
				</div>
				<div class="col-md-3 col-6">
				<div class="form-group">
					<label for="target">H6 <i data-toggle="tooltip" data-placement="bottom" title="Customize the font size for h6 tag." class="fas fa-info-circle"></i></label>
					<div class="font-size-input px">
						<input type="number" name="themesettingtypohsix" id="themesettingtypohsix" {if $themetyposetting.themesettingtypohsix|default:'' == null}value="" placeholder="Leave empty for default settings"{else}value="{$themetyposetting.themesettingtypohsix|default:''}"{/if} class="form-control" >
					</div>
				</div>
				</div>
				<div class="col-md-3 col-6">
				<div class="form-group">
					<label for="target">P <i data-toggle="tooltip" data-placement="bottom" title="Customize the font size for p tag." class="fas fa-info-circle"></i></label>
					<div class="font-size-input px">
						<input type="number" name="themesettingtypop" id="themesettingtypop" {if $themetyposetting.themesettingtypop|default:'' == null}value="" placeholder="Leave empty for default settings"{else}value="{$themetyposetting.themesettingtypop|default:''}"{/if} class="form-control" >
					</div>
				</div>
				</div>
				<div class="col-md-3 col-6">
				<div class="form-group">
					<label for="target">button <i data-toggle="tooltip" data-placement="bottom" title="Customize the font size for the default button." class="fas fa-info-circle"></i></label>
					<div class="font-size-input px">
						<input type="number" name="themesettingtypobutton" id="themesettingtypobutton" {if $themetyposetting.themesettingtypobutton|default:'' == null}value="" placeholder="Leave empty for default settings"{else}value="{$themetyposetting.themesettingtypobutton|default:''}"{/if} class="form-control" >
					</div>
				</div>
				</div>
				<div class="col-md-3 col-6">
				<div class="form-group">
					<label for="target">Small button <i data-toggle="tooltip" data-placement="bottom" title="Customize the font size for the small button." class="fas fa-info-circle"></i></label>
					<div class="font-size-input px">
						<input type="number" name="themesettingtyposbutton" id="themesettingtyposbutton" {if $themetyposetting.themesettingtyposbutton|default:'' == null}value="" placeholder="Leave empty for default settings"{else}value="{$themetyposetting.themesettingtyposbutton|default:''}"{/if} class="form-control" >
					</div>
				</div>
				</div>
				</div>
			</div>
			
			
		</div>
	
	</form>
</div>
<div class="coodiv__whmcs__admin__panel__form__footer__btns">
<input class="coodiv__whmcs__admin__panel__form__footer__submit" type="submit" form="applythemetype" value="Save and apply the typography settings"/>
<a class="coodiv__whmcs__admin__panel__form__footer__cancel" href="{$modurl}&action=typpoptions">Cancel</a>
</div>

<div id="resetpageoptions" class="coodiv__whmcs__admin__panel__model modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="{$modurl}&action=resettyppoptions" method="post">
				<div class="coodiv__whmcs__admin__panel__model__header">
					<h4 class="title">Reset <b>Shufy Theme Typography</b> settings</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="fal fa-times"></i></button>
				</div>
				<div class="coodiv__whmcs__admin__panel__model__body">
					 <p>You are trying to Shufy Theme Typography settings, <b class="red">Please not that this action can not be undone!</b>. Please confirm, to reset Shufy Theme Typography settings completly.</p>
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
            <form id="exportForm" action="{$modurl}&action=exporttyppoptions" method="post">
				<div class="coodiv__whmcs__admin__panel__model__header">
					<h4 class="title">Export <b>Shufy Theme Typography</b> settings</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="fal fa-times"></i></button>
				</div>
				<div class="coodiv__whmcs__admin__panel__model__body">
					 <p>You are trying to export Shufy Theme Typography settings, <b class="red">you will download a CSV file!</b>. Please do NOT edit it To avoid any problem that may occur in the future.</p>
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
            <form id="exportForm" action="{$modurl}&action=importtyppoptions" method="post" enctype="multipart/form-data">
				<div class="coodiv__whmcs__admin__panel__model__header">
					<h4 class="title">Import <b>Shufy Theme Typography</b> settings</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="fal fa-times"></i></button>
				</div>
				<div class="coodiv__whmcs__admin__panel__model__body">
					 <p>You are trying to Import Shufy Theme Typography settings, <b class="red">Please check that the file name is shufytheme_typography_exported_data.CSV!</b>. If you upload a different file to the page option that may create issues with your system and <b>Coodiv is not responsible for it.</b></p>
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
			  
