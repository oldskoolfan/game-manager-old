<?php
session_start();
require 'mysql.php';

// define custom autoload and error functions
spl_autoload_register(function ($class) {
	$dirs = explode('\\', $class);
	$path = implode('/', $dirs);
	include 'include/' . strtolower($path) . '.php';
});

set_error_handler(function($errno, $errstr, $errfile, $errline ) {
    throw new \ErrorException($errstr, 0, $errno, $errfile, $errline);
});

// check session vars
$msg = isset($_SESSION['msg']) ? $_SESSION['msg'] : null;
unset($_SESSION['msg']);
$loggedIn = isset($_SESSION['id']);
?>
<!doctype html>
<html>
<head>
    <title>Week 12 - Game Manager</title>
    <link href="assets/styles.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h1>Week 12 - Game Manager</h1>
	<?php if (isset($msg)): ?>
	<h5 class="<?=$msg['type']?>"><?=$msg['text']?></h5>
	<?php endif; ?>
	<?php if ($loggedIn): ?>
		<h5>Hello, <?=$_SESSION['username']?>! <a href="logout.php">Log Out</a></h5>
	<?php endif; ?>
