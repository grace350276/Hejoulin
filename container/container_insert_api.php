<?php require __DIR__ . '\..\parts\__connect_db.php';

header('Content-Type: application/json');

$upload_folder = __DIR__ . '\..\img\container';

$exts = [
    'image/jpeg' => '.jpg',
    'image/png' => '.png',
    'image/gif' => '.gif'
];
$output = [
    'success' => false,
    'code' => 0,
    'error' => '',
];

$container_img = $_POST['container_img'] ?? '';
$container_shadow = $_POST['container_shadow'] ?? '';
$container_name = $_POST['container_name'] ?? '';

if (empty($containerName)) {
    $output['code'] = 405;
    $output['error'] = '請輸入正確的酒器名稱';
    echo json_encode($output, JSON_UNESCAPED_UNICODE);
    exit;
}

$exts = [
    'image/jpeg' => '.jpg',
    'image/png' => '.png',
    'image/gif' => '.gif'
];

if (!empty($_FILES['container_img']) && !empty($_FILES['container_shadow'])) {
    $ext01 = $exts[$_FILES['container_img']['type']];
    $ext02 = $exts[$_FILES['container_shadow']['type']];


    if (!empty($ext01) && !empty($ext02)) {
        $filename01 = $_FILES['container_img']['name'] . $ext01;
        $target01 = $upload_folder . "\\" . $filename01;
        $filename02 = $_FILES['container_shadow']['name'] . $ext02;
        $target02 = $upload_folder . '/' . $filename02;

        if (move_uploaded_file($_FILES['container_img']['tmp_name'], $target01) && move_uploaded_file($_FILES['container_shadow']['tmp_name'], $target02)) {

            $sql = "INSERT INTO `product_container`(`container_img`,`container_shadow`,`container_name`) VALUES (?,?,?)`";
            $stmt = $pdo->prepare($sql);
            $stmt->execute([
                $filename01,
                $filename02,
                $containerName,
            ]);
            $output['success'] = $stmt->rowCount() == 1;
            $output['rowCount'] = $stmt->rowCount();


            $output['success'] = true;
            $output['filename01'] = $filename01;
            $output['filename02'] = $filename02;
        } else {
            $output['error'] = '無法移動檔案';
        }
    } else {
        $output['error'] = '不合法的檔案類型';
    }
} else {
    $output['error'] = '沒有上傳檔案';
}


// if(! empty($_FILES['container_shadow'])){
//     $ext02 = $exts[$_FILES['container_shadow']['type']] ;

//     if(! empty($ext02)){
//         $filename02 = $_FILES['container_shadow']['name'].$ext02;
//         $target02 = $upload_folder.'/'.$filename02;

//         if(move_uploaded_file($_FILES['container_shadow']['tmp_name'],$target02)){
//             $output['success'] = true;
//             $output['filename'] = $filename02;
//         }else{
//             $output['error'] = '無法移動檔案';
//         }
//     }else{
//         $output['error'] = '不合法的檔案類型';
//     }
// } else {
//     $output['error'] = '沒有上傳檔案';
// }

// $sql = "INSERT INTO `product_container`(`container_img`,`container_shadow`,`container_name`) VALUES (?,?,?)`";
// $stmt = $pdo->prepare($sql);
// $stmt -> execute([
//     $filename01,
//     $filename02,
//     $containerName,
// ]);

// $output['success'] = $stmt->rowCount() == 1;
// $output['rowCount'] = $stmt->rowCount();

echo json_encode($output, JSON_UNESCAPED_UNICODE);
