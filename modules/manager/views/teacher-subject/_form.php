<?php

use yii\bootstrap5\Html;
use yii\bootstrap5\ActiveForm;

/** @var yii\web\View $this */
/** @var app\models\TeacherSubject $model */
/** @var yii\bootstrap5\ActiveForm $form */
?>

<div class="teacher-subject-form">

    <?php $form = ActiveForm::begin([
        'id' => 'login-form',
        'fieldConfig' => [
            'template' => "{label}\n{input}\n{error}",
            'labelOptions' => ['class' => 'col-lg-12 col-form-label mr-lg-3'],
            'inputOptions' => ['class' => 'col-lg-3 form-control'],
            'errorOptions' => ['class' => 'col-lg-7 invalid-feedback'],
        ],
    ]); ?>

    <?= $form->field($model, 'user_id')->dropDownList($users, ['prompt' => 'Выберите преподавателя', 'class' => 'form-control w-50', 'style' => 'min-width: 200px']) ?>

    <?= $form->field($model, 'subject_id')->dropDownList($subjects, ['prompt' => 'Выберите предмет', 'class' => 'form-control w-50', 'style' => 'min-width: 200px']) ?>

    <div class="form-group">
        <?= Html::submitButton('Добавить', ['class' => 'btn my-btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>