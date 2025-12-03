<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | CMS</title>

    <!-- Correct CSS link -->
    <link rel="stylesheet" href="/Cms/assets/css/style.css">
</head>

<body class="login-page">
