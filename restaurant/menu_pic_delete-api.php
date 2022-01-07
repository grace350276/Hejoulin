<?php
require __DIR__. '\..\parts\__connect_db.php';

if(isset($_GET['menu_pic_id'])) {
    $sid = intval($_GET['menu_pic_id']);
    $pdo->query("DELETE FROM `menu_pictures` WHERE `menu_pic_id` IN ($sid)");
}
