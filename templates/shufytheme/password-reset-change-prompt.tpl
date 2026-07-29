<div class="mb-4">
	<h6 class="coodiv-text-6 font-weight-bold mb-0">{lang key='pwreset'}</h6>
	<p class="coodiv-text-10 font-weight-400">{lang key='pwresetenternewpw'}</p>
</div>	
<form class="using-password-strength" method="POST" action="{routePath('password-reset-change-perform')}">
    <input type="hidden" name="answer" id="answer" value="{$securityAnswer}" />
	
   
	
	<div id="newPassword1" class="form-group has-feedback">
		<label for="password" class="form-control-label d-flex align-items-center justify-content-between">{lang key='newpassword'}</label>
		<div class="input-control position-relative">
			<input type="password" name="newpw" id="inputNewPassword1" data-error-threshold="{$pwStrengthErrorThreshold}" data-warning-threshold="{$pwStrengthWarningThreshold}" class="form-control" autocomplete="off"{if $remote_auth_prelinked} value="{$password}"{/if}>
			<button title="{lang key='generatePassword.btnLabel'}" type="button" class="generate-pswrd-button generate-password" data-targetfields="inputNewPassword1,inputNewPassword2">
				<i class="fal fa-lock"></i>
			</button>
			<div id="passwordStrengthBar" class="paswrd__stenth__bar progress">
				<div class="progress-bar bg-success bg-striped" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" id="passwordStrengthMeterBar"></div>
			</div>
		</div>
	</div>
											
    <div id="newPassword2" class="form-group has-feedback">
        <label class="control-label" for="inputNewPassword2">{lang key='confirmnewpassword'}</label>
        <input type="password" name="confirmpw" id="inputNewPassword2" class="form-control" autocomplete="off" />
        <div id="inputNewPassword2Msg"></div>
    </div>

    <div class="form-group">
        {include file="$template/includes/pwstrength.tpl" maximumPasswordLength=$maximumPasswordLength}
    </div>

    <div class="form-group">
        <div class="d-flex align-items-center gap-5 flex-column">
            <input class="btn btn-primary d-block w-100" type="submit" name="submit" value="{lang key='clientareasavechanges'}" />
            <input class="btn btn-default d-block w-100" type="reset" value="{lang key='cancel'}" />
        </div>
    </div>

</form>
