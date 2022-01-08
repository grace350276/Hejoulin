<?php
require __DIR__ . '\..\parts\__connect_db.php';


$output = [
    'success' => false,
    'code' => 0,
    'error' => '',
];
//TODO:檢查欄位資料
$userID = isset($_POST['user_id']) ? intval($_POST['user_id']) : 0;
if(empty($userID)){
    $output['code'] = 400;
    $output['error'] = '沒有user_id';
    echo json_encode($output, JSON_UNESCAPED_UNICODE); exit;
}


$name = $_POST['name'] ?? '';
$bir = $_POST['birthday'] ?? '';
$mobile = $_POST['mobile'] ?? '';
$level = $_POST['level'] ?? '';
$address = $_POST['address'] ?? '';
$uID = $_POST['user_id'] ?? '';


$sql = "UPDATE `member` SET
                          `member_name` =?,
                          `member_bir` = ?,
                          `member_mob` = ?,
                          `member_level` = ?,
                          `member_addr` = ?
                          
        WHERE `user_id`=?";
$stmt = $pdo->prepare($sql);

$stmt->execute([
    $name,
    $bir,
    $mobile,
    $level,
    $address,
    $uID
]);

if($stmt->rowCount()==0){
    $output['error'] = '資料沒有修改';
}else{
    $output['success'] = true;
}
echo json_encode($output,JSON_UNESCAPED_UNICODE);