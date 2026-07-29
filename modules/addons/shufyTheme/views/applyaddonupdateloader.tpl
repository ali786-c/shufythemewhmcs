{if isset($updateError)}
	<div class="page__wrapper__content">
		<div style="border: 0 !important" class="coodiv__main__hero with__menu">
			<div class="row justify-content-center">
				<div class="col-md-8 col-12">
					<div class="text-center">

						<i class="fal fa-times"
						   style="font-size:70px;margin-bottom:15px;color:#e90000;"
						   aria-hidden="true"></i>

						<h5 style="font-size:30px" class="coodiv__main__hero__title">
							We encountered an error during the upgrading process…
						</h5>

						<div class="alert alert-danger">
							{$updateError|escape:'html'}
						</div>

						<p style="color:#54636a;margin-bottom:35px"
						   class="coodiv__main__hero__sub__title">
							Please try updating the addon again.  
							If the issue persists, contact our
							<a target="_blank" rel="noopener"
							   href="https://support.coodiv.net/">
								Coodiv support team
							</a>.
						</p>

						<a href="{$modurl}&action=updateaddon&error=1" class="btn btn-default">
							Back to Addon Update
						</a>

					</div>
				</div>
			</div>
		</div>
    </div>
{/if}
{if isset($updateSuccess)}
	<div class="page__wrapper__content">
		<div style="border: 0 !important" class="coodiv__main__hero with__menu">
			<div class="row justify-content-center">
				<div class="col-md-8 col-12">
					<div class="text-center">
						<h5 style="font-size: 30px" class="coodiv__main__hero__title">Updating ShufyTheme …</h5>
						<p style="color:#54636a" class="coodiv__main__hero__sub__title">Please wait, this may take a few seconds.</p>					
						<div class="theme__update__spinner"></div>
						
						<p style="color:#54636a" class="coodiv__main__hero__sub__title">Don't close this page until the Updating process is finished.</p>	
					</div>
				</div>
			</div>
		</div>
	</div>
    <script>
        setTimeout(function () {
            window.location.href = '{$modurl}&action=updateaddon&success=1';
        }, 8000);
    </script>
{/if}