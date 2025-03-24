-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 20 2025 г., 18:07
-- Версия сервера: 10.8.4-MariaDB-log
-- Версия PHP: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `new_diplom2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `answer`
--

CREATE TABLE `answer` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_true` tinyint(1) NOT NULL,
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `answer`
--

INSERT INTO `answer` (`id`, `title`, `image`, `is_true`, `question_id`) VALUES
(84, 'test1', NULL, 0, 60),
(85, 'test2', NULL, 0, 60),
(86, 'test3', NULL, 1, 60),
(87, 'test1', NULL, 1, 61),
(88, 'test2', NULL, 1, 61),
(89, 'test3', NULL, 0, 61),
(90, 'Test', NULL, 1, 62),
(91, 'test1', NULL, 1, 63),
(92, 'test2', NULL, 0, 63),
(93, 'test3', NULL, 0, 63);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `rule_name` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `deny`
--

CREATE TABLE `deny` (
  `id` int(11) NOT NULL,
  `is_true` tinyint(1) NOT NULL,
  `group_test_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `group`
--

CREATE TABLE `group` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `group`
--

INSERT INTO `group` (`id`, `title`) VALUES
(1, 'iv123'),
(2, '234');

-- --------------------------------------------------------

--
-- Структура таблицы `group_test`
--

CREATE TABLE `group_test` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `avg_points` float DEFAULT NULL,
  `val_5` int(11) DEFAULT NULL,
  `val_4` int(11) DEFAULT NULL,
  `val_3` int(11) DEFAULT NULL,
  `fails` int(11) DEFAULT NULL,
  `group_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `end_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `group_test`
--

INSERT INTO `group_test` (`id`, `date`, `avg_points`, `val_5`, `val_4`, `val_3`, `fails`, `group_id`, `test_id`, `end_time`) VALUES
(63, NULL, NULL, NULL, NULL, NULL, NULL, 1, 42, '2025-03-20 17:51:07');

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1710234645),
('m140506_102106_rbac_init', 1710358066),
('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1710358066),
('m180523_151638_rbac_updates_indexes_without_prefix', 1710358066),
('m200409_110543_rbac_update_mssql_trigger', 1710358066);

-- --------------------------------------------------------

--
-- Структура таблицы `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL,
  `points_per_question` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `level_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `question`
--

INSERT INTO `question` (`id`, `text`, `points_per_question`, `image`, `level_id`, `test_id`, `type_id`) VALUES
(60, 'Test 1', 1, NULL, 1, 42, 1),
(61, 'Test 2', 2, NULL, 2, 42, 2),
(62, 'Test 3', 3, NULL, 3, 42, 3),
(63, 'Test 4', 2, NULL, 2, 42, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `question_level`
--

CREATE TABLE `question_level` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `question_level`
--

INSERT INTO `question_level` (`id`, `title`) VALUES
(1, 'Лёгкий'),
(2, 'Средний'),
(3, 'Сложный');

-- --------------------------------------------------------

--
-- Структура таблицы `question_type`
--

CREATE TABLE `question_type` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `question_type`
--

INSERT INTO `question_type` (`id`, `title`) VALUES
(1, 'Один правильный ответ'),
(2, 'Несколько правильных ответов'),
(3, 'Ввод ответа от студента');

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `role`
--

INSERT INTO `role` (`id`, `title`) VALUES
(1, 'admin'),
(2, 'manager'),
(3, 'teacher'),
(4, 'student');

-- --------------------------------------------------------

--
-- Структура таблицы `student_answer`
--

CREATE TABLE `student_answer` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `answer_title` varchar(255) DEFAULT NULL,
  `cheked` tinyint(1) DEFAULT NULL,
  `is_true` tinyint(1) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `student_test`
--

CREATE TABLE `student_test` (
  `id` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `mark` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_test_id` int(11) NOT NULL,
  `cheked` tinyint(1) NOT NULL,
  `date` date DEFAULT NULL,
  `attempt` int(11) NOT NULL,
  `ip` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `student_test`
--

INSERT INTO `student_test` (`id`, `points`, `mark`, `test_id`, `user_id`, `group_test_id`, `cheked`, `date`, `attempt`, `ip`) VALUES
(118, 0, 2, 42, 77, 63, 1, '2025-03-20', 1, NULL),
(119, 0, 2, 42, 77, 63, 1, '2025-03-20', 2, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `subject`
--

INSERT INTO `subject` (`id`, `title`) VALUES
(1, 'пришем код'),
(2, 'не пришем код');

-- --------------------------------------------------------

--
-- Структура таблицы `teacher_subject`
--

CREATE TABLE `teacher_subject` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `teacher_subject`
--

INSERT INTO `teacher_subject` (`id`, `user_id`, `subject_id`) VALUES
(1, 68, 1),
(2, 68, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `question_count` int(11) NOT NULL,
  `point_count` int(11) DEFAULT NULL,
  `subject_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `duration` int(11) DEFAULT 20
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `test`
--

INSERT INTO `test` (`id`, `title`, `question_count`, `point_count`, `subject_id`, `is_active`, `duration`) VALUES
(42, 'Test', 4, 8, 1, 1, 20);

-- --------------------------------------------------------

--
-- Структура таблицы `test_status`
--

CREATE TABLE `test_status` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `test_status`
--

INSERT INTO `test_status` (`id`, `title`) VALUES
(1, 'active'),
(2, 'not_active'),
(3, 'closed');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `patronimyc` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `auth_key` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `name`, `surname`, `patronimyc`, `login`, `password`, `email`, `phone`, `role_id`, `auth_key`) VALUES
(2, 'admin', 'admin', 'admin', 'admin', '$2y$13$OPlJC8YfaEg4KmDEQzIvH.cN0aRiJZh0MgmVQkB94bpDRyjBZDWDy', 'admin', 'admin', 2, 'qCRkB2qqOQz6IGyPYRnwkKy7m0jmpwOJ'),
(68, 'teacher', 'teacher', 'teacher', 'teacher', '$2y$13$Tq7pIwFSvU.JgAFj1I1.x.ETffLgNx44o/TH8./f50zVR1TciKHbq', 'teacher', 'teacher', 3, 'LwJUjcM9VhLjsEQvDuyMvot8nDN0J2XF'),
(77, 'student', 'student', 'student', 'student', '$2y$13$xceS3/d8uJpFbwBIGZwk1uSv0mwd3/neiZvy53fMvloNBiS004dHW', 'student', 'student', 4, '6AGxewilkapWVuCJ8sBrkknUA2mgp5QK');

-- --------------------------------------------------------

--
-- Структура таблицы `user_group`
--

CREATE TABLE `user_group` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `user_group`
--

INSERT INTO `user_group` (`id`, `user_id`, `group_id`) VALUES
(558, 77, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- Индексы таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `idx-auth_assignment-user_id` (`user_id`);

--
-- Индексы таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Индексы таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Индексы таблицы `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Индексы таблицы `deny`
--
ALTER TABLE `deny`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_test_id` (`group_test_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `group_test`
--
ALTER TABLE `group_test`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `test_id` (`test_id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `level_id` (`level_id`),
  ADD KEY `question_ibfk_3` (`test_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Индексы таблицы `question_level`
--
ALTER TABLE `question_level`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `question_type`
--
ALTER TABLE `question_type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `student_answer`
--
ALTER TABLE `student_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `answer_id` (`answer_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `student_test`
--
ALTER TABLE `student_test`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_test_id` (`group_test_id`),
  ADD KEY `test_id` (`test_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `teacher_subject`
--
ALTER TABLE `teacher_subject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id-subject` (`subject_id`),
  ADD KEY `test_ibfk_2` (`is_active`);

--
-- Индексы таблицы `test_status`
--
ALTER TABLE `test_status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- Индексы таблицы `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `answer`
--
ALTER TABLE `answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT для таблицы `deny`
--
ALTER TABLE `deny`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT для таблицы `group`
--
ALTER TABLE `group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `group_test`
--
ALTER TABLE `group_test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT для таблицы `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT для таблицы `question_level`
--
ALTER TABLE `question_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `question_type`
--
ALTER TABLE `question_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `student_answer`
--
ALTER TABLE `student_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=600;

--
-- AUTO_INCREMENT для таблицы `student_test`
--
ALTER TABLE `student_test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT для таблицы `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `teacher_subject`
--
ALTER TABLE `teacher_subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT для таблицы `test_status`
--
ALTER TABLE `test_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=702;

--
-- AUTO_INCREMENT для таблицы `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=559;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `deny`
--
ALTER TABLE `deny`
  ADD CONSTRAINT `deny_ibfk_1` FOREIGN KEY (`group_test_id`) REFERENCES `group_test` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deny_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_2` FOREIGN KEY (`level_id`) REFERENCES `question_level` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `question_ibfk_3` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `question_ibfk_4` FOREIGN KEY (`type_id`) REFERENCES `question_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `student_answer`
--
ALTER TABLE `student_answer`
  ADD CONSTRAINT `student_answer_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_answer_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_answer_ibfk_3` FOREIGN KEY (`answer_id`) REFERENCES `answer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `student_test`
--
ALTER TABLE `student_test`
  ADD CONSTRAINT `student_test_ibfk_1` FOREIGN KEY (`group_test_id`) REFERENCES `group_test` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_test_ibfk_2` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_test_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `teacher_subject`
--
ALTER TABLE `teacher_subject`
  ADD CONSTRAINT `teacher_subject_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teacher_subject_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `test_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_group`
--
ALTER TABLE `user_group`
  ADD CONSTRAINT `user_group_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_group_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
