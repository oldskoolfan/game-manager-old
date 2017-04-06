<?php

namespace GameManager;

class Game {
	const DEV_DUMMY = 'Developer';
	const SYS_DUMMY = 'System';
	const YEAR_DUMMY = 'Year';

	public $id;
	public $title;
	public $year;
	public $completed;
	public $system;
	public $developer;
	public $systemName;
	public $developerName;

	public function __construct($id = null, $title = '', $year = self::YEAR_DUMMY,
	$developer = self::DEV_DUMMY, $system = self::SYS_DUMMY, $completed = false)
	{
		$this->id = $id;
		$this->title = $title;
		$this->year = $year;
		$this->completed = $completed;
		$this->developer = $developer;
		$this->system = $system;
	}

	public static function getGameFromStdClass($obj) {
		try {
			$game = new self($obj->game_id, $obj->game_title, $obj->release_year,
				$obj->developer_id, $obj->system_id, $obj->completed);
			if (isset($obj->system_name)) {
				$game->systemName = $obj->system_name;
			}
			if (isset($obj->developer_name)) {
				$game->developerName = $obj->developer_name;
			}
			return $game;
		} catch (\Throwable $ex) {
			$_SESSION['msg'] = [
				'type' => 'error',
				'text' => $ex->getMessage(),
			];
		}
	}

	public function getCompletedText() {
		return $this->completed ? 'yes' : 'no';
	}

	public function getCompletedAttribute() {
		return $this->completed ? 'checked' : '';
	}

	public function getCompletedDb() {
		return $this->completed ? 1 : 0;
	}
}
