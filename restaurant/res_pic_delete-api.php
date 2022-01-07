<?php
require __DIR__. '\..\parts\__connect_db.php';

if(isset($_GET['res_pic_id'])) {
    $sid = intval($_GET['res_pic_id']);
    $pdo->query("DELETE FROM `restaurant_pictures` WHERE `res_pic_id` IN ($sid)");
}
