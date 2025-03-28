<?php

/** @var yii\web\View $this */
/** @var string $content */

use app\assets\Admin2Asset;
use app\models\Role;
use app\models\Test;
use app\models\User;
use app\widgets\Alert;
use yii\bootstrap5\Breadcrumbs;
use yii\helpers\Html;

if (Yii::$app->user->isGuest) {
    $navLinks = [
        ['label' => 'Войти', 'url' => ['/site/login']]
    ];
} elseif (Yii::$app->user->identity->role_id == Role::getRoleId('manager')) {
    $navLinks = [
        ['label' => '<i class="nav-icon fi fi-rr-user"></i> <p>Преподаватели</p>', 'url' => ['/manager']],
        ['label' => '<i class="nav-icon fi fi-rr-user-add"></i> <p>Добавление преподавателя</p>', 'url' => ['/manager/teacher/create']],
        ['label' => '<i class="nav-icon fi-rr-users-alt"></i> <p>Группы</p>', 'url' => ['/manager/group']],
        ['label' => '<i class="nav-icon fi fi-rr-book-alt"></i> &nbsp; <p>Предметы</p>', 'url' => ['/manager/subject']],
    ];
} elseif (Yii::$app->user->identity->role_id == Role::getRoleId('teacher')) {
    $navLinks = [
        ['label' => '<i class="nav-icon fi fi-rr-user"></i> <p>Студенты</p>', 'url' => ['/teacher']],
        ['label' => ' <i class="nav-icon fi fi-rr-user-add"></i> <p>Добавление студента</p>', 'url' => ['/teacher/student/create']],
        ['label' => '<i class="nav-icon fi-rr-users-alt"></i> <p>Группы</p>', 'url' => ['/teacher/group']],
        ['label' => '<i class="nav-icon fi fi-rr-document"></i>  <p>Тесты</p>', 'url' => ['/teacher/test']],
        ['label' => '<i class="nav-icon fi fi-rr-assept-document"></i>  <p>Проверить тесты</p>', 'url' => ['/teacher/student-test']],
    ];
} elseif (Yii::$app->user->identity->role_id == Role::getRoleId('student')) {
    $navLinks = [
        ['label' => '<i class="nav-icon fi fi-rr-home"></i> <p>Личный кабинет</p>', 'url' => ['/student']],
        ['label' => '<i class="nav-icon fi fi-rr-list-check"></i> <p>Мои оценки</p>', 'url' => ['/student/student-test']],
        Test::getActiveTestCount() ?
            ['label' => '<i class="nav-icon fi-rr-edit"></i> <p>Решить активный тест</p>', 'url' => ['/student/test']] : [],
        // ['label' => 'добавление преподавателя', 'url' => ['/manager/teacher/create']],
        // ['label' => 'группы', 'url' => ['/manager/group']],
    ];
} elseif (Yii::$app->user->identity->role_id == Role::getRoleId('admin')) {
    $navLinks = [
        ['label' => '<i class="nav-icon fi-rr-users-alt"></i> <p>Личный кабинет</p>', 'url' => ['/student']],
    ];
}
//http://new-diplom/student/test/view?id=17&student_test_id=83

$getNavLinks = function ($navLinks) {
    $string = '';
    if (!is_null($navLinks)) {
        foreach ($navLinks as $value) {
            if (!$value) {
                break;
            }
            $string .=  "<li class='nav-item'>
            <a class='nav-link' href=" . $value['url'][0] . ">" . $value['label'] . "</a>
            </li>";
        }
    }
    return $string;
};
// MainAppAsset::register($this);

Admin2Asset::register($this);

$this->registerCsrfMetaTags();
$this->registerMetaTag(['charset' => Yii::$app->charset], 'charset');
$this->registerMetaTag(['name' => 'viewport', 'content' => 'width=device-width, initial-scale=1, shrink-to-fit=no']);
$this->registerMetaTag(['name' => 'description', 'content' => $this->params['meta_description'] ?? '']);
$this->registerMetaTag(['name' => 'keywords', 'content' => $this->params['meta_keywords'] ?? '']);
$this->registerLinkTag(['rel' => 'icon', 'type' => 'image/x-icon', 'href' => Yii::getAlias('@web/favicon.ico')]);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>" class="h-100">

