<div class="mb-8 text-center">
	<h6 class="coodiv-text-9 font-weight-bold mb-0">{lang key='twofactorauth'}</h6>
	<p class="coodiv-text-10 font-weight-400">{lang key='twofa2ndfactorreq'}</p>
</div>

<form method="post" action="{routePath('login-two-factor-challenge-verify')}" role="form">

	<div id="loginWithBackupCode" {if !$backupcode} class="w-hidden"{/if}>
		<div class="content-padded">
			
			<div class="form-group">
				<label for="codeid" class="form-control-label">{lang key='twofabackupcodelogin'}</label>
				<input type="email" name="code" class="form-control" id="codeid" placeholder="{lang key='enteremail'}" autofocus>
			</div>
						   
			<button type="submit" name="backupcode" value="1" class="btn btn-primary btn-sm btn-block w-100" id="btnLogin">
				{lang key='login'}
			</button>
		</div>
		<div class="action-buttons">
			<button type="button" class="btn btn-default btn-sm btn-block w-100" id="btnCancel" onclick="jQuery('#frmCancelLogin').submit()">
				{lang key='cancel'}
			</button>
		</div>
	</div>

	<div id="loginWithSecondFactor"{if $backupcode} class="w-hidden"{/if}>
		<div class="content-padded">
			{if $incorrect}
				{include file="$template/includes/alert.tpl" type="error" msg="{lang key='twofa2ndfactorincorrect'}" textcenter=true}
			{elseif $error}
				{include file="$template/includes/alert.tpl" type="error" msg=$error textcenter=true}
			{/if}
			{$challenge}
		</div>
		<div class="action-buttons">
			<p class="coodiv-text-11 font-weight-400 text-center">
				{lang key='twofacantaccess2ndfactor'}<br />
				<a href="#" onclick="jQuery('#loginWithSecondFactor').hide();jQuery('#loginWithBackupCode').show();">{lang key='twofaloginusingbackupcode'}</a>
			</p>
		   
			<button type="button" class="btn btn-sm btn-block w-100 btn-default mt-4" id="btnCancel" onclick="jQuery('#frmCancelLogin').submit()">
				{lang key='cancel'}
			</button>
		</div>
	</div>
</form>
<form method="post" action="{$issuerurl}oauth/authorize.php" id="frmCancelLogin">
    <input type="hidden" name="login_declined" value="yes"/>
    <input type="hidden" name="request_hash" value="{$request_hash}"/>
</form>
