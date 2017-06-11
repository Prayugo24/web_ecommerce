<?php
include"db.php";
$nama = $_POST['nama'];
$email = $_POST['email'];
$password = $_POST['pass'];
	mysqli_query($db,"INSERT INTO `customer` (`id_cus`, `nama_cus`, `email_cus`, `password_cus`) VALUES (NULL, '$nama', '$email', '$password')");
	header("location:index.php?pesan=berhasil daftar");
?>
