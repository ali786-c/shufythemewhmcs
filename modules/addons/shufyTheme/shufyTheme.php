<?php
/**
 * ShufyTheme Addon Module - Original Coodiv Control Panel Engine (Auto-Activated)
 */

if (!defined("WHMCS")) {
    die("This file cannot be accessed directly");
}

use WHMCS\Database\Capsule;

function shufyTheme_config() {
    return [
        'name' => 'ShufyTheme Control Panel',
        'description' => 'Original ShufyTheme Management Addon (Active & Fully Unlocked)',
        'author' => 'Coodiv',
        'language' => 'english',
        'version' => '1.1.8',
        'fields' => []
    ];
}

function shufyTheme_activate() {
    return ['status' => 'success', 'description' => 'ShufyTheme Control Panel activated successfully.'];
}

function shufyTheme_deactivate() {
    return ['status' => 'success', 'description' => 'ShufyTheme Control Panel deactivated.'];
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
    $action = $_GET['action'] ?? $_POST['action'] ?? '';

    // If saving homepage options, set unchecked checkboxes to 'disabled'
    if (strpos($action, 'homepage') !== false) {
        $homepageCheckboxes = [
            'themehomepagesettingmarketconnectbannaers',
            'themehomepagesettingmarketconnectbannaersnav',
            'themehomepagesettingannouncements',
            'themehomepagesettinghomepagefeaturedsection',
            'themehomepagesettingfeaturedfirst',
            'themehomepagesettingfeaturedssecond',
            'themehomepagesettingfeaturedthird',
            'themehomepagesettingfeaturescolorsplansfirst',
            'themehomepagesettingservicesfeatures',
            'themehomepagesettingsavingbanner',
            'themehomepagesettingsubscribingsection'
        ];
        foreach ($homepageCheckboxes as $cb) {
            if (!isset($data[$cb])) {
                $data[$cb] = 'disabled';
            }
        }
    }

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
                    'module' => 'shufyTheme',
                    'setting' => $key,
                    'value' => $strVal
                ]);
            }
        } catch (\Exception $e) {
            // Ignore DB errors
        }
    }
}

function shufyTheme_output($vars) {
    $action = $_GET['action'] ?? 'themeoption';
    $modurl = 'addonmodules.php?module=shufyTheme';
    $isAjax = (!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) === 'xmlhttprequest');

    // Process POST submissions
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        check_token();
        shufyTheme_save_settings($_POST);

        if ($isAjax) {
            header('Content-Type: application/json');
            echo json_encode([
                'success' => true,
                'message' => 'Shufytheme settings saved successfully.'
            ]);
            exit;
        } else {
            $redirectAction = str_replace('apply', '', $action);
            if (empty($redirectAction)) $redirectAction = 'themeoption';
            header("Location: {$modurl}&action={$redirectAction}&success=1");
            exit;
        }
    }

    // Initialize WHMCS Smarty instance
    $smarty = new \WHMCS\Smarty();

    // Load saved settings
    $settings = shufyTheme_get_all_settings();

    // Assign standard variables for Coodiv views
    $smarty->assign('modurl', $modurl);
    $smarty->assign('currentAddonVersion', '1.1.8');
    $smarty->assign('needsUpdate', false);
    $smarty->assign('csrfToken', generate_token('plain'));
    $smarty->assign('breadcrumbs', 'ShufyTheme Control Panel');
    $smarty->assign('license_status', 'active');
    $smarty->assign('themesetting', $settings);
    $smarty->assign('themehomepagesetting', $settings);
    $smarty->assign('coodivsettings', $settings);
    $smarty->assign('coodivcolorsettings', $settings);
    $smarty->assign('coodivsidebaroptions', $settings);
    $smarty->assign('coodivlayoutssettings', $settings);
    $smarty->assign('coodivhomepagesettings', $settings);
    $smarty->assign('coodivfootersettings', $settings);
    $smarty->assign('coodivfooteroptions', $settings);
    $smarty->assign('themefootersetting', $settings);
    $smarty->assign('coodivheadersettings', $settings);
    $smarty->assign('coodivheaderoptions', $settings);
    $smarty->assign('coodivtypographiesettings', $settings);
    $smarty->assign('coodivtypographieoptions', $settings);

    // Pass direct settings variables to Smarty
    foreach ($settings as $k => $v) {
        $smarty->assign($k, $v);
    }

    $viewsDir = __DIR__ . '/views/';

    // Render Coodiv Header View
    if (file_exists($viewsDir . 'header.tpl')) {
        echo $smarty->fetch($viewsDir . 'header.tpl');
    }

    // Render Coodiv Tab View
    $targetView = $viewsDir . $action . '.tpl';
    if (!file_exists($targetView)) {
        if ($action === 'listgroup') $targetView = $viewsDir . 'menulist.tpl';
        else $targetView = $viewsDir . 'themeoption.tpl';
    }

    if (file_exists($targetView)) {
        echo $smarty->fetch($targetView);
    } else {
        echo '<div class="alert alert-info">View not found: ' . htmlspecialchars($action) . '</div>';
    }

    // Render Coodiv Footer View
    if (file_exists($viewsDir . 'footer.tpl')) {
        echo $smarty->fetch($viewsDir . 'footer.tpl');
    }
}