
	
	<div class="mb-8 text-center">
		<h6 class="coodiv-text-9 font-weight-bold mb-0">{lang key='oauth.authoriseAppToAccess' appName=$appName}</h6>
		<p class="coodiv-text-10 font-weight-400">{lang key='oauth.willBeAbleTo'}:</p>
		
		<ul>
			{foreach $requestedPermissions as $permission}
				<li class="coodiv-text-11 font-weight-400">{$permission}</li>
			{/foreach}
		</ul>
	</div>

  

    <form method="post" action="#" role="form">
        {foreach $requestedAuthorizations as $auth}
            <input type="hidden" name="authz[]" value="{$auth}" />
        {/foreach}
		
        <div class="action-buttons">
            <button name="userAuthorization" id="userAuthorizationAccepted" value="yes" type="submit" class="btn btn-sm btn-primary d-block w-100 mb-3">
                {lang key='oauth.authorise'}
            </button>
            <button name="userAuthorization" id="userAuthorizationDeclined" value="no" type="submit" class="btn btn-sm btn-default d-block w-100">
                {lang key='cancel'}
            </button>
        </div>
    </form>


