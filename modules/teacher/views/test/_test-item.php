<?php

use app\models\Test;
use yii\bootstrap5\Html;
use yii\bootstrap5\LinkPager;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\widgets\ListView;

/** @var yii\web\View $this */
/** @var app\models\TestSerch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

?>
<div class="card">
    <ul class="list-group">
        <li class="list-group-item"><b>Название:</b> <?= Html::a(Html::encode($model->title), ['view', 'id' => $model->id], ['style' => 'color:#3b7ddd']) ?></li>
        <?php if ($model->is_active): ?>
        <li class="list-group-item"><b>Открыт для группы:</b> <?= $model?->lastGroup->group[0]->title ?></li>
        <li class="list-group-item"><b>Открыт до:</b> <?= Yii::$app->formatter->asDatetime($model?->lastGroup->end_time, 'HH:mm dd.MM.yyyy') ?></li>
        <?php endif; ?>
    </ul>
</div>