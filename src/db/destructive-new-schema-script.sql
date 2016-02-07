-- Adminer 4.2.3 MySQL dump
--
--  WARNING!! WARNING!! TO SCRIPT DROPS AND RE-CREATES THE SCHEMA
--
--  USE WITH _EXTREME CAUTION_
--

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP DATABASE IF EXISTS `mozi`;
CREATE DATABASE `mozi` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mozi`;

DROP TABLE IF EXISTS `associate-time-sheet`;
CREATE TABLE `associate-time-sheet` (
  `associate-time-sheet-id` int(11) NOT NULL AUTO_INCREMENT,
  `matter-id` int(11) NOT NULL,
  `matter-task-id` int(11) NOT NULL,
  `user-id` int(11) NOT NULL,
  `timestamp-start-period` bigint(20) DEFAULT NULL,
  `timestamp-end-period` bigint(20) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `created-by-user-id` int(11) DEFAULT '-1',
  `timestamp-create` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timestamp-activate` bigint(20) DEFAULT NULL,
  `timestamp-deactivate` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`associate-time-sheet-id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `client-id` int(11) NOT NULL AUTO_INCREMENT,
  `group-id` int(11) NOT NULL,
  `client-name` varchar(128) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `contact-person` varchar(128) DEFAULT NULL,
  `number-mobile` varchar(32) DEFAULT NULL,
  `number-landline` varchar(32) DEFAULT NULL,
  `pan-card-number` varchar(128) DEFAULT NULL,
  `created-by-user-id` int(11) DEFAULT '-1',
  `timestamp-create` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timestamp-activate` bigint(20) DEFAULT NULL,
  `timestamp-deactivate` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`client-id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `group-id` int(11) NOT NULL AUTO_INCREMENT,
  `group-name` varchar(128) DEFAULT NULL,
  `referrer-name` varchar(128) DEFAULT NULL,
  `group-address` varchar(128) DEFAULT NULL,
  `group-contact-number` varchar(128) DEFAULT NULL,
  `referrer-address` varchar(256) DEFAULT NULL,
  `referrer-contact-number` varchar(32) DEFAULT NULL,
  `referrer-email` varchar(256) DEFAULT NULL,
  `created-by-user-id` int(11) DEFAULT '-1',
  `timestamp-create` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timestamp-activate` bigint(20) DEFAULT NULL,
  `timestamp-deactivate` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`group-id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `group` (`group-id`, `group-name`, `referrer-name`, `group-address`, `group-contact-number`, `referrer-address`, `referrer-contact-number`, `referrer-email`, `created-by-user-id`, `timestamp-create`, `timestamp-activate`, `timestamp-deactivate`) VALUES
(1,	'Shauns Group 1',	'no referrer',	NULL,	NULL,	'',	'',	'shaun@sunderwood.co.uk',	0,	'2016-02-05 00:00:00',	NULL,	NULL),
(2,	'shauns 2nd group',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2016-02-07 15:07:10',	NULL,	NULL),
(3,	'shauns 3rd group',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2016-02-07 15:07:54',	NULL,	NULL);

DROP TABLE IF EXISTS `matter`;
CREATE TABLE `matter` (
  `matter-id` int(11) NOT NULL AUTO_INCREMENT,
  `matter-template-id` int(11) DEFAULT NULL,
  `matter-name` varchar(128) DEFAULT NULL,
  `employees` int(11) DEFAULT '0',
  `estimated-feee` int(11) DEFAULT '0',
  `country` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `additional-fields` longtext,
  `created-by-user-id` int(11) DEFAULT '-1',
  `timestamp-create` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timestamp-activate` bigint(20) DEFAULT NULL,
  `timestamp-deactivate` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`matter-id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `matter-associates`;
CREATE TABLE `matter-associates` (
  `matter-associate-id` int(11) NOT NULL,
  `matter-id` int(11) NOT NULL,
  `user-id` int(11) NOT NULL,
  `date-started` bigint(20) DEFAULT NULL,
  `date-finished` bigint(20) DEFAULT NULL,
  `created-by-user-id` int(11) DEFAULT '-1',
  `timestamp-create` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timestamp-activate` bigint(20) DEFAULT NULL,
  `timestamp-deactivate` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`matter-associate-id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `matter-comment`;
CREATE TABLE `matter-comment` (
  `matter-comment-id` int(11) NOT NULL AUTO_INCREMENT,
  `matter-id` int(11) NOT NULL,
  `text` text,
  `created-by-user-id` int(11) DEFAULT '-1',
  `timestamp-create` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`matter-comment-id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `matter-task`;
