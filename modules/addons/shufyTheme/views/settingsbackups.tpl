{if $smarty.get.success|default:'' == 'created'}
<div class="settings__popupalert__coodiv alert alert-success alert-dismissible show" role="alert">
  <span class="alert__progress"></span>
  <span class="icon"><i class="fal fa-check-circle"></i></span>
  <div class="text"><strong>Success!</strong> Settings backup has been created successfully.</div>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
</div>
{/if}
{if $smarty.get.success|default:'' == 'restored'}
<div class="settings__popupalert__coodiv alert alert-success alert-dismissible show" role="alert">
  <span class="alert__progress"></span>
  <span class="icon"><i class="fal fa-check-circle"></i></span>
  <div class="text"><strong>Success!</strong> Settings backup has been restored successfully.</div>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
</div>
{/if}
{if $smarty.get.success|default:'' == 'deleted'}
<div class="settings__popupalert__coodiv alert alert-success alert-dismissible show" role="alert">
  <span class="alert__progress"></span>
  <span class="icon"><i class="fal fa-check-circle"></i></span>
  <div class="text"><strong>Success!</strong> Settings backup has been deleted successfully.</div>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
</div>
{/if}
{if $smarty.get.success|default:'' == 'profileimported'}
<div class="settings__popupalert__coodiv alert alert-success alert-dismissible show" role="alert">
  <span class="alert__progress"></span>
  <span class="icon"><i class="fal fa-check-circle"></i></span>
  <div class="text"><strong>Success!</strong> Full theme profile has been imported successfully.</div>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
</div>
{/if}
{if $smarty.get.error|default:'' == 'backupfailed'}
<div class="settings__popupalert__coodiv alert alert-danger alert-dismissible show" role="alert">
  <span class="alert__progress"></span>
  <span class="icon"><i class="fal fa-times-circle"></i></span>
  <div class="text"><strong>Error!</strong> The backup folder is not writable or the backup could not be created.</div>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
</div>
{/if}
{if $themeProfileImportErrorMessage|default:''}
<div class="settings__popupalert__coodiv alert alert-danger alert-dismissible show" role="alert">
  <span class="alert__progress"></span>
  <span class="icon"><i class="fal fa-times-circle"></i></span>
  <div class="text"><strong>Error!</strong> {$themeProfileImportErrorMessage}</div>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
</div>
{/if}
{if $smarty.get.error|default:'' == 'restorefailed'}
<div class="settings__popupalert__coodiv alert alert-danger alert-dismissible show" role="alert">
  <span class="alert__progress"></span>
  <span class="icon"><i class="fal fa-times-circle"></i></span>
  <div class="text"><strong>Error!</strong> The selected backup could not be restored.</div>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
</div>
{/if}

