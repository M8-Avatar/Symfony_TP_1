-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 16 jan. 2026 à 04:42
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
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `activity`
--

INSERT INTO `activity` (`id`, `title`, `description`, `start_at`, `room`, `event_id`, `discr`, `game`, `platform`, `format`, `rules`, `game_name`, `min_players`, `max_players`, `complexity_level`) VALUES
(35, 'voluptate pariatur architecto', 'Aut tempora cupiditate repudiandae debitis quidem dolorum. Facere voluptas sed voluptatem.', '2026-09-14 06:37:36', 'Salle a10', 11, 'tournament', 'League of Legends', 'Switch', 'Battle Royale', 'Fair-play obligatoire.', NULL, NULL, NULL, NULL),
(36, 'illo quasi eius', 'Et unde fugit voluptatem cumque odit assumenda ex. Impedit iure blanditiis non exercitationem.', '2026-09-14 09:37:36', 'Salle v7', 11, 'boardgame', NULL, NULL, NULL, NULL, 'Dixit', 2, 5, 'Moyen'),
(37, 'doloribus et asperiores', 'In voluptas officia impedit tempore. Ipsam nobis quia est. Rem fuga omnis consequatur.', '2026-09-14 11:37:36', 'Salle o2', 11, 'boardgame', NULL, NULL, NULL, NULL, 'Catan', 2, 4, 'Moyen'),
(38, 'voluptas architecto error', 'Nobis nisi sit culpa accusamus aperiam natus. Cumque reiciendis fuga sit harum.', '2026-12-21 19:57:32', 'Salle c2', 12, 'tournament', 'Valorant', 'Switch', 'Battle Royale', 'Fair-play obligatoire.', NULL, NULL, NULL, NULL),
(39, 'a enim tempora', 'Assumenda eveniet velit qui nulla non beatae. Dolor inventore ipsum nemo illo et necessitatibus et.', '2026-12-22 02:57:32', 'Salle h6', 12, 'boardgame', NULL, NULL, NULL, NULL, '7 Wonders', 2, 6, 'Moyen'),
(40, 'similique delectus tempora', 'Optio nesciunt quis ducimus aut vero totam. Culpa minima architecto impedit. Totam ab soluta et ex.', '2026-12-21 21:57:32', 'Salle q9', 12, 'tournament', 'CS:GO', 'Switch', '5v5', 'Fair-play obligatoire.', NULL, NULL, NULL, NULL),
(41, 'fugiat qui eligendi', 'Quidem vel rerum omnis aperiam et est. Qui aut fugiat totam autem sed hic non pariatur.', '2026-12-21 20:57:32', 'Salle g8', 12, 'tournament', 'Valorant', 'PS5', 'Battle Royale', 'Fair-play obligatoire.', NULL, NULL, NULL, NULL),
(42, 'accusantium culpa occaecati', 'Repellat laudantium magni quod repellat ea rerum. Tempora sit accusantium praesentium veniam.', '2026-12-22 00:57:32', 'Salle p2', 12, 'tournament', 'League of Legends', 'PC', '1v1', 'Fair-play obligatoire.', NULL, NULL, NULL, NULL),
(43, 'qui dolores ratione', 'Vel voluptatibus repellendus excepturi et. Mollitia nobis eos rerum enim et consequuntur corporis.', '2026-07-01 18:13:40', 'Salle i4', 13, 'tournament', 'Valorant', 'PC', '5v5', 'Fair-play obligatoire.', NULL, NULL, NULL, NULL),
(44, 'exercitationem sequi quaerat', 'Architecto voluptates autem in optio voluptatem dolore. Aut enim ipsa unde ut minima aliquid qui.', '2026-07-01 17:13:40', 'Salle b9', 13, 'boardgame', NULL, NULL, NULL, NULL, '7 Wonders', 2, 8, 'Facile'),
(45, 'aliquam ea vero', 'Officia consequuntur aut odit. Est et quia quis qui repellat est qui quam.', '2026-07-01 16:13:40', 'Salle x6', 13, 'boardgame', NULL, NULL, NULL, NULL, 'Dixit', 2, 4, 'Moyen'),
(46, 'nihil facilis error', 'Nemo quisquam beatae dolorum tempore beatae. Tempore cupiditate soluta et.', '2026-07-01 11:13:40', 'Salle g2', 13, 'boardgame', NULL, NULL, NULL, NULL, 'Dungeons & Dragons', 2, 6, 'Facile'),
(47, 'beatae vel est', 'Natus ratione excepturi est aut. Omnis tenetur quis corrupti magni asperiores omnis repellendus.', '2026-02-01 11:59:03', 'Salle f10', 14, 'boardgame', NULL, NULL, NULL, NULL, '7 Wonders', 2, 7, 'Expert'),
(48, 'consequatur non ut', 'Quis vel ut commodi autem facilis. Quia voluptatum laboriosam commodi nemo fuga libero.', '2026-02-01 08:59:03', 'Salle x3', 14, 'boardgame', NULL, NULL, NULL, NULL, 'Catan', 2, 5, 'Facile'),
(49, 'ut harum accusamus', 'Voluptas minus nesciunt non et aut aliquam. Dolores doloremque quia dicta fugiat aut unde deserunt.', '2026-02-01 10:59:03', 'Salle z4', 14, 'boardgame', NULL, NULL, NULL, NULL, 'Dixit', 2, 10, 'Moyen'),
(50, 'alias eos fugiat', 'Qui dolore rerum quae. Officiis expedita assumenda et porro. Repellat sint ut rerum omnis.', '2026-04-20 00:54:05', 'Salle s4', 15, 'boardgame', NULL, NULL, NULL, NULL, 'Catan', 2, 4, 'Moyen'),
(51, 'architecto quasi sit', 'A sunt odio in libero. Ut architecto delectus exercitationem et aut omnis.', '2026-04-20 09:54:05', 'Salle e9', 15, 'tournament', 'Smash Bros', 'Switch', 'Battle Royale', 'Fair-play obligatoire.', NULL, NULL, NULL, NULL),
(52, 'nobis est ullam', 'Placeat id officia alias voluptatum sunt. Sequi sapiente fugiat voluptatem et iure.', '2026-04-20 05:54:05', 'Salle b4', 15, 'boardgame', NULL, NULL, NULL, NULL, 'Dixit', 2, 4, 'Moyen'),
(53, 'voluptatem odit aliquid', 'Vel saepe aliquam enim vero vitae. Harum et iste deleniti reiciendis ullam accusantium et.', '2026-05-13 02:29:56', 'Salle x4', 16, 'tournament', 'League of Legends', 'PC', 'Battle Royale', 'Fair-play obligatoire.', NULL, NULL, NULL, NULL),
(54, 'facere eum cum', 'In assumenda voluptate voluptatem minima. Placeat impedit blanditiis quia sed ab.', '2026-05-13 00:29:56', 'Salle o2', 16, 'tournament', 'CS:GO', 'PC', '5v5', 'Fair-play obligatoire.', NULL, NULL, NULL, NULL),
(55, 'molestiae sint consequatur', 'Ipsum omnis dicta debitis error sunt. Aliquam possimus dignissimos ut commodi quam nobis doloribus.', '2026-05-13 02:29:56', 'Salle c1', 16, 'boardgame', NULL, NULL, NULL, NULL, 'Catan', 2, 9, 'Facile'),
(56, 'quis ea dolore', 'Hic vitae repudiandae quisquam id. Ut rerum est beatae. Expedita cum aspernatur tempora.', '2026-12-09 22:07:49', 'Salle i7', 17, 'boardgame', NULL, NULL, NULL, NULL, '7 Wonders', 2, 5, 'Expert'),
(57, 'voluptas aut molestiae', 'Et unde sed enim in mollitia. Facilis dolores qui temporibus facilis aliquam distinctio atque.', '2026-12-09 20:07:49', 'Salle t2', 17, 'tournament', 'League of Legends', 'PS5', '1v1', 'Fair-play obligatoire.', NULL, NULL, NULL, NULL),
(58, 'dolorum unde vero', 'Excepturi quasi fuga sed. Et voluptatum et quis dignissimos.', '2026-12-09 15:07:49', 'Salle s5', 17, 'tournament', 'CS:GO', 'Switch', '5v5', 'Fair-play obligatoire.', NULL, NULL, NULL, NULL),
(59, 'tempora odit qui', 'Autem et et saepe praesentium perferendis. Et eos repudiandae doloribus fugiat expedita.', '2026-12-09 22:07:49', 'Salle i5', 17, 'boardgame', NULL, NULL, NULL, NULL, '7 Wonders', 2, 10, 'Moyen'),
(60, 'vel autem qui', 'Et illum ut ullam dolor. Eum officiis id sit explicabo sequi consequatur.', '2026-12-09 23:07:49', 'Salle d1', 17, 'boardgame', NULL, NULL, NULL, NULL, '7 Wonders', 2, 6, 'Facile'),
(61, 'consequatur fuga iusto', 'Dicta rem animi officiis. Asperiores quia voluptate sit asperiores dolorem quod.', '2026-02-08 04:50:24', 'Salle c3', 18, 'tournament', 'Valorant', 'PS5', '5v5', 'Fair-play obligatoire.', NULL, NULL, NULL, NULL),
(62, 'tenetur rerum iure', 'Rem nulla nisi consequuntur. Ab nulla repellat ut corrupti non. Et rerum saepe modi deserunt.', '2026-02-08 05:50:24', 'Salle c2', 18, 'tournament', 'Smash Bros', 'Switch', 'Battle Royale', 'Fair-play obligatoire.', NULL, NULL, NULL, NULL),
(63, 'rem nobis veniam', 'Iure non ut aut ipsa deleniti saepe et. Fugiat non accusantium et aut nam.', '2026-02-08 02:50:24', 'Salle m4', 18, 'tournament', 'Valorant', 'PS5', 'Battle Royale', 'Fair-play obligatoire.', NULL, NULL, NULL, NULL),
(64, 'molestiae non quod', 'Ut corporis fuga corrupti ducimus reiciendis aut iure. Dicta at neque non.', '2026-10-15 22:22:30', 'Salle w10', 19, 'boardgame', NULL, NULL, NULL, NULL, 'Dungeons & Dragons', 2, 8, 'Expert'),
(65, 'quis ut ullam', 'Ex debitis quisquam ducimus aut. Ea iure quis magnam voluptatem.', '2026-10-15 21:22:30', 'Salle b9', 19, 'tournament', 'Valorant', 'PC', '5v5', 'Fair-play obligatoire.', NULL, NULL, NULL, NULL),
(66, 'et dolore animi', 'Incidunt ut enim mollitia quis labore. Omnis nesciunt est qui nam. Voluptatem ipsa optio quisquam.', '2026-10-15 13:22:30', 'Salle y5', 19, 'tournament', 'CS:GO', 'PC', '1v1', 'Fair-play obligatoire.', NULL, NULL, NULL, NULL),
(67, 'tenetur atque nulla', 'Qui eius officia in. Aut cupiditate et qui occaecati. Quaerat at maiores tenetur est ipsam officia.', '2026-10-15 13:22:30', 'Salle q1', 19, 'tournament', 'Valorant', 'PC', '1v1', 'Fair-play obligatoire.', NULL, NULL, NULL, NULL),
(68, 'culpa id nemo', 'Et est at non ab minus. Dolor atque modi saepe id placeat voluptatum et.', '2026-03-10 14:35:41', 'Salle g4', 20, 'tournament', 'Smash Bros', 'Switch', '1v1', 'Fair-play obligatoire.', NULL, NULL, NULL, NULL),
(69, 'aliquam pariatur praesentium', 'Sunt quas aut sit qui minima. Ut unde dolorem rerum ipsam deleniti. Blanditiis sed et sequi ullam.', '2026-03-10 09:35:41', 'Salle a2', 20, 'tournament', 'Valorant', 'PS5', '5v5', 'Fair-play obligatoire.', NULL, NULL, NULL, NULL),
(70, 'nihil ipsam ad', 'Debitis ducimus aliquam sed. Qui qui vel iure autem aut vero. Magni vel ratione sit qui sunt.', '2026-03-10 09:35:41', 'Salle b2', 20, 'boardgame', NULL, NULL, NULL, NULL, '7 Wonders', 2, 10, 'Expert'),
(71, 'aspernatur sit vel', 'Saepe et asperiores veritatis aliquam. Dolorem atque aut et dignissimos error est laudantium.', '2026-03-10 10:35:41', 'Salle t5', 20, 'boardgame', NULL, NULL, NULL, NULL, 'Catan', 2, 9, 'Moyen'),
(72, 'tempore id quasi', 'Pariatur dolores accusamus magni quis quo nam. Asperiores dolorum iusto doloribus qui.', '2026-03-10 12:35:41', 'Salle c3', 20, 'tournament', 'League of Legends', 'PC', 'Battle Royale', 'Fair-play obligatoire.', NULL, NULL, NULL, NULL);

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
(35, 22),
(35, 30),
(35, 38),
(35, 40),
(35, 41),
(35, 43),
(36, 22),
(36, 24),
(36, 31),
(36, 32),
(36, 38),
(36, 39),
(36, 41),
(37, 22),
(37, 23),
(37, 24),
(37, 25),
(37, 28),
(37, 29),
(37, 32),
(37, 33),
(37, 42),
(37, 43),
(38, 24),
(38, 26),
(38, 27),
(38, 35),
(38, 42),
(39, 22),
(39, 25),
(39, 31),
(39, 39),
(39, 42),
(39, 43),
(40, 22),
(40, 26),
(40, 31),
(40, 33),
(40, 37),
(40, 43),
(41, 28),
(41, 29),
(41, 36),
(41, 37),
(41, 40),
(41, 42),
(43, 24),
(43, 33),
(43, 35),
(43, 43),
(44, 22),
(44, 23),
(44, 31),
(44, 32),
(44, 33),
(44, 37),
(45, 29),
(45, 38),
(45, 39),
(46, 23),
(46, 38),
(47, 23),
(47, 26),
(47, 29),
(47, 30),
(47, 33),
(47, 34),
(47, 37),
(47, 39),
(47, 40),
(47, 41),
(48, 23),
(48, 25),
(48, 27),
(48, 39),
(49, 22),
(49, 24),
(49, 31),
(49, 32),
(50, 32),
(50, 42),
(52, 26),
(52, 39),
(53, 22),
(53, 33),
(53, 35),
(53, 36),
(53, 39),
(53, 42),
(54, 22),
(54, 26),
(54, 30),
(54, 34),
(54, 36),
(54, 40),
(54, 41),
(54, 43),
(55, 22),
(55, 24),
(55, 27),
(55, 32),
(55, 34),
(55, 35),
(55, 39),
(55, 40),
(55, 42),
(56, 22),
(56, 23),
(56, 24),
(56, 26),
(56, 28),
(56, 33),
(56, 34),
(56, 38),
(56, 40),
(56, 42),
(57, 23),
(57, 24),
(57, 26),
(57, 42),
(58, 35),
(58, 36),
(58, 37),
(58, 39),
(58, 42),
(58, 43),
(59, 22),
(59, 33),
(59, 34),
(59, 35),
(59, 40),
(59, 43),
(60, 23),
(60, 29),
(60, 34),
(60, 35),
(60, 36),
(60, 37),
(60, 40),
(61, 30),
(61, 31),
(61, 33),
(61, 41),
(62, 31),
(62, 34),
(62, 35),
(62, 41),
(62, 42),
(63, 22),
(63, 37),
(63, 41),
(64, 22),
(64, 23),
(64, 28),
(64, 29),
(64, 30),
(64, 38),
(64, 39),
(65, 22),
(65, 25),
(65, 28),
(65, 30),
(65, 33),
(65, 34),
(65, 38),
(65, 40),
(65, 41),
(65, 42),
(66, 32),
(66, 35),
(66, 37),
(66, 43),
(67, 22),
(67, 27),
(67, 33),
(68, 27),
(68, 28),
(68, 29),
(68, 33),
(68, 35),
(68, 42),
(69, 22),
(69, 24),
(69, 31),
(69, 36),
(69, 38),
(70, 29),
(71, 24),
(71, 29),
(71, 30),
(71, 34),
(71, 35),
(71, 36),
(71, 39),
(72, 22),
(72, 26),
(72, 30),
(72, 31),
(72, 36),
(72, 37),
(72, 41),
(72, 42),
(72, 43);

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
('DoctrineMigrations\\Version20260113084304', '2026-01-13 08:43:08', 145);

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
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `event`
--

