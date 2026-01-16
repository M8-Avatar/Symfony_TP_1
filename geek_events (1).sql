-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 16 jan. 2026 à 12:13
-- Version du serveur : 9.1.0
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `geek_events`
--

-- --------------------------------------------------------

--
-- Structure de la table `activity`
--

DROP TABLE IF EXISTS `activity`;
CREATE TABLE IF NOT EXISTS `activity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext,
  `start_at` datetime NOT NULL,
  `room` varchar(255) DEFAULT NULL,
  `event_id` int NOT NULL,
  `discr` varchar(255) NOT NULL,
  `game` varchar(255) DEFAULT NULL,
  `platform` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `rules` longtext,
  `game_name` varchar(255) DEFAULT NULL,
  `min_players` int DEFAULT NULL,
  `max_players` int DEFAULT NULL,
  `complexity_level` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AC74095A71F7E88B` (`event_id`)
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `activity`
--

INSERT INTO `activity` (`id`, `title`, `description`, `start_at`, `room`, `event_id`, `discr`, `game`, `platform`, `format`, `rules`, `game_name`, `min_players`, `max_players`, `complexity_level`) VALUES
(73, 'quia inventore et', 'Sit culpa non labore ipsam soluta. Ut molestias facilis qui et error doloremque alias.', '2026-03-22 23:35:49', 'Salle c4', 21, 'boardgame', NULL, NULL, NULL, NULL, '7 Wonders', 2, 6, 'Moyen'),
(74, 'consequatur tenetur ut', 'Quis voluptas cupiditate hic at.', '2026-03-23 04:35:49', 'Salle t2', 21, 'boardgame', NULL, NULL, NULL, NULL, 'Ark Nova', 2, 6, 'Expert'),
(75, 'et minus dolor', 'Quod ut reprehenderit alias consequatur libero.', '2026-03-22 21:35:49', 'Salle b2', 21, 'tournament', 'Valorant', 'Switch', '1v1', 'Règles officielles v8', NULL, NULL, NULL, NULL),
(76, 'sequi voluptatem reprehenderit', 'Ratione cum commodi beatae fugiat quis dolores.', '2026-07-01 22:52:41', 'Salle y9', 22, 'tournament', 'Smash Bros', 'PS5', 'Battle Royale', 'Règles officielles v1', NULL, NULL, NULL, NULL),
(77, 'inventore expedita eos', 'Dolor explicabo dolores et temporibus. Unde ut consequatur non vitae minus vel quo.', '2026-04-14 00:55:11', 'Salle f4', 23, 'boardgame', NULL, NULL, NULL, NULL, 'Dune Imperium', 2, 6, 'Facile'),
(78, 'omnis cupiditate sit', 'Dolores et numquam aut et fuga. Tempora delectus similique saepe error at doloremque quia.', '2025-12-18 07:07:31', 'Salle l4', 24, 'boardgame', NULL, NULL, NULL, NULL, 'Catan', 2, 6, 'Expert'),
(79, 'reprehenderit dolorem totam', 'Exercitationem quisquam dolorem sed.', '2025-12-18 11:07:31', 'Salle m4', 24, 'tournament', 'FIFA', 'PS5', '5v5', 'Règles officielles v4', NULL, NULL, NULL, NULL),
(80, 'velit sunt reiciendis', 'Omnis error nobis consequatur possimus. Facere placeat at expedita.', '2025-12-18 12:07:31', 'Salle j3', 24, 'boardgame', NULL, NULL, NULL, NULL, 'Dune Imperium', 2, 6, 'Facile'),
(81, 'porro necessitatibus unde', 'Sunt voluptas similique aut ex rerum.', '2025-12-18 04:07:31', 'Salle m5', 24, 'tournament', 'FIFA', 'PC', '1v1', 'Règles officielles v2', NULL, NULL, NULL, NULL),
(82, 'qui ut qui', 'Ut vero vero sed accusantium.', '2026-07-14 12:55:37', 'Salle w9', 25, 'tournament', 'Valorant', 'PS5', 'Battle Royale', 'Règles officielles v8', NULL, NULL, NULL, NULL),
(83, 'sunt rerum deserunt', 'Nesciunt facilis et laborum et quaerat.', '2026-07-14 17:55:37', 'Salle i0', 25, 'tournament', 'League of Legends', 'PC', 'Battle Royale', 'Règles officielles v8', NULL, NULL, NULL, NULL),
(84, 'culpa quo quia', 'Excepturi incidunt molestiae aut eveniet delectus voluptate doloremque. Hic molestias dignissimos molestias dolor ipsum et.', '2026-07-14 21:55:37', 'Salle r2', 25, 'boardgame', NULL, NULL, NULL, NULL, 'Catan', 2, 6, 'Moyen'),
(85, 'aut sit aut', 'Alias ex voluptatem itaque perferendis voluptates nesciunt.', '2026-07-14 21:55:37', 'Salle b0', 25, 'boardgame', NULL, NULL, NULL, NULL, 'Dune Imperium', 2, 6, 'Expert'),
(86, 'explicabo cumque reiciendis', 'Molestiae id maiores molestiae voluptatibus. Aut minima voluptate quia sunt est reprehenderit sed omnis.', '2026-03-19 03:28:56', 'Salle h8', 26, 'tournament', 'FIFA', 'PS5', 'Battle Royale', 'Règles officielles v6', NULL, NULL, NULL, NULL),
(87, 'cumque quibusdam aliquam', 'Cumque delectus corrupti et quam hic.', '2026-03-19 06:28:56', 'Salle l0', 26, 'tournament', 'Smash Bros', 'PC', '1v1', 'Règles officielles v8', NULL, NULL, NULL, NULL),
(88, 'qui est magni', 'Autem qui et dolorem officiis. Culpa quia dolorem illum.', '2026-05-05 13:44:22', 'Salle o4', 27, 'tournament', 'League of Legends', 'PS5', 'Battle Royale', 'Règles officielles v3', NULL, NULL, NULL, NULL),
(89, 'dolores modi qui', 'Sunt quasi iure quos aspernatur. Libero beatae fuga cumque dolorem ratione cupiditate quae.', '2026-02-23 16:22:18', 'Salle w0', 28, 'boardgame', NULL, NULL, NULL, NULL, 'Dune Imperium', 2, 6, 'Moyen'),
(90, 'eum excepturi rerum', 'Ut quos voluptatem a quaerat laboriosam in.', '2026-01-16 07:50:40', 'Salle a2', 29, 'tournament', 'FIFA', 'PS5', '1v1', 'Règles officielles v1', NULL, NULL, NULL, NULL),
(91, 'iste sequi ratione', 'Dolor et fugiat optio. Molestiae doloribus vero quia quas.', '2026-01-16 08:50:40', 'Salle m0', 29, 'boardgame', NULL, NULL, NULL, NULL, 'Dune Imperium', 2, 6, 'Expert'),
(92, 'qui nihil incidunt', 'Dolorem aut incidunt est quod. Provident numquam iure vitae officiis.', '2026-04-14 02:09:58', 'Salle z9', 30, 'tournament', 'Smash Bros', 'PC', 'Battle Royale', 'Règles officielles v2', NULL, NULL, NULL, NULL),
(93, 'corporis et quasi', 'Omnis adipisci quia autem ut qui iure expedita. Architecto et facilis aut aut dicta est aut et.', '2026-04-14 01:09:58', 'Salle w6', 30, 'boardgame', NULL, NULL, NULL, NULL, 'Catan', 2, 6, 'Facile'),
(94, 'esse voluptatem ipsum', 'Error aut quaerat autem eos quis.', '2026-04-14 04:09:58', 'Salle k6', 30, 'tournament', 'League of Legends', 'PS5', '1v1', 'Règles officielles v4', NULL, NULL, NULL, NULL),
(95, 'quas aut error', 'Velit in eius fugit ducimus quos nam consequuntur. Ipsam sit odio perspiciatis temporibus.', '2026-03-01 00:29:40', 'Salle l7', 31, 'boardgame', NULL, NULL, NULL, NULL, 'Ark Nova', 2, 6, 'Facile'),
(96, 'ut consequuntur neque', 'Sed perspiciatis nihil consequatur exercitationem aut laudantium magni. Est et tempora unde et aut nostrum eveniet expedita.', '2026-02-28 22:29:40', 'Salle u5', 31, 'tournament', 'Smash Bros', 'Switch', '1v1', 'Règles officielles v2', NULL, NULL, NULL, NULL),
(97, 'autem similique est', 'Repudiandae et dolore dolores et iste.', '2026-03-01 00:29:40', 'Salle r2', 31, 'boardgame', NULL, NULL, NULL, NULL, 'Catan', 2, 6, 'Moyen'),
(98, 'iste nobis temporibus', 'Cupiditate quasi ut illo repellendus a est. Sunt dolor est voluptas sit quos ut ad.', '2026-02-28 20:29:40', 'Salle q2', 31, 'tournament', 'League of Legends', 'Switch', 'Battle Royale', 'Règles officielles v2', NULL, NULL, NULL, NULL),
(99, 'quisquam et quia', 'Dolor et vel alias aut ullam sed voluptatem.', '2026-03-13 04:24:03', 'Salle u7', 32, 'boardgame', NULL, NULL, NULL, NULL, 'Ark Nova', 2, 6, 'Moyen'),
(100, 'qui non rem', 'Qui nemo deleniti doloremque labore nihil deserunt. Hic tempora sed nesciunt consequatur.', '2026-03-13 04:24:03', 'Salle y7', 32, 'tournament', 'FIFA', 'PC', '5v5', 'Règles officielles v6', NULL, NULL, NULL, NULL),
(101, 'consequatur sint omnis', 'Fuga quo totam hic. Explicabo natus quia dolorum quos maxime voluptas facilis iure.', '2026-03-13 01:24:03', 'Salle o0', 32, 'tournament', 'League of Legends', 'Switch', 'Battle Royale', 'Règles officielles v6', NULL, NULL, NULL, NULL),
(102, 'commodi porro animi', 'Architecto eius saepe aut neque sapiente tempora qui. Provident eos illo libero veniam pariatur sequi.', '2026-03-13 03:24:03', 'Salle x3', 32, 'boardgame', NULL, NULL, NULL, NULL, 'Ark Nova', 2, 6, 'Expert'),
(103, 'ut rerum saepe', 'Voluptates est iure ea quia iste ex.', '2026-06-25 11:27:08', 'Salle v5', 33, 'boardgame', NULL, NULL, NULL, NULL, 'Ark Nova', 2, 6, 'Facile'),
(104, 'distinctio quisquam sint', 'Quisquam autem iste reiciendis cupiditate repudiandae.', '2026-06-25 13:27:08', 'Salle v2', 33, 'tournament', 'Smash Bros', 'PC', '1v1', 'Règles officielles v0', NULL, NULL, NULL, NULL),
(105, 'eum animi ipsam', 'Voluptatem et libero voluptas reprehenderit. Quo maiores error voluptas accusamus nam.', '2026-06-25 09:27:08', 'Salle j4', 33, 'boardgame', NULL, NULL, NULL, NULL, 'Catan', 2, 6, 'Facile'),
(106, 'nisi ut id', 'Blanditiis nihil tenetur porro eum et. Doloribus hic vero facere aliquam enim.', '2026-05-16 15:10:52', 'Salle y6', 34, 'tournament', 'Smash Bros', 'PC', '1v1', 'Règles officielles v7', NULL, NULL, NULL, NULL),
(107, 'est officiis corporis', 'Qui pariatur molestias dolore voluptates adipisci. Adipisci omnis voluptatem delectus nesciunt eligendi minus officiis.', '2026-05-16 20:10:52', 'Salle l8', 34, 'tournament', 'Valorant', 'PS5', 'Battle Royale', 'Règles officielles v1', NULL, NULL, NULL, NULL),
(108, 'assumenda aspernatur et', 'Debitis soluta blanditiis nostrum rerum saepe ad occaecati voluptas. Sunt et consequatur ut maxime.', '2026-05-16 18:10:52', 'Salle v4', 34, 'tournament', 'FIFA', 'PS5', '5v5', 'Règles officielles v8', NULL, NULL, NULL, NULL),
(109, 'quis odio vel', 'Provident sunt vero ab magnam illo facilis vitae. Culpa facere commodi nulla similique.', '2026-05-16 20:10:52', 'Salle m8', 34, 'tournament', 'Valorant', 'PC', '5v5', 'Règles officielles v9', NULL, NULL, NULL, NULL),
(110, 'ad dolorem amet', 'Quasi expedita nisi ex laborum corrupti excepturi.', '2026-06-18 17:34:41', 'Salle k2', 35, 'tournament', 'Smash Bros', 'PC', 'Battle Royale', 'Règles officielles v6', NULL, NULL, NULL, NULL),
(111, 'eius natus quia', 'Neque quod et aut fugit.', '2026-06-18 16:34:41', 'Salle y9', 35, 'boardgame', NULL, NULL, NULL, NULL, 'Dune Imperium', 2, 6, 'Facile'),
(112, 'qui earum voluptatem', 'Sunt aliquid et rem doloremque culpa.', '2026-06-18 13:34:41', 'Salle e1', 35, 'tournament', 'League of Legends', 'PC', 'Battle Royale', 'Règles officielles v2', NULL, NULL, NULL, NULL),
(113, 'voluptate aut qui', 'Sint et facilis reiciendis voluptatibus est fuga blanditiis. Ea voluptas et ab accusamus assumenda facere officiis.', '2026-06-18 13:34:41', 'Salle p0', 35, 'boardgame', NULL, NULL, NULL, NULL, '7 Wonders', 2, 6, 'Moyen'),
(114, 'facilis rerum et', 'Sunt numquam consectetur ipsam veritatis sit. Quia quia corporis nam.', '2026-07-12 03:23:15', 'Salle r5', 36, 'boardgame', NULL, NULL, NULL, NULL, '7 Wonders', 2, 6, 'Expert'),
(115, 'architecto rerum dolores', 'Aut iusto officia ipsum distinctio. Aliquid alias vero voluptas consequuntur.', '2026-07-12 04:23:15', 'Salle z5', 36, 'tournament', 'Valorant', 'Switch', '1v1', 'Règles officielles v0', NULL, NULL, NULL, NULL),
(116, 'debitis nihil quia', 'Perspiciatis repellendus facere cum modi.', '2026-07-12 06:23:15', 'Salle f1', 36, 'tournament', 'League of Legends', 'PS5', '1v1', 'Règles officielles v7', NULL, NULL, NULL, NULL),
(117, 'dolores amet et', 'Dolores velit distinctio debitis vitae et cupiditate.', '2026-07-12 10:23:15', 'Salle w6', 36, 'tournament', 'FIFA', 'Switch', 'Battle Royale', 'Règles officielles v8', NULL, NULL, NULL, NULL),
(118, 'temporibus maiores nobis', 'Minima amet sed ea rerum suscipit accusantium. Omnis recusandae fugit minus dolores quia rerum repudiandae.', '2025-12-11 19:38:14', 'Salle u9', 37, 'tournament', 'Valorant', 'PC', '5v5', 'Règles officielles v8', NULL, NULL, NULL, NULL),
(119, 'consequatur laboriosam fugiat', 'Tempore rem neque eos ut et in.', '2025-12-11 19:38:14', 'Salle l5', 37, 'tournament', 'League of Legends', 'Switch', 'Battle Royale', 'Règles officielles v1', NULL, NULL, NULL, NULL),
(120, 'similique saepe nostrum', 'Nisi eos illum at amet harum. Modi atque veniam quia accusantium aperiam molestiae tempora.', '2025-12-12 02:38:14', 'Salle j5', 37, 'boardgame', NULL, NULL, NULL, NULL, 'Ark Nova', 2, 6, 'Facile'),
(121, 'magni accusantium provident', 'Voluptatem placeat possimus ipsum veritatis quis saepe incidunt. Officiis et suscipit tenetur magni.', '2026-02-19 07:59:43', 'Salle t1', 38, 'tournament', 'FIFA', 'PS5', 'Battle Royale', 'Règles officielles v4', NULL, NULL, NULL, NULL),
(122, 'atque autem inventore', 'Qui quos necessitatibus architecto sequi.', '2026-02-19 08:59:43', 'Salle c7', 38, 'boardgame', NULL, NULL, NULL, NULL, 'Ark Nova', 2, 6, 'Expert'),
(123, 'quidem provident cumque', 'Architecto explicabo quibusdam culpa ipsa. Incidunt error sed omnis sint ut voluptatem.', '2026-02-19 07:59:43', 'Salle o7', 38, 'tournament', 'Valorant', 'PC', '1v1', 'Règles officielles v3', NULL, NULL, NULL, NULL),
(124, 'eveniet quis in', 'Eveniet autem non quas ea mollitia.', '2025-12-25 01:59:12', 'Salle b4', 39, 'tournament', 'FIFA', 'PS5', '1v1', 'Règles officielles v7', NULL, NULL, NULL, NULL),
(125, 'non deserunt est', 'Beatae quod nulla et sed.', '2025-12-25 03:59:12', 'Salle e6', 39, 'tournament', 'Smash Bros', 'PC', 'Battle Royale', 'Règles officielles v1', NULL, NULL, NULL, NULL),
(126, 'quis iste enim', 'Ipsa qui qui aut culpa non minima perspiciatis similique.', '2025-12-25 02:59:12', 'Salle y8', 39, 'boardgame', NULL, NULL, NULL, NULL, 'Catan', 2, 6, 'Moyen'),
(127, 'corrupti aut quia', 'Est non voluptas cum assumenda voluptate.', '2026-03-09 00:00:17', 'Salle n2', 40, 'boardgame', NULL, NULL, NULL, NULL, 'Catan', 2, 6, 'Moyen'),
(128, 'laboriosam sit eius', 'Provident hic aut possimus quia.', '2026-03-09 03:00:17', 'Salle f7', 40, 'tournament', 'Valorant', 'PC', '5v5', 'Règles officielles v7', NULL, NULL, NULL, NULL),
(129, 'sunt est eum', 'Odit quasi a est nulla quis cumque esse. Consequuntur laudantium cum accusantium repellendus.', '2026-03-08 23:00:17', 'Salle q3', 40, 'tournament', 'Smash Bros', 'Switch', '5v5', 'Règles officielles v8', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `activity_user`
--

DROP TABLE IF EXISTS `activity_user`;
CREATE TABLE IF NOT EXISTS `activity_user` (
  `activity_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`activity_id`,`user_id`),
  KEY `IDX_8E570DDB81C06096` (`activity_id`),
  KEY `IDX_8E570DDBA76ED395` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `activity_user`
--

INSERT INTO `activity_user` (`activity_id`, `user_id`) VALUES
(74, 73),
(75, 55),
(75, 56),
(75, 61),
(75, 73),
(76, 77),
(77, 52),
(77, 57),
(77, 64),
(77, 69),
(77, 77),
(78, 73),
(78, 74),
(78, 78),
(79, 73),
(80, 73),
(81, 55),
(81, 64),
(81, 68),
(81, 72),
(81, 75),
(82, 51),
(82, 59),
(82, 67),
(82, 70),
(83, 55),
(83, 57),
(83, 60),
(83, 66),
(84, 53),
(84, 69),
(84, 71),
(86, 65),
(87, 52),
(87, 54),
(87, 57),
(87, 64),
(87, 71),
(88, 64),
(88, 65),
(88, 71),
(92, 52),
(92, 55),
(92, 78),
(93, 59),
(93, 77),
(93, 78),
(93, 79),
(94, 56),
(94, 68),
(95, 60),
(95, 61),
(95, 63),
(95, 66),
(95, 78),
(96, 56),
(96, 68),
(96, 76),
(97, 56),
(97, 60),
(97, 72),
(99, 57),
(99, 72),
(100, 54),
(100, 64),
(100, 70),
(100, 72),
(100, 74),
(102, 57),
(104, 53),
(104, 55),
(104, 59),
(104, 60),
(104, 63),
(105, 56),
(105, 69),
(106, 50),
(106, 64),
(106, 67),
(106, 70),
(106, 76),
(107, 50),
(107, 68),
(108, 54),
(108, 55),
(108, 65),
(108, 66),
(108, 74),
(109, 66),
(109, 78),
(110, 50),
(110, 55),
(110, 69),
(110, 71),
(111, 60),
(111, 66),
(111, 78),
(113, 56),
(113, 59),
(113, 61),
(113, 68),
(114, 52),
(114, 58),
(114, 71),
(116, 64),
(116, 71),
(118, 52),
(118, 54),
(118, 58),
(118, 76),
(119, 57),
(119, 70),
(119, 71),
(119, 72),
(119, 79),
(120, 53),
(120, 58),
(121, 58),
(122, 64),
(122, 78),
(123, 57),
(123, 60),
(123, 61),
(123, 66),
(124, 72),
(125, 56),
(126, 50),
(126, 63),
(126, 73),
(127, 56),
(127, 57),
(128, 52),
(128, 57),
(128, 73),
(128, 77),
(128, 79),
(129, 61),
(129, 62),
(129, 63);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20260112080000', '2026-01-12 08:00:40', 108),
('DoctrineMigrations\\Version20260112081246', '2026-01-12 08:13:12', 106),
('DoctrineMigrations\\Version20260112095845', '2026-01-12 09:58:53', 156),
('DoctrineMigrations\\Version20260112100440', '2026-01-12 10:05:03', 99),
('DoctrineMigrations\\Version20260113052423', '2026-01-13 05:24:39', 204),
('DoctrineMigrations\\Version20260113065009', '2026-01-13 06:50:23', 191),
('DoctrineMigrations\\Version20260113072732', '2026-01-13 07:27:40', 141),
('DoctrineMigrations\\Version20260113084304', '2026-01-13 08:43:08', 145),
('DoctrineMigrations\\Version20260116085747', '2026-01-16 08:58:19', 388);

-- --------------------------------------------------------

--
-- Structure de la table `event`
--

DROP TABLE IF EXISTS `event`;
CREATE TABLE IF NOT EXISTS `event` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `start_at` datetime NOT NULL,
  `end_at` datetime NOT NULL,
  `capacity` int NOT NULL,
  `organizer_id` int NOT NULL,
  `category` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3BAE0AA7876C4DDA` (`organizer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `event`
--

INSERT INTO `event` (`id`, `title`, `description`, `start_at`, `end_at`, `capacity`, `organizer_id`, `category`, `location`, `image_name`, `updated_at`) VALUES
(21, 'Quaerat voluptate animi.', 'Dolorem non est distinctio nisi sit tempora. Molestiae deleniti voluptatem magnam consectetur. Voluptatum a exercitationem recusandae maiores. Ratione sit rerum quae. Rerum delectus quos impedit esse sunt id harum. Beatae debitis quod laudantium et ut eum numquam. Ex ut consequuntur ut culpa quia voluptatem dolore.', '2026-03-22 20:35:49', '2026-03-23 20:35:49', 492, 46, 'Tournoi E-sport', 'Paris Expo', NULL, NULL),
(22, 'Quisquam molestiae cum maxime.', 'Quidem rerum temporibus sint est. Expedita accusamus laboriosam non error molestiae. Quo quisquam asperiores omnis voluptates. Nihil ut eos ipsa rerum ullam sunt sed rerum. Et amet quas id repudiandae rem quisquam sunt.', '2026-07-01 13:52:41', '2026-07-03 13:52:41', 167, 46, 'Convention', 'Salle des fêtes locale', NULL, NULL),
(23, 'Illo voluptatem deleniti.', 'Sint est qui vero veritatis voluptatem accusantium veniam ipsam. Iste quasi enim expedita tempora nulla voluptatem sunt. Molestias unde pariatur esse maiores iusto repudiandae sed. Ex odit ratione sit laboriosam. Asperiores voluptatem beatae omnis occaecati et optio. Quas eligendi repellendus aut magnam.', '2026-04-13 16:55:11', '2026-04-16 16:55:11', 198, 46, 'Convention', 'Paris Expo', NULL, NULL),
(24, 'Occaecati vero delectus consequuntur qui.', 'Sit vitae ullam corporis inventore alias alias qui. Sint sed et mollitia et deserunt. Non et laboriosam consequatur. Nihil et enim voluptate ducimus esse commodi. Magnam sed recusandae ratione dignissimos. Repudiandae autem officia dolores id.', '2025-12-18 02:07:31', '2025-12-20 02:07:31', 46, 47, 'Jeux de Société', 'Eurexpo Lyon', NULL, NULL),
(25, 'Officia voluptatem nesciunt deleniti.', 'Sint illo pariatur debitis et tempora earum cumque provident. Sit ut recusandae nisi temporibus. Reprehenderit et repellendus maxime quibusdam quod aut. Omnis eum et velit veniam quo vel autem. Eius sint ab impedit in tenetur.', '2026-07-14 11:55:37', '2026-07-17 11:55:37', 105, 46, 'Conférence', 'Paris Expo', NULL, NULL),
(26, 'Necessitatibus natus saepe.', 'Aspernatur assumenda qui aut a. Libero ducimus numquam nesciunt numquam. Quam id eos aut possimus dolorem. Est modi et ipsum in dolore quibusdam. Quod officiis minima est.', '2026-03-19 02:28:56', '2026-03-22 02:28:56', 280, 48, 'Conférence', 'Eurexpo Lyon', NULL, NULL),
(27, 'Sint quia suscipit.', 'Perspiciatis ut et aliquid et laudantium cum et. Ut similique consequatur doloribus quia. Molestiae et ipsa facere consequuntur explicabo quia laboriosam. Vel veniam consequatur sit earum eaque voluptatem quod. Consequatur et sit ullam libero dignissimos et explicabo repudiandae. Molestiae excepturi dolore ipsam et sunt totam commodi sed. Mollitia accusantium at quia consequatur consectetur.', '2026-05-05 11:44:22', '2026-05-07 11:44:22', 169, 49, 'Tournoi E-sport', 'Paris Expo', NULL, NULL),
(28, 'Qui ducimus dicta.', 'Unde animi architecto mollitia vero. Facilis saepe alias assumenda quo deserunt unde. Rerum itaque hic sed id expedita et. Accusamus veritatis eum culpa possimus eaque delectus. Quos est voluptatem totam voluptas sit reiciendis delectus. Rem vel maxime vero modi atque cum illum vel.', '2026-02-23 13:22:18', '2026-02-25 13:22:18', 472, 49, 'Convention', 'Eurexpo Lyon', NULL, NULL),
(29, 'Hic rem modi cum.', 'Amet aperiam ad est amet labore autem dolor. Quia velit et sint quas repudiandae vero expedita. Distinctio ut quam mollitia qui assumenda ad quis eaque. Voluptas minima velit itaque corporis et consequuntur. Voluptatem ad ratione qui mollitia velit qui.', '2026-01-15 22:50:40', '2026-01-17 22:50:40', 151, 49, 'Cosplay', 'Salle des fêtes locale', NULL, NULL),
(30, 'Unde officia numquam aut.', 'Rerum tenetur quidem laborum porro accusamus. Fugit optio omnis quis dolores ut. Omnis ea libero incidunt veniam. Provident rem quis quas dolore asperiores.', '2026-04-13 21:09:58', '2026-04-16 21:09:58', 133, 49, 'Cosplay', 'Discord / Online', NULL, NULL),
(31, 'Omnis sequi voluptate est.', 'Consectetur rerum temporibus natus sequi. Ad tempora voluptate molestias nihil. Assumenda perspiciatis facere ipsa hic voluptates ex vitae. Quam commodi aut impedit quae sunt. Asperiores dignissimos minima facere. Delectus iste dolore ut quis odit sapiente iste.', '2026-02-28 18:29:40', '2026-03-02 18:29:40', 260, 49, 'Tournoi E-sport', 'Discord / Online', NULL, NULL),
(32, 'Dolorem ad non.', 'In maxime in maxime qui. Delectus eveniet vel consequatur voluptatibus quam suscipit. Voluptatem et enim dicta labore. Cum nisi vero illo et et aut. Delectus voluptas similique molestias ut veniam. Velit voluptas et aut molestiae sunt. Et aliquid alias voluptate magnam porro voluptates.', '2026-03-12 20:24:03', '2026-03-14 20:24:03', 217, 45, 'Convention', 'Paris Expo', NULL, NULL),
(33, 'Ut officiis cupiditate officia.', 'Adipisci at iusto tempore non illo consequatur. Quis expedita porro dolores cum odit sed. Maxime non et aut maiores. Et molestias molestias laborum sunt maiores alias.', '2026-06-25 04:27:08', '2026-06-28 04:27:08', 116, 46, 'Convention', 'Discord / Online', NULL, NULL),
(34, 'Ut consequatur consequatur qui.', 'Dolores illo magni delectus libero. Eum ut repellat iste ut aut. Nemo corporis alias numquam quas et facilis laborum. Dicta quasi perferendis iste possimus totam eum. Reprehenderit dolores aut rerum repudiandae voluptas non.', '2026-05-16 12:10:52', '2026-05-17 12:10:52', 472, 47, 'Convention', 'Discord / Online', NULL, NULL),
(35, 'Maxime et et quia molestias.', 'Veritatis dicta non quisquam in molestiae et quidem soluta. Occaecati enim dolorum excepturi dolores quia. Amet accusamus est laboriosam minus. Enim quia et error sint consequatur culpa consectetur.', '2026-06-18 11:34:41', '2026-06-20 11:34:41', 198, 48, 'Jeux de Société', 'Discord / Online', NULL, NULL),
(36, 'Eum accusantium ea rerum.', 'Ipsa quos neque voluptatibus cum. Nihil harum itaque occaecati fuga sit necessitatibus. Aut perferendis ut provident consequatur quo error blanditiis. Hic corrupti et beatae voluptatem.', '2026-07-12 01:23:15', '2026-07-14 01:23:15', 132, 46, 'Convention', 'Eurexpo Lyon', NULL, NULL),
(37, 'Maiores earum voluptate sequi itaque.', 'Architecto excepturi fuga ut in dolor eaque perspiciatis. Molestias error eveniet vel voluptas fuga ab omnis. Mollitia magnam aut iure eligendi. Illo minus consectetur a consectetur. Magni natus asperiores maiores incidunt.', '2025-12-11 16:38:14', '2025-12-12 16:38:14', 230, 48, 'Convention', 'Salle des fêtes locale', NULL, NULL),
(38, 'Vel aut doloremque.', 'Quo iste quaerat laudantium repellat ipsa sint quidem. Facilis excepturi saepe illum et enim. Explicabo voluptatem iure eos itaque odit ducimus. Sapiente magnam asperiores quia quis voluptatem qui. Aut repudiandae ad illo ipsum rerum. Pariatur distinctio eaque inventore officia quo et.', '2026-02-19 00:59:43', '2026-02-21 00:59:43', 139, 47, 'Jeux de Société', 'Paris Expo', NULL, NULL),
(39, 'Ipsum eaque nesciunt assumenda.', 'Rerum ipsam quisquam illum aliquam officiis aliquam. Sed fugiat veritatis rerum nesciunt enim enim. Non aut reiciendis porro. Placeat nam expedita enim atque.', '2025-12-24 21:59:12', '2025-12-26 21:59:12', 197, 49, 'Convention', 'Eurexpo Lyon', NULL, NULL),
(40, 'Numquam sunt possimus.', 'Excepturi voluptatem consequuntur vitae eveniet. Quibusdam consectetur quia nulla aperiam in vel sint odio. Aliquam accusantium alias asperiores dolor molestiae. Architecto sunt doloremque est. Officiis ut velit nihil labore sed est. Facilis illo maiores eligendi voluptas culpa voluptatibus. Et a voluptatem molestiae voluptate ut.', '2026-03-08 17:00:17', '2026-03-11 17:00:17', 377, 45, 'Cosplay', 'Paris Expo', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `event_intervenant`
--

DROP TABLE IF EXISTS `event_intervenant`;
CREATE TABLE IF NOT EXISTS `event_intervenant` (
  `event_id` int NOT NULL,
  `intervenant_id` int NOT NULL,
  PRIMARY KEY (`event_id`,`intervenant_id`),
  KEY `IDX_D859C7DC71F7E88B` (`event_id`),
  KEY `IDX_D859C7DCAB9A1716` (`intervenant_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `event_intervenant`
--

INSERT INTO `event_intervenant` (`event_id`, `intervenant_id`) VALUES
(22, 1),
(22, 9),
(23, 3),
(24, 1),
(24, 7),
(24, 8),
(25, 3),
(26, 7),
(27, 4),
(27, 8),
(27, 9),
(28, 3),
(28, 5),
(29, 4),
(29, 6),
(29, 9),
(30, 4),
(31, 8),
(32, 3),
(32, 5),
(32, 8),
(33, 8),
(34, 9),
(35, 4),
(37, 7),
(37, 9),
(38, 5),
(38, 9),
(38, 10),
(40, 9);

-- --------------------------------------------------------

--
-- Structure de la table `intervenant`
--

DROP TABLE IF EXISTS `intervenant`;
CREATE TABLE IF NOT EXISTS `intervenant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `bio` longtext,
  `image_name` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `intervenant`
--

INSERT INTO `intervenant` (`id`, `name`, `bio`, `image_name`, `updated_at`) VALUES
(1, 'Nicolas Fouquet', 'Odio ipsam sit doloremque ullam. Sit voluptatem voluptatum minus ad debitis ut.', NULL, NULL),
(2, 'Chantal Guillon', 'Ut ex tenetur nihil soluta rerum totam. Itaque culpa laborum sed id.', NULL, NULL),
(3, 'Colette Joly-Andre', 'Dolorum ut doloremque aliquid perspiciatis consequuntur est quam. Et voluptatum rerum numquam dolores qui ratione adipisci molestiae. Officiis quae voluptas quo harum.', NULL, NULL),
(4, 'David Bourdon', 'Et facere tempore sunt cumque. Sed est facilis ut nihil corporis.', NULL, NULL),
(5, 'Céline Masse', 'Unde laudantium et quis ea consectetur. Et incidunt qui rerum porro vitae magni et.', NULL, NULL),
(6, 'Bertrand Hardy', 'Est quia veritatis eius rerum dolor delectus eum. Non et velit labore adipisci.', NULL, NULL),
(7, 'Joseph Germain', 'Doloribus magni cupiditate esse occaecati aut. Laudantium vitae quisquam architecto soluta. Sed expedita deleniti tenetur nobis.', NULL, NULL),
(8, 'Bertrand Vallet', 'Perferendis recusandae et ab ut molestiae consequuntur id. Omnis inventore ducimus porro saepe. Magni reprehenderit et doloribus ea voluptatum nihil suscipit.', NULL, NULL),
(9, 'Julien Guichard', 'Est illum nesciunt omnis. Dolor at nisi qui.', NULL, NULL),
(10, 'Madeleine Perrin', 'Omnis autem iste itaque. Voluptas itaque sequi ducimus et reiciendis quia. Ut nihil et illo itaque non libero et delectus.', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0E3BD61CE16BA31DBBF396750` (`queue_name`,`available_at`,`delivered_at`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(255) NOT NULL,
  `avatar_url` varchar(255) DEFAULT NULL,
  `bio` longtext,
  `favorite_universe` varchar(255) DEFAULT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `profile`
--

INSERT INTO `profile` (`id`, `pseudo`, `avatar_url`, `bio`, `favorite_universe`, `image_name`, `updated_at`) VALUES
(44, 'AdminGeek', NULL, 'Le maître du donjon.', NULL, NULL, NULL),
(45, 'kperon', NULL, 'Quia consequatur fugiat repellat et quia cupiditate.', NULL, NULL, NULL),
(46, 'marc.rousset', NULL, 'Aut qui corporis dolores quidem maxime.', NULL, NULL, NULL),
(47, 'stephane.leconte', NULL, 'Illo ratione voluptatum nihil eveniet animi.', NULL, NULL, NULL),
(48, 'michaud.marc', NULL, 'Dolorem voluptatibus dolores quo est.', NULL, NULL, NULL),
(49, 'hlucas', NULL, 'Distinctio praesentium qui excepturi omnis dolor magnam eaque iusto.', NULL, NULL, NULL),
(50, 'thomas.peron', NULL, NULL, 'Manga', NULL, NULL),
(51, 'maryse20', NULL, NULL, 'Warhammer', NULL, NULL),
(52, 'npoulain', NULL, NULL, 'Warhammer', NULL, NULL),
(53, 'eugene.delahaye', NULL, NULL, 'Warhammer', NULL, NULL),
(54, 'cferrand', NULL, NULL, 'Warhammer', NULL, NULL),
(55, 'martel.juliette', NULL, NULL, 'Star Wars', NULL, NULL),
(56, 'laporte.brigitte', NULL, NULL, 'Marvel', NULL, NULL),
(57, 'kcourtois', NULL, NULL, 'Star Wars', NULL, NULL),
(58, 'boulay.thibault', NULL, NULL, 'Warhammer', NULL, NULL),
(59, 'stephane80', NULL, NULL, 'Zelda', NULL, NULL),
(60, 'guillaume.barbe', NULL, NULL, 'Warhammer', NULL, NULL),
(61, 'anais.garnier', NULL, NULL, 'Marvel', NULL, NULL),
(62, 'susan58', NULL, NULL, 'Star Wars', NULL, NULL),
(63, 'gabriel.georges', NULL, NULL, 'Star Wars', NULL, NULL),
(64, 'vallain', NULL, NULL, 'Warhammer', NULL, NULL),
(65, 'christiane26', NULL, NULL, 'Marvel', NULL, NULL),
(66, 'isabelle.blot', NULL, NULL, 'Warhammer', NULL, NULL),
(67, 'ylaunay', NULL, NULL, 'Warhammer', NULL, NULL),
(68, 'bbertrand', NULL, NULL, 'Marvel', NULL, NULL),
(69, 'gabrielle.bouvier', NULL, NULL, 'Manga', NULL, NULL),
(70, 'olanglois', NULL, NULL, 'Zelda', NULL, NULL),
(71, 'dupont.emilie', NULL, NULL, 'Star Wars', NULL, NULL),
(72, 'madeleine.klein', NULL, NULL, 'Warhammer', NULL, NULL),
(73, 'marchal.alexandre', NULL, NULL, 'Warhammer', NULL, NULL),
(74, 'texier.auguste', NULL, NULL, 'Zelda', NULL, NULL),
(75, 'louis.mathilde', NULL, NULL, 'Star Wars', NULL, NULL),
(76, 'chretien.margot', NULL, NULL, 'Manga', NULL, NULL),
(77, 'remy.alex', NULL, NULL, 'Star Wars', NULL, NULL),
(78, 'qguillot', NULL, NULL, 'Marvel', NULL, NULL),
(79, 'ogauthier', NULL, NULL, 'Marvel', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `registration`
--

DROP TABLE IF EXISTS `registration`;
CREATE TABLE IF NOT EXISTS `registration` (
  `id` int NOT NULL AUTO_INCREMENT,
  `registered_at` datetime NOT NULL,
  `user_id` int NOT NULL,
  `event_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_62A8A7A7A76ED395` (`user_id`),
  KEY `IDX_62A8A7A771F7E88B` (`event_id`)
) ENGINE=MyISAM AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `registration`
--

INSERT INTO `registration` (`id`, `registered_at`, `user_id`, `event_id`) VALUES
(9, '2025-12-20 04:23:29', 72, 21),
(10, '2026-01-13 13:48:20', 66, 21),
(11, '2025-12-22 02:42:12', 65, 21),
(12, '2025-12-17 11:42:11', 71, 21),
(13, '2026-01-13 01:44:51', 69, 21),
(14, '2026-01-05 06:21:52', 62, 21),
(15, '2025-12-20 04:44:31', 60, 21),
(16, '2025-12-29 10:24:59', 74, 21),
(17, '2026-01-07 16:40:59', 75, 21),
(18, '2025-12-29 20:51:49', 78, 21),
(19, '2025-12-28 12:28:16', 52, 21),
(20, '2026-01-02 17:48:44', 55, 21),
(21, '2026-01-12 23:24:37', 67, 21),
(22, '2026-01-07 21:12:07', 60, 22),
(23, '2025-12-20 16:58:23', 75, 22),
(24, '2025-12-19 03:11:23', 53, 22),
(25, '2025-12-20 09:35:48', 52, 22),
(26, '2025-12-20 09:23:02', 63, 22),
(27, '2025-12-20 17:40:42', 79, 22),
(28, '2025-12-19 15:19:31', 51, 22),
(29, '2026-01-04 22:42:23', 68, 22),
(30, '2026-01-07 03:40:40', 73, 22),
(31, '2025-12-19 14:52:06', 55, 22),
(32, '2025-12-24 09:42:40', 65, 22),
(33, '2025-12-25 23:02:04', 62, 22),
(34, '2025-12-26 16:52:45', 56, 22),
(35, '2025-12-25 17:07:18', 71, 23),
(36, '2026-01-04 08:14:23', 66, 23),
(37, '2026-01-01 20:40:34', 65, 23),
(38, '2026-01-05 06:56:40', 68, 23),
(39, '2025-12-30 17:04:30', 58, 23),
(40, '2026-01-15 17:32:11', 51, 23),
(41, '2025-12-16 21:47:42', 52, 23),
(42, '2026-01-12 16:41:30', 73, 23),
(43, '2026-01-08 00:45:40', 69, 24),
(44, '2026-01-05 00:03:58', 55, 24),
(45, '2025-12-30 03:07:00', 75, 24),
(46, '2025-12-20 09:30:37', 57, 24),
(47, '2026-01-14 05:18:31', 65, 24),
(48, '2025-12-17 20:32:44', 70, 24),
(49, '2025-12-20 13:56:10', 51, 24),
(50, '2026-01-07 09:22:56', 76, 24),
(51, '2026-01-09 21:17:00', 78, 24),
(52, '2025-12-29 13:01:04', 73, 24),
(53, '2025-12-31 11:11:05', 63, 24),
(54, '2026-01-06 21:47:29', 54, 24),
(55, '2026-01-08 00:10:28', 64, 24),
(56, '2026-01-05 15:41:35', 73, 25),
(57, '2025-12-20 20:29:28', 64, 25),
(58, '2025-12-29 10:52:43', 59, 25),
(59, '2026-01-06 11:03:34', 55, 25),
(60, '2026-01-07 08:30:14', 56, 25),
(61, '2025-12-26 12:01:56', 65, 25),
(62, '2025-12-30 08:38:20', 72, 25),
(63, '2026-01-05 10:10:19', 71, 25),
(64, '2026-01-10 01:55:29', 51, 25),
(65, '2026-01-15 04:07:35', 79, 26),
(66, '2025-12-26 08:40:12', 75, 26),
(67, '2026-01-12 10:09:43', 78, 26),
(68, '2025-12-25 13:15:54', 56, 26),
(69, '2025-12-19 07:07:38', 77, 26),
(70, '2025-12-30 12:19:43', 63, 27),
(71, '2026-01-07 16:22:04', 73, 27),
(72, '2026-01-04 10:33:08', 78, 27),
(73, '2026-01-03 23:54:53', 56, 27),
(74, '2025-12-21 22:54:52', 74, 27),
(75, '2025-12-24 19:25:25', 52, 27),
(76, '2026-01-10 07:21:38', 57, 27),
(77, '2026-01-05 20:29:22', 68, 28),
(78, '2025-12-28 20:13:47', 64, 28),
(79, '2026-01-04 21:58:24', 72, 28),
(80, '2026-01-04 08:45:50', 66, 28),
(81, '2026-01-02 17:25:09', 77, 28),
(82, '2025-12-31 02:06:55', 79, 29),
(83, '2026-01-08 20:18:03', 51, 29),
(84, '2026-01-13 19:15:07', 66, 29),
(85, '2025-12-21 00:28:39', 53, 29),
(86, '2026-01-14 21:27:57', 58, 29),
(87, '2025-12-20 00:27:52', 50, 29),
(88, '2026-01-02 18:17:54', 54, 29),
(89, '2026-01-10 11:18:55', 61, 29),
(90, '2026-01-01 15:17:59', 63, 29),
(91, '2026-01-01 03:04:36', 73, 29),
(92, '2025-12-21 13:50:23', 65, 29),
(93, '2026-01-09 10:28:26', 52, 29),
(94, '2025-12-16 21:54:11', 59, 30),
(95, '2025-12-28 13:53:32', 79, 30),
(96, '2025-12-25 13:13:42', 53, 30),
(97, '2026-01-08 09:52:26', 72, 30),
(98, '2025-12-22 05:05:02', 55, 30),
(99, '2025-12-26 00:51:51', 71, 30),
(100, '2026-01-08 21:24:47', 51, 30),
(101, '2026-01-10 15:20:15', 69, 31),
(102, '2026-01-11 22:16:31', 61, 31),
(103, '2026-01-14 09:14:39', 77, 31),
(104, '2025-12-27 05:11:54', 51, 31),
(105, '2026-01-07 21:02:17', 65, 31),
(106, '2025-12-26 09:24:20', 56, 31),
(107, '2025-12-28 18:18:58', 73, 31),
(108, '2025-12-21 01:02:36', 64, 31),
(109, '2026-01-10 02:41:57', 73, 32),
(110, '2026-01-10 22:54:20', 66, 32),
(111, '2026-01-04 00:45:28', 65, 32),
(112, '2025-12-26 08:25:03', 61, 32),
(113, '2026-01-04 18:57:56', 68, 32),
(114, '2025-12-21 05:39:32', 54, 32),
(115, '2026-01-14 23:43:55', 62, 32),
(116, '2025-12-26 13:52:54', 59, 32),
(117, '2025-12-16 15:00:41', 52, 32),
(118, '2025-12-22 15:53:40', 50, 33),
(119, '2025-12-28 17:54:30', 77, 33),
(120, '2025-12-18 18:06:04', 75, 33),
(121, '2026-01-15 05:44:34', 65, 33),
(122, '2026-01-10 08:32:28', 70, 33),
(123, '2025-12-21 21:43:18', 69, 33),
(124, '2026-01-07 02:42:07', 71, 33),
(125, '2026-01-07 11:40:03', 58, 33),
(126, '2026-01-04 11:07:54', 71, 34),
(127, '2025-12-21 07:00:11', 55, 34),
(128, '2026-01-04 04:33:44', 53, 34),
(129, '2026-01-07 03:32:09', 75, 34),
(130, '2025-12-24 23:29:26', 52, 34),
(131, '2025-12-30 00:30:27', 72, 34),
(132, '2025-12-21 01:30:16', 69, 35),
(133, '2026-01-04 01:21:43', 68, 35),
(134, '2026-01-06 03:40:04', 56, 35),
(135, '2025-12-28 04:54:44', 59, 35),
(136, '2025-12-22 14:35:59', 61, 35),
(137, '2025-12-17 21:37:52', 70, 35),
(138, '2025-12-25 00:45:24', 65, 35),
(139, '2025-12-29 22:49:31', 71, 35),
(140, '2026-01-09 15:36:25', 77, 35),
(141, '2026-01-08 08:18:10', 62, 35),
(142, '2026-01-07 04:14:11', 52, 35),
(143, '2025-12-27 00:54:13', 78, 35),
(144, '2025-12-25 07:01:15', 67, 35),
(145, '2025-12-18 02:23:53', 51, 35),
(146, '2026-01-12 12:10:11', 57, 36),
(147, '2026-01-04 16:03:57', 71, 36),
(148, '2026-01-05 20:42:06', 77, 36),
(149, '2025-12-19 16:34:13', 55, 36),
(150, '2025-12-20 06:26:58', 60, 36),
(151, '2026-01-15 14:45:26', 78, 36),
(152, '2026-01-10 02:34:14', 51, 36),
(153, '2026-01-14 01:52:03', 68, 37),
(154, '2026-01-11 16:20:05', 65, 37),
(155, '2025-12-21 13:12:41', 79, 37),
(156, '2026-01-06 06:31:20', 52, 37),
(157, '2026-01-06 00:59:52', 78, 37),
(158, '2026-01-01 07:13:18', 71, 37),
(159, '2025-12-22 17:52:40', 57, 37),
(160, '2025-12-20 00:37:35', 63, 37),
(161, '2026-01-15 11:04:46', 58, 37),
(162, '2025-12-24 11:15:42', 53, 37),
(163, '2026-01-16 04:34:01', 50, 37),
(164, '2025-12-30 21:53:11', 59, 37),
(165, '2025-12-24 20:26:30', 70, 37),
(166, '2026-01-09 18:06:24', 74, 37),
(167, '2026-01-06 16:25:41', 51, 37),
(168, '2026-01-05 17:01:40', 78, 38),
(169, '2026-01-10 13:33:16', 66, 38),
(170, '2026-01-15 13:55:16', 61, 38),
(171, '2026-01-02 07:49:57', 63, 38),
(172, '2026-01-12 05:21:35', 65, 38),
(173, '2026-01-07 03:36:44', 71, 38),
(174, '2026-01-01 18:17:01', 50, 38),
(175, '2025-12-25 00:35:24', 77, 38),
(176, '2025-12-29 18:13:37', 52, 38),
(177, '2025-12-21 12:15:12', 57, 38),
(178, '2025-12-27 00:40:35', 67, 38),
(179, '2026-01-03 02:06:04', 72, 38),
(180, '2025-12-31 22:10:14', 56, 38),
(181, '2025-12-30 19:43:53', 73, 38),
(182, '2025-12-30 16:44:09', 55, 38),
(183, '2025-12-26 07:22:13', 75, 39),
(184, '2026-01-14 03:19:19', 76, 39),
(185, '2026-01-08 11:27:19', 69, 39),
(186, '2025-12-22 04:03:00', 50, 39),
(187, '2026-01-13 04:10:54', 62, 39),
(188, '2026-01-14 19:34:33', 66, 40),
(189, '2025-12-29 21:12:41', 56, 40),
(190, '2025-12-22 12:36:15', 55, 40),
(191, '2026-01-03 21:43:00', 76, 40),
(192, '2025-12-22 16:02:01', 63, 40),
(193, '2026-01-01 01:54:26', 77, 40),
(194, '2026-01-08 22:40:45', 72, 40),
(195, '2025-12-22 12:40:19', 68, 40),
(196, '2025-12-19 23:46:34', 64, 40),
(197, '2026-01-07 21:49:44', 52, 40),
(198, '2026-01-05 04:32:47', 60, 40),
(199, '2026-01-16 06:17:05', 51, 40),
(200, '2025-12-24 03:57:48', 54, 40),
(201, '2025-12-23 16:43:01', 67, 40),
(202, '2026-01-15 11:17:04', 73, 40);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649CCFA12B8` (`profile_id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `profile_id`, `created_at`) VALUES
(44, 'admin@geekevents.com', '[\"ROLE_ADMIN\"]', '$2y$13$6Lb2k1vJnUu99mAO8U3Ac.gueUgjwuLa0LI3s8HNP1.lqd.MiamkC', 44, NULL),
(45, 'organizer0@geekevents.com', '[\"ROLE_ORGANIZER\"]', '$2y$13$ANqvXvoMmy6CjF4wK1ThNO.1Qd38u92hNZA/dRJh2iA2z3IQCbvCq', 45, NULL),
(46, 'organizer1@geekevents.com', '[\"ROLE_ORGANIZER\"]', '$2y$13$EgPSOsmBKw.kInkH8d9d8eGJWc4hHh707QGeKpy.D1O2vEtIo55Jm', 46, NULL),
(47, 'organizer2@geekevents.com', '[\"ROLE_ORGANIZER\"]', '$2y$13$Mko89WkBnyN1fQyU4tKuHuXy4/v50vNxxFTJzduhmexEu/.AnkAwe', 47, NULL),
(48, 'organizer3@geekevents.com', '[\"ROLE_ORGANIZER\"]', '$2y$13$.idWrcbPF993ibVqM4N7.exZjJLQCm6Jx6GIf/9nLH/Hu3f9fFO0O', 48, NULL),
(49, 'organizer4@geekevents.com', '[\"ROLE_ORGANIZER\"]', '$2y$13$YhxsHuez0AU30RF6DjV9reP6J6wTAk6jZjEPnENKUpx0lRsuMwzjG', 49, NULL),
(50, 'gabrielle43@pons.com', '[\"ROLE_USER\"]', '$2y$13$dPwLMs2YMg42x4bOrrzrNO2NQEolywFgY4WKzJGrtB4kj81fPDXIq', 50, NULL),
(51, 'jeanne.guerin@bouchet.com', '[\"ROLE_USER\"]', '$2y$13$cfRa94KGANonrt4OT5t7AOmgrsMLd5.LvH9CmIYsoGUX9B95dlX6W', 51, NULL),
(52, 'richard.noel@teixeira.net', '[\"ROLE_USER\"]', '$2y$13$8ZRBl.0dZuguXl94boDPSeHbJ0VDVEXA/v58ATD4KcYfHVh/T/Mqi', 52, NULL),
(53, 'pichon.marguerite@pascal.com', '[\"ROLE_USER\"]', '$2y$13$YsO.X2i8P4vLkRekwyH9luzd6GBh5GxDaDIEfC7O2XbHVzLjAICd2', 53, NULL),
(54, 'raymond60@bousquet.net', '[\"ROLE_USER\"]', '$2y$13$F0RUzhbOxY/2kY.Vqr.zZOkq1NAlpeJSNU7G5r.USfsHQqeNZpp6C', 54, NULL),
(55, 'benoit.roy@orange.fr', '[\"ROLE_USER\"]', '$2y$13$et8KGA.KKcv6FwkEIm9k4uQ457Y2m.YCWVvjc7nW6ToEiBYFZ.mzm', 55, NULL),
(56, 'chevallier.anastasie@tele2.fr', '[\"ROLE_USER\"]', '$2y$13$Jidm2odc8T5.GA79vyoehOPZbi4fRE8.CkuWMcF24EjZ9Bc9ooFgG', 56, NULL),
(57, 'uclement@orange.fr', '[\"ROLE_USER\"]', '$2y$13$HeGo8HdD2l.1PwYcJRLE8u.ScbsDqkcPLXkeXIZ.7N5UdwaCvDuE2', 57, NULL),
(58, 'abrun@bourgeois.fr', '[\"ROLE_USER\"]', '$2y$13$dvdV4mbMr42RR3DeyYXZEOhx0510IE5C416ytCgTat4sB9ywU2tVa', 58, NULL),
(59, 'dominique82@laposte.net', '[\"ROLE_USER\"]', '$2y$13$DpMT4qYzyUr2Q4cOjObbAenbY18T8bxEuyNevr3BzNW89t0HJHP7m', 59, NULL),
(60, 'audrey63@pascal.com', '[\"ROLE_USER\"]', '$2y$13$5rIV40i1fU6qLcQ0mHbc2OPTSLtrAvERoIdkoXtK6uyPBk2iwF2u2', 60, NULL),
(61, 'omahe@carre.org', '[\"ROLE_USER\"]', '$2y$13$ghw5TbcxclI2A01l5uGnUu0md6NTbUIORGVMAEtjENJeRJYmjFKAW', 61, NULL),
(62, 'olivie.wagner@wanadoo.fr', '[\"ROLE_USER\"]', '$2y$13$3d9ws48uO08Rdgcb.cJuEewSbEDv4EMbKhS62A1FvQErzXIMzx5c6', 62, NULL),
(63, 'leduc.virginie@verdier.fr', '[\"ROLE_USER\"]', '$2y$13$0/X8oXBvF4IiLXAYnOPnJe1BWAG4l7a0jjezDx6jNacOD05KcBnPS', 63, NULL),
(64, 'perrin.richard@live.com', '[\"ROLE_USER\"]', '$2y$13$N2gkHfew/piYJZ.W1UypbOfsWpcCL460M3nuQ.lHeh.EBYeQN2dUu', 64, NULL),
(65, 'ylefebvre@pelletier.org', '[\"ROLE_USER\"]', '$2y$13$9K1iBMnDdN06pjbHP09j/.GIF1xCNdroTKEu3/U6bJ10xFHyaAk16', 65, NULL),
(66, 'oguillet@bouvet.fr', '[\"ROLE_USER\"]', '$2y$13$pvJ.4Odvy0lNZFL2D64eXu3.Hy0c22HrFRfHu189l8O1ZOcx3yUda', 66, NULL),
(67, 'tvincent@gauthier.net', '[\"ROLE_USER\"]', '$2y$13$gunBu9Sjbef1MUeJGWLRtOIAH3qOfvem0LcZokYCJs6/ykCeJMA0u', 67, NULL),
(68, 'isabelle36@martineau.com', '[\"ROLE_USER\"]', '$2y$13$lQ0o8GQOuxU8puv4B4En2ew04aJ6x6ibwt2nsWrISotsyzkyjumRO', 68, NULL),
(69, 'manon56@allard.fr', '[\"ROLE_USER\"]', '$2y$13$FihEyUZabNg1BNMoQ0KP/OHZ/pG9bSH3hIjKU0nwjcepZXDmm9dDS', 69, NULL),
(70, 'zacharie.andre@ferreira.com', '[\"ROLE_USER\"]', '$2y$13$gOLWekisiZJ3mMbJvJ/SzOlyBRgoxcJl4j4LyPSW/Pb.bfk1L1QE.', 70, NULL),
(71, 'bouvier.alice@charles.com', '[\"ROLE_USER\"]', '$2y$13$37ftVG5lUJqc.dtp2mbc2uEDfvABLaWGncClKmjGKMRgScCQ743na', 71, NULL),
(72, 'pierre51@gaillard.fr', '[\"ROLE_USER\"]', '$2y$13$lYz1ZncMqiGy0lnMY69cLutRAxt.KgcZkqyMliHzU0rerYEIMu.ka', 72, NULL),
(73, 'bbarbe@bernier.com', '[\"ROLE_USER\"]', '$2y$13$Q2Ipik0Vp5ufGAsT.oxq6OeTWF/G0g0.1m1bWDj0oysRonmwEErly', 73, NULL),
(74, 'xbesnard@hotmail.fr', '[\"ROLE_USER\"]', '$2y$13$W1TsQ/nIyf14qoH/mVNN..MU./2OZIYVjPdm0wmM4Ye8ya7ym17PO', 74, NULL),
(75, 'aurore68@robert.fr', '[\"ROLE_USER\"]', '$2y$13$58Mh30dSdDT1TozVrwyN.u/M9Z65kY7vBvyclWmAacIDfXi1Gyw.q', 75, NULL),
(76, 'adrien.henry@free.fr', '[\"ROLE_USER\"]', '$2y$13$jQJHkcSeGOqkbutVl3i2g.5DFG2mAI.IOkYV6bsOMGuqVBHit8un2', 76, NULL),
(77, 'alexandre10@hotmail.fr', '[\"ROLE_USER\"]', '$2y$13$cCXd3cfUh7jsKQo2QGa0j.UoC5jzjQgV1yHzrnDk6CWCVKW8ojXPa', 77, NULL),
(78, 'constance.blanchet@guerin.com', '[\"ROLE_USER\"]', '$2y$13$7jZBUcESJXLN1o5HRA2z5uCkppBeg.pzZ2lgV5BGo6i2umxAtmUvu', 78, NULL),
(79, 'aurelie03@potier.com', '[\"ROLE_USER\"]', '$2y$13$YA2zvd2Lxn1fiDFCAkCq7uVPIxfv2knM0shV7mrJ5CmTkqZMVeiFy', 79, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
