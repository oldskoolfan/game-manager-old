<?php
require "include/header.php";

use GameManager\Game;

if (!$loggedIn) {
	header('Location: ./');
}

$id = null;
$game = new Game();
$page = $_SERVER['REQUEST_URI'];

if (isset($_GET['id'])) {
    $id = $_GET['id'];
}

if ($id) {
    $result = $connection->query('select * from game
        where game_id = ' . $id);
    if ($result) {
        $row = $result->fetch_object();
		$game = Game::getGameFromStdClass($row);
    }
}
?>
<a href="./">Home</a>
<?php require "include/form-handler.php" ?>
<?php require "include/game-form.php" ?>
<?php require "include/footer.php" ?>
