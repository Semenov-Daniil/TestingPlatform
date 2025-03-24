<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "user_password".
 *
 * @property int $user_id
 * @property string $password
 *
 * @property User $user
 */
class UserPassword extends \yii\db\ActiveRecord
{


    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'user_password';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['password'], 'required'],
            [['password'], 'string', 'max' => 255],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::class, 'targetAttribute' => ['user_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'user_id' => 'User ID',
            'password' => 'Password',
        ];
    }

    /**
     * Gets query for [[User]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::class, ['id' => 'user_id']);
    }

}
