<?php

$db = "pdpt";
$user = "root";
$password = "";

try {
    $dbh = new PDO("mysql:host=localhost;dbname=$db", $user, $password);
} catch (PDOException $ex) {
    echo $ex->getMessage();
}
