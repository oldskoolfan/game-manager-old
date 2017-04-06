<?php
require "include/header.php";
$id = null;
$game = null;
?>
<?php if (!$loggedIn) include 'include/login-form.php' ?>
<?php if ($loggedIn): ?>
<a href="new-game.php">Add New Game</a>
<?php endif; ?>
<?php require "include/get-games.php" ?>
<?php require "include/footer.php" ?>
