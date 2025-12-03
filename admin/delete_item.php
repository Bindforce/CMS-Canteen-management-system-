<?php
include "../includes/db_connect.php";

$id = $_GET['id'];
$conn->query("DELETE FROM menu_items WHERE id=$id");

echo "deleted";
?>
