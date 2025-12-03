<?php 
session_start();
include('includes/header.php'); 
?>

<section class="cart-section">

    <?php if (!isset($_SESSION['cart']) || count($_SESSION['cart']) == 0): ?>

    <div class="empty-cart-box">
        <h3>🛒 Your Cart is Empty</h3>
        <p>Add delicious food from our menu to continue!</p>
        <a href="menu.php" class="cart-btn">Browse Menu</a>
    </div>

    <?php else: ?>
<h2>Your Cart</h2>
    <table class="cart-table">
        <tr>
            <th>Item</th>
            <th>Name</th>
            <th>Qty</th>
            <th>Price</th>
            <th>Total</th>
            <th>Remove</th>
        </tr>

        <?php
        $grand_total = 0;
        foreach ($_SESSION['cart'] as $index => $item):
            $sub = $item["qty"] * $item["price"];
            $grand_total += $sub;
        ?>

        <tr>
            <td><img src="images/<?php echo $item['image']; ?>" class="cart-img"></td>
            <td><?php echo $item['name']; ?></td>
            <td><?php echo $item['qty']; ?></td>
            <td>Rs. <?php echo $item['price']; ?></td>
            <td>Rs. <?php echo $sub; ?></td>
            <td>
                <a href="remove_item.php?id=<?php echo $index; ?>" class="remove-btn">X</a>
            </td>
        </tr>

        <?php endforeach; ?>
    </table>

    <h3 class="grand-total">Grand Total: Rs. <?php echo $grand_total; ?></h3>


<div class="detail-box">
   

    <form id="orderForm" method="POST" action="place_order.php">

        <label>Your Name <span style="color:red">*</span></label>
        <input type="text" id="customer_name" name="customer_name" placeholder="Enter Your Name" required>
        <div class="error" id="nameError"></div>

        <label>Table Number / Address <span style="color:red">*</span></label>
        <input type="text" id="address" name="address" placeholder="Table No / Address" required>
        <div class="error" id="addressError"></div>

        <button type="button" class="order-btn" onclick="validateForm()">Place Order</button>
    </form>
</div>

<script>
function validateForm() {
    let name = document.getElementById("customer_name");
    let address = document.getElementById("address");
    let nameError = document.getElementById("nameError");
    let addressError = document.getElementById("addressError");

    nameError.innerHTML = "";
    addressError.innerHTML = "";

    let valid = true;

    if (name.value.trim() === "") {
        nameError.innerHTML = "Please enter your name";
        valid = false;
    }

    if (address.value.trim() === "") {
        addressError.innerHTML = "Please enter table number or address";
        valid = false;
    }

    if (valid) {
        document.getElementById("orderForm").submit();
    }
}
</script>


    <?php endif; ?>

</section>

<?php include('includes/footer.php'); ?>
