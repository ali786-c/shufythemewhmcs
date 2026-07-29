<div class="page__wrapper__content">
	<div class="coodiv__main__hero">
		<div class="row justify-content-between">
			<div class="col-md-5 col-12">
				<h5 class="coodiv__main__hero__title">Coodiv themes control panel (ShufyTheme)</h5>
				<p class="coodiv__main__hero__sub__title">
				You can configure your theme layout, menus, styles, pages, and more using Coodiv themes control panel without any coding knowledge.
				</p>
			</div>
			<div class="col-md-7"></div>
		</div>
		
		{if $needsUpdate}
		<div style="margin-top: 20px" class="alert alert-warning">
			<div class="alert-icon">
				<i class="far fa-hand-paper"></i>
			</div>
			<div class="alert-msg">
				<strong class="d-block">Warning (Update your addon before using it)</strong>

				We detected an outdated ShufyTheme database version. Please run the update process to complete the upgrade and continue using the settings.
				<b>Saving any new settings without updating may crash your addon</b>.  
				During the update, none of your existing settings will be lost.

				<p style="margin-top: 10px;margin-bottom: 2px">
					Your addonâ€™s current version is:
					{if $themesetting.shufythemeaddonversion|default:'' == null}
						Unknown
					{else}
						{$themesetting.shufythemeaddonversion|default:''}
					{/if}
				</p>

				<p style="margin-bottom: 2px">
					Required ShufyTheme database version: {$currentAddonVersion}
				</p>

				<p style="margin-bottom: 2px">
					You must update to at least version <b>{$currentAddonVersion}</b> to continue.
				</p>

				<a style="margin-top: 10px" href="{$modurl}&action=updateaddon" class="btn btn-default">Update Now</a>
			</div>
		</div>
		{/if}
	
	
	
	</div>
	<div class="row justify-content-start">
		<div class="col-md-7">
			<div class="coodiv__theme__informations">
				{foreach item=group from=$groups}
				{assign var="itemSupportedDate" value=$group.itemsupported|default:''|strtotime}
				{assign var="currentDate" value="now"|strtotime}
				<ul class="list list__theme__informations">
					<li class="list__item"><span class="list__label">Theme:</span><span class="list__value">{$group.itemname|default:''}</span></li>
					<li class="list__item"><span class="list__label">License Key:</span><span class="list__value">{$group.coodivliecense|default:''}</span></li>
					<li class="list__item"><span class="list__label">Theme ID:</span><span class="list__value">{$group.itemid|default:''}</span></li>
					<li class="list__item"><span class="list__label">Registration Date:</span><span class="list__value">{$group.itemsoldat|default:''}</span></li>
					<li class="list__item"><span class="list__label">Support & updates:</span><span class="list__value {if $itemSupportedDate < $currentDate}error{else}success{/if}">until {$group.itemsupported|default:''}</span></li> 
					<li class="list__item"><span class="list__label">Support status:</span>
					{if $itemSupportedDate < $currentDate}
						<span class="list__value error">The item support has expired.</span>
					{else}
						<span class="list__value success">The item support is still valid.</span>
					{/if}
					</li>
					<li class="list__item"><span class="list__label">User:</span><span class="list__value">{$group.itembuyer|default:''}</span></li> 
				</ul>
				{/foreach}
			</div>
			
			<div class="coodiv__theme__control__extentions">
				<span class="new__tag">NEW</span>
				<div class="text">
					<h6>Shufytheme extentions</h6>
					<p>Easily manage, install, update, and control all your Shufytheme extensions from one centralized dashboard, with full control and no technical complexity.</p>
				</div>
				<a href="{$modurl}&action=extentions" class="btn btn-default">manage extentions</a>
			
			</div>
			
		</div>
		<div class="col-md-5">
			<div class="coodiv__theme__control__addons">
				<a href="{$modurl}&action=themeoption"><i class="fal fa-sliders-h"></i><span>Genaral settings</span></a>
				<a href="{$modurl}&action=styleoptions"><i class="fal fa-swatchbook"></i><span>Style & Color settings</span></a>
				<a href="{$modurl}&action=typpoptions"><i class="fal fa-text"></i><span>Typography settings</span></a>
				<a href="{$modurl}&action=layoutoptions"><i class="fal fa-browser"></i><span>Layouts settings</span></a>
				<a href="{$modurl}&action=sidebaroptions"><i class="fal fa-th-list"></i><span>Sidebar settings</span></a>
				<a href="{$modurl}&action=footeroptions"><i class="fal fa-columns"></i><span>Footer settings</span></a>
				<a href="{$modurl}&action=homepageoptions"><i class="fal fa-desktop"></i><span>Homepage settings</span></a>
				<a href="{$modurl}&action=listgroup"><i class="fal fa-bars"></i><span>Menu manager</span></a>
				<a href="{$modurl}&action=settingsbackups"><i class="fal fa-history"></i><span>Settings Backups</span></a>
				<a href="{$modurl}&action=themehealthcheck"><i class="fal fa-heartbeat"></i><span>Theme Health Check</span></a>
				<a href="{$modurl}&action=extentions"><i class="fal fa-puzzle-piece"></i><span>Extentions</span></a>
			</div>
		</div>
	</div>
</div>
