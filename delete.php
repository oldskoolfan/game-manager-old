<?php
require "include/header.php";

if (!$loggedIn) {
	header('Location: ./');
}

$gameId = isset($_GET['id']) ? $_GET['id'] : 0;
$query = "delete from game where game_id = ?";
$stmt = $connection->prepare($query);
$stmt->bind_param('i', $gameId);
if (!$stmt->execute()) {
    $_SESSION['msg'] =[
		'type' => 'error',
		'text' => $stmt->error,
	];
}
header('Location: ./');
