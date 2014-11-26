<?php
session_start();

unset($_SESSION['nidn']);
header("Location: ../index.php");

