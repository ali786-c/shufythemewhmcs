{if $template == "shufytheme-child"}{$template = "shufytheme"}{/if}
<meta name="theme-version" content="{$shuffythemeversion}">
{include file="$template/includes/theme-core/basic-seo.tpl"}
{include file="$template/includes/theme-core/typographie.tpl"}
<link rel="stylesheet" href="{$WEB_ROOT}/templates/{$template}/assets/css/theme.min.css?v={$shuffythemeversion}">
<!-- Dynamic Template Compatibility -->
<link rel="stylesheet" type="text/css" href="{$WEB_ROOT}/assets/fonts/css/fontawesome.min.css">
<link rel="stylesheet" type="text/css" href="{$WEB_ROOT}/assets/fonts/css/fontawesome-solid.min.css">
<link rel="stylesheet" type="text/css" href="{$WEB_ROOT}/assets/fonts/css/fontawesome-regular.min.css">
<link rel="stylesheet" type="text/css" href="{$WEB_ROOT}/assets/fonts/css/fontawesome-light.min.css">
<link rel="stylesheet" type="text/css" href="{$WEB_ROOT}/assets/fonts/css/fontawesome-brands.min.css">
<link rel="stylesheet" type="text/css" href="{$WEB_ROOT}/assets/fonts/css/fontawesome-duotone.min.css">
{if ($language == 'arabic' || $language == 'hebrew' || $language == 'farsi')}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/css/bootstrap.rtl.min.css?v={$shuffythemeversion}">
{/if}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/css/app.min.css?v={$shuffythemeversion}">
{if ($language == 'arabic' || $language == 'hebrew' || $language == 'farsi')}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/css/app.rtl.css?v={$shuffythemeversion}">
{/if}
{if file_exists("modules/addons/shufyTheme/css-values/default-style.css")}
    {assign var="css_base" value="{$WEB_ROOT}/modules/addons/shufyTheme/css-values"}
{else}
    {assign var="css_base" value="{$WEB_ROOT}/templates/{$template}/assets/css-values"}
{/if}
{if $coodivcolorsettings.dafaultthemecolor|default:''=='theme-style-two'}
<link rel="stylesheet" media="all" href="{$css_base}/green-style.css?v={$coodivcolorsettings.custom_colors_version|default:''}">
{else if $coodivcolorsettings.dafaultthemecolor|default:''=='theme-style-three'}
<link rel="stylesheet" media="all" href="{$css_base}/purple-style.css?v={$coodivcolorsettings.custom_colors_version|default:''}">
{else if $coodivcolorsettings.dafaultthemecolor|default:''=='theme-style-four'}
<link rel="stylesheet" media="all" href="{$css_base}/red-style.css?v={$coodivcolorsettings.custom_colors_version|default:''}">
{else}
<link rel="stylesheet" media="all" href="{$css_base}/default-style.css?v={$coodivcolorsettings.custom_colors_version|default:''}">
{/if}
{if $coodivtypographiesettings.id|default:'' == '1'}
<link rel="stylesheet" media="all" href="{$css_base}/typographie.css">
{/if}
{assetExists file="custom.css"}
<link href="{$__assetPath__}" rel="stylesheet">
{/assetExists}
{if $coodivsettings.customcsscode|default:'' != null}
<link rel="stylesheet" media="all" href="{$css_base}/custom.css?v={$coodivsettings.customcss_version|default:''}">
{/if}
{if $coodivhomepagesettings.id|default:'' == '1'}
<link rel="stylesheet" media="all" href="{$css_base}/homepage-plans.css?v={$coodivsettings.customcss_version|default:''}">
{/if}
<script>
	var csrfToken = '{$token}',
		markdownGuide = '{lang|addslashes key="markdown.title"}',
		locale = '{if !empty($mdeLocale)}{$mdeLocale}{else}en{/if}',
		saved = '{lang|addslashes key="markdown.saved"}',
		saving = '{lang|addslashes key="markdown.saving"}',
		whmcsThemeName = "{$template}",
		whmcsBaseUrl = "{\WHMCS\Utility\Environment\WebHelper::getBaseUrl()}";
    {if $captcha}{$captcha->getPageJs()}{/if}
</script>
<script src="{$WEB_ROOT}/templates/{$template}/assets/js/scripts.min.js?v={$shuffythemeversion}"></script>
{if $templatefile == "viewticket" && !$loggedin}
  <meta name="robots" content="noindex" />
{/if}