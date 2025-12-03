<?php
 $servername = "localhost";
$username = "root"; // default for XAMPP
$password = ""; // leave empty unless you set one
$dbname = "canteen_db";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
<?php
/*
$servername = "localhost";
$username = "root";
$password = "";
$database = "canteen_db";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
*/