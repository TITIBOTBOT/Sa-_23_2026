-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mer 17 Juin 2026 à 09:23
-- Version du serveur :  5.6.20
-- Version de PHP :  5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `sae23`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE IF NOT EXISTS `administrateur` (
  `login` varchar(15) NOT NULL,
  `mot_de_passe` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `bâtiments`
--

CREATE TABLE IF NOT EXISTS `bâtiments` (
  `ID_bât` int(1) NOT NULL,
  `nom_bât` varchar(1) NOT NULL,
  `login` varchar(15) NOT NULL,
  `mot_de_passe` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `bâtiments`
--

INSERT INTO `bâtiments` (`ID_bât`, `nom_bât`, `login`, `mot_de_passe`) VALUES
(1, 'E', 'etud', 'rt');

-- --------------------------------------------------------

--
-- Structure de la table `capteurs`
--

CREATE TABLE IF NOT EXISTS `capteurs` (
  `nom_salle` varchar(4) NOT NULL,
  `nom_capteur` varchar(20) NOT NULL,
  `type_capteur` varchar(15) NOT NULL,
  `unité` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `capteurs`
--

INSERT INTO `capteurs` (`nom_salle`, `nom_capteur`, `type_capteur`, `unité`) VALUES
('E208', 'co2_AM107-38', 'co2', 'ppm'),
('E208', 'humidity_AM107-38', 'humidity', '%'),
('E208', 'pressure_AM107-38', 'pressure', 'hPa'),
('E208', 'temperature_AM107-38', 'temperature', '°C');

-- --------------------------------------------------------

--
-- Structure de la table `mesures`
--

CREATE TABLE IF NOT EXISTS `mesures` (
  `ID` int(10) NOT NULL,
  `nom_capteur` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `horaire` time NOT NULL,
  `valeurs` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `salles`
--

CREATE TABLE IF NOT EXISTS `salles` (
  `ID_bât` int(1) NOT NULL,
  `nom_salle` varchar(4) NOT NULL,
  `type` varchar(8) NOT NULL,
  `capacite_accueil` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `salles`
--

INSERT INTO `salles` (`ID_bât`, `nom_salle`, `type`, `capacite_accueil`) VALUES
(1, 'E208', 'TP', 17);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `administrateur`
--
ALTER TABLE `administrateur`
 ADD PRIMARY KEY (`login`);

--
-- Index pour la table `bâtiments`
--
ALTER TABLE `bâtiments`
 ADD PRIMARY KEY (`ID_bât`);

--
-- Index pour la table `capteurs`
--
ALTER TABLE `capteurs`
 ADD PRIMARY KEY (`nom_capteur`), ADD KEY `nom_salle` (`nom_salle`);

--
-- Index pour la table `mesures`
--
ALTER TABLE `mesures`
 ADD PRIMARY KEY (`ID`), ADD KEY `nom_capteur` (`nom_capteur`);

--
-- Index pour la table `salles`
--
ALTER TABLE `salles`
 ADD PRIMARY KEY (`nom_salle`), ADD KEY `ID_bât` (`ID_bât`);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `capteurs`
--
ALTER TABLE `capteurs`
ADD CONSTRAINT `capteurs_ibfk_1` FOREIGN KEY (`nom_salle`) REFERENCES `salles` (`nom_salle`);

--
-- Contraintes pour la table `mesures`
--
ALTER TABLE `mesures`
ADD CONSTRAINT `FK_CAPTEUR` FOREIGN KEY (`nom_capteur`) REFERENCES `capteurs` (`nom_capteur`);

--
-- Contraintes pour la table `salles`
--
ALTER TABLE `salles`
ADD CONSTRAINT `FK_BAT` FOREIGN KEY (`ID_bât`) REFERENCES `bâtiments` (`ID_bât`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