INSERT INTO `event` (`id`, `title`, `description`, `start_at`, `end_at`, `capacity`, `organizer_id`, `category`, `location`, `image_name`, `updated_at`) VALUES
(11, 'Et in.', 'Ratione inventore id neque amet dolor aspernatur. Odit consequatur voluptas quidem expedita optio et.', '2026-09-14 01:37:36', '2026-09-17 01:37:36', 996, 39, 'Conférence', 'Accor Arena', NULL, NULL),
(12, 'Fugiat nemo voluptatem qui.', 'Ea eum at aut accusantium labore est. Eius qui debitis maiores sequi. Quis rerum dolore velit sint voluptas.', '2026-12-21 17:57:32', '2026-12-22 17:57:32', 550, 32, 'Soirée Jeux', 'Paris Expo', NULL, NULL),
(13, 'Voluptate et iusto.', 'Ut ab omnis aut ab provident nobis. Repudiandae quo qui consequatur provident officia esse voluptatem laudantium. Deleniti asperiores neque nisi assumenda similique. Vero repellendus quia sequi nam iste ipsa beatae.', '2026-07-01 09:13:40', '2026-07-02 09:13:40', 4919, 29, 'Conférence', 'Salle des fêtes de Trifouilly', NULL, NULL),
(14, 'Dolores sequi recusandae nulla.', 'Et officiis et asperiores quisquam et. Reiciendis et nihil quaerat voluptas rerum ipsum.', '2026-02-01 06:59:03', '2026-02-02 06:59:03', 3988, 38, 'Conférence', 'Accor Arena', NULL, NULL),
(15, 'At temporibus corporis deserunt.', 'Voluptatem dignissimos sed numquam. Nulla nostrum maxime perspiciatis dignissimos dolore. Consequatur omnis aut et adipisci aliquam. Veritatis maiores dolor modi omnis et quo.', '2026-04-19 23:54:05', '2026-04-20 23:54:05', 1370, 32, 'Convention', 'Salle des fêtes de Trifouilly', NULL, NULL),
(16, 'Et sint.', 'Sunt dolorem omnis et maxime. Minus error saepe unde voluptas. Voluptates non praesentium beatae nesciunt iste amet omnis. Atque ut aperiam eius hic adipisci enim et.', '2026-05-12 23:29:56', '2026-05-14 23:29:56', 1743, 35, 'Conférence', 'Accor Arena', NULL, NULL),
(17, 'Ut et laudantium sunt.', 'Suscipit sed labore ipsam illo. Assumenda quis facere vitae nulla ad quaerat. Architecto qui et et qui. Sint ea autem laudantium qui expedita sit dolor. Aliquam occaecati provident suscipit tempore possimus.', '2026-12-09 13:07:49', '2026-12-11 13:07:49', 1838, 43, 'Convention', 'Eurexpo Lyon', NULL, NULL),
(18, 'Est voluptate minus perspiciatis.', 'Eligendi eum dolore excepturi voluptas incidunt officiis aut. Aut quia nemo dolorem nam. Omnis quasi quibusdam sunt recusandae nesciunt a.', '2026-02-07 21:50:24', '2026-02-09 21:50:24', 2328, 41, 'Soirée Jeux', 'Paris Expo', NULL, NULL),
(19, 'Commodi consequatur cumque.', 'Soluta sed blanditiis accusamus officia aut et sit tenetur. Adipisci possimus nesciunt eum architecto et velit reprehenderit. Reprehenderit voluptas numquam voluptas quaerat placeat ut et. Est eum nihil vel officia.', '2026-10-15 12:22:30', '2026-10-17 12:22:30', 3438, 22, 'Conférence', 'Eurexpo Lyon', NULL, NULL),
(20, 'Et provident qui consequatur exercitationem.', 'Accusamus doloremque fugit animi minus. Aspernatur unde id mollitia eaque vero. Quisquam eaque quam accusamus amet ut repellat perferendis et. Qui vel nesciunt quas enim architecto. Sed quia officiis corrupti culpa rerum voluptatem et.', '2026-03-10 04:35:41', '2026-03-13 04:35:41', 2952, 36, 'Soirée Jeux', 'Accor Arena', NULL, NULL);

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
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `profile`
--

