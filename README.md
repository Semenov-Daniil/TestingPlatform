<a name="readme-top"></a>

<!-- PROJECT LOGO -->
<br />
<div align="center">
      <h1 align="center">Плаформа тестирования на Yii2</h3>
    <br />
</div>

<!-- ABOUT THE PROJECT -->
## О проекте

Платформа для тестирования написанная на Yii2.

## Функционал

- **Для администратора**:
  - Управление преподавателями (создание, настройка).
  - Управление группами (добавление).
  - Управление предметами (добавление, удаление, изменение).
- **Для преподавателя**:
  - Управление студентами (создание, настройка, удаление).
  - Управление группами (добавление, настройка).
  - Управление тестами (составление, удаление, настройка).
  - Проверка тестов.
- **Для студентов**:
  - Личный кабинет.
  - Просмотр оценок.
  - Прохождение активных тестов.

## Требования к развертыванию

- PHP версии 5.6.0 или выше (рекомендуется PHP 7.4+).
- MySQL для базы данных.
- Composer для управления зависимостями.
- Веб-сервер (Apache или Nginx).
- Git (для клонирования репозитория).
- Доступ к хостингу или серверу (например, Bluehost) с поддержкой SSH (желательно).

## Как развернуть

### 1. Получение проекта

Вы можете развернуть проект двумя способами:

#### Через ZIP-архив
- Скачайте ZIP-архив проекта из репозитория.
- Разархивируйте его на локальном компьютере, убедившись, что структура папок сохранена.

#### Через GitHub
- Клонируйте репозиторий:
  ```bash
  git clone https://github.com/Semenov-Daniil/TestingPlatform
  ```

### 2. Установка зависимостей
- Перейдите в корневую директорию проекта:
  ```bash
  cd /path/to/yii2-demo
  ```
- Установите зависимости через Composer:
  ```bash
  composer install
  ```
  Если Composer не установлен глобально, используйте php composer.phar install.

### 3. Настройка конфигурации
- Настройте подключение к базе данных в config/db.php:
  ```php
  'components' => [
    'db' => [
        'class' => 'yii\db\Connection',
        'dsn' => 'mysql:host=localhost;dbname=your_database_name',
        'username' => 'your_database_username',
        'password' => 'your_database_password',
        'charset' => 'utf8',
    ],
  ],
  ```
- Установите ключ валидации cookie в config/web.php:
  ```php
  'request' => [
    'cookieValidationKey' => 'введите_случайную_строку_здесь',
  ],
  ```

### 4. Настройка базы данных
- Импортировать базу данных из файла testing_platform.sql

### Контакты
Semenov Daniil - ds.daniilsemen.ds@gmail.com
Project Link: [https://github.com/Semenov-Daniil/TestingPlatform](https://github.com/Semenov-Daniil/TestingPlatform)

### Лиценция

Распространяется по лицензии MIT. Смотреть `LICENSE.mt` для получения более подробной информации.

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/Semenov-Daniil/api-file-cloud.svg?style=for-the-badge
[contributors-url]: https://github.com/Semenov-Daniil/api-file-cloud/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Semenov-Daniil/api-file-cloud.svg?style=for-the-badge
[forks-url]: https://github.com/Semenov-Daniil/api-file-cloud/network/members
[stars-shield]: https://img.shields.io/github/stars/Semenov-Daniil/api-file-cloud.svg?style=for-the-badge
[stars-url]: https://github.com/Semenov-Daniil/api-file-cloud/stargazers
[issues-shield]: https://img.shields.io/github/issues/Semenov-Daniil/api-file-cloud.svg?style=for-the-badge
[issues-url]: https://github.com/Semenov-Daniil/api-file-cloud/issues
[license-shield]: https://img.shields.io/github/license/Semenov-Daniil/api-file-cloud.svg?style=for-the-badge
[license-url]: https://github.com/Semenov-Daniil/api-file-cloud/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/othneildrew
[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[JQuery.com]: https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white
[JQuery-url]: https://jquery.com 
