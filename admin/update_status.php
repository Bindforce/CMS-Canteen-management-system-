<?php
include('../includes/db_connect.php');

if (isset($_POST['order_id'])) {
    $id = $_POST['order_id'];
    $conn->query("UPDATE orders SET status='Finished' WHERE order_id=$id");
    echo "OK";
} else {
    echo "ERROR";
}
?>
