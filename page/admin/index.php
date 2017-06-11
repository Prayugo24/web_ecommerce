<?php
// untuk melakukan koneksi sekaligus pengecekan season login admin
include"../../db.php";
session_start();
$nama = $_SESSION['nama_su'];
if(!isset($_SESSION['email_su'])){
	header("location:../../index.php?pesan=login");
}
?>
<!DOCTYPE html>
<html>
<head>
	<!-- untuk title tab broser -->
	<title>Kimochi</title>
	
	<link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../../css/style.css">
	<link rel="stylesheet" type="text/css" href="../../js/jquery-ui/jquery-ui.css">
	<script type="text/javascript" src="../../js/jquery.js"></script>
	<script type="text/javascript" src="../../js/jquery.js"></script>
	<script type="text/javascript" src="../../js/bootstrap.js"></script>
	<script type="text/javascript" src="../../js/jquery-ui/jquery-ui.js"></script>
</head>
<body>
<div id="head">
	<div class="hdkiri">
	<a href="index.php">Kimo<b>Chi</b></a>
	</div>
	<div class="hdkanan">
	<form>
		<input type="text" name="cari" placeholder="cari buku yang anda inginkan disini.." class="cari">
		<input type="submit" name="search" value="cari" class="tombolcari">
	</form>
	</div>
</div>
<div id="menu">
	<div class="menukiri">
		<b style="padding:20px;line-height:70px;font-size:20px;color:#fff;">Toko Buku online Kimochi</b>
	</div>
	<div class="menukanan">
	<ul>
		<li><i style="color:#fff;">Selamat Datang ,</i>, <a href="#"><span class="glyphicon glyphicon-user"></span> <?php echo "<b>".$nama."</b> (admin)"; ?></a></li>
	</ul>
	</div>
</div>
<div id="content">
	<!-- untuk bagian konten disebelah kiri -->
	<div id="contentkiri">
		<div class="welcome">
		<?php
		include("page.php");
		?>
		</div>
	</div>
	<div id="contentkanan">
		<!-- untuk bagian navigation -->
		<div class="navkanan">
			<?php include("nav.php") ?>
		</div>
	</div>
</div>
<!-- untuk bagian footer -->
<div id="footeradmin">
	<?php include("../../footer.php") ?>
</div>
</body>
</html>
