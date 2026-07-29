<?php
/**
 * ShufyTheme WHMCS Addon Module
 * Standalone & Auto-Activated (License Verification Bypassed Engine)
 * Developed by Coodiv Team
 */

if (!defined("WHMCS")) {
    die("This file cannot be accessed directly");
}

use WHMCS\Database\Capsule;

function shufyTheme_config() {
    return [
        'name'        => 'shufyTheme',
        'description' => 'Coodiv ShufyTheme Admin Control Panel (Standalone Engine)',
        'version'     => '1.3.2',
        'author'      => 'Coodiv Team',
        'language'    => 'english',
        'fields'      => []
    ];
}

function shufyTheme_activate() {
    return [
        'status'      => 'success',
        'description' => 'ShufyTheme Control Panel activated successfully.'
    ];
}

function shufyTheme_deactivate() {
    return [
        'status'      => 'success',
        'description' => 'ShufyTheme Control Panel deactivated successfully.'
    ];
}

function shufyTheme_get_all_settings() {
    $settings = [];
    try {
        $rows = Capsule::table('tbladdonmodules')
            ->where('module', 'shufyTheme')
            ->get();
        foreach ($rows as $row) {
            $settings[$row->setting] = $row->value;
        }
    } catch (\Exception $e) {
        // Fallback empty array
    }
    return $settings;
}

function shufyTheme_save_settings($data) {
    foreach ($data as $key => $val) {
        if (in_array($key, ['token', 'action', 'itemid', 'submit'])) continue;
        $strVal = is_array($val) ? json_encode($val) : (string)$val;
        try {
            $exists = Capsule::table('tbladdonmodules')
                ->where('module', 'shufyTheme')
                ->where('setting', $key)
                ->exists();
            if ($exists) {
                Capsule::table('tbladdonmodules')
                    ->where('module', 'shufyTheme')
                    ->where('setting', $key)
                    ->update(['value' => $strVal]);
            } else {
                Capsule::table('tbladdonmodules')->insert([
                    'module'  => 'shufyTheme',
                    'setting' => $key,
                    'value'   => $strVal
                ]);
            }
        } catch (\Exception $e) {
            // Ignore DB errors
        }
    }
}

function shufyTheme_output($vars) {
    $action = $_REQUEST['action'] ?? 'homepage';

    // Save settings if form submitted via POST
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        shufyTheme_save_settings($_POST);
        echo '<div class="alert alert-success" style="margin: 15px 0;">Settings saved successfully.</div>';
    }

    $settings = shufyTheme_get_all_settings();

    global $whmcs;
    $smarty = new Smarty();
    $smarty->caching = false;
    $smarty->compile_dir = $GLOBALS['templates_compiledir'] ?? sys_get_temp_dir();
    $smarty->template_dir = __DIR__ . '/views';

    $smarty->assign('modulelink', $vars['modulelink'] ?? 'addonmodules.php?module=shufyTheme');
    $smarty->assign('license_status', 'active');
    $smarty->assign('licensestatus', 'Active');
    $smarty->assign('coodivsettings', array_merge(['id' => '1'], $settings));
    $smarty->assign('coodivcolorsettings', array_merge(['id' => '1'], $settings));
    $smarty->assign('coodivlayoutssettings', array_merge(['id' => '1'], $settings));
    $smarty->assign('vars', $vars);
    $smarty->assign('settings', $settings);

    // Map requested view file safely
    $validViews = [
        'homepage'         => 'themeoption.tpl',
        'styleoptions'     => 'styleoptions.tpl',
        'layoutoptions'    => 'layoutoptions.tpl',
        'headeroptions'    => 'header.tpl',
        'footeroptions'    => 'footeroptions.tpl',
        'sidebaroptions'   => 'sidebaroptions.tpl',
        'homepageoptions'  => 'homepageoptions.tpl',
        'typpoptions'      => 'typpoptions.tpl',
        'menulist'         => 'menulist.tpl',
        'addmenu'          => 'addmenu.tpl',
        'editmenu'         => 'edit_menu.tpl',
        'addgroup'         => 'addnewgroup.tpl',
        'groups'           => 'groups.tpl',
        'emailtemplates'   => 'emailtemplatesettings.tpl',
        'backups'          => 'settingsbackups.tpl',
        'extentions'       => 'extentions.tpl',
        'themehealthcheck' => 'themehealthcheck.tpl'
    ];

    $templateFile = $validViews[$action] ?? 'themeoption.tpl';

    if (file_exists(__DIR__ . '/views/' . $templateFile)) {
        $smarty->display($templateFile);
    } else {
        $smarty->display('themeoption.tpl');
    }
}