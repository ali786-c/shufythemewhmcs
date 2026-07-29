<?php
/**
 * ShufyTheme WHMCS ClientArea Hooks
 * Standalone & Auto-Activated (License Verification Bypassed Engine)
 * Developed by Coodiv Team
 */

if (!defined("WHMCS")) {
    die("This file cannot be accessed directly");
}

use WHMCS\Database\Capsule;

if (!function_exists('shufyTheme_get_all_settings_db')) {
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
            // Fail quietly
        }
        return $settings;
    }
}

add_hook('ClientAreaPage', 1, function($vars) {
    $template = $vars['template'] ?? 'shufytheme';
    $dbSettings = shufyTheme_get_all_settings_db();

    $defaults = [
        'shuffythemeversion'         => '1.3.2',
        'shuffythemedirection'       => $template . '/includes/theme-core/header-layouts/header-default-layout.tpl',
        'shuffythemedirectionfooter' => $template . '/includes/theme-core/footer-layouts/footer-default-layout.tpl',
        
        'coodivsettings' => array_merge([
            'id'                   => '1',
            'customthemeloader'    => 'loaderdisbaled',
            'userdropdown'         => 'activated',
            'cartdropdown'         => 'activated',
            'notificationdropdown' => 'activated'
        ], $dbSettings),

        'coodivcolorsettings' => array_merge([
            'id'                => '1',
            'allowdarkmode'     => 'activated',
            'dafaultthemecolor' => 'default-color'
        ], $dbSettings),

        'coodivlayoutssettings' => array_merge([
            'id'                             => '1',
            'layoutsettingssidebarlayout'   => 'minimalist__sidebar',
            'layoutsettingssidebarposition' => 'sidebarpositionleft',
            'layoutsettingssidebarstyle'    => 'sidebarheaderlogo'
        ], $dbSettings),

        'coodivsidebaroptions' => array_merge([
            'id'                                      => '1',
            'themesidebarsettingsfixedtopheader'     => 'activated',
            'themesidebarsettingsfixedhorizontalmenu' => 'activated',
            'themesidebarsettingsfixedsecondarymenu'  => 'activated',
            'themesidebarsettingssidebaronhover'      => 'activated',
            'themesidebarsettingschildonhover'        => 'activated',
            'themesidebarsettingsdarkicons'           => 'activated',
            'themesidebarsettingsallowusertoexpend'   => 'activated',
            'themesidebarsettingsallowusertocollapse' => 'activated'
        ], $dbSettings),

        'coodivhomepagesettings' => array_merge([
            'id'                                           => '1',
            'themehomepagesettingmarketconnectbannaers'    => 'activated',
            'themehomepagesettingmarketconnectbannaersnav' => 'activated',
            'themehomepagesettinghomepagefeaturedsection'  => 'activated',
            'themehomepagesettingservicesfeatures'        => 'activated',
            'themehomepagesettingannouncements'            => 'activated',
            'themehomepagesettingsavingbanner'             => 'activated',
            'themehomepagesettingsubscribingsection'        => 'activated'
        ], $dbSettings),

        'coodivheaderoptions' => array_merge([
            'id' => '1'
        ], $dbSettings),

        'coodivfooteroptions' => array_merge([
            'id' => '1'
        ], $dbSettings),

        'coodivtypographieoptions' => array_merge([
            'id' => '1'
        ], $dbSettings),

        'CoodivMarketConnectServices' => []
    ];

    return $defaults;
});