<?php

$db=mysqli_connect("localhost","root","","toko");
if ($db->connect_errno) {
  echo "koneksi gagal ".Mysqli_error();
}



 ?>
