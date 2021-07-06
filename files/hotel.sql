SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE DATABASE IF NOT EXISTS `hotel` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `hotel`;

-- --------------------------------------------------------


CREATE TABLE IF NOT EXISTS `guests` (
  `guest_id` int(11) NOT NULL AUTO_INCREMENT,
  `guest_login` varchar(32) COLLATE utf8_bin NOT NULL,
  `guest_password` varchar(32) COLLATE utf8_bin NOT NULL,
  `guest_confirm` varchar(32) COLLATE utf8_bin NOT NULL,
  `guest_role` enum('ROLE_ADMIN','ROLE_GUEST') COLLATE utf8_bin NOT NULL DEFAULT 'ROLE_GUEST',
  `guest_firstname` varchar(60) COLLATE utf8_bin NOT NULL,
  `guest_lastname` varchar(60) COLLATE utf8_bin NOT NULL,
  `guest_version` int(11) NOT NULL,
  PRIMARY KEY (`guest_id`),
  UNIQUE KEY `guest_login` (`guest_login`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `guests` (`guest_id`, `guest_login`, `guest_password`, `guest_confirm`, `guest_role`, `guest_firstname`, `guest_lastname`, `guest_version`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '21232f297a57a5a743894a0e4a801fc3', 'ROLE_ADMIN', 'admin', 'admin', 0),
(2, 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'ee11cbb19052e40b07aac0ca060c23ee', 'ROLE_GUEST', 'user', 'user', 0);

-- --------------------------------------------------------


CREATE TABLE IF NOT EXISTS `hotels` (
  `hotel_id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `hotel_address` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `hotel_city` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `hotel_zip` int(6) DEFAULT NULL,
  `hotel_state` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `hotel_version` int(11) NOT NULL,
  PRIMARY KEY (`hotel_id`),
  UNIQUE KEY `hotel_name` (`hotel_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hotel''s Fullnames and Locations';


INSERT INTO `hotels` (`hotel_id`, `hotel_name`, `hotel_address`, `hotel_city`, `hotel_zip`, `hotel_state`, `hotel_version`) VALUES
(1, 'Palace', 'Via Magellano 27', 'Firenze', 50133, 'Italia', 0),
(2, 'Continental', 'Viale Matteotti 45', 'Firenze', 50136, 'Italia', 0);
-- --------------------------------------------------------


CREATE TABLE IF NOT EXISTS `reservations` (
  `reservation_id` int(11) NOT NULL AUTO_INCREMENT,
  `guest_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `reservation_from` date NOT NULL,
  `reservation_to` date NOT NULL,
  `reservation_cancelled` tinyint(1) NOT NULL DEFAULT '0',
  `reservation_version` int(11) NOT NULL,
  PRIMARY KEY (`reservation_id`),
  UNIQUE KEY `guest_id` (`guest_id`,`room_id`,`reservation_from`,`reservation_to`),
  KEY `room_id` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `reservations` (`reservation_id`, `guest_id`, `room_id`, `reservation_from`, `reservation_to`, `reservation_cancelled`, `reservation_version`) VALUES
(1, 1, 1, '2020-05-31', '2020-06-03', 0, 0),
(2, 2, 6, '2020-06-11', '2020-06-12', 0, 0),
(3, 2, 7, '2020-05-16', '2020-06-18', 0, 0);


-- --------------------------------------------------------


CREATE TABLE IF NOT EXISTS `rooms` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `room_number` varchar(4) COLLATE utf8_bin NOT NULL,
  `room_type` enum('StandardRoom','SpecialRoom','ExclusiveRoom') COLLATE utf8_bin NOT NULL DEFAULT 'StandardRoom',
  `room_direction` enum('FRONT','BACK') COLLATE utf8_bin NOT NULL DEFAULT 'FRONT',
  `room_price` varchar(10) COLLATE utf8_bin NOT NULL,
  `room_version` int(11) NOT NULL,
  PRIMARY KEY (`room_id`),
  UNIQUE KEY `hotel_id` (`hotel_id`,`room_number`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hotel Rooms (number, type and window direction)';


INSERT INTO `rooms` (`room_id`, `hotel_id`, `room_number`, `room_type`, `room_direction`, `room_price`, `room_version`) VALUES
(1, 1, '101', 'StandardRoom', 'FRONT', '50,00', 0),
(2, 1, '102', 'SpecialRoom', 'BACK', '70,00', 0),
(3, 1, '103', 'ExclusiveRoom', 'BACK', '90,00', 0),
(4, 1, '104', 'ExclusiveRoom', 'FRONT', '90,00', 0),
(5, 1, '105', 'StandardRoom', 'BACK', '50,00', 0),
(6, 2, '121', 'ExclusiveRoom', 'FRONT', '90,00', 0),
(7, 2, '122', 'ExclusiveRoom', 'BACK', '90,00', 0),
(8, 2, '123', 'StandardRoom', 'FRONT', '50,00', 0);




ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`guest_id`) REFERENCES `guests` (`guest_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`hotel_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
