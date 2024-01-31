-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 31 jan. 2024 à 15:06
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
DROP DATABASE IF EXISTS library;
CREATE DATABASE IF NOT EXISTS library; 
USE library;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `library`
--

-- --------------------------------------------------------

--
-- Structure de la table `authors`
--

CREATE TABLE IF NOT EXISTS `authors` (
  `au_id` int(11) NOT NULL,
  `au_fname` varchar(100) DEFAULT NULL,
  `au_lname` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `contract` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `authors`
--

INSERT INTO `authors` (`au_id`, `au_fname`, `au_lname`, `phone`, `address`, `city`, `state`, `zip`, `contract`) VALUES
(1, 'Manu', 'Dibango', '+3359895965', '3 PLACE SAINTE CLAIRE\r\n', 'GRENOBLE', 'FRANCE', '49270', 200),
(2, 'Alain \r\n', 'Hertz', '+45678945132', '1750 Avenue Van Horne', 'Montreal', 'Quebec', 'H2L2X5', 320),
(3, 'Kalla', 'Christiant', '+4505935965', '818 Upper Aboujagane rt', 'Moncton', 'New Brunswick', 'NB E1C 1R9', 122),
(4, 'Merley', 'Bob', '+4564894522', '450 Londres', 'Trois-Rivieres', 'Quebec', 'H2L3X5', 130),
(5, 'Cheick', 'Anta Diop', '+221 33445521', 'Universite Cheick Anta Dipop', 'Dakar', 'Senegal', 'SN492343', 355);

-- --------------------------------------------------------

--
-- Structure de la table `employees`
--

CREATE TABLE IF NOT EXISTS `employees` (
  `emp_id` int(11) NOT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `job_lvl` enum('STAGIAIRE','JUNIOR','INTERMEDIARE','SEINIOR') DEFAULT NULL,
  `pub_id` int(11) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `minit` int(2) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `employees`
--

INSERT INTO `employees` (`emp_id`, `fname`, `lname`, `job_id`, `job_lvl`, `pub_id`, `hire_date`, `minit`) VALUES
(1, 'Emmanuel', 'Bopda', 4, 'JUNIOR', 1, '2024-01-17', 25),
(2, 'Stephane', 'Lapointe', 3, 'SEINIOR', 3, '2024-01-10', 35),
(3, 'Albert', 'Einstein', 4, 'JUNIOR', 1, '1924-01-17', 25),
(4, 'Paolo', 'Lockman', 3, 'SEINIOR', 2, '1994-03-04', 40),
(5, 'Christ', 'Danick', 6, 'INTERMEDIARE', 2, '2014-01-17', 33),
(6, 'Alain', 'Savoie', 5, 'SEINIOR', 5, '2018-04-17', 55),
(7, 'Alima', 'Traore', 5, 'JUNIOR', 2, '2023-11-17', 33),
(8, 'Roxane', 'David', 3, 'JUNIOR', 5, '2023-04-17', 25),
(9, 'Daniel', 'Akan', 4, 'STAGIAIRE', 1, '2023-12-31', 22),
(10, 'Eric', 'Toto', 3, 'INTERMEDIARE', 4, '2017-03-24', 30),
(11, 'Daniel', 'Akan', 4, 'STAGIAIRE', 1, '2023-12-31', 22),
(12, 'Eric', 'Toto', 3, 'INTERMEDIARE', 4, '2017-03-24', 30);

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE IF NOT EXISTS `jobs` (
  `job_id` int(11) NOT NULL,
  `job_desc` varchar(255) DEFAULT NULL,
  `min_lvl` enum('STAGIAIRE','JUNIOR','INTERMEDIARE','SEINIOR') DEFAULT NULL,
  `max_lvl` enum('STAGIAIRE','JUNIOR','INTERMEDIARE','SEINIOR') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `jobs`
--

INSERT INTO `jobs` (`job_id`, `job_desc`, `min_lvl`, `max_lvl`) VALUES
(1, 'Webeditor', 'INTERMEDIARE', 'SEINIOR'),
(2, 'Correcteur', 'STAGIAIRE', 'SEINIOR'),
(3, 'Webmaster', 'INTERMEDIARE', 'SEINIOR'),
(4, 'Traducteur', 'STAGIAIRE', 'SEINIOR'),
(5, 'Imprimeur', 'STAGIAIRE', 'SEINIOR'),
(6, 'Designer', 'JUNIOR', 'SEINIOR');

-- --------------------------------------------------------

--
-- Structure de la table `publishers`
--

CREATE TABLE IF NOT EXISTS `publishers` (
  `pub_id` int(11) NOT NULL,
  `pub_name` varchar(55) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `publishers`
--

INSERT INTO `publishers` (`pub_id`, `pub_name`, `city`, `state`, `country`) VALUES
(1, 'Harmattan', 'Paris', 'France', 'France'),
(2, 'Eyrolles', 'Lyon', 'France', 'France'),
(3, 'Macmillan', 'Londres', 'Royaume-Unis', 'Royaume-Unis'),
(4, 'Boreal', 'Montreal', 'Quebec', 'Canada'),
(5, 'Disney', 'Anaheim', 'Californie', 'Etats-Unis');

-- --------------------------------------------------------

--
-- Structure de la table `titleauthor`
--

CREATE TABLE IF NOT EXISTS `titleauthor` (
  `au_id` int(11) NOT NULL,
  `title_id` int(11) NOT NULL,
  `au_ord` int(2) DEFAULT NULL,
  `royaltyper` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `titleauthor`
--

INSERT INTO `titleauthor` (`au_id`, `title_id`, `au_ord`, `royaltyper`) VALUES
(1, 5, 1, 2),
(1, 7, 1, 1),
(2, 4, 1, 2),
(2, 5, 1, 2),
(2, 9, 1, 2),
(3, 9, 1, 1),
(4, 5, 1, NULL),
(4, 10, 2, 2),
(5, 12, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `titles`
--

CREATE TABLE IF NOT EXISTS `titles` (
  `title_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `pub_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `advance` float DEFAULT NULL,
  `royalty` float DEFAULT NULL,
  `ytd_sales` float DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `pubdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `titles`
--

INSERT INTO `titles` (`title_id`, `title`, `type`, `pub_id`, `price`, `advance`, `royalty`, `ytd_sales`, `notes`, `pubdate`) VALUES
(1, 'The Canadian Constitution', 'poche', 1, 19, 3, 3, 3, 'Constitution canadienne sous forme de livre de poche', '2014-01-09'),
(2, 'Pour le liberalisme Communautaire', 'business', 2, 23, 2, 1, 3, 'Doctrine politique de Paul Barthelemy Biya ', '2010-01-01'),
(3, 'Introduction a l\'Algorithmique', 'Informatique', 2, 24, 2, 3, 3, 'Pour se familiariser au domaine de la programmation independamment du langage', '1994-01-08'),
(4, 'Php and Mysql', 'Informatique', 3, 65, 20, 40, 20, 'Web database application with Php and Mysql', '2004-03-10'),
(5, 'The Armour of Light', 'roman', 3, 49, 2, 3.4, 3.1, 'American love story', '1914-03-02'),
(6, 'The Seven Sisters Tome 1Maia Story', 'roman', 3, 19, 2, 2.4, 1.1, 'American adventure story', '1934-03-02'),
(7, 'Histoire de la Méchante Reine', 'roman', 4, 9, 2, 3.4, 3.1, 'Fairest of All : A Tale of the Wicked Queen', '1934-04-04'),
(8, 'Computer science ', 'computer', 4, 13, 10, 3, 2, 'Computer science from zero to hero', '2013-02-03'),
(9, 'Master Computers and network  ', 'Informatique', 4, 13, 10, 3, 2, 'Master Computer science ', '2023-01-03'),
(10, 'Sur de soi  ', 'psychology', 4, 13, 10, 3, 2, 'Psy de poche ', '1998-02-03'),
(11, 'Bus de la STM ', 'Transport', 2, 1, 1, 1, 3, 'Comprendre', '2008-02-03'),
(12, 'Alerte sous les tropiques', 'business', 1, 65, 20, 3, 3, 'Ceux-ci constituent la trame du combat permanent qu\'il a mené pour la Culture et le développement en Afrique noire. ', '1974-01-16');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`au_id`);

--
-- Index pour la table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `fk_employees_publishers` (`pub_id`),
  ADD KEY `fk_employees_jobss` (`job_id`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`job_id`);

--
-- Index pour la table `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`pub_id`);

--
-- Index pour la table `titleauthor`
--
ALTER TABLE `titleauthor`
  ADD PRIMARY KEY (`au_id`,`title_id`),
  ADD KEY `fk_author_title` (`title_id`);

--
-- Index pour la table `titles`
--
ALTER TABLE `titles`
  ADD PRIMARY KEY (`title_id`),
  ADD KEY `fk_titles_publishers` (`pub_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `authors`
--
ALTER TABLE `authors`
  MODIFY `au_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `employees`
--
ALTER TABLE `employees`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `publishers`
--
ALTER TABLE `publishers`
  MODIFY `pub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `titles`
--
ALTER TABLE `titles`
  MODIFY `title_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `fk_employees_jobss` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`),
  ADD CONSTRAINT `fk_employees_publishers` FOREIGN KEY (`pub_id`) REFERENCES `publishers` (`pub_id`);

--
-- Contraintes pour la table `titleauthor`
--
ALTER TABLE `titleauthor`
  ADD CONSTRAINT `fk_author_title` FOREIGN KEY (`title_id`) REFERENCES `titles` (`title_id`),
  ADD CONSTRAINT `fk_title_author` FOREIGN KEY (`au_id`) REFERENCES `authors` (`au_id`);

--
-- Contraintes pour la table `titles`
--
ALTER TABLE `titles`
  ADD CONSTRAINT `fk_titles_publishers` FOREIGN KEY (`pub_id`) REFERENCES `publishers` (`pub_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
