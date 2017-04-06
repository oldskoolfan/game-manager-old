<form action="" method="post">
<fieldset><legend>Create/Edit New Game</legend>
    <input type="text" name="title" placeholder="title"
        value="<?=$game->title?>">
    <select name="year">
        <option>Year</option>
        <?php for ($i = 1980;$i <= 2017;$i++):?>
            <option <?= $game->year == $i ? 'selected' : '' ?>><?=$i?></option>
        <?php endfor;?>
    </select>
    <input type="checkbox" name="completed"
    <?= $game->getCompletedAttribute() ?>>Completed
    <br>
    <select name="developer">
        <option>Developer</option>
<?php
$developers = $connection->query(
    'select * from game_developer');
if ($developers) {
    while ($row = $developers->fetch_object()) {
        $devId = $row->developer_id;
        $selected = $game->developer == $devId ? 'selected' : '';
        echo "<option value=\"$devId\" $selected>
            $row->developer_name</option>";
    }
}
?>
    </select>
    <select name="system">
        <option>System</option>
<?php
$systems = $connection->query(
    'select * from game_system');
if ($systems) {
    while ($row = $systems->fetch_object()) {
        $id = $row->system_id;
        $selected = $game->system == $id ? 'selected' : '';
        echo "<option value=\"$id\" $selected>
            $row->system_name</option>";
    }
}
?>
    </select>
    <button type="submit">Save Game</button>
</fieldset>
</form>
