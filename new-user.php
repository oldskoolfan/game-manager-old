<?php require "include/header.php" ?>
<form action="include/register-handler.php" method="post">
	<fieldset>
		<legend>Create New User</legend>
		<input type="text" name="username" placeholder="username">
		<input type="password" name="pass" placeholder="password">
		<input type="password" name="confirm" placeholder="confirm password">
		<button type="submit">Create New User</button>
		<a href="index.php">Back Home</a>
	</fieldset>
</form>
<?php require "include/footer.php" ?>
