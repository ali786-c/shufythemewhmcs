<link rel="stylesheet" type="text/css" href="../modules/addons/shufyTheme/assets/css/styles.css">
<link rel="stylesheet" type="text/css" href="../modules/addons/shufyTheme/assets/apps/fontawesome-iconpicker.min.css">
<script src="../modules/addons/shufyTheme/assets/js/jscolor.min.js"></script>
<script src="../modules/addons/shufyTheme/assets/apps/fontawesome-iconpicker.min.js"></script>
<script src="../modules/addons/shufyTheme/assets/js/scripts.js"></script>
<div class="coodiv__whmcs__admin__panel">
	<div class="coodiv__admin__navbar">
		<div class="container-fluid">
			<nav class="navbar__coodiv">
				<div class="coodiv__admin__navbar__logo">
					<a class="logo" href="{$modurl}"><img src="../modules/addons/shufyTheme/assets/img/coodiv-logo.png" alt="Coodiv logo"></a>
					{if $needsUpdate}
					<a href="{$modurl}&action=updateaddon" class="addon__need__update">Addon need update</a>
					{else}
					<span class="addon__version">{$currentAddonVersion}</span>
					{/if}
				</div>
				<ul class="navbar__coodiv__links">
				<li><a data-toggle="tooltip" data-placement="bottom" title="Theme Health Check" href="{$modurl}&action=themehealthcheck"><i class="fad fa-heartbeat"></i></a></li>
				<li><a data-toggle="tooltip" data-placement="bottom" title="Settings Backups" href="{$modurl}&action=settingsbackups"><i class="fad fa-history"></i></a></li>
				<li><a data-toggle="tooltip" data-placement="bottom" title="More themes" href="https://themeforest.net/user/coodiv/portfolio" target="_blank"><i class="fad fa-ellipsis-h"></i></a></li>
				<li><a data-toggle="tooltip" data-placement="bottom" title="Documentation" href="https://demo.coodiv.net/shufytheme/documentation/index.html" target="_blank"><i class="fad fa-file-alt"></i></a></li>
				<li><a data-toggle="tooltip" data-placement="bottom" title="Report a Bug" href="https://coodiv.net/support" target="_blank"><i class="fad fa-bug"></i></a></li>
				<li><a data-toggle="tooltip" data-placement="bottom" title="Get support" href="https://coodiv.net/support" target="_blank"><i class="fad fa-headset"></i></a></li>
				</ul>
			</nav>
		</div>
	</div>
	<div class="coodiv__whmcs__admin__panel__main__wrapper">
		<div class="container-fluid">
			{if $importErrorMessage|default:''}
			<div class="settings__popupalert__coodiv alert alert-danger alert-dismissible show" role="alert">
			  <span class="alert__progress"></span>
			  <span class="icon"><i class="fal fa-times-circle"></i></span>
			  <div class="text"><strong>Error!</strong> {$importErrorMessage|escape:'html'}</div>
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			{/if}
			<script>
			{literal}
			$(document).ready(function() {
				var csrfToken = {/literal}'{$csrfToken|default:''|escape:'javascript'}'{literal};
				if (csrfToken) {
					$('.coodiv__whmcs__admin__panel form').filter(function() {
						return String($(this).attr('method') || '').toLowerCase() === 'post';
					}).each(function() {
						if ($(this).find('input[name="token"]').length === 0) {
							$('<input>').attr({
								type: 'hidden',
								name: 'token'
							}).val(csrfToken).appendTo(this);
						}
					});
					$.ajaxPrefilter(function(options) {
						if (String(options.type || options.method || '').toUpperCase() !== 'POST') {
							return;
						}
						if (typeof options.data === 'string') {
							if (options.data.indexOf('token=') === -1) {
								options.data += (options.data ? '&' : '') + 'token=' + encodeURIComponent(csrfToken);
							}
						} else if ($.isPlainObject(options.data)) {
							if (!options.data.token) {
								options.data.token = csrfToken;
							}
						} else if (!options.data) {
							options.data = { token: csrfToken };
						}
					});
				}

				function showShufyThemeAjaxAlert(type, message) {
					var icon = type === 'success' ? 'fal fa-check-circle' : 'fal fa-times-circle';
					var title = type === 'success' ? 'Success!' : 'Error!';
					var alertClass = type === 'success' ? 'alert-success' : 'alert-danger';
					var safeMessage = $('<div>').text(message).html();
					var alertHtml = '<div class="settings__popupalert__coodiv alert ' + alertClass + ' alert-dismissible show" role="alert">'
						+ '<span class="alert__progress"></span>'
						+ '<span class="icon"><i class="' + icon + '"></i></span>'
						+ '<div class="text"><strong>' + title + '</strong> ' + safeMessage + '</div>'
						+ '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>'
						+ '</div>';

					$('.settings__popupalert__coodiv').remove();
					$('.coodiv__whmcs__admin__panel__main__wrapper .container-fluid').first().prepend(alertHtml);
				}
				function shufyThemeAjaxSaveErrorMessage(xhr) {
					var updateRequiredMessage = 'ShufyTheme addon needs to be updated before settings can be saved. Please run the addon update, then save again.';
					if (xhr && xhr.responseJSON && xhr.responseJSON.message) {
						return xhr.responseJSON.message;
					}

					var responseUrl = xhr && xhr.responseURL ? String(xhr.responseURL) : '';
					var responseText = xhr && xhr.responseText ? String(xhr.responseText) : '';
					if (
						responseUrl.indexOf('action=updateaddon') !== -1 ||
						responseText.indexOf('action=updateaddon') !== -1 ||
						responseText.indexOf('addon__need__update') !== -1 ||
						responseText.indexOf('Addon need update') !== -1
					) {
						return updateRequiredMessage;
					}

					return 'The settings could not be saved. Please try again.';
				}

				var shufyThemeDirtyForms = {};
				var shufyThemeUnsavedTrackingReady = false;
				function shufyThemeFormKey(form) {
					return $(form).attr('id') || $(form).attr('action') || String($('.shufytheme__ajax__save').index(form));
				}
				function shufyThemeFormSignature(formElement) {
					return formElement.serialize();
				}
				function markShufyThemeFormClean(formElement) {
					var key = shufyThemeFormKey(formElement[0]);
					formElement.data('shufytheme-original-signature', shufyThemeFormSignature(formElement));
					delete shufyThemeDirtyForms[key];
				}
				function updateShufyThemeFormDirtyState(formElement) {
					var key = shufyThemeFormKey(formElement[0]);
					var originalSignature = formElement.data('shufytheme-original-signature');
					var isDirty = originalSignature !== shufyThemeFormSignature(formElement);
					if (isDirty) {
						shufyThemeDirtyForms[key] = true;
					} else {
						delete shufyThemeDirtyForms[key];
					}
				}
				function hasShufyThemeUnsavedChanges() {
					for (var key in shufyThemeDirtyForms) {
						if (Object.prototype.hasOwnProperty.call(shufyThemeDirtyForms, key)) {
							return true;
						}
					}
					return false;
				}
				function showShufyThemeUnsavedChangesMessage() {
					showShufyThemeAjaxAlert('error', 'You have unsaved settings changes. Please save before leaving this page.');
					var alertElement = $('.settings__popupalert__coodiv').first();
					if (alertElement.length) {
						$('html, body').animate({ scrollTop: alertElement.offset().top - 20 }, 200);
					}
				}
				function shufyThemeAnalyzeCss(css) {
					var stack = [];
					var quote = '';
					var quoteLine = 1;
					var inComment = false;
					var commentLine = 1;
					var escaped = false;
					var line = 1;
					var errors = [];
					function shufyThemeOpeningPair(char) {
						if (char === String.fromCharCode(123)) {
							return String.fromCharCode(125);
						}
						if (char === '[') {
							return ']';
						}
						if (char === '(') {
							return ')';
						}
						return '';
					}
					function shufyThemeClosingPair(char) {
						if (char === String.fromCharCode(125)) {
							return String.fromCharCode(123);
						}
						if (char === ']') {
							return '[';
						}
						if (char === ')') {
							return '(';
						}
						return '';
					}

					for (var i = 0; i < css.length; i++) {
						var char = css.charAt(i);
						var next = css.charAt(i + 1);
						if (char === '\n') {
							line++;
						}

						if (inComment) {
							if (char === '*' && next === '/') {
								inComment = false;
								i++;
							}
							continue;
						}

						if (quote) {
							if (escaped) {
								escaped = false;
								continue;
							}
							if (char === '\\') {
								escaped = true;
								continue;
							}
							if (char === quote) {
								quote = '';
							}
							continue;
						}

						if (char === '/' && next === '*') {
							inComment = true;
							commentLine = line;
							i++;
							continue;
						}

						if (char === '"' || char === "'") {
							quote = char;
							quoteLine = line;
							continue;
						}

						if (shufyThemeOpeningPair(char)) {
							stack.push({ char: char, line: line });
							continue;
						}

						if (shufyThemeClosingPair(char)) {
							var last = stack.pop();
							if (!last || last.char !== shufyThemeClosingPair(char)) {
								errors.push('Line ' + line + ': unmatched ' + char);
								continue;
							}
						}
					}

					if (quote) {
						errors.push('Line ' + quoteLine + ': unclosed quote');
					}
					if (inComment) {
						errors.push('Line ' + commentLine + ': unclosed comment');
					}
					while (stack.length) {
						var item = stack.pop();
						errors.push('Line ' + item.line + ': unclosed ' + item.char);
					}

					return {
						valid: errors.length === 0,
						errors: errors,
						lines: css.length ? css.split('\n').length : 1,
						chars: css.length
					};
				}
				function shufyThemeFormatCss(css) {
					var result = '';
					var quote = '';
					var inComment = false;
					var escaped = false;
					var indent = 0;
					var pendingNewLine = false;

					function addIndent() {
						for (var j = 0; j < indent; j++) {
							result += '    ';
						}
					}

					for (var i = 0; i < css.length; i++) {
						var char = css.charAt(i);
						var next = css.charAt(i + 1);

						if (pendingNewLine && char !== '\n' && char !== ' ' && char !== '\t') {
							result = result.replace(/[ \t]+$/g, '');
							result += '\n';
							addIndent();
							pendingNewLine = false;
						}

						if (inComment) {
							result += char;
							if (char === '*' && next === '/') {
								result += next;
								inComment = false;
								i++;
							}
							continue;
						}

						if (quote) {
							result += char;
							if (escaped) {
								escaped = false;
								continue;
							}
							if (char === '\\') {
								escaped = true;
								continue;
							}
							if (char === quote) {
								quote = '';
							}
							continue;
						}

						if (char === '/' && next === '*') {
							result += char + next;
							inComment = true;
							i++;
							continue;
						}

						if (char === '"' || char === "'") {
							result += char;
							quote = char;
							continue;
						}

						if (char === String.fromCharCode(123)) {
							result = result.replace(/[ \t]+$/g, '') + ' ' + String.fromCharCode(123) + '\n';
							indent++;
							addIndent();
							continue;
						}

						if (char === String.fromCharCode(125)) {
							result = result.replace(/[ \t]+$/g, '');
							indent = Math.max(0, indent - 1);
							result += '\n';
							addIndent();
							result += String.fromCharCode(125);
							pendingNewLine = true;
							continue;
						}

						if (char === ';') {
							result += ';\n';
							addIndent();
							continue;
						}

						result += char;
					}

					return result;
				}

				function createShufyThemeCssEditor(textarea) {
					if (!textarea.length || textarea.data('shufytheme-css-editor-initialized')) {
						return;
					}

					textarea.data('shufytheme-css-editor-initialized', true);
					textarea.attr('data-shufytheme-css-editor', '1');

					var editorContainer = $('<div class="shufytheme-css-editor-wrapper"></div>');
					var toolbar = $('<div class="shufytheme-css-editor-toolbar"></div>');
					var formatBtn = $('<button type="button" class="shufytheme-css-editor-btn"><i class="fal fa-magic"></i> Format CSS</button>');
					var infoBadge = $('<span class="shufytheme-css-editor-info"></span>');
					var statusBadge = $('<span class="shufytheme-css-editor-status"></span>');
					var errorBox = $('<div class="shufytheme-css-editor-errors" style="display:none;"></div>');

					toolbar.append(formatBtn, infoBadge, statusBadge);
					textarea.before(editorContainer);
					editorContainer.append(toolbar, textarea, errorBox);

					function updateEditorState() {
						var css = textarea.val() || '';
						var analysis = shufyThemeAnalyzeCss(css);

						infoBadge.text(css.length + ' chars | ' + analysis.lines + ' lines');

						if (!css.trim()) {
							statusBadge.attr('class', 'shufytheme-css-editor-status empty').text('Empty');
							errorBox.hide().empty();
							return { valid: true, errors: [] };
						}

						if (analysis.valid) {
							statusBadge.attr('class', 'shufytheme-css-editor-status valid').html('<i class="fal fa-check-circle"></i> Valid CSS');
							errorBox.hide().empty();
						} else {
							statusBadge.attr('class', 'shufytheme-css-editor-status invalid').html('<i class="fal fa-exclamation-triangle"></i> CSS Errors');
							errorBox.html('<strong>CSS Syntax Errors:</strong><br>' + analysis.errors.join('<br>')).show();
						}

						return analysis;
					}

					window.updateShufyThemeCssEditor = function(targetTextarea) {
						var target = $(targetTextarea);
						if (!target.length) {
							return { valid: true, errors: [] };
						}
						var css = target.val() || '';
						return shufyThemeAnalyzeCss(css);
					};

					textarea.on('input change keyup', function() {
						updateEditorState();
						updateShufyThemeFormDirtyState(textarea.closest('form'));
					});

					formatBtn.on('click', function(e) {
						e.preventDefault();
						var currentCss = textarea.val();
						if (!currentCss.trim()) {
							return;
						}
						var formatted = shufyThemeFormatCss(currentCss);
						textarea.val(formatted);
						updateEditorState();
						updateShufyThemeFormDirtyState(textarea.closest('form'));
					});

					updateEditorState();
				}

				$('.coodiv__whmcs__admin__panel textarea').filter(function() {
					var id = (this.id || '').toLowerCase();
					var name = (this.name || '').toLowerCase();
					return id.indexOf('css') !== -1 || name.indexOf('css') !== -1;
				}).each(function() {
					createShufyThemeCssEditor($(this));
				});

				$('.coodiv__whmcs__admin__panel form.shufytheme__ajax__save').each(function() {
					var formElement = $(this);
					markShufyThemeFormClean(formElement);

					formElement.on('input change keyup', 'input, select, textarea', function() {
						updateShufyThemeFormDirtyState(formElement);
					});
				});

				shufyThemeUnsavedTrackingReady = true;

				$(window).on('beforeunload', function(e) {
					if (hasShufyThemeUnsavedChanges()) {
						var confirmationMessage = 'You have unsaved settings changes. Are you sure you want to leave?';
						(e.originalEvent || e).returnValue = confirmationMessage;
						return confirmationMessage;
					}
				});

				$('.coodiv__whmcs__admin__panel').on('click', 'a[href]', function(event) {
					var href = $(this).attr('href') || '';
					if (!hasShufyThemeUnsavedChanges()) {
						return;
					}
					if (!href || href === '#' || href.indexOf('javascript:') === 0 || $(this).data('toggle') === 'modal') {
						return;
					}

					event.preventDefault();
					showShufyThemeUnsavedChangesMessage();
				});

				$('.coodiv__whmcs__admin__panel').on('submit', 'form:not(.shufytheme__ajax__save)', function(event) {
					if (!hasShufyThemeUnsavedChanges()) {
						return;
					}

					event.preventDefault();
					showShufyThemeUnsavedChangesMessage();
				});

				$('.coodiv__whmcs__admin__panel').on('submit', 'form.shufytheme__ajax__save', function(event) {
					event.preventDefault();

					var form = this;
					var formElement = $(form);
					var invalidCssMessage = '';
					formElement.find('[data-shufytheme-css-editor]').each(function() {
						var result = updateShufyThemeCssEditor($(this));
						if (!result.valid && invalidCssMessage === '') {
							invalidCssMessage = result.errors.join(' ');
						}
					});
					if (invalidCssMessage !== '') {
						showShufyThemeAjaxAlert('error', 'Custom CSS has errors: ' + invalidCssMessage);
						return;
					}
					var submitButtons = formElement.find('button[type="submit"], input[type="submit"]');
					if (form.id) {
						submitButtons = submitButtons.add($('[form="' + form.id + '"]'));
					}
					var originalButtonValues = [];

					submitButtons.each(function(index) {
						originalButtonValues[index] = $(this).is('input') ? $(this).val() : $(this).text();
						$(this).prop('disabled', true);
						if ($(this).is('input')) {
							$(this).val('Saving...');
						} else {
							$(this).text('Saving...');
						}
					});

					$.ajax({
						url: formElement.attr('action'),
						type: 'POST',
						data: new FormData(form),
						processData: false,
						contentType: false,
						dataType: 'json'
					}).done(function(response) {
						if (response && response.success) {
							markShufyThemeFormClean(formElement);
							showShufyThemeAjaxAlert('success', response.message || 'Settings saved successfully.');
						} else {
							showShufyThemeAjaxAlert('error', response && response.message ? response.message : 'The settings could not be saved.');
						}
					}).fail(function(xhr) {
						showShufyThemeAjaxAlert('error', shufyThemeAjaxSaveErrorMessage(xhr));
					}).always(function() {
						submitButtons.each(function(index) {
							$(this).prop('disabled', false);
							if ($(this).is('input')) {
								$(this).val(originalButtonValues[index]);
							} else {
								$(this).text(originalButtonValues[index]);
							}
						});
					});
				});
			});
			{/literal}
			</script>
