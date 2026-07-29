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
        'shuffythemeversion' => '1.3.2',
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
        ], $dbSettings)
    ];

    return $defaults;
});