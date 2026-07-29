<?php
/**
 * ShufyTheme Standalone Engine Hooks
 * Auto-Active & Unencrypted - Integrates with Coodiv Control Panel & Database
 */

if (!defined("WHMCS")) {
    die("This file cannot be accessed directly");
}

use WHMCS\Database\Capsule;

function shufyTheme_get_all_settings_db() {
    $settings = [];
    try {
        $rows = Capsule::table('tbladdonmodules')
            ->where('module', 'shufyTheme')
            ->get();
        foreach ($rows as $row) {
            $settings[$row->setting] = $row->value;
        }
    } catch (\Exception $e) {
        // Fallback
    }
    return $settings;
}

function shufyTheme_load_lang_vars($language = 'english') {
    $langDir = __DIR__ . '/../../templates/shufytheme/lang/';
    $langFile = $langDir . strtolower($language) . '.php';
    if (!file_exists($langFile)) {
        $langFile = $langDir . 'english.php';
    }
    $_LANG = [];
    if (file_exists($langFile)) {
        include $langFile;
    }
    return $_LANG['shufytheme'] ?? [];
}

add_hook('ClientAreaPage', 1, function($vars) {
    $template = $vars['template'] ?? 'shufytheme';
    $dbSettings = shufyTheme_get_all_settings_db();

    // Load theme language strings
    global $smarty;
    $userLang = $vars['language'] ?? 'english';
    $shufyLang = shufyTheme_load_lang_vars($userLang);
    $existingLang = $vars['LANG'] ?? [];
    $existingShufy = $existingLang['shufytheme'] ?? [];
    $existingLang['shufytheme'] = array_merge($shufyLang, $existingShufy);

    if (isset($smarty) && is_object($smarty)) {
        $smarty->assign('LANG', $existingLang);
        $smarty->assign('shufythemeLang', $shufyLang);
    }

    // Default configuration mapping
    $defaults = [
        'LANG' => $existingLang,
        'shuffythemeversion' => '1.3.2',
        'shuffythemedirection' => "templates/{$template}/includes/theme-core/header-layouts/header-default-layout.tpl",
        'shuffythemedirectionfooter' => "templates/{$template}/includes/theme-core/footer-layouts/footer-default-layout.tpl",
        'coodivsettings' => array_merge([
            'id' => '1',
            'customthemeloader' => 'loaderdisbaled',
            'userdropdown' => 'activated',
            'cartdropdown' => 'activated',
            'notificationdropdown' => 'activated',
            'customersnotifications' => '',
            'gravatar' => 'activated',
            'loginstyle' => 'loginstyleone',
            'registerstyle' => 'registerstyleone'
        ], $dbSettings),
        'coodivcolorsettings' => array_merge([
            'id' => '1',
            'allowdarkmode' => 'activated',
            'darkmodefault' => '',
            'dafaultthemecolor' => 'default-color'
        ], $dbSettings),
        'coodivsidebaroptions' => array_merge([
            'id' => '1',
            'themesidebarsettingsfixedtopheader' => 'activated',
            'themesidebarsettingsfixedhorizontalmenu' => 'activated',
            'themesidebarsettingsfixedsecondarymenu' => 'activated',
            'themesidebarsettingssidebaronhover' => 'activated',
            'themesidebarsettingschildonhover' => 'activated',
            'themesidebarsettingsdarkicons' => '',
            'themesidebarsettingswithouticons' => '',
            'themesidebarsettingfullwidthtopheader' => 'activated',
            'themesidebarsettingfullwithhorizontalmenu' => 'activated',
            'themesidebarsettingsdarkmode' => '',
            'themesidebarsettingsallowusertoexpend' => 'activated',
            'themesidebarsettingsallowusertocollapse' => 'activated',
            'themesidebarsettingscollapsed' => ''
        ], $dbSettings),
        'coodivlayoutssettings' => array_merge([
            'id' => '1',
            'layoutsettingssidebarlayout' => 'minimalist__sidebar',
            'layoutsettingssidebarposition' => 'sidebarpositionleft',
            'layoutsettingssidebarstyle' => 'sidebarheaderlogo'
        ], $dbSettings),
        'coodivhomepagesettings' => array_merge([
            'id' => '1',
            'themehomepagesettingmarketconnectbannaers' => 'activated',
            'themehomepagesettingmarketconnectbannaersnav' => 'activated',
            'themehomepagesettinghomepagefeaturedsection' => 'activated',
            'themehomepagesettingservicesfeatures' => 'activated',
            'themehomepagesettingannouncements' => 'activated',
            'themehomepagesettingsavingbanner' => 'activated',
            'themehomepagesettingsubscribingsection' => 'activated'
        ], $dbSettings),
        'coodivfootersettings' => array_merge([
            'id' => '1'
        ], $dbSettings),
        'coodivfooteroptions' => array_merge([
            'id' => '1'
        ], $dbSettings),
        'themefootersetting' => array_merge([
            'id' => '1'
        ], $dbSettings),
        'coodivheadersettings' => array_merge([
            'id' => '1'
        ], $dbSettings),
        'coodivheaderoptions' => array_merge([
            'id' => '1'
        ], $dbSettings),
        'coodivtypographiesettings' => array_merge([
            'id' => '1'
        ], $dbSettings),
        'coodivtypographieoptions' => array_merge([
            'id' => '1'
        ], $dbSettings),
        'CoodivMarketConnectServices' => [
            ['name' => 'sitebuilder', 'productGroup' => ['slug' => 'website-builder']],
            ['name' => 'codeguard', 'productGroup' => ['slug' => 'codeguard']],
            ['name' => 'sitelock', 'productGroup' => ['slug' => 'sitelock']],
            ['name' => 'spamexperts', 'productGroup' => ['slug' => 'spamexperts']],
            ['name' => 'marketgoo', 'productGroup' => ['slug' => 'marketgoo']],
            ['name' => 'weebly', 'productGroup' => ['slug' => 'weebly']]
        ]
    ];

    return $defaults;
});