<?php
include('../includes/db_connect.php');
if (!isset($_GET['order_id'])) {
    die("Order ID is missing.");
}

$order_id = intval($_GET['order_id']);

// Fetch order details
$orderQuery = mysqli_query($conn, "SELECT * FROM orders WHERE order_id=$order_id");
$order = mysqli_fetch_assoc($orderQuery);

if (!$order) {
    die("Order not found.");
}

// Fetch ordered items
$itemQuery = mysqli_query($conn, "
    SELECT oi.*, mi.name, mi.price
    FROM order_items oi
    JOIN menu_items mi ON oi.item_id = mi.item_id
    WHERE oi.order_id = $order_id
");


$items = [];
while ($row = mysqli_fetch_assoc($itemQuery)) {
    $items[] = $row;
}
?>

<style>
    body {
        font-family: "Segoe UI", Arial, sans-serif;
        background: #f5f6fa;
        margin: 0;
        padding: 0;
    }

    .order-container {
        max-width: 800px;
        margin: 40px auto;
        background: #ffffff;
        padding: 25px 30px;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        animation: fadeIn 0.4s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(10px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .title {
        font-size: 24px;
        font-weight: 700;
        color: #ff6b00;
        margin-bottom: 20px;
    }

    .info-box {
        background: #fff7f0;
        border-left: 5px solid #ff6b00;
        padding: 15px;
        border-radius: 8px;
        margin-bottom: 25px;
    }

    .info-box p {
        margin: 6px 0;
        font-size: 15px;
        color: #444;
    }

    .items-title {
        font-size: 20px;
        font-weight: 600;
        margin-bottom: 15px;
        color: #333;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 25px;
    }

    th {
        background: #ff6b00;
        color: white;
        padding: 10px;
        font-size: 15px;
    }

    td {
        padding: 10px;
        border-bottom: 1px solid #ddd;
        font-size: 15px;
        color: #444;
    }

    .btn-group {
        display: flex;
        gap: 10px;
        margin-top: 15px;
    }

    .btn {
        padding: 10px 20px;
        background: #ff6b00;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 15px;
        cursor: pointer;
        transition: 0.2s;
        text-decoration: none;
    }

    .btn:hover {
        background: #e55e00;
    }

    .btn-secondary {
        background: #444;
    }

    .btn-secondary:hover {
        background: #222;
    }
</style>

<div class="order-container">
    <div class="title">Order #<?= $order['order_id']; ?> Details</div>

    <div class="info-box">
        <p><b>Customer:</b> <?= $order['customer_name']; ?></p>
        <p><b>Table No / Address:</b> <?= $order['table_address']; ?></p>
        <p><b>Total Amount:</b> Rs. <?= number_format($order['total_amount'], 2); ?></p>
        <p><b>Date:</b> <?= $order['order_time']; ?></p>
    </div>

    <div class="items-title">Ordered Items</div>

    <table>
        <tr>
            <th>Item</th>
            <th>Price (Rs)</th>
            <th>Qty</th>
            <th>Subtotal (Rs)</th>
        </tr>

        <?php foreach ($items as $row): ?>
        <tr>
            <td><?= $row['name']; ?></td>
            <td><?= number_format($row['price'], 2); ?></td>
            <td><?= $row['quantity']; ?></td>
            <td><?= number_format($row['subtotal'], 2); ?></td>
        </tr>
        <?php endforeach; ?>
    </table>

    <div class="btn-group">
        <a href="view_orders.php" class="btn-secondary btn">Back to Orders</a>
        <a href="print_bill.php?order_id=<?= $order['order_id']; ?>" class="btn">Print Bill</a>
    </div>
</div>
