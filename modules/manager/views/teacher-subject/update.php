<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\TeacherSubject $model */

$this->title = 'Обновить предмет преподавателя: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Предметы и преподаватели', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Обновить';
?>
<div class="teacher-subject-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'users' => $users,
        'subjects'=>$subjects,
    ]) ?>

</div>
