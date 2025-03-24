<?php

use yii\bootstrap5\Html;
use yii\bootstrap5\ActiveForm;
use yii\widgets\Pjax;
use app\models\QuestionType;
use aneeshikmat\yii2\Yii2TimerCountDown\Yii2TimerCountDown;
use aayaresko\timer\Timer;
use app\assets\VueAsset;
// use app\models\QuestionType;
use app\models\Test;
use yii\helpers\VarDumper;
use yii\web\View;
use yii\web\YiiAsset;

$this->title = Html::encode($test_title);

$options = [
    'endTimeTest' => strtotime($end_time),
];
$this->registerJs(
    "const yiiOptions = ".\yii\helpers\Json::htmlEncode($options).";",
    View::POS_HEAD,
    'yiiOptions'
);

$this->registerJsFile('js/timerTest.js', ['depends' => YiiAsset::class]);

// VarDumper::dump($answers, 10, true);die;

?>

<div class="test-text row justify-content-center align-items-center">
    <h3 class="col text text-muted">
        Название теста: <?= $test_title ?>
    </h3>
    <div class="col-auto text text-muted row row-cols-2 justify-content-center align-items-center" id="timer-test">
        <div class="col-auto timer-value h2 display-6 m-0 text-center d-flex justify-content-center align-items-center">
            <?= date('H:i:s', (strtotime($end_time . '- 3 hours') - time())) ?>
        </div>
    </div>
</div>


<?php Pjax::begin([
    'id' => 'questions-pjax',
    'enablePushState' => false,
    'enableReplaceState' => false,
    'timeout' => 10000
]); ?>
<div class="questions-list d-flex justify-content-start flex-row gap-4 flex-wrap vertical-divider-container">
    <?= $questions_str ?>
</div>

<div class="question-field">
    <?php
    // VarDumper::dump($modelStudentAnswer->attributes, 10, true);
    // VarDumper::dump($answers, 10, true);
    // die;
    ?>
    <h3><?= $question->text ?></h3>
    <div class="mt-3">
        <?php $form = ActiveForm::begin([
            'id' => 'test-form',
            'options' => [
                'data' => [
                    'pjax' => true
                ],
            ]
        ]); ?>

        <?= $form->field($modelStudentAnswer, 'user_id')->hiddenInput(['value' => Yii::$app->user->identity->id])->label(false) ?>

        <?= $form->field($modelStudentAnswer, 'question_id')->hiddenInput(['value' => $question->id])->label(false) ?>
        <?= $form->field($modelStudentAnswer, 'attempt')->hiddenInput(['value' => $attempt])->label(false) ?>
        <?php if ($question->image) : ?>
            <img src="<?= $question->image ?>" style='height:150px' />
        <?php endif ?>
        <?php if ($question->type_id == QuestionType::getTypeId('Один правильный ответ')) : ?>
            <div class="answers-test">
                <?= $form->field($modelStudentAnswer, 'cheked')->hiddenInput(['value' => 1])->label(false) ?>
                <?= $form->field($modelStudentAnswer, 'answer_id', ['enableClientValidation' => false])->radioList($answers, [
                    'item' => function ($index, $item, $name, $checked, $value) {
                        $checkedAttribute = $checked ? 'checked' : '';
                        return "<div class='form-check d-flex align-items-center'>
                        <input id='radio-$index' class='form-check-input' type='radio' name='{$name}' value='{$value}' {$checkedAttribute}>
                        <label for='radio-$index' class='form-check-label' style='font-weight: 400;'>{$item->title}" . ($item->image ? Html::img($item->image, ['style' => 'height:150px']) : '') . "</label>
                    </div>";
                    }
                ])->label(false) ?>
            </div>
        <?php elseif ($question->type_id == QuestionType::getTypeId('Несколько правильных ответов')) : ?>
            <div class="answers-test">
                <?= $form->field($modelStudentAnswer, 'cheked')->hiddenInput(['value' => 1])->label(false) ?>
                <?= $form->field($modelStudentAnswer, 'answer_id', ['enableClientValidation' => false])->checkboxList($answers, [
                    'item' => function ($index, $item, $name, $checked, $value) {
                        $checkedAttribute = $checked ? 'checked' : '';
                        return "<div class='form-check d-flex align-items-center'>
                        <input id='checkbox-$index' class='form-check-input' type='checkbox' name='{$name}' value='{$value}' {$checkedAttribute}>
                            <label for='checkbox-$index' class='form-check-label' style='font-weight: 400;'>{$item->title}" . ($item->image ? Html::img($item->image, ['style' => 'height:150px']) : '') . "</label>
                        </div>";
                    }
                ])->label(false); ?>
            </div>
        <?php elseif ($question->type_id == QuestionType::getTypeId('Ввод ответа от студента')) : ?>
            <div class="answers-test">
                <?= $form->field($modelStudentAnswer, 'cheked')->hiddenInput(['value' => 0])->label(false) ?>
                <?= $form->field($modelStudentAnswer, 'answer_id')->hiddenInput(['value' => key($answers)])->label(false) ?>
                <?= $form->field($modelStudentAnswer, 'answer_title', ['enableClientValidation' => false])->textInput(['value' => ''])->label(false); ?>
            </div>
        <?php endif ?>
        <div class="form-group">
            <?= Html::submitButton('Ответить', [
                'class' => 'my-btn-primary', 'id' => 'btn_ans',
                'data' => [
                    'method' => 'post',
                    'params' => [
                        'question' => $current_question,
                        'id' => $group_test_id,
                    ],
                ]
            ]) ?>
        </div>

        <?php ActiveForm::end(); ?>
    </div>
</div>

<?php Pjax::end();

?>