/*
 Navicat Premium Data Transfer

 Source Server         : MYSQLDEV
 Source Server Type    : MySQL
 Source Server Version : 50714
 Source Host           : 10.99.103.13:3306
 Source Schema         : c1_db2

 Target Server Type    : MySQL
 Target Server Version : 50714
 File Encoding         : 65001

 Date: 18/06/2019 09:23:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for epayment_transactions
-- ----------------------------
DROP TABLE IF EXISTS `epayment_transactions`;
CREATE TABLE `epayment_transactions`  (
  `transaction_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `transaction_date_enter_web` datetime(0) NULL DEFAULT NULL,
  `transaction_date_enter_web_day` date NULL DEFAULT NULL,
  `transaction_ip_address` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `transaction_marchand_id` bigint(11) NULL DEFAULT NULL,
  `transaction_key1` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `transaction_key2` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `transaction_key3` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `transaction_key4` varchar(7) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `transaction_is_error_key_typing` int(11) NULL DEFAULT NULL,
  `transaction_is_error_key_dateecheance` int(11) NULL DEFAULT NULL,
  `transaction_is_error_accept_conditions` int(11) NULL DEFAULT NULL,
  `transaction_montant` double NULL DEFAULT NULL,
  `transaction_date_echeance` date NULL DEFAULT NULL,
  `transaction_date_payment` datetime(0) NULL DEFAULT NULL,
  `transaction_date_payment_day` date NULL DEFAULT NULL,
  `epayment_transaction_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `epayment_authorization_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `epayment_code_client` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `epayment_track_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `epayment_response_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `transaction_paid` int(11) NULL DEFAULT NULL,
  `transaction_report_printed` int(11) NULL DEFAULT NULL,
  `transaction_report_pdf` int(11) NULL DEFAULT NULL,
  `transaction_report_sent` int(11) NULL DEFAULT NULL,
  `transaction_report_sent_to` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `is_sent` int(11) NULL DEFAULT NULL,
  `date_send` datetime(0) NULL DEFAULT NULL,
  `cc` varchar(4) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `transaction_com` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `transaction_statut` enum('non_traiter','en_cours','rejeter','ok') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'non_traiter',
  PRIMARY KEY (`transaction_id`) USING BTREE,
  INDEX `transaction_paid`(`transaction_paid`) USING BTREE,
  INDEX `transaction_marchand_id`(`transaction_marchand_id`) USING BTREE,
  INDEX `transaction_date_payment`(`transaction_date_payment`) USING BTREE,
  INDEX `transaction_date_enter_web_day`(`transaction_date_enter_web_day`) USING BTREE,
  INDEX `transaction_date_payment_day`(`transaction_date_payment_day`) USING BTREE,
  INDEX `epayment_transaction_id`(`epayment_transaction_id`) USING BTREE,
  INDEX `epayment_code_client`(`epayment_code_client`) USING BTREE,
  INDEX `epayment_response_code`(`epayment_response_code`) USING BTREE,
  INDEX `transaction_report_printed`(`transaction_report_printed`) USING BTREE,
  INDEX `transaction_report_pdf`(`transaction_report_pdf`) USING BTREE,
  INDEX `transaction_report_sent`(`transaction_report_sent`) USING BTREE,
  INDEX `transaction_date_echeance`(`transaction_date_echeance`) USING BTREE,
  INDEX `is_sent`(`is_sent`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14074 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
