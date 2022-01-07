<?php
require __DIR__. '\..\parts\__connect_db.php';

if(isset($_GET['res_id'])) {
    $sid = $_GET['res_id'];
    $pdo->query("DELETE FROM `restaurant` WHERE `res_id` IN ($sid)");
}

$come_from = $_SERVER['HTTP_REFERER'] ?? 'restaurant.php';

header("Location: $come_from");