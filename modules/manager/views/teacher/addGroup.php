<?php

use yii\bootstrap5\Html;
use yii\bootstrap5\ActiveForm;

/** @var yii\web\View $this */
/** @var app\models\UserGroup $model */
/** @var app\models\User $user */
/** @var yii\widgets\ActiveForm $form */

$this->title = 'Добавление группы преподователю: ' . $user->surname;
?>

<div class="user-form">

    <h3><?= Html::encode($this->title); ?></h3>

    <?php $form = ActiveForm::begin(); ?>

    <? # $form->field($model, 'name')->textInput(['type' => 'date'])          
    ?>

    <?= $form->field($model, 'group_id')->dropDownList($groupTitle, ['prompt' => 'выберите группу', 'class' => 'form-control w-25', 'style' => 'min-width: 200px']) ?>

    <? # $form->field($model, 'email')->textInput(['maxlength' => true])          
    ?>

    <? # $form->field($model, 'phone')->textInput(['maxlength' => true])          
    ?>

    <? # $form->field($model, 'group_id')->textInput()          
    ?>

    <? # $form->field($model, 'role_id')->textInput()          
    ?>

    <? # $form->field($model, 'auth_key')->textInput(['maxlength' => true])          
    ?>

    <div class="form-group">
        <?= Html::submitButton('сохранить', ['class' => 'btn my-btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>