<div class="page__wrapper__content">
	<div class="coodiv__main__hero with__menu">
		<div class="coodiv__main__hero__breadcrumbs">{$breadcrumbs}</div>
		<div class="row justify-content-between">
			<div class="col-md-5 col-12">
				<h5 class="coodiv__main__hero__title">Shufy Theme Settings Backups</h5>
				<p class="coodiv__main__hero__sub__title">Automatic snapshots are created before settings save, reset, import, and restore actions.</p>
			</div>
			<div class="col-md-7 col-12 btn__container">
				<a href="{$modurl}&action=exportthemeprofile" class="add__new__group__btn"><i class="fal fa-file-export"></i>Export full profile</a>
				<a href="#import__theme__profile" data-toggle="modal" class="add__new__group__btn"><i class="fal fa-file-import"></i>Import full profile</a>
				<a href="#create__settings__backup" data-toggle="modal" class="add__new__group__btn"><i class="fal fa-save"></i>Create backup now</a>
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
		  <li class="nav-item active"><a class="nav-link">Backups</a></li>
		  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=themehealthcheck">Health</a></li>
		  <li class="nav-item ml-auto"><a href="{$modurl}&action=extentions" class="nav-link">Extention manager</a></li>
		</ul>
	</div>

	<div class="shufytheme__ops__summary">
		<div class="shufytheme__ops__metric">
			<span class="icon"><i class="fal fa-archive"></i></span>
			<span class="value">{$backupSummary.total|default:'0'}</span>
			<span class="label">Backups</span>
		</div>
		<div class="shufytheme__ops__metric">
			<span class="icon"><i class="fal fa-layer-group"></i></span>
			<span class="value">{$backupSummary.sections|default:'0'}</span>
			<span class="label">Sections</span>
		</div>
		<div class="shufytheme__ops__metric">
			<span class="icon"><i class="fal fa-file-code"></i></span>
			<span class="value">{$backupSummary.files|default:'0'}</span>
			<span class="label">Included files</span>
		</div>
		<div class="shufytheme__ops__metric wide">
			<span class="icon"><i class="fal fa-clock"></i></span>
			<span class="value small">{if $backupSummary.latest|default:''}{$backupSummary.latest|default:''}{else}No backups yet{/if}</span>
			<span class="label">Latest snapshot</span>
		</div>
	</div>

	<div class="shufytheme__ops__panel">
		<div class="shufytheme__ops__panel__head">
			<div>
				<h6>Full Theme Profile</h6>
				<p>Export or import all theme settings, menu manager groups and items, and generated CSS files in one profile JSON file.</p>
			</div>
			<div class="actions">
				<a href="{$modurl}&action=exportthemeprofile" class="shufytheme__ops__btn"><i class="fal fa-file-export"></i>Export Profile</a>
				<a href="#import__theme__profile" data-toggle="modal" class="shufytheme__ops__btn primary"><i class="fal fa-file-import"></i>Import Profile</a>
			</div>
		</div>
		<div class="shufytheme__ops__list">
			<div class="shufytheme__ops__empty">
				<i class="fal fa-shield-check"></i>
				<strong>Production-safe profile transfer.</strong>
				<span>Import creates a protected before-import profile snapshot, then replaces settings, menus, and generated CSS from the uploaded profile.</span>
			</div>
		</div>
	</div>

	<div class="shufytheme__ops__panel">
		<div class="shufytheme__ops__panel__head">
			<div>
				<h6>Available Snapshots</h6>
				<p>Automatic backups are kept per section, with the latest 25 retained for each section.</p>
			</div>
			<a href="#create__settings__backup" data-toggle="modal" class="shufytheme__ops__btn primary"><i class="fal fa-plus"></i>Create Backup</a>
		</div>
		<div class="shufytheme__ops__list">
			<div class="shufytheme__ops__list__head backup">
				<span>Snapshot</span>
				<span>Created</span>
				<span>Contents</span>
				<span>Actions</span>
			</div>
			{foreach item=backup from=$settingsBackups}
			<div class="shufytheme__ops__list__row backup">
				<div class="main">
					<span class="section__badge"><i class="fal fa-sliders-h"></i>{$backup.label|default:''}</span>
					<strong>{$backup.file|default:''}</strong>
					<small>{$backup.reason|default:''}</small>
				</div>
				<div>{$backup.created_at|default:''}</div>
				<div>
					<span class="shufytheme__ops__pill">{$backup.row_count|default:'0'} rows</span>
					<span class="shufytheme__ops__pill">{$backup.file_count|default:'0'} files</span>
				</div>
				<div class="actions">
					<a href="{$modurl}&action=downloadsettingsbackup&file={$backup.file|escape:'url'}" class="shufytheme__ops__iconbtn" title="Download"><i class="fal fa-download"></i></a>
					<a href="#restore__backup__{$backup.file|replace:'.json':''}" data-toggle="modal" class="shufytheme__ops__iconbtn" title="Restore"><i class="fal fa-undo"></i></a>
					<a href="#delete__backup__{$backup.file|replace:'.json':''}" data-toggle="modal" class="shufytheme__ops__iconbtn danger" title="Delete"><i class="fal fa-trash-alt"></i></a>
				</div>
			</div>
			{foreachelse}
			<div class="shufytheme__ops__empty">
				<i class="fal fa-archive"></i>
				<strong>No backups created yet.</strong>
				<span>Create a manual backup now, or save/reset/import a settings page to create one automatically.</span>
			</div>
			{/foreach}
		</div>
	</div>
</div>

