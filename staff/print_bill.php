<?php
include('../includes/db_connect.php');

$order_id = $_GET['order_id'];

$order = $conn->query("SELECT * FROM orders WHERE order_id=$order_id")->fetch_assoc();
$items = $conn->query("
    SELECT oi.quantity, oi.subtotal, m.name, m.price
    FROM order_items oi
    JOIN menu_items m ON oi.item_id = m.item_id
    WHERE oi.order_id=$order_id
");
?>
<html>
<head>
<title>Print Bill</title>
<style>
body { font-family: Arial; }
.bill-box {
    width: 300px;
    margin: auto;
    padding: 20px;
    border: 1px solid #ccc;
}
h2 { text-align:center; }
table { width:100%; border-collapse: collapse; }
td, th { border-bottom: 1px solid #ddd; padding:6px; }
.print-btn { display:none; }
</style>
</head>

<body onload="window.print()">

<div class="bill-box">
    <h2>Canteen Bill</h2>

    <p><strong>Order ID:</strong> <?php echo $order_id; ?></p>
    <p><strong>Customer:</strong> <?php echo $order['customer_name']; ?></p>
    <p><strong>Date:</strong> <?php echo $order['order_time']; ?></p>

    <table>
        <tr><th>Item</th><th>Qty</th><th>Total</th></tr>
        <?php while ($it = $items->fetch_assoc()): ?>
        <tr>
            <td><?php echo $it['name']; ?></td>
            <td><?php echo $it['quantity']; ?></td>
            <td><?php echo $it['subtotal']; ?></td>
        </tr>
        <?php endwhile; ?>
    </table>

    <h3>Total: Rs. <?php echo $order['total_amount']; ?></h3>
</div>

</body>
</html>

