-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 08, 2016 at 05:36 AM
-- Server version: 5.6.28
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ridePlus`
--
CREATE DATABASE IF NOT EXISTS `ridePlus` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ridePlus`;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `booking_datetime` datetime NOT NULL,
  `pickup_point` varchar(45) NOT NULL,
  `drop_point` varchar(45) NOT NULL,
  `pickup_zip` char(5) NOT NULL,
  `dropoff_zip` char(5) NOT NULL,
  `user_id` int(11) NOT NULL,
  `booking_status` enum('approved','Cancelled') DEFAULT NULL,
  `no_of_passengers` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `car_id` int(11) NOT NULL,
  `car_type` enum('ridePlus_mini','ridePlus_sedan','ridePlus_SUV','ridePlus_luxury') NOT NULL,
  `driver_id` int(11) NOT NULL,
  `car_no` int(11) NOT NULL,
  `car_year` date NOT NULL,
  `cars_car_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `commission`
--

CREATE TABLE `commission` (
  `commission_id` int(11) NOT NULL,
  `driver_commission` decimal(6,2) NOT NULL,
  `ride_details_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `driver_id` int(11) NOT NULL,
  `driver_first_name` varchar(45) NOT NULL,
  `driver_last_name` varchar(45) NOT NULL,
  `driver_address` varchar(45) NOT NULL,
  `driver_telephone` int(10) NOT NULL,
  `driver_zip` char(5) NOT NULL,
  `car_id` int(11) NOT NULL,
  `driver_license_num` varchar(45) NOT NULL,
  `driver_login_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `driver_commission_view`
-- (See below for the actual view)
--
CREATE TABLE `driver_commission_view` (
`driver_id` int(11)
,`driver_first_name` varchar(45)
,`driver_commission` decimal(6,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `driver_login`
--

CREATE TABLE `driver_login` (
  `driver_login_id` int(11) NOT NULL,
  `check_in` datetime NOT NULL,
  `check_out` datetime NOT NULL,
  `driver_status` enum('ride_Inprogress','Availble') NOT NULL,
  `driver_login_zip` char(5) NOT NULL,
  `driver_logout_zip` char(5) NOT NULL,
  `car_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `excellent_rating_view`
