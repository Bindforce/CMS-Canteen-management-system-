<?php
session_start();
include("includes/db_connect.php");

$item_id = $_POST['item_id'];
$qty = $_POST['quantity'];

$item = $conn->query("SELECT * FROM menu_items WHERE item_id=$item_id")->fetch_assoc();

$cart_item = [
    "id" => $item["item_id"],
    "name" => $item["name"],
    "price" => $item["price"],
    "qty" => $qty,
    "image" => $item["image"]
];

if (!isset($_SESSION['cart'])) {
    $_SESSION['cart'] = [];
}

$found = false;

foreach ($_SESSION['cart'] as &$ci) {
    if ($ci["id"] == $item_id) {
        $ci["qty"] += $qty;
        $found = true;
        break;
    }
}

if (!$found) {
    $_SESSION['cart'][] = $cart_item;
}

echo json_encode([
    "status" => "success",
    "cart_count" => count($_SESSION['cart'])
]);
?>
