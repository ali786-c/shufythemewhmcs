<?php
/**
 * ShufyTheme Language Override Loader for WHMCS
 * Automatically loads templates/shufytheme/lang/*.php into WHMCS $_LANG['shufytheme']
 */

if (!defined("WHMCS")) {
    die("This file cannot be accessed directly");
}

$shufyLangDir = __DIR__ . '/../../templates/shufytheme/lang/';
$userLanguage = isset($_SESSION['Language']) ? strtolower($_SESSION['Language']) : 'english';
$shufyLangFile = $shufyLangDir . $userLanguage . '.php';

if (!file_exists($shufyLangFile)) {
    $shufyLangFile = $shufyLangDir . 'english.php';
}

if (file_exists($shufyLangFile)) {
    include $shufyLangFile;
}