INSERT INTO `profile` (`id`, `pseudo`, `avatar_url`, `bio`, `favorite_universe`, `image_name`, `updated_at`) VALUES
(22, 'AdminGeek', 'https://api.dicebear.com/7.x/avataaars/svg?seed=Admin', 'Administrateur suprême de GeekEvents.', 'Matrix', NULL, NULL),
(23, 'GamerTest', NULL, 'Compte de test pour vérifier les inscriptions.', 'Nintendo', NULL, NULL),
(24, 'claire97', 'https://api.dicebear.com/7.x/avataaars/svg?seed=ischneider@hotmail.fr', 'Sed nostrum veritatis error dolor beatae nihil.', 'Warhammer', NULL, NULL),
(25, 'ppasquier', 'https://api.dicebear.com/7.x/avataaars/svg?seed=capucine.auger@yahoo.fr', 'Dolorem asperiores delectus veritatis voluptas dolor rerum qui qui non.', 'Nintendo', NULL, NULL),
(26, 'christelle18', 'https://api.dicebear.com/7.x/avataaars/svg?seed=andree30@marty.fr', 'Dolor eum voluptatum tempore nam expedita tempora at architecto commodi et soluta.', 'Warhammer', NULL, NULL),
(27, 'nicolas61', 'https://api.dicebear.com/7.x/avataaars/svg?seed=aime.lemoine@laposte.net', 'Qui optio similique ipsam quo et eos esse eum nulla.', 'Marvel', NULL, NULL),
(28, 'juliette87', 'https://api.dicebear.com/7.x/avataaars/svg?seed=petit.paulette@yahoo.fr', 'Et veritatis numquam nihil unde porro quam quibusdam delectus asperiores.', 'Nintendo', NULL, NULL),
(29, 'echarrier', 'https://api.dicebear.com/7.x/avataaars/svg?seed=olefevre@ferreira.net', 'Amet id rem dolor itaque et adipisci corporis unde consequuntur ipsam quis voluptatem.', 'Manga', NULL, NULL),
(30, 'zgilles', 'https://api.dicebear.com/7.x/avataaars/svg?seed=alecoq@dbmail.com', 'Dolores rerum quaerat nostrum atque voluptatem voluptatem cum ducimus iure doloribus quae temporibus sed.', 'Manga', NULL, NULL),
(31, 'isaac38', 'https://api.dicebear.com/7.x/avataaars/svg?seed=uaubert@sfr.fr', 'Non voluptas architecto asperiores quia inventore rem sed aut provident debitis numquam quaerat dolorem modi.', 'Star Wars', NULL, NULL),
(32, 'cecile.costa', 'https://api.dicebear.com/7.x/avataaars/svg?seed=olivier95@marchal.com', 'Dolorem est aperiam architecto at consequatur sit ad aut doloribus.', 'Nintendo', NULL, NULL),
(33, 'gonzalez.zacharie', 'https://api.dicebear.com/7.x/avataaars/svg?seed=shamel@yahoo.fr', 'Aut maiores soluta assumenda quia et qui odit ut.', 'Nintendo', NULL, NULL),
(34, 'thierry31', 'https://api.dicebear.com/7.x/avataaars/svg?seed=xperon@lecomte.net', 'At suscipit omnis maiores sapiente enim numquam et ut.', 'Warhammer', NULL, NULL),
(35, 'barbe.marine', 'https://api.dicebear.com/7.x/avataaars/svg?seed=bbourdon@didier.com', 'Architecto autem enim velit excepturi sed iste voluptate quia.', 'Warhammer', NULL, NULL),
(36, 'marc89', 'https://api.dicebear.com/7.x/avataaars/svg?seed=bernard08@besson.net', 'Aut rerum cumque id accusantium qui mollitia aut sed.', 'Star Wars', NULL, NULL),
(37, 'thierry62', 'https://api.dicebear.com/7.x/avataaars/svg?seed=nathalie15@orange.fr', 'Voluptatem officiis perspiciatis omnis reprehenderit exercitationem facere est repellendus recusandae dicta eius.', 'Warhammer', NULL, NULL),
(38, 'suzanne10', 'https://api.dicebear.com/7.x/avataaars/svg?seed=iperrot@orange.fr', 'Eligendi alias voluptatem vel ducimus repudiandae est asperiores eos iste autem temporibus sit earum.', 'Manga', NULL, NULL),
(39, 'david.paul', 'https://api.dicebear.com/7.x/avataaars/svg?seed=jerome34@free.fr', 'Maxime et et qui consequatur consequatur officiis expedita ducimus asperiores.', 'Warhammer', NULL, NULL),
(40, 'isaac91', 'https://api.dicebear.com/7.x/avataaars/svg?seed=victor.joly@rocher.fr', 'Occaecati porro atque quibusdam reprehenderit aperiam voluptates totam quo qui voluptatum dolores soluta.', 'Marvel', NULL, NULL),
(41, 'begue.marie', 'https://api.dicebear.com/7.x/avataaars/svg?seed=margaud58@dbmail.com', 'Fugit vitae sequi et et qui molestiae dignissimos veritatis voluptatem voluptatibus.', 'Manga', NULL, NULL),
(42, 'lucie.maury', 'https://api.dicebear.com/7.x/avataaars/svg?seed=emile.martin@bourdon.org', 'Quaerat aut ad voluptas aut sunt ea aut.', 'Warhammer', NULL, NULL),
(43, 'coulon.honore', 'https://api.dicebear.com/7.x/avataaars/svg?seed=aurelie.lopes@letellier.org', 'Corporis quia libero culpa ducimus sunt ad eaque dolorem.', 'Manga', NULL, NULL);

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `registration`
--

