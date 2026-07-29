<?php
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    function checkSubmissionLimit($ip) {
        $storageFile = 'ip_submissions.json';
        $hourlyLimit = 5;
        if (file_exists($storageFile)) {
            $submissions = json_decode(file_get_contents($storageFile), true);
        } else {
            $submissions = [];
        }
        foreach ($submissions as $key => $entry) {
            if (time() - $entry['timestamp'] > 3600) {
                unset($submissions[$key]);
            }
        }
        $ipCount = 0;
        foreach ($submissions as $entry) {
            if ($entry['ip'] === $ip) {
                $ipCount++;
            }
        }
        $submissions[] = [
            'ip' => $ip,
            'timestamp' => time()
        ];
        file_put_contents($storageFile, json_encode($submissions));
        return $ipCount >= $hourlyLimit;
    }
    $ip = $_SERVER['REMOTE_ADDR'];
    if (checkSubmissionLimit($ip)) {
        exit('The submission limit was exceeded on this IP address. Please try again after 1 hour.');
    }
    $email = $_POST['email'];
    $audienceId = $_POST['audienceId'];
    $apiKey = $_POST['apiKey'];
    $dc = $_POST['dc'];
    if (!empty($_POST['email_botcheck'])) {
        exit('Suspicious submission detected. Please try again later.');
    }
    $url = "https://$dc.api.mailchimp.com/3.0/lists/$audienceId/members/";
    $data = [
        'email_address' => $email,
        'status' => 'subscribed'
    ];
    $jsonData = json_encode($data);
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_USERPWD, 'user:' . $apiKey);
    curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json']);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonData);
    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($httpCode === 200) {
        echo 'Subscription successful!';
    } else {
        $response = json_decode($response, true);
        echo 'Error: ' . $response['detail'];
    }

} else {
    exit('Invalid request method.');
}
?>
