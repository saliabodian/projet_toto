-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 11 Novembre 2016 à 16:10
-- Version du serveur :  10.1.8-MariaDB
-- Version de PHP :  5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `webforce3`
--

DELIMITER $$
--
-- Fonctions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `hello` (`s` CHAR(20)) RETURNS CHAR(50) CHARSET utf8 COLLATE utf8_unicode_ci RETURN CONCAT('Hello, ',s,'!')$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `city`
--

CREATE TABLE `city` (
  `cit_id` int(10) UNSIGNED NOT NULL,
  `country_cou_id` int(10) UNSIGNED NOT NULL,
  `cit_name` varchar(32) DEFAULT NULL,
  `cit_inserted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cit_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `city`
--

INSERT INTO `city` (`cit_id`, `country_cou_id`, `cit_name`, `cit_inserted`, `cit_updated`) VALUES
(1, 1, 'Esch-sur-Alzette', '2016-10-12 17:55:21', '2016-10-14 15:47:39'),
(2, 2, 'Verdun', '2016-10-12 17:55:21', '2016-10-25 10:48:43'),
(3, 1, 'Luxembourg2', '2016-10-12 17:55:45', '2016-10-14 15:53:46'),
(4, 2, 'Metz', '2016-10-12 17:55:45', '2016-10-14 15:47:39'),
(5, 1, 'Differdange', '2016-10-13 07:12:37', '2016-10-14 15:47:39'),
(6, 1, 'Rosport', '2016-10-13 07:14:50', '2016-10-14 15:47:39'),
(7, 1, 'Bascharage', '2016-10-13 07:15:51', '2016-10-14 15:47:39'),
(8, 1, 'Clervaux', '2016-10-13 07:16:27', '2016-10-14 15:47:39'),
(10, 2, 'Strasbourg', '2016-10-13 07:25:13', '2016-10-14 15:47:39'),
(11, 2, 'Nancy', '2016-10-13 07:28:51', '2016-10-14 15:47:39'),
(18, 2, 'Thionville', '2016-10-13 07:29:56', '2016-10-14 15:47:39'),
(19, 3, 'Arlon', '2016-10-25 08:45:16', '2016-10-25 10:47:35'),
(20, 2, 'Longwy', '2016-10-25 08:49:18', '2016-10-25 10:49:36'),
(21, 1, 'Rodange', '2016-10-25 08:50:11', '2016-10-25 10:50:24'),
(22, 1, 'Pissange', '2016-10-25 08:50:52', '2016-10-25 10:51:07'),
(23, 1, 'Pétange', '2016-10-25 08:51:36', '2016-10-25 10:51:46');

--
-- Déclencheurs `city`
--
DELIMITER $$
CREATE TRIGGER `cityUpdate` BEFORE UPDATE ON `city` FOR EACH ROW SET new.cit_updated = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `country`
--

CREATE TABLE `country` (
  `cou_id` int(10) UNSIGNED NOT NULL,
  `cou_name` varchar(32) DEFAULT NULL,
  `cou_inserted` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `country`
--

INSERT INTO `country` (`cou_id`, `cou_name`, `cou_inserted`) VALUES
(1, 'Luxembourg', '2016-10-12 17:54:48'),
(2, 'France', '2016-10-12 17:54:48'),
(3, 'Belgique', '2016-10-13 10:38:25'),
(4, 'Chine', '2016-10-13 10:54:24'),
(5, 'Bangladesh', '2016-10-21 09:08:18'),
(7, 'Malaisie', '2016-10-24 10:22:09');

-- --------------------------------------------------------

--
-- Structure de la table `location`
--

CREATE TABLE `location` (
  `loc_id` int(10) UNSIGNED NOT NULL,
  `city_cit_id` int(10) UNSIGNED NOT NULL,
  `loc_name` varchar(64) DEFAULT NULL,
  `loc_inserted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `location`
--

INSERT INTO `location` (`loc_id`, `city_cit_id`, `loc_name`, `loc_inserted`) VALUES
(1, 1, 'Fit4Coding Esch/Belval', '2016-10-12 17:56:19');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `luxembourgville`
--
CREATE TABLE `luxembourgville` (
);

-- --------------------------------------------------------

--
-- Structure de la table `speciality`
--

CREATE TABLE `speciality` (
  `spe_id` int(10) UNSIGNED NOT NULL,
  `spe_name` varchar(32) DEFAULT NULL,
  `spe_inserted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `speciality`
--

INSERT INTO `speciality` (`spe_id`, `spe_name`, `spe_inserted`) VALUES
(1, 'back-end', '2016-10-12 18:01:17'),
(2, 'front-end', '2016-10-12 18:01:17');

-- --------------------------------------------------------

--
-- Structure de la table `student`
--

CREATE TABLE `student` (
  `stu_id` int(10) UNSIGNED NOT NULL,
  `city_cit_id` int(10) UNSIGNED NOT NULL,
  `training_tra_id` int(10) UNSIGNED NOT NULL,
  `stu_lname` varchar(64) DEFAULT NULL,
  `stu_fname` varchar(64) DEFAULT NULL,
  `stu_email` varchar(255) DEFAULT NULL,
  `stu_image` varchar(255) NOT NULL,
  `stu_age` tinyint(3) UNSIGNED NOT NULL,
  `stu_friendliness` tinyint(3) UNSIGNED NOT NULL,
  `stu_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stu_inserted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `student`
--

INSERT INTO `student` (`stu_id`, `city_cit_id`, `training_tra_id`, `stu_lname`, `stu_fname`, `stu_email`, `stu_image`, `stu_age`, `stu_friendliness`, `stu_updated`, `stu_inserted`) VALUES
(1, 1, 2, 'TASCH', 'Philippe', 'filou@toto.fr', '', 12, 1, '2016-10-14 14:25:12', '2016-10-14 14:25:12'),
(2, 1, 2, 'ROLLAND', 'Marie', 'marie@toto.fr', '', 40, 2, '2016-10-14 14:25:12', '2016-10-14 14:25:12'),
(3, 1, 2, 'CAVRO', 'Michel', 'michou@toto.fr', '', 12, 2, '2016-10-26 09:46:40', '2016-10-14 14:25:12'),
(4, 1, 2, 'THIELLO', 'Ibrahima', 'lakers@toto.fr', '', 24, 5, '2016-10-14 14:25:12', '2016-10-14 14:25:12'),
(5, 1, 2, 'FABRI', 'Paul', 'paulf@toto.fr', '', 17, 3, '2016-10-14 14:25:12', '2016-10-14 14:25:12'),
(6, 1, 2, 'IOANID', 'Paul', 'pauli@toto.fr', '', 57, 4, '2016-10-14 14:25:12', '2016-10-14 14:25:12'),
(7, 5, 1, 'AHRACH', 'Hicham', 'hicham.ahrach@gmail.com', '', 37, 3, '2016-10-14 14:25:12', '2016-10-14 14:25:12'),
(8, 1, 1, 'BODIAN', 'Salia', 'sbodian@yahool.com', '', 28, 4, '2016-10-27 13:21:57', '2016-10-14 14:25:12'),
(9, 5, 1, 'BOUHAMID', 'Malika', 'bouhamid.m@yahool.com', '', 22, 5, '2016-10-27 13:21:57', '2016-10-14 14:25:12'),
(10, 5, 1, 'DE MELO', 'Flavio', 'flaviodemello@gmail.com', '', 27, 1, '2016-10-14 14:25:12', '2016-10-14 14:25:12'),
(11, 7, 1, 'DIOGO', 'Patrick', 'dpatrick94@yahool.com', '', 41, 1, '2016-10-27 13:21:57', '2016-10-14 14:25:12'),
(12, 6, 1, 'DUHR', 'Christopher', 'duhrchristopher@hotmail.com', '', 25, 5, '2016-10-14 14:25:12', '2016-10-14 14:25:12'),
(13, 8, 1, 'EILENBECKER', 'Charles', 'ceilenbecker@yahool.com', '', 23, 2, '2016-10-27 13:21:57', '2016-10-14 14:25:12'),
(14, 3, 1, 'FURFARI', 'Paul', 'furfari.paul@yahool.com', '', 36, 3, '2016-10-27 13:21:57', '2016-10-14 14:25:12'),
(15, 3, 1, 'KAVANAGH', 'Alan', 'alankavanagh@email.lu', '', 32, 3, '2016-10-14 14:25:12', '2016-10-14 14:25:12'),
(16, 4, 3, 'DELTGEN', 'David', 'david@toto.fr', '', 27, 2, '2016-10-14 14:25:12', '2016-10-14 14:25:12'),
(17, 3, 1, 'Vador', 'Dark', 'dark@vad.org', '', 35, 2, '2016-10-26 09:46:40', '2016-10-21 12:39:41'),
(18, 3, 1, 'Kenobi', 'Obi-Wan', 'kenobi@jedi.org', '', 28, 3, '2016-10-26 09:46:07', '2016-10-21 12:39:41'),
(19, 3, 1, 'Solo', 'Han', 'solo@anonymous.com', '', 8, 2, '2016-10-25 08:37:13', '2016-10-21 12:39:41'),
(20, 3, 1, 'Amidala', 'Padmé', 'padme@amidala.naboo', '', 17, 2, '2016-10-26 09:54:22', '2016-10-21 12:39:41'),
(21, 3, 1, 'Goku', 'Son', 'goku@dbz.com', '', 25, 4, '2016-10-26 09:46:07', '2016-10-21 12:39:41'),
(22, 3, 1, '', 'Végéta', 'vegeta@dbz.com', '', 21, 1, '2016-10-26 09:54:22', '2016-10-21 12:39:41'),
(23, 3, 1, 'Sennin', 'Kamé', 'sennin.kame@dbz.com', '', 45, 5, '2016-10-26 09:54:22', '2016-10-21 12:39:41'),
(24, 3, 1, 'Vador', 'Dark', 'dark@vad.org', '', 12, 5, '2016-10-26 09:46:40', '2016-10-21 12:40:42'),
(25, 3, 1, 'Kenobi', 'Obi-Wan', 'kenobi@jedi.org', '', 85, 3, '2016-10-26 09:46:07', '2016-10-21 12:40:42'),
(26, 3, 1, 'Solo', 'Han', 'solo@anonymous.com', '', 25, 2, '2016-10-25 08:37:13', '2016-10-21 12:40:42'),
(27, 3, 1, 'Amidala', 'Padmé', 'padme@amidala.naboo', '', 17, 2, '2016-10-26 09:54:22', '2016-10-21 12:40:42'),
(28, 3, 1, 'Goku', 'Son', 'goku@dbz.com', '', 8, 4, '2016-10-26 09:46:07', '2016-10-21 12:40:42'),
(29, 3, 1, '', 'Végéta', 'vegeta@dbz.com', '', 9, 1, '2016-10-26 09:54:22', '2016-10-21 12:40:42'),
(30, 3, 1, 'Sennin', 'Kamé', 'sennin.kame@dbz.com', '', 11, 5, '2016-10-26 09:54:22', '2016-10-21 12:40:42'),
(31, 3, 1, 'Vador', 'Dark', 'dark@vad.org', '', 8, 4, '2016-10-26 09:46:40', '2016-10-21 12:48:55'),
(32, 3, 1, 'Kenobi', 'Obi-Wan', 'kenobi@jedi.org', '', 48, 3, '2016-10-26 09:46:07', '2016-10-21 12:48:55'),
(33, 3, 1, 'Solo', 'Han', 'solo@anonymous.com', '', 30, 2, '2016-10-25 08:37:13', '2016-10-21 12:48:55'),
(34, 3, 1, 'Amidala', 'Padmé', 'padme@amidala.naboo', '', 100, 2, '2016-10-26 09:54:22', '2016-10-21 12:48:55'),
(35, 3, 1, 'Goku', 'Son', 'goku@dbz.com', '', 17, 4, '2016-10-26 09:46:07', '2016-10-21 12:48:55'),
(36, 3, 1, '', 'Végéta', 'vegeta@dbz.com', '', 19, 1, '2016-10-26 09:54:22', '2016-10-21 12:48:55'),
(37, 3, 1, 'Sennin', 'Kamé', 'sennin.kame@dbz.com', '', 52, 5, '2016-10-26 09:54:22', '2016-10-21 12:48:55'),
(38, 3, 1, 'Vador', 'Dark', 'dark@vad.org', '', 41, 4, '2016-10-26 09:46:40', '2016-10-21 12:52:10'),
(39, 3, 1, 'Kenobi', 'Obi-Wan', 'kenobi@jedi.org', '', 12, 3, '2016-10-26 09:46:07', '2016-10-21 12:52:10'),
(40, 3, 1, 'Solo', 'Han', 'solo@anonymous.com', '', 15, 2, '2016-10-25 08:37:13', '2016-10-21 12:52:10'),
(41, 3, 1, 'Amidala', 'Padmé', 'padme@amidala.naboo', '', 86, 2, '2016-10-26 09:54:22', '2016-10-21 12:52:10'),
(42, 3, 1, 'Goku', 'Son', 'goku@dbz.com', '', 17, 4, '2016-10-26 09:46:07', '2016-10-21 12:52:10'),
(43, 3, 1, '', 'Végéta', 'vegeta@dbz.com', '', 12, 1, '2016-10-26 09:54:22', '2016-10-21 12:52:10'),
(44, 3, 1, 'Sennin', 'Kamé', 'sennin.kame@dbz.com', '', 11, 5, '2016-10-26 09:54:50', '2016-10-21 12:52:10'),
(45, 3, 1, 'Solo', 'Han', 'solo@anonymous.com', '', 50, 2, '2016-10-25 08:37:13', '2016-10-21 12:53:48'),
(46, 23, 3, 'FALL', 'Lamine', 'lamine@yahool.com', '', 78, 5, '2016-10-27 13:21:57', '2016-10-25 10:53:56'),
(47, 21, 3, 'BLANC', 'laurent', 'lblanc@gmail.com', '', 44, 1, '2016-10-26 09:46:07', '2016-10-25 10:57:11'),
(48, 19, 3, 'SHERIFA', 'Ayna', 'sayna@gmail.com', '', 11, 5, '2016-10-26 09:46:07', '2016-10-25 12:14:09'),
(49, 3, 3, 'TRUDOT', 'Jean', 'jtrudo@yahoo.fr', '', 8, 1, '2016-10-26 09:46:07', '2016-10-25 12:20:11'),
(50, 3, 3, 'BADJI', 'Salimata', 'salimata.badji@yahool.com', '', 12, 1, '2016-10-27 13:21:57', '2016-10-25 12:48:53'),
(51, 3, 3, 'FALL', 'Idrissa', 'ifall@jambar.sn', '', 0, 5, '2016-10-26 10:40:08', '2016-10-26 10:40:08'),
(52, 3, 3, 'MBAYE', 'Aby', 'abibatou_mbaye@yahoo.fr', '', 0, 3, '2016-10-28 10:27:50', '2016-10-28 10:27:50'),
(53, 3, 3, 'DANIEL', 'Alan', 'kavangh@gmail.vo', '', 0, 4, '2016-10-28 10:39:01', '2016-10-28 10:39:01'),
(54, 2, 3, 'BODIAN', 'Tabara', 'tabou@gmail.com', '', 0, 5, '2016-10-28 10:43:23', '2016-10-28 10:43:23'),
(55, 3, 3, 'DE MELO', 'Martin', 'fmartin@gmail.com', 'photos/images.png', 0, 5, '2016-10-28 10:56:06', '2016-10-28 10:56:06');

-- --------------------------------------------------------

--
-- Structure de la table `trainer`
--

CREATE TABLE `trainer` (
  `trn_id` int(10) UNSIGNED NOT NULL,
  `city_cit_id` int(10) UNSIGNED NOT NULL,
  `speciality_spe_id` int(10) UNSIGNED NOT NULL,
  `trn_lname` varchar(64) DEFAULT NULL,
  `trn_fname` varchar(64) DEFAULT NULL,
  `trn_email` varchar(255) DEFAULT NULL,
  `trn_inserted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trn_updated` datetime NOT NULL,
  `trn_nb_updates` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `trainer`
--

INSERT INTO `trainer` (`trn_id`, `city_cit_id`, `speciality_spe_id`, `trn_lname`, `trn_fname`, `trn_email`, `trn_inserted`, `trn_updated`, `trn_nb_updates`) VALUES
(1, 2, 1, 'CORDIER', 'Benjamin', 'ben@progweb.fr', '2016-10-12 17:58:49', '0000-00-00 00:00:00', 0),
(2, 4, 2, 'Marty', 'Igor', 'igor@marty.pl', '2016-10-12 18:00:19', '0000-00-00 00:00:00', 0);

--
-- Déclencheurs `trainer`
--
DELIMITER $$
CREATE TRIGGER `trnUpdated` BEFORE UPDATE ON `trainer` FOR EACH ROW SET 
new.trn_updated = now(),
NEW.trn_nb_updates = trn_nb_updates + 1
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `training`
--

CREATE TABLE `training` (
  `tra_id` int(10) UNSIGNED NOT NULL,
  `location_loc_id` int(10) UNSIGNED NOT NULL,
  `tra_start_date` date DEFAULT NULL,
  `tra_end_date` date DEFAULT NULL,
  `tra_inserted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `training`
--

INSERT INTO `training` (`tra_id`, `location_loc_id`, `tra_start_date`, `tra_end_date`, `tra_inserted`) VALUES
(1, 1, '2016-08-31', '2016-12-23', '2016-10-12 17:56:57'),
(2, 1, '2016-04-04', '2016-07-29', '2016-10-12 17:57:13'),
(3, 1, '2015-11-30', '2016-03-25', '2016-10-12 17:57:56');

-- --------------------------------------------------------

--
-- Structure de la table `training_has_trainer`
--

CREATE TABLE `training_has_trainer` (
  `training_tra_id` int(10) UNSIGNED NOT NULL,
  `trainer_trn_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `training_has_trainer`
--

INSERT INTO `training_has_trainer` (`training_tra_id`, `trainer_trn_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `usr_id` int(10) UNSIGNED NOT NULL,
  `usr_password` varchar(255) COLLATE latin1_bin NOT NULL,
  `usr_token` char(32) COLLATE latin1_bin NOT NULL,
  `usr_role` varchar(16) COLLATE latin1_bin NOT NULL,
  `usr_email` varchar(255) COLLATE latin1_bin NOT NULL,
  `usr_date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`usr_id`, `usr_password`, `usr_token`, `usr_role`, `usr_email`, `usr_date_created`) VALUES
(1, '$2y$10$faAnx7aou1MKuOz57X44QuU7NoOrNrS8ViemEW7nVY77cfd9H8CfS', '', 'user', 'salia@gmail.com', '2016-11-02 09:11:39'),
(2, '$2y$10$ZsYA8XzgHMwQ0Oc51StEM.ggB8Cb4QBpgMHd8iM9tkqzmB1j/56ni', '', 'admin', 'sbodian@gmail.com', '2016-11-02 13:09:39'),
(3, '$2y$10$74SBa9gcPbylAb7CN198PecQYLjqlQZD163mwwLuzrBsZw13HLwSe', '', '', 'flavio@demelo.lu', '2016-11-02 14:08:38'),
(4, '$2y$10$Ptc77pWEHe/vcJkOlyB3dOzNCSGF1ytdLincwVeNicGJqaBPzApWW', '', '', 'khone@gmail.com', '2016-11-02 14:16:07'),
(5, '$2y$10$wicAhjGLErnCUfr1MHKvGOOvehYIc0GMRBRb2.spQ2vq3h20TdonG', '', '', 'khone2@gmail.com', '2016-11-02 14:17:11'),
(6, '$2y$10$7jlM2A3beKFbf1LZKyAe0OCDt/YCCY5M2PZ6e/7ZWJyq5luC6EPKC', '', '', 'khone1@gmail.com', '2016-11-02 14:18:04'),
(7, '$2y$10$4Gg3TKVqmehJvXP6HuYfzOuR1LFAz1l9D67yAIdvURAaKRSjSuK.G', '', '', 'khone4@gmail.com', '2016-11-02 14:20:19'),
(8, '$2y$10$tJa00AfQj25gdF6EdugAPOEjk6aZ1styRt3yXIdY2Nxy6CYMTFhtm', '', 'editeur', 'khone5@gmail.com', '2016-11-02 14:23:43'),
(9, '$2y$10$PSWqcu5LVKQ5SvcAvkMaYetHaGlX2zyQEfp19pBAE2QqkAUIZog1m', '', 'visiteur', 'maman@gmail.com', '2016-11-02 14:39:10'),
(10, '$2y$10$sCqrOdgPSXPAdSdA2X/pLej1xSafYnHR8Mcip3Yrw2KyKNZpey/em', '', 'editeur', 'tata@gmail.com', '2016-11-03 14:16:53'),
(11, '$2y$10$tIirkZIoxSs/mpsuJrFa0OVjH8L6eCHIm/74TqWOUsfAofhDnYX/i', '', 'visiteur', 'flavio@elo.lu', '2016-11-03 14:28:44');

-- --------------------------------------------------------

--
-- Structure de la vue `luxembourgville`
--
DROP TABLE IF EXISTS `luxembourgville`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `luxembourgville`  AS  select `city`.`cit_id` AS `cit_id`,`city`.`country_cou_id` AS `country_cou_id`,`city`.`cit_name` AS `cit_name`,`city`.`cit_inserted` AS `cit_inserted`,`city`.`cty_updated` AS `cty_updated` from `city` where (`city`.`country_cou_id` = 1) ;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`cit_id`),
  ADD KEY `city_FKIndex1` (`country_cou_id`);

--
-- Index pour la table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`cou_id`);

--
-- Index pour la table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`loc_id`),
  ADD KEY `location_FKIndex1` (`city_cit_id`);

--
-- Index pour la table `speciality`
--
ALTER TABLE `speciality`
  ADD PRIMARY KEY (`spe_id`);

--
-- Index pour la table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`stu_id`),
  ADD KEY `student_FKIndex1` (`training_tra_id`),
  ADD KEY `student_FKIndex2` (`city_cit_id`);

