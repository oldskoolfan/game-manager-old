<?php

// $connection =
//     new mysqli('localhost','root','','gamesdb');

$config = parse_ini_file("{$_SERVER['DOCUMENT_ROOT']}/config.ini");
$etcPath = $config['etc_directory'];
include "$etcPath/db-connect.php";
$connection->select_db('gamesdb');
