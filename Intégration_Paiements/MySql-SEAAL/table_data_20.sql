-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Lun 17 Juin 2019 à 13:37
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

-- SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET sql_mode = '';
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `c1_db2`
--

-- --------------------------------------------------------

--
-- Structure de la table `epayment_transactions`
--

CREATE TABLE `epayment_transactions` (
  `transaction_id` bigint(20) NOT NULL,
  `transaction_date_enter_web` datetime DEFAULT NULL,
  `transaction_date_enter_web_day` date DEFAULT NULL,
  `transaction_ip_address` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_marchand_id` bigint(11) DEFAULT NULL,
  `transaction_key1` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_key2` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_key3` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_key4` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_is_error_key_typing` int(11) DEFAULT NULL,
  `transaction_is_error_key_dateecheance` int(11) DEFAULT NULL,
  `transaction_is_error_accept_conditions` int(11) DEFAULT NULL,
  `transaction_montant` double DEFAULT NULL,
  `transaction_date_echeance` date DEFAULT NULL,
  `transaction_date_payment` datetime DEFAULT NULL,
  `transaction_date_payment_day` date DEFAULT NULL,
  `epayment_transaction_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `epayment_authorization_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `epayment_code_client` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `epayment_track_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `epayment_response_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_paid` int(11) DEFAULT NULL,
  `transaction_report_printed` int(11) DEFAULT NULL,
  `transaction_report_pdf` int(11) DEFAULT NULL,
  `transaction_report_sent` int(11) DEFAULT NULL,
  `transaction_report_sent_to` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_sent` int(11) DEFAULT NULL,
  `date_send` datetime DEFAULT NULL,
  `cc` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_com` text COLLATE utf8_unicode_ci,
  `transaction_statut` enum('non_traiter','en_cours','rejeter','ok') COLLATE utf8_unicode_ci DEFAULT 'non_traiter'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `epayment_transactions`
--

INSERT INTO `epayment_transactions` (`transaction_id`, `transaction_date_enter_web`, `transaction_date_enter_web_day`, `transaction_ip_address`, `transaction_marchand_id`, `transaction_key1`, `transaction_key2`, `transaction_key3`, `transaction_key4`, `transaction_is_error_key_typing`, `transaction_is_error_key_dateecheance`, `transaction_is_error_accept_conditions`, `transaction_montant`, `transaction_date_echeance`, `transaction_date_payment`, `transaction_date_payment_day`, `epayment_transaction_id`, `epayment_authorization_code`, `epayment_code_client`, `epayment_track_id`, `epayment_response_code`, `transaction_paid`, `transaction_report_printed`, `transaction_report_pdf`, `transaction_report_sent`, `transaction_report_sent_to`, `is_sent`, `date_send`, `cc`, `transaction_com`, `transaction_statut`) VALUES
(1, '2015-02-24 09:54:18', '2015-02-24', '105.106.89.216', 0, '67133', '47317', '03219', '2801304', NULL, NULL, 1, 133472.19, '0000-00-00', '0000-00-00 00:00:00', '0000-00-00', '', '', '42167', '1', '', NULL, NULL, NULL, NULL, '', NULL, '0000-00-00 00:00:00', '', NULL, 'non_traiter'),
(2, '2015-02-24 10:02:56', '2015-02-24', '197.119.39.61', 0, '12001', '40496', '03199', '2806304', NULL, NULL, NULL, 1403.98, '0000-00-00', '0000-00-00 00:00:00', '0000-00-00', '', '', '41912', '2', '', NULL, NULL, NULL, NULL, '', NULL, '0000-00-00 00:00:00', '', NULL, 'non_traiter'),
(3, '2015-02-24 10:07:03', '2015-02-24', '105.106.89.216', 0, '63230', '45761', '03219', '2807604', NULL, NULL, 1, 230456.63, '0000-00-00', '0000-00-00 00:00:00', '0000-00-00', '', '', '42163', '3', '', NULL, NULL, NULL, NULL, '', NULL, '0000-00-00 00:00:00', '', NULL, 'non_traiter'),
(4, '2015-02-24 10:14:43', '2015-02-24', '105.106.89.216', 0, '63230', '45761', '03219', '2807604', NULL, NULL, NULL, 230456.63, '0000-00-00', '0000-00-00 00:00:00', '0000-00-00', '894782101050550', '491767', '42163', '4', '', 1, 1, 1, 1, '', NULL, '0000-00-00 00:00:00', '', NULL, 'non_traiter'),
(5, '2015-02-24 10:15:37', '2015-02-24', '197.119.39.61', 0, '12001', '40496', '03199', '2806304', NULL, NULL, NULL, 1403.98, '0000-00-00', '2015-02-24 12:55:16', '2015-02-24', '8056404070950490', '491739', '41912', '5', '', 1, 1, NULL, 1, '', NULL, '0000-00-00 00:00:00', '', NULL, 'non_traiter'),
(6, '2015-02-24 10:22:27', '2015-02-24', '105.106.89.216', 0, '67133', '47317', '03219', '2801304', NULL, NULL, NULL, 133472.19, '0000-00-00', '0000-00-00 00:00:00', '0000-00-00', '', '', '42167', '6', '', NULL, NULL, NULL, NULL, '', NULL, '0000-00-00 00:00:00', '', NULL, 'non_traiter'),
(7, '2015-02-24 10:28:53', '2015-02-24', '105.106.89.216', 0, '67133', '47317', '03219', '2801304', NULL, NULL, NULL, 133472.19, '0000-00-00', '0000-00-00 00:00:00', '0000-00-00', '6454808241050550', '491768', '42167', '7', '', 1, NULL, 1, 1, '', NULL, '0000-00-00 00:00:00', '', NULL, 'non_traiter'),
(8, '2015-02-24 10:32:35', '2015-02-24', '105.106.89.216', 0, '19000', '60967', '98369', '1808272', NULL, 1, NULL, 608.7, '0000-00-00', '0000-00-00 00:00:00', '0000-00-00', '3213108281050550', '000000', '723619', '8', '', 1, NULL, NULL, NULL, '', NULL, '0000-00-00 00:00:00', '', NULL, 'non_traiter'),
(9, '2015-02-24 10:34:14', '2015-02-24', '105.106.89.216', 0, '19000', '60967', '98369', '1808272', NULL, 1, NULL, 608.7, '0000-00-00', '0000-00-00 00:00:00', '0000-00-00', '269753301050550', '000000', '723619', '9', '', 1, NULL, NULL, NULL, '', NULL, '0000-00-00 00:00:00', '', NULL, 'non_traiter'),
(10, '2015-02-24 11:01:35', '2015-02-24', '105.106.89.216', 0, '67133', '47317', '03219', '2801304', NULL, NULL, NULL, 133472.19, '0000-00-00', '0000-00-00 00:00:00', '0000-00-00', '', '', '42167', '10', '', NULL, NULL, NULL, NULL, '', NULL, '0000-00-00 00:00:00', '', NULL, 'non_traiter'),
(11, '2015-02-24 11:07:40', '2015-02-24', '105.106.89.216', 0, '19000', '60967', '98369', '1808272', NULL, 1, NULL, 608.7, '0000-00-00', '0000-00-00 00:00:00', '0000-00-00', '1544679031150550', '491770', '723619', '11', '', 1, NULL, NULL, NULL, '', NULL, '0000-00-00 00:00:00', '', NULL, 'non_traiter'),
(12, '2015-02-24 11:16:07', '2015-02-24', '105.106.89.216', 0, '63230', '45761', '03219', '2807604', NULL, NULL, 1, 230456.63, '0000-00-00', '0000-00-00 00:00:00', '0000-00-00', '648184131150550', '491771', '42163', '12', '', 1, 1, 1, 1, '', NULL, '0000-00-00 00:00:00', '', NULL, 'non_traiter'),
(13, '2015-02-24 11:22:14', '2015-02-24', '105.106.89.216', 0, '67133', '47317', '03219', '2801304', NULL, NULL, 1, 133472.19, '0000-00-00', '0000-00-00 00:00:00', '0000-00-00', '', '', '42167', '13', '87', NULL, NULL, NULL, NULL, '', NULL, '0000-00-00 00:00:00', '', NULL, 'non_traiter'),
(14, '2015-02-24 11:27:12', '2015-02-24', '105.106.89.216', 0, '67133', '47317', '03219', '2801304', NULL, NULL, NULL, 133472.19, '0000-00-00', '0000-00-00 00:00:00', '0000-00-00', '9696308241150550', '491772', '42167', '14', '00', 1, NULL, NULL, NULL, '', NULL, '0000-00-00 00:00:00', '', NULL, 'non_traiter'),
(15, '2015-02-24 11:34:53', '2015-02-24', '105.106.89.216', 0, '67133', '47317', '03219', '2801304', NULL, NULL, NULL, 133472.19, '2015-03-10', '0000-00-00 00:00:00', '2015-02-24', '8028228311150550', '491773', '42167', '15', '00', 1, NULL, NULL, NULL, '', NULL, '0000-00-00 00:00:00', '', NULL, 'non_traiter'),
(16, '2015-02-24 11:37:30', '2015-02-24', '105.106.89.216', 0, '51002', '13622', '09649', '2805503', NULL, NULL, 1, 2135.24, '2015-03-16', '0000-00-00 00:00:00', '2015-02-24', '8908387341150550', '491774', '36451', '16', '00', 1, NULL, NULL, NULL, '', NULL, '0000-00-00 00:00:00', '', NULL, 'non_traiter'),
(17, '2015-02-24 11:40:01', '2015-02-24', '105.106.89.216', 0, '67133', '47317', '03219', '2801304', NULL, NULL, NULL, 133472.19, '2015-03-10', '0000-00-00 00:00:00', '0000-00-00', '', '', '42167', '17', '87', NULL, NULL, NULL, NULL, '', NULL, '0000-00-00 00:00:00', '', NULL, 'non_traiter'),
(18, '2015-02-24 11:47:37', '2015-02-24', '105.106.89.216', 0, '22000', '43682', '03209', '2801404', NULL, NULL, 1, 435.84, '2015-03-10', '2015-02-24 11:49:11', '2015-02-24', '2997141441150550', '491775', '42022', '18', '00', 1, 1, 1, NULL, '', NULL, '0000-00-00 00:00:00', '', NULL, 'non_traiter'),
(19, '2015-02-24 13:37:52', '2015-02-24', '105.106.89.216', 0, '63230', '45761', '03219', '2807604', NULL, NULL, NULL, 0, '2015-03-10', '0000-00-00 00:00:00', '0000-00-00', '', '', '', '19', '', NULL, NULL, NULL, NULL, '', NULL, '0000-00-00 00:00:00', '', NULL, 'non_traiter'),
(20, '2015-02-24 13:38:06', '2015-02-24', '105.106.89.216', 0, '63230', '45761', '03219', '2807604', NULL, NULL, NULL, 0, '2015-03-10', '0000-00-00 00:00:00', '0000-00-00', '', '', '', '20', '', NULL, NULL, NULL, NULL, '', NULL, '0000-00-00 00:00:00', '', NULL, 'non_traiter'),

--
-- Index pour les tables exportées
--

--
-- Index pour la table `epayment_transactions`
--
ALTER TABLE `epayment_transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `transaction_paid` (`transaction_paid`),
  ADD KEY `transaction_marchand_id` (`transaction_marchand_id`),
  ADD KEY `transaction_date_payment` (`transaction_date_payment`),
  ADD KEY `transaction_date_enter_web_day` (`transaction_date_enter_web_day`),
  ADD KEY `transaction_date_payment_day` (`transaction_date_payment_day`),
  ADD KEY `epayment_transaction_id` (`epayment_transaction_id`),
  ADD KEY `epayment_code_client` (`epayment_code_client`),
  ADD KEY `epayment_response_code` (`epayment_response_code`),
  ADD KEY `transaction_report_printed` (`transaction_report_printed`),
  ADD KEY `transaction_report_pdf` (`transaction_report_pdf`),
  ADD KEY `transaction_report_sent` (`transaction_report_sent`),
  ADD KEY `transaction_date_echeance` (`transaction_date_echeance`),
  ADD KEY `is_sent` (`is_sent`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `epayment_transactions`
--
ALTER TABLE `epayment_transactions`
  MODIFY `transaction_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14074;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
