<?php
$query_kode_beli = mysqli_query($db,"SELECT * from selesai where id_cus='$_SESSION[id_cus]' && status_beli='order'");
$data_kode_beli = mysqli_fetch_array($query_kode_beli);
$kode_beli = $data_kode_beli['kode_beli'];
@$aksi = $_GET['aksi'];
if($aksi=="hapus")
{
	$idker = $_GET['id'];
	$qryker =mysqli_query($db,"SELECT * from keranjang where id_keranjang='$idker'");
	$data_ker=mysqli_fetch_array($qryker);
	$qty1 = $data_ker['qty'];
	$qrystok =mysqli_query($db,"SELECT * from stok where id_buku='$data_ker[id_buku]'");
	$data_stok = mysqli_fetch_array($qrystok);
	$qty2 = $data_stok['stok'];
	$stokakhir = $qty1+$qty2;
	mysqli_query($db,"UPDATE stok set stok='$stokakhir' where id_buku='$data_ker[id_buku]'");
	mysqli_query($db,"DELETE from keranjang where id_keranjang='$idker'");
	mysqli_query($db,"DELETE from pembelian where id_keranjang='$idker'");
	header("location:home.php?hal=keranjang");
}else if($aksi=="remove"){
	$id_beli=$_GET['id'];
	$total_qty=0;
	$total_byr=0;

	mysqli_query($db,"UPDATE selesai set qty_total='$total_qty',bayar='$total_byr' where id_cus='$_SESSION[id_cus]' && kode_beli='$id_beli'");
	header("location:home.php?hal=keranjang");
}
$keranjang = mysqli_query($db,"SELECT * from keranjang where id_cus='$_SESSION[id_cus]' && kode_beli='$kode_beli'");
$qrykeranjang=mysqli_fetch_array($keranjang);
$ttl_harga = $qrykeranjang['total_harga'];
$byr = mysqli_fetch_array(mysqli_query($db,"SELECT SUM(total_harga) as total_bayar from keranjang where id_cus='$_SESSION[id_cus]' && kode_beli='$kode_beli'"));
$qtot = mysqli_fetch_array(mysqli_query($db,"SELECT SUM(qty) as qty_total from keranjang where id_cus='$_SESSION[id_cus]' && kode_beli='$kode_beli'"));
$total_byr = $byr['total_bayar'];
$total_qty = $qtot['qty_total'];
mysqli_query($db,"UPDATE selesai set qty_total='$total_qty',bayar='$total_byr' where id_cus='$_SESSION[id_cus]' && kode_beli='$kode_beli'");
?>
<div class="hdkeranjang">
Keranjang Belanja
</div>
<table class="table table-stiped">
<th>judul buku</th>
<th><center>harga</center></th>
<th><center>qty</center></th>
<th><center>total harga</center></th>
<th><center>Aksi</center></th>
<?php
 while($isi_keranjang = mysqli_fetch_array($keranjang)){ ?>
<tr>
	<td><?php $id_buku = $isi_keranjang['id_buku']; $qrybuku=mysqli_query($db,"SELECT * from buku where id_buku='$id_buku'"); $data_buku=mysqli_fetch_array($qrybuku); $judul = $data_buku['judul']; echo $judul;?></td>
	<td><center>Rp.<?php echo number_format($isi_keranjang['harga']); ?>,-</center></td>
	<td><center><?php echo $isi_keranjang['qty'];  ?></center></td>
	<td><center>Rp.<?php echo number_format($isi_keranjang['total_harga']);  ?>,-</center></td>
	<td><center>
	<a href="home.php?hal=keranjang&aksi=hapus&id=<?php echo $isi_keranjang['id_keranjang']; ?>"><span class="glyphicon glyphicon-remove"></span></a></center></td>
</tr>
<?php } ?>
<tr>
	<?php $isi_keranjang = mysqli_fetch_array($keranjang); ?>
	<td colspan="2" style="text-align:center;"><b>Total<b></td><td><center><?php echo $total_qty; ?></center></td><td><center>Rp.<?php echo number_format($total_byr); ?>,-</center></td>
	<td><center><a href="home.php" class="btn btn-warning"><span class="glyphicon glyphicon-shopping-cart"></span> Continue Shopping</a>
	<a href="home.php?hal=checkout" class="btn btn-primary"><span class="glyphicon glyphicon-paste"> checkout</span></a>
	<a href="home.php?hal=keranjang&aksi=remove&id=<?php echo $kode_beli; ?>" class="btn btn-danger"><span class="glyphicon glyphicon-remove">Remove</span></a></center></td>

</tr>
</table>
