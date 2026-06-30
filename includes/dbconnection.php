<?php
$con = mysqli_connect("mysql-db", "phpuser", "php123", "vpmsdb");

if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}
?>
