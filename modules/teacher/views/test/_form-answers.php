<?php


use yii\bootstrap5\Html;

use wbraganca\dynamicform\DynamicFormWidget;


?>


<?php DynamicFormWidget::begin([

    'widgetContainer' => 'dynamicform_inner',

    'widgetBody' => '.container-answers',

    'widgetItem' => '.answer-item',

    'limit' => 10,

    'min' => 1,

    'insertButton' => '.add-answer',

    'deleteButton' => '.remove-answer',

    'model' => $modelsAnswer[0],

    'formId' => 'dynamic-form',

    'formFields' => [
        'is_true',
        'title'
    ],

]); ?>

<div class="row d-flex justify-content-between">

    <h4 class="col-8">Ответы</h4>
    <div class="col-auto">
        <button type="button" class="px-3 py-2 add-answer btn my-btn-success btn-xs d-flex gap-2 align-items-center"><i class="fi fi-rr-plus"></i> Добавить ответ</button>
    </div>
</div>
<div class="row container-answers">
    <?php foreach ($modelsAnswer as $indexAnswer => $modelAnswer) : ?>
        <div class="col-12 answer-item">
            <?php
            if (!$modelAnswer->isNewRecord) {
                echo Html::activeHiddenInput($modelAnswer, "[{$indexQuestion}][{$indexAnswer}]id");
            }
            ?>
            <div class="col-6">
                <?= $form->field($modelAnswer, "[{$indexQuestion}][{$indexAnswer}]imageFile")->fileInput(['class' => 'form-control']) ?>
            </div>

            <div class="row col-12">

                <div class="col-auto d-flex justify-content-around">
                    <?= $form->field($modelAnswer, "[{$indexQuestion}][{$indexAnswer}]is_true")->label("Правильный ответ", ['class' => "form-check-label w-100", 'style' => 'color:black'])->checkbox(['class' => "form-check-input"]) ?>
                </div>

                <div class="col-12">
                    <?= $form->field($modelAnswer, "[{$indexQuestion}][{$indexAnswer}]title")->label(false)->textInput(['maxlength' => true, 'class' => 'form-control']) ?>
                </div>
                
            </div>
            <div class="col-12 d-flex justify-content-end">
                <button type="button" class="px-3 py-2 remove-answer btn my-btn-danger btn-xs d-flex gap-2 align-items-center"><i class="fi fi-rr-cross"></i> Удалить ответ</button>
            </div>
        </div>
    <?php endforeach; ?>

</div>



<?php DynamicFormWidget::end(); ?>