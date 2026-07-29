<div class="row justify-content-center mb-9">
	<div class="col-md-8 col-12">
		<div class="card">
			<div class="card__header">
				<h6 class="coodiv-text-9 mb-0 text-center">{lang key='clientregisterverify'}</h6>
			</div>
			<div class="card__body text-center">
				{if $success}
					<div class="d-flex flex-column gap-5">
						<i style="font-size: 35px;color: #72df77;width: 65px;height: 65px;margin: 0 auto 15px;background: #ecfced;border-radius: 100%;display: flex;align-items: center;justify-content: center;" class="fal fa-check"></i>
						<p class="coodiv-text-10 font-weight-400">{lang key="emailVerification.success"}</p>
					</div>
				{elseif $expired}
					<i style="font-size: 35px;color: #FF9800;width: 65px;height: 65px;margin: 0 auto 15px;background: #fff7eb;border-radius: 100%;display: flex;align-items: center;justify-content: center;" class="fal fa-clock"></i>
					<p class="coodiv-text-10 font-weight-400">{lang key="emailVerification.expired"}</p>
				{if !$loggedin}
					<p class="coodiv-text-10 font-weight-bold">{lang key="emailVerification.loginToRequest"}</p>
				{/if}
				{else}
					
					<i style="font-size: 35px;color: #F44336;width: 65px;height: 65px;margin: 0 auto 15px;background: #fcf0ef;border-radius: 100%;display: flex;align-items: center;justify-content: center;" class="fal fa-times"></i>
					<p class="coodiv-text-10 font-weight-400">{lang key="emailVerification.notFound"}</p>
					{if !$loggedin}
					<p class="coodiv-text-10 font-weight-bold">{lang key="emailVerification.loginToRequest"}</p>
					{/if}
				{/if}
				<div class="d-flex align-items-center justify-content-center gap-5 flex-wrap mt-5">
				<a href="{routePath('login-index')}" class="btn btn-sm btn-primary">{lang key="orderForm.continueToClientArea"}</a>
				{if $expired}
					{if $loggedin}
						<button class="btn btn-default btn-sm btn-resend-verify-email" data-email-sent="{lang key='emailSent'}" data-error-msg="{lang key='error'}" data-uri="{routePath('user-email-verification-resend')}">
							{lang key='resendEmail'}
						</button>
					{/if}
				{/if}
				</div>
			</div>
		</div>
	</div>
</div>
