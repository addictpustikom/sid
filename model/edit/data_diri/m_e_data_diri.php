<?php
session_start();

require_once '../../koneksi.php';

$column = $_POST['column'];
$data = $_POST['data'];

$query = "UPDATE `dosen` SET $column='$data' WHERE nidn='" . $_SESSION['nidn'] . "'";
$stmnt = $dbh->prepare($query);
if($stmnt->execute()){
    $output = "Sukses";
}else{
    $output = "Gagal";
}

echo ($output);
