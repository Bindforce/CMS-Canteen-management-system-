<?php ob_start(); ?>

<?php
include("../includes/db_connect.php");
session_start();
?>



<!DOCTYPE html>
<html>
<head>
    <title>Manage Staff - Admin Panel</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f9f6f2;
            margin: 0;
            padding: 0;
        }

        .page-container {
            max-width: 1000px;
            margin: 40px auto;
            padding: 20px;
        }

        h1 {
            color: #ff5722;
            text-align: center;
            margin-bottom: 25px;
        }

        .add-box {
            background: #ffffff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }

        .add-box h2 {
            margin-top: 0;
            color: #333;
        }

        .input-row {
            display: flex;
            gap: 15px;
            margin-bottom: 15px;
        }

        .input-row input, .input-row select {
            padding: 10px;
            width: 100%;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        .add-btn {
            background: #28a745;
            color: #fff;
            border: none;
            padding: 12px 25px;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            float: right;
        }

        .add-btn:hover {
            background: #218838;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            overflow: hidden;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        table thead {
            background: #ff5722;
            color: white;
        }

        table th, table td {
            padding: 14px;
            text-align: left;
            font-size: 15px;
        }

        tbody tr:nth-child(even) {
            background: #ffe7dd;
        }

        .delete-btn {
            background: #dc3545;
            padding: 8px 14px;
            color: #fff;
            text-decoration: none;
            border-radius: 6px;
            font-size: 14px;
        }

        .delete-btn:hover {
            background: #c82333;
        }

        footer {
            margin-top: 40px;
            background: #ff5722;
            color: white;
            text-align: center;
            padding: 12px;
        }
    </style>
</head>

<body>

<div class="page-container">

    <h1>Manage Staff</h1>

    
    <div class="add-box">
        <h2>Add New Staff</h2>

        <form method="POST" action="manage_staff.php">
            <div class="input-row">
                <input type="text" name="username" placeholder="Staff Username" required>
                <input type="password" name="password" placeholder="Password" required>
                <select name="role">
                    <option value="staff">Staff</option>
                    
                </select>
            </div>
            <button type="submit" name="add_staff" class="add-btn">Add Staff</button>
        </form>

        <div style="clear:both;"></div>
    </div>

   
    <h2 style="margin-left: 5px;">Existing Staff Members</h2>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Role</th>
                <th style="width:100px;">Action</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $result = $conn->query("SELECT * FROM users ORDER BY user_id ASC");
            while ($row = $result->fetch_assoc()) {
                echo "
                    <tr>
                        <td>{$row['user_id']}</td>
                        <td>{$row['username']}</td>
                        <td>{$row['role']}</td>
                        <td>
                            <a href='manage_staff.php?delete={$row['user_id']}' class='delete-btn'>Delete</a>
                        </td>
                    </tr>
                ";
            }
            ?>
        </tbody>
    </table>

</div>

<footer>
    © 2025 College Canteen Management System | All Rights Reserved.
</footer>

</body>
</html>

<?php

if (isset($_POST['add_staff'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $role = $_POST['role'];

    $conn->query("INSERT INTO users (username, password, role) VALUES ('$username', '$password', '$role')");
    header("Location: manage_staff.php");
    exit();
}

//delete staff
if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $conn->query("DELETE FROM users WHERE user_id = $id");
    header("Location: manage_staff.php");
    exit();
}
?>
<?php ob_end_flush(); ?>

