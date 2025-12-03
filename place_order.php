<?php
session_start();
include("includes/db_connect.php");

if (!isset($_SESSION['cart']) || count($_SESSION['cart']) == 0) {
    header("Location: cart.php");
    exit();
}


$customer_name = mysqli_real_escape_string($conn, $_POST['customer_name']);
$table_address = mysqli_real_escape_string($conn, $_POST['address']);

$total = 0;


foreach ($_SESSION['cart'] as $item) {
    $total += $item['qty'] * $item['price'];
}


$sql = "INSERT INTO orders (customer_name, table_address, total_amount, status)
        VALUES ('$customer_name', '$table_address', $total, 'Ongoing')";

$conn->query($sql);


$order_id = $conn->insert_id;


foreach ($_SESSION['cart'] as $item) {
    $id = $item['id'];
    $qty = $item['qty'];
    $sub = $item['price'] * $item['qty'];

    $conn->query("INSERT INTO order_items (order_id, item_id, quantity, subtotal)
                  VALUES ($order_id, $id, $qty, $sub)");
}


unset($_SESSION['cart']);

header("Location: order_success.php");
exit();
?>
