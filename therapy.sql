-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2022 at 12:40 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `therapy2`
--

-- --------------------------------------------------------

--
-- Table structure for table `book_session`
--

CREATE TABLE `book_session` (
  `session_id` int(255) NOT NULL,
  `booked_by` int(255) NOT NULL,
  `patient_name` varchar(255) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `category` varchar(255) NOT NULL,
  `therapist` int(255) NOT NULL,
  `therapist_name` varchar(255) NOT NULL,
  `approved_by` int(255) NOT NULL,
  `appdate` date NOT NULL,
  `apptime` time(6) NOT NULL,
  `payment_status` enum('pending','complete') NOT NULL,
  `session_status` enum('pending','attended') NOT NULL,
  `is_deleted` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book_session`
--

INSERT INTO `book_session` (`session_id`, `booked_by`, `patient_name`, `phone_number`, `category`, `therapist`, `therapist_name`, `approved_by`, `appdate`, `apptime`, `payment_status`, `session_status`, `is_deleted`) VALUES
(21, 10, 'Jeff', '0712344556', 'PTSD', 30, 'Dr Mathenge', 0, '2022-07-30', '12:12:00.000000', 'pending', 'pending', 1),
(22, 10, 'Jeff', '0723233446', 'FGM', 34, 'Dr.Lee', 0, '2022-07-30', '11:00:00.000000', 'pending', 'attended', 0);

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `chat_id` int(25) NOT NULL,
  `incoming_msg_id` int(255) NOT NULL,
  `outgoing_msg_id` int(255) NOT NULL,
  `message` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `comments` longtext NOT NULL,
  `createdOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `emergency_contact`
--

CREATE TABLE `emergency_contact` (
  `contact_id` int(11) NOT NULL,
  `contact_fname` varchar(40) DEFAULT NULL,
  `contact_lname` varchar(40) DEFAULT NULL,
  `contact_number` int(10) DEFAULT NULL,
  `added_by` int(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emergency_contact`
--

INSERT INTO `emergency_contact` (`contact_id`, `contact_fname`, `contact_lname`, `contact_number`, `added_by`, `created_at`, `updated_at`, `is_deleted`) VALUES
(12776, 'Jane', 'Doe', 712121212, 5, NULL, NULL, 0),
(12777, 'Max', 'Well', 743721232, 5, NULL, NULL, 0),
(12778, 'Ben', 'Brien', 745352412, 6, NULL, NULL, 0),
(12779, 'Ken', 'Kelly', 792837465, 9, NULL, NULL, 0),
(12780, 'Leon', 'Carl', 723425262, 5, NULL, NULL, 0),
(12781, 'James', 'Bond', 722334455, 5, NULL, NULL, 0),
(12782, 'Timothy', 'Mukaru', 791617821, 5, NULL, NULL, 0),
(12783, 'Wanjiru', 'Kemboi', 791617822, 23100, NULL, NULL, 0),
(12784, 'Everlyne', 'Kuria', 791617922, 23100, NULL, NULL, 0),
(12785, 'Jamarcus', 'Ombwalala', 791618922, 23100, NULL, NULL, 0),
(12786, 'Mark ', 'Maasai', 734562673, 23100, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `focusgroup`
--

CREATE TABLE `focusgroup` (
  `focusgroup_id` int(11) NOT NULL,
  `focusgroup_name` varchar(40) DEFAULT NULL,
  `focusgroup_member` int(11) NOT NULL,
  `focusgroup_leader` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `focusgroup`
--

INSERT INTO `focusgroup` (`focusgroup_id`, `focusgroup_name`, `focusgroup_member`, `focusgroup_leader`, `created_by`, `created_at`, `updated_at`, `is_deleted`) VALUES
(23954, NULL, 10, NULL, NULL, '2022-06-16 20:45:19', '2022-06-16 20:45:19', 0);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_id` int(11) NOT NULL,
  `location_name` varchar(40) DEFAULT NULL,
  `location_ip` varchar(40) DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `sent_by` int(11) DEFAULT NULL,
  `sent_to` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `location_name`, `location_ip`, `sent_at`, `sent_by`, `sent_to`, `is_deleted`) VALUES
(34567, NULL, NULL, '2022-06-16 20:48:59', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `payment_type` enum('mpesa','wallet','card') DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `payment_status` enum('paid','pending','cancelled') DEFAULT 'pending',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `payed_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `session_id`, `payment_type`, `amount`, `payment_status`, `created_at`, `updated_at`, `payed_by`, `is_deleted`) VALUES
(45678, NULL, NULL, NULL, NULL, '2022-06-16 20:49:20', '2022-06-16 20:49:20', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `request_id` int(11) NOT NULL,
  `status` enum('pending','approved') DEFAULT 'pending',
  `category` varchar(15) NOT NULL,
  `requested_by` int(11) DEFAULT NULL,
  `accepted_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`request_id`, `status`, `category`, `requested_by`, `accepted_by`, `created_at`, `updated_at`, `is_deleted`) VALUES
(56737, 'pending', 'General/All', 23100, NULL, '2022-07-13 12:07:57', '2022-07-13 12:07:57', 0),
(56738, 'pending', 'sexual_abuse', 23100, NULL, '2022-07-13 12:07:53', '2022-07-13 12:07:53', 0);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` int(11) NOT NULL,
  `request_id` int(11) DEFAULT NULL,
  `scheduled_date` date NOT NULL,
  `scheduled_time` time DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`schedule_id`, `request_id`, `scheduled_date`, `scheduled_time`, `is_deleted`) VALUES
(32346, 56737, '2022-07-30', '07:00:00', 0),
(32347, 56738, '2022-07-31', '09:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `sessions_id` int(11) NOT NULL,
  `schedule` int(11) DEFAULT NULL,
  `duration` time DEFAULT NULL,
  `comments` text DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `ended_at` datetime DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `fname` varchar(40) DEFAULT NULL,
  `lname` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `role` enum('user','therapist','admin') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `fname`, `lname`, `email`, `gender`, `password`, `avatar`, `role`, `created_at`, `updated_at`, `is_deleted`) VALUES
(5, 'Jeff', 'Jack', 'jeff@id.com', 'male', '1234567', '1657365349', 'user', NULL, NULL, 0),
(6, 'lee', 'Jack', 'jeff@idi.com', 'male', '123456', '1657365465', 'user', NULL, NULL, 0),
(7, 'linus', 'lee', 'lee@gmail.com', 'male', '123456', '1657365531', 'admin', NULL, NULL, 0),
(8, 'New', 'User', 'user@gmail.com', 'male', '123456', '1657366577', 'user', NULL, NULL, 0),
(9, 'John', 'Doe', 'johndoe@gmail.com', 'male', 'doe123', '1657488816', 'user', NULL, NULL, 0),
(10, 'Jane', 'Jackson', 'jeff@gmail.com', 'male', 'jj12345', '1657489398', 'user', NULL, NULL, 0),
(23100, 'Timothy', 'Mukaru', 'timtest@test.com', 'male', 'timtest', '1657626970].jpg', 'user', '2022-07-12 13:07:10', '2022-07-12 13:07:10', 0),
(23109, 'Tyra ', 'Banks', 'tyra@test.com', 'female', 'tyratesttest', '1657630502person2.jpg', 'therapist', '2022-07-12 14:07:02', '2022-07-12 14:07:02', 0),
(23110, 'David ', 'Hammilton', 'hamm@test.com', 'male', 'hamm123', '1657630684person1.png', 'therapist', '2022-07-12 14:07:04', '2022-07-12 14:07:04', 0),
(23111, 'Everlyne', 'Okoye', 'okoye@test.com', 'female', 'okoyeeve', '1657630927person6.jpg', 'therapist', '2022-07-12 15:07:07', '2022-07-12 15:07:07', 0),
(23112, 'Benjamin ', 'Luca', 'luca@test.com', 'male', 'lucatest', '1657631006person3.jpg', 'therapist', '2022-07-12 15:07:26', '2022-07-12 15:07:26', 0),
(23113, 'Liam', 'Noah', 'noah@test.com', 'male', 'noahliam', '1657631049person4.jpg', 'therapist', '2022-07-12 15:07:09', '2022-07-12 15:07:09', 0),
(23114, 'William', 'Stone', 'stone@test.com', 'male', 'stone23', '1657631095person5.jpg', 'therapist', '2022-07-12 15:07:55', '2022-07-12 15:07:55', 0);

-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

CREATE TABLE `userlogin` (
  `userlogin_id` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `logintime` datetime DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userlogin`
--

INSERT INTO `userlogin` (`userlogin_id`, `user`, `logintime`, `logout_time`, `is_deleted`) VALUES
(45882, 8, '2022-07-12 12:07:32', '2022-07-12 17:07:25', 0),
(45883, 8, '2022-07-12 13:07:12', '2022-07-12 17:07:25', 0),
(45884, 23100, '2022-07-12 13:07:51', '2022-07-20 20:07:27', 0),
(45885, 8, '2022-07-12 14:07:41', '2022-07-12 17:07:25', 0),
(45886, 23100, '2022-07-12 15:07:13', '2022-07-20 20:07:27', 0),
(45887, 23100, '2022-07-12 15:07:21', '2022-07-20 20:07:27', 0),
(45888, 8, '2022-07-12 16:07:22', '2022-07-12 17:07:25', 0),
(45889, 23100, '2022-07-12 17:07:49', '2022-07-20 20:07:27', 0),
(45890, 23100, '2022-07-13 09:07:35', '2022-07-20 20:07:27', 0),
(45891, 23100, '2022-07-19 07:07:41', '2022-07-20 20:07:27', 0),
(45892, 23100, '2022-07-20 10:07:41', '2022-07-20 20:07:27', 0),
(45893, 23100, '2022-07-20 19:07:15', '2022-07-20 20:07:27', 0),
(45894, 23112, '2022-07-20 20:07:59', '2022-07-20 20:07:34', 0),
(45895, 23100, '2022-07-20 20:07:19', '2022-07-20 20:07:27', 0),
(45896, 23112, '2022-07-20 20:07:31', '2022-07-20 20:07:34', 0),
(45897, 23112, '0000-00-00 00:00:00', '2022-07-20 20:07:34', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book_session`
--
ALTER TABLE `book_session`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`chat_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `emergency_contact`
--
ALTER TABLE `emergency_contact`
  ADD PRIMARY KEY (`contact_id`),
  ADD KEY `added_by` (`added_by`);

--
-- Indexes for table `focusgroup`
--
ALTER TABLE `focusgroup`
  ADD PRIMARY KEY (`focusgroup_id`),
  ADD KEY `focusgroup_leader` (`focusgroup_leader`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `focusgroup_member` (`focusgroup_member`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `sent_by` (`sent_by`),
  ADD KEY `sent_to` (`sent_to`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `payed_by` (`payed_by`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `requested_by` (`requested_by`),
  ADD KEY `accepted_by` (`accepted_by`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `request_id` (`request_id`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`sessions_id`),
  ADD KEY `schedule` (`schedule`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `userlogin`
--
ALTER TABLE `userlogin`
  ADD PRIMARY KEY (`userlogin_id`),
  ADD KEY `user` (`user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book_session`
--
ALTER TABLE `book_session`
  MODIFY `session_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `chat_id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emergency_contact`
--
ALTER TABLE `emergency_contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12787;

--
-- AUTO_INCREMENT for table `focusgroup`
--
ALTER TABLE `focusgroup`
  MODIFY `focusgroup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23955;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34568;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45679;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56739;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32348;

--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `sessions_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23115;

--
-- AUTO_INCREMENT for table `userlogin`
--
ALTER TABLE `userlogin`
  MODIFY `userlogin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45898;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `emergency_contact`
--
ALTER TABLE `emergency_contact`
  ADD CONSTRAINT `emergency_contact_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `focusgroup`
--
ALTER TABLE `focusgroup`
  ADD CONSTRAINT `focusgroup_ibfk_1` FOREIGN KEY (`focusgroup_leader`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `focusgroup_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `focusgroup_ibfk_3` FOREIGN KEY (`focusgroup_member`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`sent_by`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `location_ibfk_2` FOREIGN KEY (`sent_to`) REFERENCES `emergency_contact` (`contact_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `session` (`sessions_id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`payed_by`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`requested_by`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `request_ibfk_2` FOREIGN KEY (`accepted_by`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `request` (`request_id`);

--
-- Constraints for table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`schedule`) REFERENCES `schedule` (`schedule_id`);

--
-- Constraints for table `userlogin`
--
ALTER TABLE `userlogin`
  ADD CONSTRAINT `userlogin_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
