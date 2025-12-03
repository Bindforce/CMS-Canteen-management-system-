<?php
include('../includes/db_connect.php');

$orders = $conn->query("SELECT * FROM orders ORDER BY order_id DESC");

echo '<table class="order-tables">
<tr>
    <th>Order ID</th>
    <th>Customer</th>
    <th>Table.no/Address</th>
    <th>Food Items</th>
    <th>Total</th>
    <th>Time</th>
</tr>';

if ($orders->num_rows > 0) {
    while ($o = $orders->fetch_assoc()) {

        // Fetch food items 
        $items = $conn->query("
            SELECT m.name, oi.quantity 
            FROM order_items oi
            JOIN menu_items m ON oi.item_id = m.item_id
            WHERE oi.order_id = {$o['order_id']}
        ");

        $foodList = "";
        while ($item = $items->fetch_assoc()) {
            $foodList .= "
            <div class='food-item'>
                <span class='food-name'>{$item['name']}</span>
                <span class='food-qty'>x {$item['quantity']}</span>
            </div>";
        }

        $status = $o['status'] ?? "Ongoing";

        echo "<tr>
            <td>{$o['order_id']}</td>
            <td>{$o['customer_name']}</td>
            <td>{$o['table_address']}</td>
            <td>$foodList</td>
            <td><strong>{$o['total_amount']}</strong></td>
            <td>{$o['order_time']}</td>

            <td>";

     
        
        echo "</tr>";
    }
} else {
    echo "<tr><td colspan='6'>No orders found.</td></tr>";
}

echo '</table>';
?>
