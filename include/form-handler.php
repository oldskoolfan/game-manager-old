<?php

use GameManager\Game;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
	try {
	    $game->title = $_POST['title'];
	    $game->year = $_POST['year'];
	    $game->developer = $_POST['developer'];
	    $game->system = $_POST['system'];
	    $game->completed = isset($_POST['completed']);

	    if (empty($game->title) || $game->year === Game::YEAR_DUMMY ||
	    $game->developer === Game::DEV_DUMMY || $game->system === Game::SYS_DUMMY) {
			throw new \Exception('Please fill out all fields');
		}
        // good to go
        // check if we have a game object to edit
        // note: this will be null on index.php
        $completedDb = $game->getCompletedDb();
        if (isset($game->id)) {
            $query = "update game
                set game_title = '$game->title',
                    release_year = '$game->year',
                    completed = $completedDb,
                    developer_id = $game->developer,
                    system_id = $game->system
                where game_id = $game->id";
        } else {
            $query = "insert game(game_title, release_year,
                completed, developer_id, system_id) values
                ('$game->title','$game->year',$completedDb,
				$game->developer, $game->system)";
        }
        $result = $connection->query($query);
        if (!$result) {
            throw new \Exception($connection->error);
        }
		$_SESSION['msg'] = [
			'type' => 'success',
			'text' => 'Game saved successfully!',
		];
		header('Location: ./');
	} catch (\Throwable $ex) {
		$_SESSION['msg'] = [
			'type' => 'danger',
			'text' => $ex->getMessage(),
		];
		header('Location: ' . $page);
	}
}