--
-- Index pour la table `trainer`
--
ALTER TABLE `trainer`
  ADD PRIMARY KEY (`trn_id`),
  ADD KEY `trainer_FKIndex1` (`speciality_spe_id`),
  ADD KEY `trainer_FKIndex2` (`city_cit_id`);

--
-- Index pour la table `training`
--
ALTER TABLE `training`
  ADD PRIMARY KEY (`tra_id`),
  ADD KEY `training_FKIndex1` (`location_loc_id`);

--
-- Index pour la table `training_has_trainer`
--
ALTER TABLE `training_has_trainer`
  ADD PRIMARY KEY (`training_tra_id`,`trainer_trn_id`),
  ADD KEY `training_has_trainer_FKIndex1` (`training_tra_id`),
  ADD KEY `training_has_trainer_FKIndex2` (`trainer_trn_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`usr_id`),
  ADD UNIQUE KEY `usr_email` (`usr_email`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `city`
--
ALTER TABLE `city`
  MODIFY `cit_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT pour la table `country`
--
ALTER TABLE `country`
  MODIFY `cou_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `location`
--
ALTER TABLE `location`
  MODIFY `loc_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `speciality`
--
ALTER TABLE `speciality`
  MODIFY `spe_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `student`
--
ALTER TABLE `student`
  MODIFY `stu_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT pour la table `trainer`
--
ALTER TABLE `trainer`
  MODIFY `trn_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `training`
--
ALTER TABLE `training`
  MODIFY `tra_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `usr_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
