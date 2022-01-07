<?php
require __DIR__ . '../parts/__connect_db.php';


$title = '管理者列表';
$pageName = 'adminList';

$perPage = 3;
$page = isset($_GET['page']) ? intval($_GET['page']) : 1;


$t_sql = "SELECT COUNT(1) FROM `admin`";

//總筆數
$totalRows = $pdo->query($t_sql)->fetch(PDO::FETCH_NUM)[0];
$totalPages = ceil($totalRows / $perPage);//幾頁


$sql = sprintf("SELECT * FROM `admin` LIMIT %s, %s", ($page-1)*$perPage, $perPage);

$rows = $pdo->query($sql)->fetchAll();
?>
<?php include __DIR__ . '/parts/__head.html'?>
<?php include __DIR__ . '/parts/__navbar.html'?>
<?php include __DIR__ . '/parts/__sidebar.html'?>

<?php include __DIR__ . '/parts/__main_start.html'?>
<!-- 主要的內容放在 __main_start 與 __main_end 之間 -->
<!-- table -->
    <div class="d-flex justify-content-between mt-5">
        <button type="button" class="btn btn-secondary btn-sm">刪除選擇項目</button>
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <li class="page-item">
                    <a class="page-link" href="#"><i class="fas fa-angle-double-left"></i></a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#"><i class="fas fa-angle-left"></i></a>
                </li>
                <?php for ($i = $page - 2; $i <= $page + 2; $i++)
                    if ($i >= 1 && $i <= $totalPages): ?>
                        <li class="page-item <?= $i == $page ? 'active' : '' ?>">
                            <a class="page-link" href="?page=<?= $i ?>">
                                <?= $i ?>
                            </a>
                        </li>
                    <?php endif; ?>
                <li class="page-item">
                    <a class="page-link" href="#"><i class="fas fa-angle-right"></i></a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#"><i class="fas fa-angle-double-right"></i></a>
                </li>
            </ul>
        </nav>
    </div>
    <div class="table-responsive">
        <table class="table table-striped table-sm">
            <thead>
            <tr>

                <!--`admin_id`, `admin_name`, `admin_pass`, `user_time`-->
                <th>管理員id</th>
                <th>管理員名稱</th>
                <th>管理員密碼</th>
                <th>建立時間</th>
            </tr>
            </thead>
            <?php foreach ($rows as $r): ?>
            <tbody>

            <!--`admin_id`, `admin_name`, `admin_pass`, `user_time`-->
            <td><?= $r['admin_id'] ?></td>
            <td><?= $r['admin_name'] ?></td>
            <td><?= $r['admin_pass'] ?></td>
            <td><?= $r['user_time'] ?></td>

            </tr>
            <?php endforeach; ?>
            </tbody>
        </table>
    </div>
    <!--
    <td>
        // <a href="#"><i class="fas fa-pen"></i></a>
        //
    </td>
    -->
<?php include __DIR__ . '/parts/__main_end.html'?>

<!-- 如果要 modal 的話留下面的結構 -->
<?php include __DIR__ . '/parts/__modal.html'?>

<?php include __DIR__ . '/parts/__script.html'?>
<!-- 如果要 modal 的話留下面的 script -->
<script>
     const modal = new bootstrap.Modal(document.querySelector('#exampleModal'));
    //  modal.show() 讓 modal 跳出
</script>
<?php include __DIR__ . '/parts/__foot.html'?>