<div id="import__theme__profile" class="coodiv__whmcs__admin__panel__model modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="{$modurl}&action=importthemeprofile" method="post" enctype="multipart/form-data" id="shufytheme__profile__import__form" data-current-addon-version="{$currentAddonVersion|default:''|escape:'html'}">
				<div class="coodiv__whmcs__admin__panel__model__header">
					<h4 class="title">Import full theme profile</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="fal fa-times"></i></button>
				</div>
				<div class="coodiv__whmcs__admin__panel__model__body">
					<p>This will replace current theme settings, menu manager data, and generated CSS files with the uploaded profile. A full profile snapshot of the current state will be created before importing.</p>
					<div class="form-group">
						<label>Theme profile JSON file</label>
						<input type="file" name="theme_profile_file" class="form-control" accept=".json,application/json" required data-profile-file-input>
					</div>
					<div class="shufytheme__profile__compatibility" data-profile-compatibility hidden>
						<div class="shufytheme__profile__compatibility__head">
							<span class="icon" data-profile-status-icon><i class="fal fa-info-circle"></i></span>
							<div>
								<strong data-profile-status-title>Profile compatibility check</strong>
								<span data-profile-status-text>Select a profile file to review compatibility before import.</span>
							</div>
						</div>
						<div class="shufytheme__profile__compatibility__grid">
							<div><span>Installed version</span><strong data-installed-version>{$currentAddonVersion|default:'Unknown'}</strong></div>
							<div><span>Profile version</span><strong data-profile-addon-version>Unknown</strong></div>
							<div><span>Settings sections</span><strong data-profile-settings-count>0</strong></div>
							<div><span>Menu items</span><strong data-profile-menu-items-count>0</strong></div>
							<div><span>Generated files</span><strong data-profile-files-count>0</strong></div>
						</div>
						<label class="shufytheme__profile__compatibility__confirm" data-profile-confirm-wrap hidden>
							<input type="checkbox" name="confirm_profile_compatibility_warning" value="1" data-profile-confirm>
							<span>I understand this profile was exported from a different ShufyTheme version and want to import it.</span>
						</label>
					</div>
				</div>
				<div class="coodiv__whmcs__admin__panel__model__footer">
					<button type="submit" class="confirm" data-profile-submit>Import Profile</button>
					<button type="button" class="cancel" data-dismiss="modal">Close</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div id="create__settings__backup" class="coodiv__whmcs__admin__panel__model modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="{$modurl}&action=createsettingsbackup" method="post">
				<div class="coodiv__whmcs__admin__panel__model__header">
					<h4 class="title">Create settings backup</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="fal fa-times"></i></button>
				</div>
				<div class="coodiv__whmcs__admin__panel__model__body">
					<div class="form-group">
						<label>Settings section</label>
						<select name="backup_key" class="form-control">
							<option value="all">All settings sections</option>
							{foreach from=$backupDefinitions key=backupKey item=definition}
							<option value="{$backupKey}">{$definition.label|default:''}</option>
							{/foreach}
						</select>
					</div>
				</div>
				<div class="coodiv__whmcs__admin__panel__model__footer">
					<button type="submit" class="confirm">Create Backup</button>
					<button type="button" class="cancel" data-dismiss="modal">Close</button>
				</div>
			</form>
		</div>
	</div>
</div>