CREATE TABLE `matter-task` (
  `matter-task-id` int(11) NOT NULL AUTO_INCREMENT,
  `matter-id` int(11) NOT NULL,
  `matter-template-id` int(11) DEFAULT NULL,
  `matter-template-task-id` int(11) DEFAULT NULL,
  `matter-task-name` varchar(128) DEFAULT NULL,
  `description` varchar(2048) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `created-by-user-id` int(11) DEFAULT '-1',
  `timestamp-create` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timestamp-activate` bigint(20) DEFAULT NULL,
  `timestamp-deactivate` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`matter-task-id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `matter-template`;
CREATE TABLE `matter-template` (
  `matter-template-id` int(11) NOT NULL AUTO_INCREMENT,
  `matter-template-name` varchar(128) DEFAULT NULL,
  `additional-fields` longtext,
  `nature` varchar(128) DEFAULT NULL,
  `created-by-user-id` int(11) DEFAULT '-1',
  `timestamp-create` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timestamp-activate` bigint(20) DEFAULT NULL,
  `timestamp-deactivate` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`matter-template-id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `matter-template-task`;
CREATE TABLE `matter-template-task` (
  `matter-template-task-id` int(11) NOT NULL AUTO_INCREMENT,
  `matter-template-id` int(11) NOT NULL,
  `matter-template-task-name` varchar(128) DEFAULT NULL,
  `description` varchar(2048) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `created-by-user-id` int(11) DEFAULT '-1',
  `timestamp-create` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timestamp-activate` bigint(20) DEFAULT NULL,
  `timestamp-deactivate` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`matter-template-task-id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `role-id` int(11) NOT NULL AUTO_INCREMENT,
  `role-name` varchar(128) DEFAULT NULL,
  `privilege-level` int(11) DEFAULT '-1',
  `created-by-user-id` int(11) DEFAULT '-1',
  `timestamp-create` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timestamp-activate` bigint(20) DEFAULT NULL,
  `timestamp-deactivate` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`role-id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO `roles` (`role-id`, `role-name`, `privilege-level`, `created-by-user-id`, `timestamp-create`, `timestamp-activate`, `timestamp-deactivate`) VALUES
(1,	'System Operator',	100,	1,	'2016-02-02 18:36:17',	NULL,	NULL),
(2,	'Admin',	90,	1,	'2016-02-02 18:36:24',	NULL,	NULL),
(3,	'Manager',	50,	1,	'2016-02-02 18:35:13',	NULL,	NULL),
(4,	'Associate',	25,	1,	'2016-02-02 18:35:27',	NULL,	NULL),
(5,	'Disabled',	-1,	1,	'2016-02-07 15:21:44',	NULL,	NULL);

DROP TABLE IF EXISTS `user-roles`;
CREATE TABLE `user-roles` (
  `user-role-id` int(11) NOT NULL AUTO_INCREMENT,
  `user-id` int(11) NOT NULL,
  `role-id` int(11) NOT NULL,
  `created-by-user-id` int(11) DEFAULT '-1',
  `timestamp-create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timestamp-activate` bigint(20) DEFAULT NULL,
  `timestamp-deactivate` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`user-role-id`),
  KEY `user-id` (`user-id`),
  KEY `role-id` (`role-id`),
  CONSTRAINT `user-roles_ibfk_1` FOREIGN KEY (`user-id`) REFERENCES `users` (`user-id`),
  CONSTRAINT `user-roles_ibfk_2` FOREIGN KEY (`role-id`) REFERENCES `roles` (`role-id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user-id` int(11) NOT NULL AUTO_INCREMENT,
  `user-name` varchar(128) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `password-forgotten-token` text,
  `password-forgotten-token-expiration` text,
  `charge-out-rate` int(11) DEFAULT '-1',
  `yearly-salary` int(11) DEFAULT '-1',
  `contact-number` varchar(32) DEFAULT NULL,
  `image-url` text,
  `created-by-user-id` int(11) DEFAULT '-1',
  `timestamp-create` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timestamp-activate` bigint(20) DEFAULT NULL,
  `timestamp-deactivate` bigint(20) DEFAULT NULL,
  `keycloak-id` text,
  PRIMARY KEY (`user-id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `users` (`user-id`, `user-name`, `email`, `password-forgotten-token`, `password-forgotten-token-expiration`, `charge-out-rate`, `yearly-salary`, `contact-number`, `image-url`, `created-by-user-id`, `timestamp-create`, `timestamp-activate`, `timestamp-deactivate`, `keycloak-id`) VALUES
(1,	'admin',	'shaun@sunderwood.co.uk',	NULL,	NULL,	0,	0,	NULL,	NULL,	1,	'2016-02-02 18:31:03',	NULL,	NULL,	NULL);

-- 2016-02-07 15:33:28

