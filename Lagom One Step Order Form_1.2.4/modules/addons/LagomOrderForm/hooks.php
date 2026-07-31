<?php
/**
 * Lagom One Step Order Form Hooks
 * Clean, Unencrypted Version
 */

if (!defined("WHMCS")) {
    die("This file cannot be accessed directly");
}

use WHMCS\Database\Capsule;

/**
 * Cart Page Hook
 */
add_hook('ClientAreaPageCart', 1, function($vars) {
    return [
        'lagomOrderFormActive' => true,
        'lagomVersion' => '1.2.4'
    ];
});