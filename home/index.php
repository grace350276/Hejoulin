<?php require __DIR__. '\..\parts\__connect_db.php';

// 如果未登入管理帳號就轉向
if (! $_SESSION['admin']) {
    header("Location: " . "../login/login.php");
    exit;
}


$title = "首頁";
$pageName = "homepage";
?>
<?php include __DIR__ . '\..\parts\__head.php'?>

<?php include __DIR__ . '\..\parts\__navbar.php'?>
<?php include __DIR__ . '\..\parts\__sidebar.html'?>

<?php include __DIR__ . '\..\parts\__main_start.html'?>
<!-- 主要的內容放在 __main_start 與 __main_end 之間 -->

<h1 class='mt-2'>我是首頁</h1>

<?php include __DIR__ . '\..\parts\__main_end.html'?>
<!-- 如果要 modal 的話留下面的結構 -->
<?php include __DIR__ . '\..\parts\__modal.html'?>

<?php include __DIR__ . '\..\parts\__script.html'?>
<!-- 如果要 modal 的話留下面的 script -->
<script>
</script>
<?php include __DIR__ . '\..\parts\__foot.html'?>