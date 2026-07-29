<?php
use WHMCS\ClientArea;
use WHMCS\Database\Capsule;

define('CLIENTAREA', true);
require __DIR__ . '/init.php';
$ca = new ClientArea();
$ca->setPageTitle('Verify Your Email To Continue.');
$ca->initPage();
$ca->assign('custompage', 'full');
$ca->setTemplate('verify-email');
$ca->output();