{literal}
<script>
(function () {
	var form = document.getElementById('shufytheme__profile__import__form');
	if (!form || !window.FileReader) {
		return;
	}

	var currentVersion = form.getAttribute('data-current-addon-version') || '';
	var input = form.querySelector('[data-profile-file-input]');
	var panel = form.querySelector('[data-profile-compatibility]');
	var title = form.querySelector('[data-profile-status-title]');
	var text = form.querySelector('[data-profile-status-text]');
	var icon = form.querySelector('[data-profile-status-icon]');
	var profileVersion = form.querySelector('[data-profile-addon-version]');
	var settingsCount = form.querySelector('[data-profile-settings-count]');
	var menuItemsCount = form.querySelector('[data-profile-menu-items-count]');
	var filesCount = form.querySelector('[data-profile-files-count]');
	var confirmWrap = form.querySelector('[data-profile-confirm-wrap]');
	var confirm = form.querySelector('[data-profile-confirm]');
	var submit = form.querySelector('[data-profile-submit]');

	function setPanelState(state, message) {
		panel.hidden = false;
		panel.classList.remove('is-ok', 'is-warning', 'is-error');
		panel.classList.add('is-' + state);

		if (state === 'ok') {
			title.textContent = 'Profile is compatible';
			icon.innerHTML = '<i class="fal fa-check-circle"></i>';
		} else if (state === 'warning') {
			title.textContent = 'Version compatibility warning';
			icon.innerHTML = '<i class="fal fa-exclamation-triangle"></i>';
		} else {
			title.textContent = 'Profile could not be checked';
			icon.innerHTML = '<i class="fal fa-times-circle"></i>';
		}

		text.textContent = message;
	}

	function resetPreview() {
		panel.hidden = true;
		profileVersion.textContent = 'Unknown';
		settingsCount.textContent = '0';
		menuItemsCount.textContent = '0';
		filesCount.textContent = '0';
		confirm.checked = false;
		confirmWrap.hidden = true;
		submit.disabled = false;
	}

	function countObjectKeys(value) {
		return value && typeof value === 'object' && !Array.isArray(value) ? Object.keys(value).length : 0;
	}

	input.addEventListener('change', function () {
		resetPreview();
		var file = input.files && input.files[0] ? input.files[0] : null;
		if (!file) {
			return;
		}

		var reader = new FileReader();
		reader.onload = function () {
			var profile;
			try {
				profile = JSON.parse(String(reader.result || ''));
			} catch (e) {
				setPanelState('error', 'The selected file is not readable JSON.');
				submit.disabled = true;
				return;
			}

			if (!profile || Number(profile.profile_version || 0) !== 1 || !profile.settings || !profile.menus) {
				setPanelState('error', 'The selected file is not a valid ShufyTheme profile.');
				submit.disabled = true;
				return;
			}

			var exportedVersion = String(profile.addon_version || 'Unknown');
			var menuItems = Array.isArray(profile.menus.items) ? profile.menus.items.length : 0;
			var generatedFiles = countObjectKeys(profile.files);
			profileVersion.textContent = exportedVersion;
			settingsCount.textContent = String(countObjectKeys(profile.settings));
			menuItemsCount.textContent = String(menuItems);
			filesCount.textContent = String(generatedFiles);

			if (currentVersion && exportedVersion !== currentVersion) {
				setPanelState('warning', 'This profile was exported from ShufyTheme ' + exportedVersion + ', but this installation is running ' + currentVersion + '.');
				confirmWrap.hidden = false;
				submit.disabled = true;
				return;
			}

			setPanelState('ok', 'This profile addon version matches the installed ShufyTheme version.');
			submit.disabled = false;
		};
		reader.onerror = function () {
			setPanelState('error', 'The selected file could not be read.');
			submit.disabled = true;
		};
		reader.readAsText(file);
	});

	confirm.addEventListener('change', function () {
		submit.disabled = confirmWrap.hidden ? false : !confirm.checked;
	});
})();
</script>
{/literal}

{foreach item=backup from=$settingsBackups}
<div id="restore__backup__{$backup.file|replace:'.json':''}" class="coodiv__whmcs__admin__panel__model modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="{$modurl}&action=restoresettingsbackup" method="post">
				<input type="hidden" name="file" value="{$backup.file|escape:'html'}">
				<div class="coodiv__whmcs__admin__panel__model__header">
					<h4 class="title">Restore {$backup.label|default:''} backup</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="fal fa-times"></i></button>
				</div>
				<div class="coodiv__whmcs__admin__panel__model__body">
					<p>This will replace the current {$backup.label|default:''} settings with this snapshot. A new backup of the current settings will be created before restoring.</p>
				</div>
				<div class="coodiv__whmcs__admin__panel__model__footer">
					<button type="submit" class="confirm">Restore Backup</button>
					<button type="button" class="cancel" data-dismiss="modal">Close</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div id="delete__backup__{$backup.file|replace:'.json':''}" class="coodiv__whmcs__admin__panel__model modal fade delete__item">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="{$modurl}&action=deletesettingsbackup" method="post">
				<input type="hidden" name="file" value="{$backup.file|escape:'html'}">
				<div class="coodiv__whmcs__admin__panel__model__header">
					<h4 class="title">Delete settings backup</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="fal fa-times"></i></button>
				</div>
				<div class="coodiv__whmcs__admin__panel__model__body">
					<p>You are deleting this backup file. This action can not be undone.</p>
				</div>
				<div class="coodiv__whmcs__admin__panel__model__footer">
					<button type="submit" class="confirm">Delete Backup</button>
					<button type="button" class="cancel" data-dismiss="modal">Close</button>
				</div>
			</form>
		</div>
	</div>
</div>
{/foreach}
