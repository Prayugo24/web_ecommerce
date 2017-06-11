<?php
include"../../db.php";
$kd=$_GET['id'];
$qry=mysqli_query($db,"DELETE FROM buku WHERE id_buku='$kd'");
mysqli_query($db,"DELETE from stok where id_buku='$kd'");
header('location:buku.php');
?>