<head>
    <!-- <script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script> -->
    <title>
        <?= Html::encode($this->title) ?>
    </title>
    <?php $this->head() ?>
</head>

<body class="hold-transition sidebar-mini layout-fixed">
    <?php $this->beginBody() ?>
    <div class="wrapper">

        <!-- Preloader -->
        <div class="preloader flex-column justify-content-center align-items-center">
            <img class="animation__shake" src="/web/adminlte/dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
        </div>

        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand navbar-white navbar-light">
            <!-- Left navbar links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <!-- Navbar Search -->
                <?=
                Yii::$app->user->isGuest
                    ? Html::a(
                        'Войти',
                        '/site/login',
                        ['class' => 'nav-link btn btn-link logout']
                    ) :
                    Html::beginForm(['/site/logout'])
                    . Html::submitButton(
                        'Выйти (' . User::findOne(['login' => Yii::$app->user->identity->login])->name . ')',
                        ['class' => 'nav-link btn btn-link logout']
                    )
                    . Html::endForm()
                    . '</li>'
                ?>
            </ul>
        </nav>
        <!-- /.navbar -->

        <!-- Main Sidebar Container -->
        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <!-- Brand Logo -->
            <a href="/" class="brand-link">
                <img src="/web/adminlte/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
                <span class="brand-text font-weight-light">
                    <?=
                    Yii::$app->name;
                    ?>
                </span>
            </a>

            <!-- Sidebar -->
            <div class="sidebar">
                <!-- Sidebar user panel (optional) -->
                <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                    <!-- <div class="image">
                        <img src="adminlte/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
                    </div> -->
                    <div class="info">
                        <span class="d-block" style="color: #C7CAD2FF;">
                            <?php $roleArr = [
                                'admin' => 'Администратор',
                                'manager' => 'Менеджер',
                                'teacher' => 'Преподаватель',
                                'student' => 'Студент',

                            ] ?>
                            Роль:
                            <?= !Yii::$app->user->isGuest ? $roleArr[Role::getRoleTitle(Yii::$app->user->identity->role_id)] : 'Необходимо войти'
                            ?>
                        </span>
                    </div>
                </div>

                <!-- Sidebar Menu -->
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                        <!-- Add icons to the links using the .nav-icon class
             with font-awesome or any other icon font library -->

                        <?= $getNavLinks($navLinks) ?>
                    </ul>
                </nav>
                <!-- /.sidebar-menu -->
            </div>
            <!-- /.sidebar -->
        </aside>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->

            <!-- /.content-header -->

            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <!-- /.row -->
                    <!-- Main row -->
                    <div class="row">
                        <!-- Left col -->
                        <section class="col-lg-12 connectedSortable">
                            <div class="project-body">
                                <div class="my-3">
                                    <?php if (!empty($this->params['breadcrumbs'])) : ?>
                                        <?= Breadcrumbs::widget(['links' => $this->params['breadcrumbs']]) ?>
                                    <?php endif ?>
                                </div>
                                <?= Alert::widget(); ?>
                                <?= $content ?>
                            </div>
                        </section>
                        <!-- /.Left col -->
                        <!-- right col (We are only adding the ID to make the widgets sortable)-->

                        <!-- right col -->
                    </div>
                    <!-- /.row (main row) -->
                </div><!-- /.container-fluid -->
            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->
        <!-- <footer class="main-footer">
            <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong>
            All rights reserved.
            <div class="float-right d-none d-sm-inline-block">
                <b>Version</b> 3.2.0
            </div>
        </footer> -->

        <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-dark">
            <!-- Control sidebar content goes here -->
        </aside>
        <!-- /.control-sidebar -->
    </div>

    <main id="main" class="flex-shrink-0">
        <!--  role="main" -->
    </main>

    <? # $this->registerJs("$.widget.bridge('uibutton', $.ui.button)") 
    ?>

    <?php $this->endBody() ?>
</body>

</html>
<?php $this->endPage() ?>