INSERT INTO `registration` (`id`, `registered_at`, `user_id`, `event_id`) VALUES
(3, '2026-01-13 09:38:38', 23, 14);

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
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `profile_id`, `created_at`) VALUES
(22, 'admin@geekevents.com', '[\"ROLE_ORGANIZER\"]', '$2y$13$aDikRA72ynxxHi6FBFTsxeh/VvWjx6huVEDuJDP1XKQX2yPQwemBa', 22, '2026-01-13 09:37:37'),
(23, 'user@geekevents.com', '[\"ROLE_USER\"]', '$2y$13$LGBnku.1ax99D123wryZS.CCNkkt5rbcBpx2d6sjRJnODZF8jphrm', 23, NULL),
(24, 'ischneider@hotmail.fr', '[\"ROLE_USER\"]', '$2y$13$BiSQz5F9i5sVky6oeTKuK.E9N1mjgI.i9XboLbclPVcznnVbBrBOy', 24, '2025-06-29 06:13:44'),
(25, 'capucine.auger@yahoo.fr', '[\"ROLE_USER\"]', '$2y$13$aTBkxnS5c5lgcHdqZzk/nuWwzLQpxgvWZ.bBx5ynoQ7KcSnl2QeX.', 25, '2025-07-19 15:31:24'),
(26, 'andree30@marty.fr', '[\"ROLE_USER\"]', '$2y$13$jdgV7s3xiDk0tIR/3BJb8ucYrF/0rbUgXOxCiV/YgFifXoVVONFem', 26, '2025-03-23 21:49:07'),
(27, 'aime.lemoine@laposte.net', '[\"ROLE_USER\"]', '$2y$13$97RqK3Y8ZNMJF894PX.ZcOGpBO.YEvdi.6uhSnGXimM5SFAEJPEVi', 27, '2025-04-22 07:46:17'),
(28, 'petit.paulette@yahoo.fr', '[\"ROLE_USER\"]', '$2y$13$PNRfuzqRsXQvPDSs8QLjm.Apqz7hez5pY8QLSzVK99Qv8qQkdxupq', 28, '2025-08-02 01:55:17'),
(29, 'olefevre@ferreira.net', '[\"ROLE_USER\"]', '$2y$13$TONiD.mR6Svko4RmqKR8RuWAOR6uWQRpw9RIQlayaGScozZOayQ9S', 29, '2025-07-26 13:46:07'),
(30, 'alecoq@dbmail.com', '[\"ROLE_USER\"]', '$2y$13$DWgHDp8Kb1/1vDpM76K2LOBpK0NH.vtRG772AaWL//k4l/zqwTjOG', 30, '2025-08-12 08:30:09'),
(31, 'uaubert@sfr.fr', '[\"ROLE_USER\"]', '$2y$13$vZwUg2rUxju4VskIxvDR5OkiAP7.fNpAawO552AT/pZ2Bgf2hxC2.', 31, '2026-01-11 03:27:11'),
(32, 'olivier95@marchal.com', '[\"ROLE_USER\"]', '$2y$13$ph1OrxRYmCx.h3a2SF2Bre.wA5dVciw04wjoEXHiU7ehzMNWWHXxS', 32, '2025-09-03 12:58:51'),
(33, 'shamel@yahoo.fr', '[\"ROLE_USER\"]', '$2y$13$o70Svm6wJ1RZ8zeyFiYNF.rMNhxSqHO0IzNgzf1Sr9HW0oHUASqwm', 33, '2025-07-09 11:10:25'),
(34, 'xperon@lecomte.net', '[\"ROLE_USER\"]', '$2y$13$bWTM4zi3r49Jxc6oQnh/cOGKag4b/IBY.ExpJMJBj4Fms2Gow.80S', 34, '2025-03-07 20:33:03'),
(35, 'bbourdon@didier.com', '[\"ROLE_USER\"]', '$2y$13$abQXpvKezcp0QfqrMAm4a.wOpjUrM0hlKUAMNWcOVdw8hM8MM228y', 35, '2025-12-20 08:13:51'),
(36, 'bernard08@besson.net', '[\"ROLE_USER\"]', '$2y$13$aZqHUtv4Lt5hhkiY4SuXn.siL9yIwGYKAShmvb.Vw1lu4vmzXFdxq', 36, '2025-12-14 20:37:08'),
(37, 'nathalie15@orange.fr', '[\"ROLE_USER\"]', '$2y$13$7hPkvwxIKzFjAXgDwx86a.wq1bKGA.a4dhWs040PkI70D6hbRD4Uu', 37, '2025-06-28 00:26:33'),
(38, 'iperrot@orange.fr', '[\"ROLE_USER\"]', '$2y$13$d8TtU/Vbz0MpvVIVVGrlrOGqpOxhh/4fVj5uBOnxnvDoUOL1OOaPO', 38, '2025-05-28 00:37:20'),
(39, 'jerome34@free.fr', '[\"ROLE_USER\"]', '$2y$13$L8aHMVN1iDXGZfRlG7GUX.5ktyp2cbommsmPWt6IQfFiugsCMEPeu', 39, '2025-03-25 09:00:22'),
(40, 'victor.joly@rocher.fr', '[\"ROLE_USER\"]', '$2y$13$2jJshKeujTelPvywC8W3GOlMNaqeCErt4r8JyKltJIQt/gqOF/z7q', 40, '2025-07-18 00:54:37'),
(41, 'margaud58@dbmail.com', '[\"ROLE_USER\"]', '$2y$13$yRT/PpGCmI2sLX/jj7W3IeFp67sUVEX0u.zAUbw1vLB.EYgCseUaa', 41, '2025-03-28 00:25:25'),
(42, 'emile.martin@bourdon.org', '[\"ROLE_USER\"]', '$2y$13$jGC9tD1DoCY4xj2MGp9d9uCREUo1DYWMeg2rIFVJB3xe.NZRhDN9O', 42, '2025-12-21 18:36:37'),
(43, 'aurelie.lopes@letellier.org', '[\"ROLE_USER\"]', '$2y$13$5nG/cxVYTnKCI6QL6qcml.Pnb.IdmfcTBlA8qTiRcfh9JV8ijmqma', 43, '2025-01-19 09:00:21');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
