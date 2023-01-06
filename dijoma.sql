-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 06 jan. 2023 à 18:11
-- Version du serveur : 5.7.36
-- Version de PHP : 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `dijoma`
--

-- --------------------------------------------------------

--
-- Structure de la table `activite`
--

DROP TABLE IF EXISTS `activite`;
CREATE TABLE IF NOT EXISTS `activite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_size` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `activite`
--

INSERT INTO `activite` (`id`, `titre`, `image_name`, `image_size`, `updated_at`, `description`) VALUES
(3, 'Affichage', '63b62ff6bd7e2_82.jpg', 35827, '2023-01-05 02:03:34', 'L’affichage publicitaire est un excellent moyen pour les entreprises de tous secteurs de diffuser un message marketing à leur clientèle.'),
(4, 'Covering', '63b63107123e9_S1.jpg', 185861, '2023-01-05 02:08:07', 'Le covering protège la peinture des intempéries et des UV. Cela permet de donner un coup de neuf à son véhicule. Le film adhésif s\'enlève facilement.'),
(5, 'Balisage', '63b62e3e7299e_10.jpg', 19894, '2023-01-05 01:56:14', 'Afin d’augmenter la visibilité et l’esthétique d’un point de vente et le rendre attractif pour le consommateur, le balisage magasin est un outil marketing indispensable'),
(6, 'Lettrage', '63b631be93c2e_1.jpg', 33347, '2023-01-05 02:11:10', 'L\'objectif de cet outil de communication est d\'attirer les regards et ainsi de véhiculer parfaitement l\'image de marque de l\'entreprise.'),
(7, 'Menuiserie', '63b6321635bf1_9.jpg', 16855, '2023-01-05 02:12:38', 'L\'ensemble des techniques mises en œuvre pour construire des ouvrages de taille relativement petite par la mise en forme et l\'assemblage de menues pièces de bois pour vous.');

-- --------------------------------------------------------

--
-- Structure de la table `act_photos`
--

DROP TABLE IF EXISTS `act_photos`;
CREATE TABLE IF NOT EXISTS `act_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activite_id` int(11) DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_size` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FC72FD179B0F88B1` (`activite_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `act_photos`
--

INSERT INTO `act_photos` (`id`, `activite_id`, `description`, `image_name`, `image_size`, `updated_at`, `position`) VALUES
(4, 3, 'Coca cola', '6.jpg', 27443, '2023-01-01 21:18:35', 1),
(5, 3, 'VOO', '5.jpg', 23088, '2023-01-02 15:42:42', 2),
(6, 3, 'PATATI PATATA', '82.jpg', 35827, '2023-01-02 15:56:46', 3),
(7, 4, 'Voiture rouge', '8.jpg', 29494, '2023-01-02 15:57:17', 1),
(8, 6, 'test', '63b37a8f5e35e_3.jpg', 15581, '2023-01-03 01:45:03', 2),
(9, 6, 'test', '63b37ad19f864_3.jpg', 15581, '2023-01-03 01:46:09', 2),
(10, 3, 'Photo', '63b6358385565_4.jpg', 29743, '2023-01-05 02:27:15', 4),
(11, 3, 'dos', '63b6358e25bd4_9.jpg', 29244, '2023-01-05 02:27:26', 5);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230101143146', '2023-01-01 15:27:41', 23),
('DoctrineMigrations\\Version20230101143253', '2023-01-01 15:27:41', 0),
('DoctrineMigrations\\Version20230101143421', '2023-01-01 15:27:41', 0),
('DoctrineMigrations\\Version20230101144900', '2023-01-01 15:27:41', 0),
('DoctrineMigrations\\Version20230101151647', '2023-01-01 15:27:41', 0),
('DoctrineMigrations\\Version20230101151843', '2023-01-01 15:27:41', 0),
('DoctrineMigrations\\Version20230101152127', '2023-01-01 15:27:41', 0),
('DoctrineMigrations\\Version20230101152233', '2023-01-01 15:27:41', 0),
('DoctrineMigrations\\Version20230101152415', '2023-01-01 15:27:41', 0),
('DoctrineMigrations\\Version20230101152658', '2023-01-01 15:27:41', 0),
('DoctrineMigrations\\Version20230101152737', '2023-01-01 15:27:41', 0),
('DoctrineMigrations\\Version20230101160213', '2023-01-01 16:02:25', 47),
('DoctrineMigrations\\Version20230101175043', '2023-01-01 17:50:54', 24),
('DoctrineMigrations\\Version20230101175231', '2023-01-01 17:52:36', 22),
('DoctrineMigrations\\Version20230101175346', '2023-01-01 17:53:50', 56),
('DoctrineMigrations\\Version20230101175951', '2023-01-01 17:59:54', 40),
('DoctrineMigrations\\Version20230101180102', '2023-01-01 18:01:05', 41),
('DoctrineMigrations\\Version20230101180508', '2023-01-01 18:05:11', 81),
('DoctrineMigrations\\Version20230101180726', '2023-01-01 18:07:29', 440),
('DoctrineMigrations\\Version20230102140607', '2023-01-02 14:06:14', 86),
('DoctrineMigrations\\Version20230102144106', '2023-01-02 14:41:10', 69),
('DoctrineMigrations\\Version20230105015927', '2023-01-05 01:59:33', 556),
('DoctrineMigrations\\Version20230105020132', '2023-01-05 02:01:35', 55),
('DoctrineMigrations\\Version20230105020258', '2023-01-05 02:03:00', 52),
('DoctrineMigrations\\Version20230105020327', '2023-01-05 02:03:31', 60);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `messenger_messages`
--

INSERT INTO `messenger_messages` (`id`, `body`, `headers`, `queue_name`, `created_at`, `available_at`, `delivered_at`) VALUES
(1, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":4:{i:0;s:30:\\\"reset_password/email.html.twig\\\";i:1;N;i:2;a:1:{s:10:\\\"resetToken\\\";O:58:\\\"SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\\":4:{s:65:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0token\\\";s:40:\\\"ERTW4FTq2BoGhdm7P8Gsq1pKSMVxbhKUos0QNFU0\\\";s:69:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0expiresAt\\\";O:17:\\\"DateTimeImmutable\\\":3:{s:4:\\\"date\\\";s:26:\\\"2023-01-02 16:23:17.125610\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:13:\\\"Europe/Berlin\\\";}s:71:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0generatedAt\\\";i:1672669397;s:73:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0transInterval\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:18:\\\"kspdzeta@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:11:\\\"Dijoma MAIL\\\";}}s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:22:\\\"marqueslaw19@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:27:\\\"Your password reset request\\\";s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2023-01-02 15:23:17', '2023-01-02 15:23:17', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `reset_password_request`
--

DROP TABLE IF EXISTS `reset_password_request`;
CREATE TABLE IF NOT EXISTS `reset_password_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_7CE748AA76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(3, 'admin@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$nnMUqmxfMNlD9MM63NpuR.mPwYISy2XqwDB8C4Fg7b4X0PJo9ccFC');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `act_photos`
--
ALTER TABLE `act_photos`
  ADD CONSTRAINT `FK_FC72FD179B0F88B1` FOREIGN KEY (`activite_id`) REFERENCES `activite` (`id`);

--
-- Contraintes pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
