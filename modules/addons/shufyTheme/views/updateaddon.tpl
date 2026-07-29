{if $smarty.get.success|default:'' == 1}
<div class="settings__popupalert__coodiv alert alert-success alert-dismissible show" role="alert">
  <span class="alert__progress"></span>
  <span class="icon"><i class="fal fa-check-circle"></i></span>
  <div class="text">
  <strong>Success!</strong> ShufyTheme addon has been successfully updated to version <b>{$themesetting.shufythemeaddonversion|default:''}</b>
  </div>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	<span aria-hidden="true">&times;</span>
  </button>
</div>
{/if}
{if $smarty.get.error|default:'' == 1}
<div class="settings__popupalert__coodiv alert alert-danger alert-dismissible show" role="alert">
  <span class="alert__progress"></span>
  <span class="icon"><i class="fal fa-times"></i></span>
  <div class="text">
  <strong>Update error!</strong> ShufyTheme addon has been not updated successfully <b>Please check your admin log for more informations</b>
  </div>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	<span aria-hidden="true">&times;</span>
  </button>
</div>
{/if}
<div class="page__wrapper__content">
	<div style="border: 0 !important" class="coodiv__main__hero with__menu">
		{if $needsUpdate}
		<div class="row justify-content-center">
			<div class="col-md-8 col-12">
				<div class="text-center">
					<i style="font-size: 70px;margin-bottom: 15px;color: #e90000;" class="fal fa-exclamation-triangle"></i>
					<h5 style="font-size: 30px" class="coodiv__main__hero__title">ShufyTheme Version Upgrade Needed</h5>
					<p style="color:#54636a" class="coodiv__main__hero__sub__title">Your addon current version is: <b>{if $themesetting.shufythemeaddonversion|default:'' == null}Unknowned{else}{$themesetting.shufythemeaddonversion|default:''}{/if}</b></p>					
					<p style="color:#54636a" class="coodiv__main__hero__sub__title">You must update to at least version <b>{$currentAddonVersion}</b> to continue.</p>
				</div>
			</div>
		</div>
		{else}
		<div class="row justify-content-center">
			<div class="col-md-8 col-12">
				<div class="text-center">
					<i style="font-size: 70px;margin-bottom: 15px;color: #4caf50;" class="fal fa-check-circle"></i>
					<h5 class="coodiv__main__hero__title">You are using the latest version of ShufyTheme</h5>
					<p style="color:#54636a" class="coodiv__main__hero__sub__title">Your Shufytheme addon was updated to latest version, you can use the addon features without any issues</p>
				</div>
			</div>
		</div>
		{/if}
	</div>
	<div id="updateaddoncontainder">
		<div class="shufytheme__version__container version-container clearfix">
			<div class="installed">Your Current Version</div>
			<div class="latest">Latest Installed Version</div>
			<div class="installed-output"><span class="version-number">{if $themesetting.shufythemeaddonversion|default:'' == null}Unknowned{else}{$themesetting.shufythemeaddonversion|default:''}{/if}</span><span class="version-label">General Release</span></div>
			<div class="latest-output"><span class="version-number">{$currentAddonVersion}</span><span class="version-label">General Release</span></div>
		</div>
		<div class="current-status">	
			{if $needsUpdate}
			<form id="applyaddonupdate" class="full__fieldset__area default__form__panel__cart coodiv__whmcs__admin__panel__form" action="{$modurl}&action=applyaddonupdate" method="post">
				<button id="updateBtn" type="submit" class="btn btn-default">
					Update Now
				</button>
			</form>
			{/if}
				
			<div><a href="https://themeforest.net/item/shufytheme-the-ultimate-whmcs-theme/52246062" target="_blank" class="btn btn-link change-log-link">Changelog</a></div>
		</div>
	</div>
</div>


<script>
document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('applyaddonupdate');
    const btn  = document.getElementById('updateBtn');

    form.addEventListener('submit', function (e) {
        e.preventDefault();

        btn.disabled = true;
        btn.classList.add('loading');
        btn.textContent = 'Updating...';
        setTimeout(function () {
            form.submit();
        }, 2000);
    });
});
</script>