<div class="page__wrapper__content">
	<div class="coodiv__main__hero with__menu">
		<div class="coodiv__main__hero__breadcrumbs">{$breadcrumbs}</div>
		<div class="row justify-content-between">
			<div class="col-md-5 col-12">
				<h5 class="coodiv__main__hero__title">Shufy Theme Health Check</h5>
				<p class="coodiv__main__hero__sub__title">Review addon files, generated CSS, database settings, menu assignments, backups, and extensions from one place.</p>
			</div>
			<div class="col-md-7 col-12 btn__container">
				<a href="{$modurl}&action=themehealthcheck" class="add__new__group__btn"><i class="fal fa-sync"></i>Refresh Check</a>
				<a href="{$modurl}&action=settingsbackups" class="add__new__group__btn"><i class="fal fa-history"></i>Settings Backups</a>
			</div>
		</div>

		<ul class="navbar-nav coodiv__main__hero__nav">
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=themeoption">Genaral</a></li>
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=styleoptions">Colors</a></li>
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=typpoptions">Typography</a></li>
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=layoutoptions">Layouts</a></li>
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=sidebaroptions">Sidebar</a></li>
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=footeroptions">Footer</a></li>
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=homepageoptions">Homepage</a></li>
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=listgroup">Menu manager</a></li>
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=settingsbackups">Backups</a></li>
		  <li class="nav-item active"><a class="nav-link">Health</a></li>
		  <li class="nav-item ml-auto"><a href="{$modurl}&action=extentions" class="nav-link">Extention manager</a></li>
		</ul>
	</div>

	<div class="shufytheme__ops__summary">
		<div class="shufytheme__ops__metric">
			<span class="icon"><i class="fal fa-tasks"></i></span>
			<span class="value">{$healthTotalChecks|default:'0'}</span>
			<span class="label">Checks</span>
		</div>
		<div class="shufytheme__ops__metric ok">
			<span class="icon"><i class="fal fa-check"></i></span>
			<span class="value">{$healthReport.summary.ok|default:'0'}</span>
			<span class="label">OK</span>
		</div>
		<div class="shufytheme__ops__metric warning">
			<span class="icon"><i class="fal fa-exclamation-triangle"></i></span>
			<span class="value">{$healthReport.summary.warning|default:'0'}</span>
			<span class="label">Warnings</span>
		</div>
		<div class="shufytheme__ops__metric error">
			<span class="icon"><i class="fal fa-times"></i></span>
			<span class="value">{$healthReport.summary.error|default:'0'}</span>
			<span class="label">Errors</span>
		</div>
	</div>
	
	<div class="shufytheme__health__banner {$healthOverallStatus|default:'ok'}">
		<div class="icon">
			{if $healthOverallStatus|default:'ok' == 'error'}
			<i class="fal fa-times-circle"></i>
			{else if $healthOverallStatus|default:'ok' == 'warning'}
			<i class="fal fa-exclamation-triangle"></i>
			{else}
			<i class="fal fa-check-circle"></i>
			{/if}
		</div>
		<div>
			<h6>
				{if $healthOverallStatus|default:'ok' == 'error'}
				Action needed
				{else if $healthOverallStatus|default:'ok' == 'warning'}
				Review recommended
				{else}
				Theme looks healthy
				{/if}
			</h6>
			<p>{$healthTotalChecks|default:'0'} checks completed at {$healthReport.generated_at|default:''}.</p>
		</div>
	</div>

	{foreach item=healthGroup from=$healthGroups}
	<div class="shufytheme__ops__panel health">
		<div class="shufytheme__ops__panel__head">
			<div>
				<h6>{$healthGroup.name|default:''}</h6>
				<p>{$healthGroup.count|default:'0'} checks in this area.</p>
			</div>
		</div>
		<div class="shufytheme__ops__list">
			{foreach item=check from=$healthGroup.checks}
			<div class="shufytheme__ops__list__row health {$check.status|default:''} shufytheme__helthcheck__table">
				<div class="main">
					<strong>{$check.title|default:''}</strong>
					<small>{$check.message|default:''}</small>
				</div>
				<div>
					{if $check.status|default:'' == 'ok'}
					<span class="shufytheme__ops__status ok"><i class="fal fa-check"></i>OK</span>
					{else if $check.status|default:'' == 'warning'}
					<span class="shufytheme__ops__status warning"><i class="fal fa-exclamation-triangle"></i>Warning</span>
					{else}
					<span class="shufytheme__ops__status error"><i class="fal fa-times"></i>Error</span>
					{/if}
				</div>
			</div>
			{/foreach}
		</div>
	</div>
	{foreachelse}
	<div class="shufytheme__ops__empty">
		<i class="fal fa-heartbeat"></i>
		<strong>No health data generated.</strong>
		<span>Refresh the health check page to run the diagnostics again.</span>
	</div>
	{/foreach}
</div>
</div>
