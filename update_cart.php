<?php
session_start();

foreach ($_POST['qty'] as $index => $quantity) {
    $_SESSION['cart'][$index]['qty'] = $quantity;
}

header("Location: cart.php");
exit();
?>
