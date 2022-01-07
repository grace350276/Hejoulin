<?php
require __DIR__. '\..\parts\__connect_db.php';

if(isset($_GET['sp_menu_id'])) {
    $sid = intval($_GET['sp_menu_id']);
    $pdo->query("DELETE FROM `special_menu` WHERE `sp_menu_id` IN ($sid)");
}
