<?php

session_start();

require_once '../koneksi.php';

$nidn = $_SESSION['nidn'];

$query = "SELECT * FROM dosen, program_studi WHERE dosen.nidn='$nidn' AND dosen.kode_program_studi=program_studi.kode_program_studi";
$stmnt = $dbh->prepare($query);
$stmnt->execute();
$output = "[";
while ($row = $stmnt->fetch()) {
    if ($output != "[") {
        $output .= ",";
    }
    $output .= '{"nidn":"' . $nidn . '",';
    $output .= '"nama":"' . $row["nama_dosen"] . '",';
    $output .= '"nip":"' . $row["nip_baru"] . '",';
    $output .= '"prodi":"' . $row["nama_program_studi"] . '"}';
}
$output .= "]";

echo ($output);
