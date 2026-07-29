<div class="front__get__started__wrapper text-center dark-mode-texts">
	<div class="main__page__content">
		<div class="row justify-content-center">
			<div class="col-lg-6 col-md-10 col-12">
				<h6 class="coodiv-text-4 font-weight-700">
					{if $coodivhomepagesettings.themehomepagesettingsavingbannertitle|default:'' == null}
						{$LANG.shufytheme.homepage__getstarted__bannertitle}
					{else}
						{$coodivhomepagesettings.themehomepagesettingsavingbannertitle|default:''}
					{/if}
				</h6>
				<p class="coodiv-text-9 font-weight-300">
					{if $coodivhomepagesettings.themehomepagesettingsavingbannersubtitle|default:'' == null}
						{$LANG.shufytheme.homepage__getstarted__bannersubtitle}
					{else}
						{$coodivhomepagesettings.themehomepagesettingsavingbannersubtitle|default:''}
					{/if}
				</p>
				<div class="d-flex align-items-center justify-content-center mt-10">
					<a href="{if $coodivhomepagesettings.themehomepagesettingsavingbannerbtnlink|default:'' == null}#{else}{$coodivhomepagesettings.themehomepagesettingsavingbannerbtnlink|default:''}{/if}" class="btn btn-lg btn-primary-outline-white">
						{if $coodivhomepagesettings.themehomepagesettingsavingbannerbtntext|default:'' == null}
							{$LANG.shufytheme.homepage__getstarted__bannerbutton}
						{else}
							{$coodivhomepagesettings.themehomepagesettingsavingbannerbtntext|default:''}
						{/if}
					</a>
				</div>
			</div>
		</div>
	</div>
</div>