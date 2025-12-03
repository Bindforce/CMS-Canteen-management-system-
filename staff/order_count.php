<?php
include('../includes/db_connect.php');
$count = $conn->query("SELECT COUNT(*) AS total FROM orders")->fetch_assoc()['total'];
echo $count;
?>
