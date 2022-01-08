<?php
require __DIR__ . '\..\parts\__connect_db.php';


$output = [
    'success' => false,
    'code' => 0,
    'error' => '',
];
$uID = $_POST['user_id'] ?? '';
$name = $_POST['name'] ?? '';
$mobile = $_POST['mobile'] ?? '';
$bir = $_POST['birthday'] ?? '';
$address = $_POST['address'] ?? '';
$level = $_POST['level'] ?? '';

////TODO:檢查欄位資料
//if (empty($name)) {
//    $output['code'] = 401;
//    $output['error'] = '請輸入正確的姓名';
//    echo json_encode($output, JSON_UNESCAPED_UNICODE);
//    exit;
//}
//if (empty($userID)) {
//    $output['code'] = 403;
//    $output['error'] = '請輸入正確的帳號';
//    echo json_encode($output, JSON_UNESCAPED_UNICODE);
//    exit;
//}



$sql = "INSERT INTO `member`(
                            `user_id`,
                     `member_name`,
                     `member_bir`,
                     `member_mob`,
                     `member_addr`,
                     `member_level`
                          ) VALUES (?,?,?,?,?,?)";
$stmt = $pdo->prepare($sql);

$stmt->execute([
    $uID,
    $name,
    $bir,
    $mobile,
    $address,
    $level,
]);

$output['success'] = $stmt->rowCount() == 1;
$output['rowCount'] = $stmt->rowCount();

echo json_encode($output, JSON_UNESCAPED_UNICODE);