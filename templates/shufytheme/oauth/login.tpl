<div class="mb-8 text-center">
	<h6 class="coodiv-text-6 font-weight-bold mb-0">{lang key='clientlogin'}</h6>
	<p class="coodiv-text-10 font-weight-400">{lang key='oauth.loginToGrantApp' appName=$appName}</p>
</div>
<form method="post" action="{$issuerurl}dologin.php" role="form">
	<div class="content-padded">

		{if $incorrect}
			{include file="$template/includes/alert.tpl" type="error" msg="{lang key='loginincorrect'}" textcenter=true}
		{/if}

		<div class="form-group">
			<label for="inputEmail" class="form-control-label">{lang key='clientareaemail'}</label>
			<input type="email" name="username" class="form-control" id="inputEmail" placeholder="{lang key='enteremail'}" autofocus>
		</div>
		
		<div class="form-group mb-4 focused">
			<div class="d-flex align-items-center justify-content-between">
				<label for="inputPassword" class="form-control-label">{lang key='clientareapassword'}</label>
				<div class="mb-2">
					<a href="{routePath('password-reset-begin')}" class="coodiv-text-11 font-weight-300" tabindex="-1">{lang key='forgotpw'}</a>
				</div>
			</div>
			<div class="input-group">
				<input type="password" name="password" class="form-control" id="inputPassword" placeholder="{lang key='clientareapassword'}" autocomplete="off" >
			</div>
		</div>
	</div>
	
	<div class="form-group mb-7">
		<label for="rememberme-check" class="coodiv-check-input mb-7 d-flex">
			<input class="d-none" name="rememberme" type="checkbox" id="rememberme-check" />
			<span class="checkbox mr-2"></span>
			<p class="coodiv-text-11 text-blackish-blue mb-0">{lang key='loginrememberme'}</p>
		</label>
	</div>

	<div class="action-buttons">
		<button type="submit" class="btn btn-sm btn-primary d-block w-100 mb-3" id="btnLogin">
			{lang key='login'}
		</button>
		<button type="button" class="btn btn-sm btn-default d-block w-100" id="btnCancel" onclick="jQuery('#frmCancelLogin').submit()">
			{lang key='cancel'}
		</button>
	</div>
</form>
<form method="post" action="{$issuerurl}oauth/authorize.php" id="frmCancelLogin">
    <input type="hidden" name="login_declined" value="yes"/>
    <input type="hidden" name="request_hash" value="{$request_hash}"/>
</form>
