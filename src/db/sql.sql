-- Adminer 4.2.3 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

CREATE TABLE `associate-time-sheet` (
  `associate-time-sheet-id` int(11) NOT NULL AUTO_INCREMENT,
  `matter-id` int(11) NOT NULL,
  `matter-task-id` int(11) NOT NULL,
  `user-id` int(11) NOT NULL,
  `timestamp-start-period` bigint(20) NOT NULL,
  `timestamp-end-period` timestamp NULL DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `created-by-user-id` int(11) NOT NULL,
  `timestamp-create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timestamp-activate` bigint(20) DEFAULT NULL,
  `timestamp-deactivate` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`associate-time-sheet-id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `client` (
  `client-id` int(11) NOT NULL AUTO_INCREMENT,
  `group-id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `contact-person` varchar(128) DEFAULT NULL,
  `number-mobile` varchar(32) DEFAULT NULL,
  `number-landline` varchar(32) DEFAULT NULL,
  `pan-card number` varchar(128) DEFAULT NULL,
  `created-by-user-id` int(11) NOT NULL,
  `timestamp-create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timestamp-activate` bigint(20) DEFAULT NULL,
  `timestamp-deactivate` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`client-id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `group` (
  `group-id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `referrer-name` varchar(128) DEFAULT NULL,
  `referrer-address` varchar(256) DEFAULT NULL,
  `referrer-contact-number` varchar(32) DEFAULT NULL,
  `referrer-email` varchar(256) DEFAULT NULL,
  `created-by-user-id` int(11) DEFAULT NULL,
  `timestamp-create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timestamp-activate` bigint(20) DEFAULT NULL,
  `timestamp-deactivate` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`group-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `matter` (
  `matter-id` int(11) NOT NULL AUTO_INCREMENT,
  `matter-template-id` int(11) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `employees` int(11) NOT NULL DEFAULT '0',
  `estimated-feee` int(11) NOT NULL DEFAULT '0',
  `country` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `additional-fields` longtext,
  `created-by-user-id` int(11) NOT NULL,
  `timestamp-create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timestamp-activate` bigint(20) DEFAULT NULL,
  `timestamp-deactivate` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`matter-id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `matter-associates` (
  `matter-associate-id` int(11) NOT NULL AUTO_INCREMENT,
  `matter-id` int(11) NOT NULL,
  `user-id` int(11) NOT NULL,
  `date-started` date NOT NULL,
  `date-finished` date DEFAULT NULL,
  `created-by-user-id` int(11) NOT NULL,
  `timestamp-create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timestamp-activate` bigint(20) DEFAULT NULL,
  `timestamp-deactivate` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`matter-associate-id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `matter-comment` (
  `matter-comment-id` int(11) NOT NULL AUTO_INCREMENT,
  `matter-id` int(11) NOT NULL,
  `text` text NOT NULL,
  `created-by-user-id` int(11) NOT NULL,
  `timestamp-create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`matter-comment-id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `matter-task` (
  `matter-task-id` int(11) NOT NULL AUTO_INCREMENT,
  `matter-id` int(11) NOT NULL,
  `matter-template-id` int(11) DEFAULT NULL,
  `matter-template-task-id` int(11) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `description` varchar(2048) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `created-by-user-id` int(11) NOT NULL,
  `timestamp-create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timestamp-activate` bigint(20) DEFAULT NULL,
  `timestamp-deactivate` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`matter-task-id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `matter-template` (
  `matter-template-id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `additional-fields` longtext,
  `nature` varchar(128) DEFAULT NULL,
  `created-by-user-id` int(11) NOT NULL,
  `timestamp-create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timestamp-activate` bigint(20) DEFAULT NULL,
  `timestamp-deactivate` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`matter-template-id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `matter-template-task` (
  `matter-template-task-id` int(11) NOT NULL AUTO_INCREMENT,
  `matter-template-id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `description` varchar(2048) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `created-by-user-id` int(11) NOT NULL,
  `timestamp-create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timestamp-activate` bigint(20) DEFAULT NULL,
  `timestamp-deactivate` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`matter-template-task-id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `role` (
  `role-id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `privilege-level` int(11) NOT NULL DEFAULT '0',
  `created-by-user-id` int(11) NOT NULL,
  `timestamp-create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timestamp-activate` bigint(20) DEFAULT NULL,
  `timestamp-deactivate` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`role-id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `role` (`role-id`, `name`, `privilege-level`, `created-by-user-id`, `timestamp-create`, `timestamp-activate`, `timestamp-deactivate`) VALUES
(1,	'System Operator',	100,	1,	'2016-02-02 18:36:17',	NULL,	NULL),
(2,	'Admin',	90,	1,	'2016-02-02 18:36:24',	NULL,	NULL),
(3,	'Manager',	50,	1,	'2016-02-02 18:35:13',	NULL,	NULL),
(4,	'Associate',	25,	1,	'2016-02-02 18:35:27',	NULL,	NULL),
(5,	'Disabled',	0,	1,	'2016-02-02 18:36:07',	NULL,	NULL);

CREATE TABLE `user` (
  `user-id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `role-id` int(11) NOT NULL DEFAULT '0',
  `password-forgotten-token` text,
  `password-forgotten-token-expiration` text,
  `charge-out-rate` int(11) NOT NULL DEFAULT '0',
  `yearly-salary` int(11) NOT NULL DEFAULT '0',
  `contact-number` varchar(32) DEFAULT NULL,
  `image-url` text,
  `created-by-user-id` int(11) NOT NULL,
  `timestamp-create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timestamp-activate` bigint(20) DEFAULT NULL,
  `timestamp-deactivate` bigint(20) DEFAULT NULL,
  `keycloak-id` text,
  PRIMARY KEY (`user-id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `user` (`user-id`, `name`, `email`, `role-id`, `password-forgotten-token`, `password-forgotten-token-expiration`, `charge-out-rate`, `yearly-salary`, `contact-number`, `image-url`, `created-by-user-id`, `timestamp-create`, `timestamp-activate`, `timestamp-deactivate`, `keycloak-id`) VALUES
(1,	'admin',	'shaun@sunderwood.co.uk',	100,	NULL,	NULL,	0,	0,	NULL,	NULL,	1,	'2016-02-02 18:31:03',	NULL,	NULL,	NULL);

-- 2016-02-07 13:10:39