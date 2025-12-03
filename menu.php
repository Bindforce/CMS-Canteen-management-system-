<?php include('includes/header.php'); ?>

<?php include('includes/db_connect.php'); ?>

<section class="menu-section">
    
    <h2 class="menu-title">Our Delicious Menu</h2>
    <p class="menu-subtitle">Choose from a wide variety of freshly made meals</p>

    <div class="menu-container">

        <?php
        $items = $conn->query("SELECT * FROM menu_items");
        while ($row = $items->fetch_assoc()):
        ?>

        <div class="menu-card">

            <img src="images/<?php echo $row['image']; ?>" class="menu-image">

            <h3 class="menu-name"><?php echo $row['name']; ?></h3>
            <p class="menu-category"><?php echo $row['category']; ?></p>
            <p class="menu-price">Rs. <?php echo $row['price']; ?></p>

            <form action="add_to_cart.php" method="POST" class="menu-form">
                <input type="hidden" name="item_id" value="<?php echo $row['item_id']; ?>">
                <input type="number" name="quantity" value="1" min="1" class="qty-input">
                <button class="add-btn">Add to Cart</button>
            </form>

        </div>
       


        <?php endwhile; ?>

    </div>

</section>

<?php include('includes/footer.php'); ?>
