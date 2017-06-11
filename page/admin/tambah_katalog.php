<?php
	include"../../db.php";
	$kategori = $_POST['kategori'];
	$id_katego = mysqli_query($db,"SELECT * from kategori where kategori='$kategori'");
	$id_kategor = mysqli_fetch_array($id_katego);
	$id_kategori = $id_kategor['id_kategori'];
	$katalog = $_POST['katalog'];
	mysqli_query($db,"INSERT into katalog set id_kategori='$id_kategori',katalog='$katalog'");
	header("location:katalog.php");
?>
