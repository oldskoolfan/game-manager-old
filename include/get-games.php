<?php use GameManager\Game; ?>
<table>
    <tr>
        <th>Title</th>
        <th>Year</th>
        <th>Completed</th>
        <th>System</th>
        <th>Developer</th>
		<?php if ($loggedIn): ?>
			<th>Action</th>
		<?php endif; ?>
    </tr>
<?php
$query = 'select * from game g
	join game_system s on s.system_id = g.system_id
	join game_developer d using (developer_id)';
$result = $connection->query($query);

if ($result) {
    while ($row = $result->fetch_object()) {
        $game = Game::getGameFromStdClass($row);
		$completed = $game->getCompletedText();
        $html = "<tr><td>$game->title</td>
            <td>$game->year</td>
            <td>$completed</td>
            <td>$game->systemName</td>
            <td>$game->developerName</td>";

		if ($loggedIn) {
			$html .= "<td>
		            <a href=\"edit.php?id=$game->id\">Edit</a>
		            <a href=\"delete.php?id=$game->id\" onclick=\"return makeSure()\">Delete</a>
	        	</td>";
		}
		$html .= '</tr>';
		echo $html;
    }
} else {
    echo $connection->error;
}
?>
</table>