-- (See below for the actual view)
--
CREATE TABLE `excellent_rating_view` (
`user_id` int(5)
,`first_name` varchar(45)
,`ratings` enum('Excellent','Satisfied','Very bad')
,`driver_id` int(11)
,`driver_first_name` varchar(45)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `number_of_rides_view`
-- (See below for the actual view)
--
CREATE TABLE `number_of_rides_view` (
`No_of_rides` bigint(21)
,`driver_login_id` int(11)
,`driver_first_name` varchar(45)
);

-- --------------------------------------------------------

--
-- Table structure for table `payment_info`
--

CREATE TABLE `payment_info` (
  `payment_info_id` int(11) NOT NULL,
  `ride_details_id` int(11) DEFAULT NULL,
  `payment_method` enum('Card','eWallet','Cash') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Rating`
--

CREATE TABLE `Rating` (
  `rating_id` int(11) NOT NULL,
  `ride_details_id` int(11) NOT NULL,
  `ratings` enum('Excellent','Satisfied','Very bad') DEFAULT NULL,
  `feedback` varchar(45) DEFAULT NULL,
  `feedback_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `rides_cancelled_view`
-- (See below for the actual view)
--
CREATE TABLE `rides_cancelled_view` (
`user_id` int(5)
,`first_name` varchar(45)
,`booking_status` enum('approved','Cancelled')
);

-- --------------------------------------------------------

--
-- Table structure for table `ride_details`
--

CREATE TABLE `ride_details` (
  `ride_details_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `waiting_time` datetime NOT NULL,
  `pickup_time` datetime NOT NULL,
  `drop_time` datetime NOT NULL,
  `ride_cost` datetime NOT NULL,
  `no_of_miles` int(11) NOT NULL,
  `driver_login_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(5) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `user_address` varchar(45) NOT NULL,
  `user_email` varchar(45) NOT NULL,
  `user_telephone` int(10) NOT NULL,
  `card_details` varchar(16) NOT NULL,
  `card_valid_thru` date NOT NULL,
  `user_zip` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

CREATE TABLE `user_login` (
  `user_login_id` int(11) NOT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `user_pswd` varchar(45) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `zips`
--

CREATE TABLE `zips` (
  `zip` char(5) NOT NULL,
  `state` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `lat` decimal(8,6) NOT NULL,
  `lng` decimal(10,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure for view `driver_commission_view`
--
DROP TABLE IF EXISTS `driver_commission_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rideplus`.`driver_commission_view`  AS  select `rideplus`.`drivers`.`driver_id` AS `driver_id`,`rideplus`.`drivers`.`driver_first_name` AS `driver_first_name`,`rideplus`.`commission`.`driver_commission` AS `driver_commission` from ((((`rideplus`.`drivers` join `rideplus`.`cars`) join `rideplus`.`driver_login`) join `rideplus`.`ride_details`) join `rideplus`.`commission`) where ((`rideplus`.`drivers`.`driver_id` = `rideplus`.`cars`.`driver_id`) and (`rideplus`.`cars`.`car_id` = `rideplus`.`driver_login`.`car_id`) and (`rideplus`.`driver_login`.`driver_login_id` = `rideplus`.`ride_details`.`driver_login_id`) and (`rideplus`.`ride_details`.`ride_details_id` = `rideplus`.`commission`.`ride_details_id`)) group by `rideplus`.`drivers`.`driver_id` ;

-- --------------------------------------------------------

--
-- Structure for view `excellent_rating_view`
--
DROP TABLE IF EXISTS `excellent_rating_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rideplus`.`excellent_rating_view`  AS  select `rideplus`.`user`.`user_id` AS `user_id`,`rideplus`.`user`.`first_name` AS `first_name`,`rideplus`.`rating`.`ratings` AS `ratings`,`rideplus`.`drivers`.`driver_id` AS `driver_id`,`rideplus`.`drivers`.`driver_first_name` AS `driver_first_name` from ((((((`rideplus`.`user` join `rideplus`.`booking`) join `rideplus`.`ride_details`) join `rideplus`.`rating`) join `rideplus`.`cars`) join `rideplus`.`driver_login`) join `rideplus`.`drivers`) where ((`rideplus`.`user`.`user_id` = `rideplus`.`booking`.`user_id`) and (`rideplus`.`booking`.`booking_id` = `rideplus`.`ride_details`.`booking_id`) and (`rideplus`.`ride_details`.`ride_details_id` = `rideplus`.`rating`.`ride_details_id`) and (`rideplus`.`drivers`.`driver_id` = `rideplus`.`cars`.`driver_id`) and (`rideplus`.`cars`.`car_id` = `rideplus`.`driver_login`.`car_id`) and (`rideplus`.`driver_login`.`driver_login_id` = `rideplus`.`ride_details`.`driver_login_id`) and (`rideplus`.`rating`.`ratings` = 'Excellent')) ;

-- --------------------------------------------------------

--
-- Structure for view `number_of_rides_view`
--
DROP TABLE IF EXISTS `number_of_rides_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rideplus`.`number_of_rides_view`  AS  select count(`rideplus`.`ride_details`.`ride_details_id`) AS `No_of_rides`,`rideplus`.`driver_login`.`driver_login_id` AS `driver_login_id`,`rideplus`.`drivers`.`driver_first_name` AS `driver_first_name` from ((`rideplus`.`ride_details` join `rideplus`.`driver_login`) join `rideplus`.`drivers`) group by `rideplus`.`driver_login`.`driver_login_id` ;

-- --------------------------------------------------------

--
-- Structure for view `rides_cancelled_view`
--
DROP TABLE IF EXISTS `rides_cancelled_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rideplus`.`rides_cancelled_view`  AS  select `rideplus`.`user`.`user_id` AS `user_id`,`rideplus`.`user`.`first_name` AS `first_name`,`rideplus`.`booking`.`booking_status` AS `booking_status` from (`rideplus`.`user` join `rideplus`.`booking`) where ((`rideplus`.`user`.`user_id` = `rideplus`.`booking`.`user_id`) and (`rideplus`.`booking`.`booking_status` = 'Cancelled')) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `fk_user_id_idx` (`user_id`),
  ADD KEY `fk_pickup_zip_idx` (`pickup_zip`),
  ADD KEY `fk_drop_point_idx` (`dropoff_zip`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `fk_driver_id_idx` (`driver_id`),
  ADD KEY `fk_cars_cars1_idx` (`cars_car_id`);

--
-- Indexes for table `commission`
--
ALTER TABLE `commission`
  ADD PRIMARY KEY (`commission_id`),
  ADD KEY `fk_ride_detail_id_idx` (`ride_details_id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`driver_id`),
  ADD KEY `fk_driver_zip_idx` (`driver_zip`);

--
-- Indexes for table `driver_login`
--
ALTER TABLE `driver_login`
  ADD PRIMARY KEY (`driver_login_id`),
  ADD KEY `fk_driver_login_zip_idx` (`driver_login_zip`),
  ADD KEY `fk_car_id_idx` (`car_id`),
  ADD KEY `fk_driver_logout_zip_idx` (`driver_logout_zip`);

--
-- Indexes for table `payment_info`
--
ALTER TABLE `payment_info`
  ADD PRIMARY KEY (`payment_info_id`),
  ADD KEY `fk_ride_details_id_idx` (`ride_details_id`);

--
-- Indexes for table `Rating`
--
ALTER TABLE `Rating`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `fk_ride_details_ratingID_idx` (`ride_details_id`);

--
-- Indexes for table `ride_details`
--
ALTER TABLE `ride_details`
  ADD PRIMARY KEY (`ride_details_id`),
  ADD KEY `fk_driver_login_id_idx` (`driver_login_id`),
  ADD KEY `fk_ride_details_booking1_idx` (`booking_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `fk_user_zip_idx` (`user_zip`);

--
-- Indexes for table `user_login`
--
ALTER TABLE `user_login`
  ADD PRIMARY KEY (`user_login_id`),
  ADD KEY `fk_user_id_idx` (`user_id`);

--
-- Indexes for table `zips`
--
ALTER TABLE `zips`
  ADD PRIMARY KEY (`zip`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `fk_drop_point` FOREIGN KEY (`dropoff_zip`) REFERENCES `zips` (`zip`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pickup_zip` FOREIGN KEY (`pickup_zip`) REFERENCES `zips` (`zip`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `fk_cars_cars1` FOREIGN KEY (`cars_car_id`) REFERENCES `cars` (`car_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_driver_id` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `commission`
--
ALTER TABLE `commission`
  ADD CONSTRAINT `fk_ride_detail_id` FOREIGN KEY (`ride_details_id`) REFERENCES `ride_details` (`ride_details_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `drivers`
--
ALTER TABLE `drivers`
  ADD CONSTRAINT `fk_driver_zip` FOREIGN KEY (`driver_zip`) REFERENCES `zips` (`zip`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `driver_login`
--
ALTER TABLE `driver_login`
  ADD CONSTRAINT `fk_car_id` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_driver_login_zip` FOREIGN KEY (`driver_login_zip`) REFERENCES `zips` (`zip`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_driver_logout_zip` FOREIGN KEY (`driver_logout_zip`) REFERENCES `zips` (`zip`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `payment_info`
--
ALTER TABLE `payment_info`
  ADD CONSTRAINT `fk_ride_details_paymentID` FOREIGN KEY (`ride_details_id`) REFERENCES `ride_details` (`ride_details_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Rating`
--
ALTER TABLE `Rating`
  ADD CONSTRAINT `fk_ride_details_ratingID` FOREIGN KEY (`ride_details_id`) REFERENCES `ride_details` (`ride_details_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ride_details`
--
ALTER TABLE `ride_details`
  ADD CONSTRAINT `fk_driver_login_id` FOREIGN KEY (`driver_login_id`) REFERENCES `driver_login` (`driver_login_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ride_details_booking1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_zip` FOREIGN KEY (`user_zip`) REFERENCES `zips` (`zip`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_login`
--
ALTER TABLE `user_login`
  ADD CONSTRAINT `fk_user_login_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
