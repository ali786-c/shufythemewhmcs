<?php
/**
 * Lagom One Step Order Form Addon Module for WHMCS
 * Clean, Unencrypted, License-Free Version
 */

if (!defined("WHMCS")) {
    die("This file cannot be accessed directly");
}

use WHMCS\Database\Capsule;

function LagomOrderForm_config() {
    return [
        'name' => 'Lagom One Step Order Form',
        'description' => 'Redefine the process of purchasing WHMCS products with a fast 1-Step checkout experience.',
        'author' => 'RS Studio / Custom Unlocked',
        'language' => 'english',
        'version' => '1.2.4',
        'fields' => [
            'license' => [
                'FriendlyName' => 'License Key',
                'Type' => 'text',
                'Size' => '50',
                'Default' => 'LagomOrderForm-Unlocked-License-Key',
                'Description' => 'Enter license key (Pre-filled and unlocked)',
            ],
            'status' => [
                'FriendlyName' => 'Module Status',
                'Type' => 'dropdown',
                'Options' => 'Active,Disabled',
                'Default' => 'Active',
                'Description' => 'Enable or disable Lagom One Step Order Form',
            ],
            'template' => [
                'FriendlyName' => 'Order Form Template',
                'Type' => 'dropdown',
                'Options' => 'shufytheme_cart,lagom2',
                'Default' => 'shufytheme_cart',
                'Description' => 'Select default order form template layout',
            ]
        ]
    ];
}

function LagomOrderForm_activate() {
    try {
        // Automatically register license in WHMCS database
        $check = Capsule::table('tbladdonmodules')
            ->where('module', 'LagomOrderForm')
            ->where('setting', 'license')
            ->first();

        if (!$check) {
            Capsule::table('tbladdonmodules')->insert([
                'module' => 'LagomOrderForm',
                'setting' => 'license',
                'value' => 'LagomOrderForm-Unlocked-License-Key'
            ]);
        } else {
            Capsule::table('tbladdonmodules')
                ->where('module', 'LagomOrderForm')
                ->where('setting', 'license')
                ->update(['value' => 'LagomOrderForm-Unlocked-License-Key']);
        }

        return [
            'status' => 'success',
            'description' => 'Lagom One Step Order Form activated successfully without any license restrictions.'
        ];
    } catch (\Exception $e) {
        return [
            'status' => 'error',
            'description' => 'Could not activate module: ' . $e->getMessage()
        ];
    }
}

function LagomOrderForm_deactivate() {
    return [
        'status' => 'success',
        'description' => 'Lagom One Step Order Form deactivated.'
    ];
}

function LagomOrderForm_output($vars) {
    // Ensure license setting is set in tbladdonmodules table
    try {
        $check = Capsule::table('tbladdonmodules')
            ->where('module', 'LagomOrderForm')
            ->where('setting', 'license')
            ->first();
            
        if (!$check) {
            Capsule::table('tbladdonmodules')->insert([
                'module' => 'LagomOrderForm',
                'setting' => 'license',
                'value' => 'LagomOrderForm-Unlocked-License-Key'
            ]);
        }
    } catch (\Exception $e) {
        // silence DB check error if table doesn't exist
    }

    $moduleVersion = '1.2.4';
    $activeTemplate = isset($vars['template']) ? htmlspecialchars($vars['template']) : 'shufytheme_cart';
    $licenseKey = isset($vars['license']) && !empty($vars['license']) ? htmlspecialchars($vars['license']) : 'LagomOrderForm-Unlocked-License-Key';
    
    echo '<div class="bootstrap">';
    echo '  <div class="alert alert-success" style="font-size: 15px; padding: 15px; margin-bottom: 20px;">';
    echo '      <i class="fas fa-check-circle" style="margin-right: 8px;"></i> <strong>Lagom One Step Order Form (v' . $moduleVersion . ') Active & Fully Unlocked!</strong>';
    echo '  </div>';
    echo '  <div class="panel panel-default">';
    echo '      <div class="panel-heading"><h3 class="panel-title"><i class="fas fa-sliders-h"></i> Module Settings</h3></div>';
    echo '      <div class="panel-body">';
    echo '          <p>Module is running smoothly with <strong>Zero License Restrictions</strong>.</p>';
    echo '          <p><strong>License Status:</strong> <span class="label label-success">Active / Unlocked</span></p>';
    echo '          <p><strong>License Key:</strong> <code>' . $licenseKey . '</code></p>';
    echo '          <p><strong>Configured Cart Template:</strong> <span class="label label-info">' . $activeTemplate . '</span></p>';
    echo '      </div>';
    echo '  </div>';
    echo '</div>';
}