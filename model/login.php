<?php
session_start();

$nidn = $_POST['nidn'];
$_SESSION['nidn'] = $nidn;
header("Location: ../data_dosen.php");

