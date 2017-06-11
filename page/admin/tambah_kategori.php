<?php
	include"../../db.php";
	$kategori = $_POST['kategori'];
	mysqli_query($db,"INSERT into kategori set kategori='$kategori'");
	header("location:kategori.php");
?>
