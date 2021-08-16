-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Дек 10 2017 г., 16:12
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `copsandthiefs`
--

-- --------------------------------------------------------

--
-- Структура таблицы `action`
--

CREATE TABLE IF NOT EXISTS `action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_player` int(64) NOT NULL,
  `id_target` int(64) DEFAULT NULL,
  `type` varchar(256) NOT NULL,
  `value` varchar(256) DEFAULT NULL,
  `date_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `action`
--

INSERT INTO `action` (`id`, `id_player`, `id_target`, `type`, `value`, `date_time`) VALUES
(1, 1, NULL, 'search', 'null', '2017-12-04 08:03:42');

-- --------------------------------------------------------

--
-- Структура таблицы `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_room` int(11) DEFAULT NULL,
  `form` varchar(50) NOT NULL,
  `cost` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Дамп данных таблицы `item`
--

INSERT INTO `item` (`id`, `id_user`, `id_room`, `form`, `cost`, `title`) VALUES
(2, NULL, 1, 'ring', 111, 'Silver ring'),
(1, 1, NULL, 'ring', 777, 'Golden ring');

-- --------------------------------------------------------

--
-- Структура таблицы `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_room` int(11) NOT NULL,
  `id_player` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `date_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Дамп данных таблицы `message`
--

INSERT INTO `message` (`id`, `id_room`, `id_player`, `text`, `date_time`) VALUES
(1, 1, 2, 'And you are filthy cop!', '2017-11-05 00:00:00'),
(2, 1, 1, 'you are filthy thief!!!', '2017-11-02 00:00:00'),
(3, 2, 2, 'dsa', '2017-11-06 14:14:59'),
(4, 2, 1, 'Vasya lox', '2017-11-08 22:49:24'),
(11, 1, 1, '321', '2017-12-10 11:18:57'),
(10, 1, 2, 'q', '2017-11-27 22:23:41'),
(12, 1, 1, '3211', '2017-12-10 11:25:25'),
(13, 1, 2, '1', '2017-12-10 12:27:53'),
(14, 1, 1, '2', '2017-12-10 12:27:58');

-- --------------------------------------------------------

--
-- Структура таблицы `player`
--

CREATE TABLE IF NOT EXISTS `player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_room` int(11) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `status` varchar(50) NOT NULL,
  `live` tinyint(1) NOT NULL,
  `rang` varchar(64) DEFAULT NULL,
  `exp` int(64) DEFAULT NULL,
  `money` int(15) DEFAULT NULL,
  `strength` int(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `player`
--

INSERT INTO `player` (`id`, `id_user`, `id_room`, `type`, `status`, `live`, `rang`, `exp`, `money`, `strength`) VALUES
(2, 2, 1, 'cop', 'alive', 1, '1', 55, 60, 0),
(1, 1, 1, 'thief', 'alive', 1, '1', 45, 40, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `room`
--

CREATE TABLE IF NOT EXISTS `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `money` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Дамп данных таблицы `room`
--

INSERT INTO `room` (`id`, `name`, `money`, `description`) VALUES
(1, 'Улица', 100483, NULL),
(2, 'Большой театр', 100500, NULL),
(3, 'Храм', 100500, NULL),
(4, 'Придел', 100500, NULL),
(5, 'Гос. Дума', 100500, NULL),
(6, 'Кабинет №1', 100500, NULL),
(7, 'Кабинет №2', 100500, NULL),
(8, 'Кабинет №3', 100500, NULL),
(9, 'Красная площадь', 100500, NULL),
(10, 'Патриаршие палаты', 100500, NULL),
(11, 'Арсенал', 100500, NULL),
(12, 'Оружейная палата', 100500, NULL),
(13, 'Сенат', 100500, NULL),
(14, 'Золотая палата', 100500, NULL),
(15, 'ГУМ', 100500, NULL),
(16, 'Магазин', 100500, NULL),
(17, 'Банк', 100500, NULL),
(18, 'Хранилище', 100500, NULL),
(19, 'Библиотека', 100500, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `token` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `nickname`, `token`) VALUES
(1, 'vasya', '123', 'mega killer', 'eb8b25c16363663dc9fd12e5892146c9'),
(2, 'petya', '321', 'antikiller', '1857c5657f90872cb2be5ac4745a6e72'),
(3, 'vasya1', '123456', 'nagibator666', NULL),
(6, 'vasya2', '1234567', 'pupkin', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `way`
--

CREATE TABLE IF NOT EXISTS `way` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_from` int(11) NOT NULL,
  `id_to` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45 ;

--
-- Дамп данных таблицы `way`
--

INSERT INTO `way` (`id`, `id_from`, `id_to`) VALUES
(1, 1, 2),
(2, 1, 19),
(3, 1, 3),
(4, 1, 15),
(5, 1, 5),
(6, 1, 9),
(7, 2, 1),
(8, 3, 1),
(9, 3, 4),
(10, 4, 3),
(11, 5, 1),
(12, 5, 6),
(13, 5, 7),
(14, 5, 8),
(15, 6, 5),
(16, 7, 5),
(17, 8, 5),
(18, 9, 1),
(19, 9, 11),
(20, 9, 10),
(21, 9, 12),
(22, 10, 9),
(23, 10, 11),
(24, 10, 13),
(25, 11, 9),
(26, 11, 10),
(27, 11, 13),
(28, 11, 14),
(29, 12, 9),
(30, 12, 14),
(31, 13, 10),
(32, 13, 11),
(33, 13, 14),
(34, 14, 11),
(35, 14, 12),
(36, 14, 13),
(37, 15, 1),
(38, 15, 16),
(39, 15, 17),
(40, 16, 15),
(41, 17, 15),
(42, 17, 18),
(43, 18, 17),
(44, 19, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
