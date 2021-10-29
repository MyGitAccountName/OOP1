-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 29 2021 г., 15:06
-- Версия сервера: 5.7.33
-- Версия PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `guestbook`
--

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'id сообщения',
  `Message` varchar(600) NOT NULL COMMENT 'текст сообщения',
  `Date` datetime NOT NULL COMMENT 'время сообщения'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id`, `Message`, `Date`) VALUES
(1, 'Первое сообщение', '2021-09-14 11:18:57'),
(2, 'Второе сообщение', '2021-09-19 05:22:34'),
(3, 'Я обычно как напьюсь,<br>Головой о стенку бьюсь.<br>То ли вредно мне спиртное,<br>То ли просто возрастное.', '2021-10-01 15:47:18'),
(4, 'Любой дурак сможет написать код, который поймет машина. Хорошие программисты пишут код, который сможет понять человек.<br>Martin Fowler', '2021-10-09 11:32:34'),
(5, 'Чему нас может научить гиппопотам? Что невозможно избавиться от лишнего веса, благодаря прогулкам и растительной диете.', '2021-10-10 18:20:33'),
(6, ';)', '2021-10-14 00:44:48'),
(7, 'До скорой встречи!', '2021-10-14 05:20:28'),
(8, 'ДОБАВЛЕННОЕ СООЩЕНИЕ!', '2021-10-29 19:04:42');

-- --------------------------------------------------------

--
-- Структура таблицы `usermessage`
--

CREATE TABLE `usermessage` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'для удобства редактирования',
  `id_mess` int(11) UNSIGNED NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `usermessage`
--

INSERT INTO `usermessage` (`id`, `id_mess`, `id_user`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 6),
(4, 4, 2),
(5, 5, 7),
(6, 6, 4),
(7, 7, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'id пользователя',
  `Name` varchar(60) NOT NULL DEFAULT 'No name' COMMENT 'имя пользователя',
  `SurName` varchar(60) NOT NULL DEFAULT 'No surname' COMMENT 'фамилия пользователя',
  `Login` varchar(60) NOT NULL COMMENT 'логин',
  `Password_hash` varchar(60) NOT NULL COMMENT 'хэш пароля'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `Name`, `SurName`, `Login`, `Password_hash`) VALUES
(1, 'Иван', 'Иванов', 'login1', '96e79218965eb72c92a549dd5a330112'),
(2, 'Александр', 'Александров', 'login2', 'e3ceb5881a0a1fdaad01296d7554868d'),
(3, 'Виталий', 'Буров', 'login3', '1a100d2c0dab19c4430e7d73762b3423'),
(4, 'Валентина', 'Андреева', 'login4', '73882ab1fa529d7273da0db6b49cc4f3'),
(5, 'Акакий', 'Фролов', 'login5', '5b1b68a9abf4d2cd155c81a9225fd158'),
(6, 'Ольга', 'Морковкина', 'login6', 'f379eaf3c831b04de153469d1bec345e'),
(7, 'Анна', 'Ярко', 'login7', 'f63f4fbc9f8c85d409f2f59f2b9e12d5'),
(8, 'Пётр', 'Некрасов', 'login8', '21218cca77804d2ba1922c33e0151105'),
(9, 'Тимофей', 'Кнутский', 'login9', '52c69e3a57331081823331c4e69d3f2e'),
(10, 'Дарья', 'Жилина', 'login10', '6d071901727aec1ba6d8e2497ef5b709');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `usermessage`
--
ALTER TABLE `usermessage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_mess` (`id_mess`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id сообщения', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `usermessage`
--
ALTER TABLE `usermessage`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'для удобства редактирования', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id пользователя', AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `usermessage`
--
ALTER TABLE `usermessage`
  ADD CONSTRAINT `usermessage_ibfk_1` FOREIGN KEY (`id_mess`) REFERENCES `messages` (`id`),
  ADD CONSTRAINT `usermessage_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
