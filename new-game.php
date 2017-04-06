<?php
require "include/header.php";

use GameManager\Game;

if (!$loggedIn) {
	header('Location: ./');
}

$game = new Game();
$page = $_SERVER['REQUEST_URI'];
?>
<a href="./">Home</a>
<?php require "include/form-handler.php" ?>
<?php require "include/game-form.php" ?>
<?php require "include/footer.php" ?>
