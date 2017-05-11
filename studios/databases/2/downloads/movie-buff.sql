-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:8889
-- Generation Time: May 09, 2017 at 09:27 PM
-- Server version: 5.6.34-log
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movie-buff`
--

-- --------------------------------------------------------

--
-- Table structure for table `directors`
--

CREATE TABLE IF NOT EXISTS `directors` (
  `director_id` int(11) NOT NULL,
  `first` varchar(60) DEFAULT NULL,
  `last` varchar(60) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `directors`
--

INSERT INTO `directors` (`director_id`, `first`, `last`, `country`) VALUES
(1, 'Jean-Pierre', 'Jeunet', 'France'),
(2, 'Jean', 'Renoir', 'France'),
(3, 'Akira', 'Kurosawa', 'Japan'),
(4, 'Jane', 'Campion', 'New Zealand'),
(5, 'Sally', 'Potter', 'UK'),
(6, 'Kasi', 'Lemmons', 'USA'),
(7, 'Ava', 'DuVernay', 'USA'),
(8, 'Todd', 'Haynes', 'USA'),
(9, 'Marleen', 'Gorris', 'Netherlands');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE IF NOT EXISTS `movies` (
  `movie_id` int(11) NOT NULL,
  `title` varchar(130) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `director_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movie_id`, `title`, `year`, `director_id`) VALUES
(1, 'The City of Lost Children', 1995, 1),
(2, 'Amelie', 2001, 1),
(3, 'The Rules of the Game', 1939, 2),
(4, 'La Grande Illusion', 1937, 2),
(5, 'The Lower Depths', 1936, 2),
(6, 'Alien: Resurrection', 1997, 1),
(7, 'Ran', 1985, 3),
(8, 'Seven Samurai', 1954, 3),
(9, 'Throne of Blood', 1957, 3),
(10, 'An Angel at My Table', 1990, 4),
(11, 'The Piano', 1993, 4),
(12, 'Orlando', 1992, 5),
(13, 'The Tango Lesson', 1997, 5),
(14, 'Talk to Me', 2007, 6),
(15, 'Eve''s Bayou', 1997, 6),
(16, 'Selma', 2014, 7),
(18, 'Far From Heaven', 2002, 8),
(19, 'I''m Not There', 2007, 8),
(20, 'Carol', 2015, 8),
(21, 'Antonia''s Line', 1995, 9),
(22, 'Mrs. Dalloway', 1997, 9);

-- --------------------------------------------------------

--
-- Table structure for table `viewers`
--

CREATE TABLE IF NOT EXISTS `viewers` (
  `viewer_id` int(11) NOT NULL,
  `first` varchar(60) DEFAULT NULL,
  `last` varchar(60) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `viewers`
--

INSERT INTO `viewers` (`viewer_id`, `first`, `last`, `email`) VALUES
(1, 'Tim', 'Labonne', 'tim_labonne@live.com'),
(2, 'Alicen', 'Brightley', 'abrightley@yahoo.com'),
(3, 'Renard', 'Sartor', 'rsartor@washu.edu'),
(4, 'Luigi', 'Greco', 'elgreco@live.com'),
(5, 'Jackie', 'Linwood', 'jLinwood@yahoo.com'),
(6, 'Caroline', 'Smith', 'youknowwho@live.com');

-- --------------------------------------------------------

--
-- Table structure for table `viewings`
--

CREATE TABLE IF NOT EXISTS `viewings` (
  `viewing_id` int(11) NOT NULL,
  `viewer_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `date_viewed` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `viewings`
--

INSERT INTO `viewings` (`viewing_id`, `viewer_id`, `movie_id`, `date_viewed`) VALUES
(1, 1, 4, '2008-10-07'),
(2, 1, 2, '2009-12-18'),
(3, 1, 1, '2010-02-27'),
(4, 1, 21, '2010-03-14'),
(5, 2, 21, '2015-04-15'),
(6, 2, 22, '2015-10-04'),
(7, 2, 7, '2015-11-30'),
(8, 2, 9, '2016-01-05'),
(9, 2, 12, '2016-04-14'),
(10, 2, 16, '2017-01-23'),
(11, 3, 8, '2016-02-14'),
(12, 3, 18, '2016-03-20'),
(13, 3, 22, '2016-04-07'),
(14, 4, 20, '2017-01-03'),
(15, 4, 18, '2017-01-14'),
(16, 4, 15, '2017-02-08'),
(17, 4, 10, '2007-09-23'),
(18, 4, 2, '2017-03-05'),
(19, 4, 4, '2017-04-13'),
(20, 4, 12, '2017-04-30'),
(21, 4, 14, '2017-05-02'),
(22, 4, 21, '2017-05-08'),
(23, 5, 2, '2013-08-25'),
(24, 5, 3, '2013-12-16'),
(25, 5, 7, '2014-03-18'),
(26, 6, 11, '2013-11-30'),
(27, 6, 2, '2013-12-18'),
(28, 6, 14, '2014-04-29'),
(29, 6, 5, '2016-12-03'),
(30, 6, 13, '2017-01-09'),
(31, 6, 18, '2017-02-13'),
(32, 6, 21, '2017-03-14'),
(33, 6, 15, '2017-04-15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `directors`
--
ALTER TABLE `directors`
  ADD PRIMARY KEY (`director_id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movie_id`),
  ADD KEY `director_id` (`director_id`);

--
-- Indexes for table `viewers`
--
ALTER TABLE `viewers`
  ADD PRIMARY KEY (`viewer_id`);

--
-- Indexes for table `viewings`
--
ALTER TABLE `viewings`
  ADD PRIMARY KEY (`viewing_id`),
  ADD KEY `viewer_id` (`viewer_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `directors`
--
ALTER TABLE `directors`
  MODIFY `director_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `viewers`
--
ALTER TABLE `viewers`
  MODIFY `viewer_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `viewings`
--
ALTER TABLE `viewings`
  MODIFY `viewing_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`director_id`) REFERENCES `directors` (`director_id`);

--
-- Constraints for table `viewings`
--
ALTER TABLE `viewings`
  ADD CONSTRAINT `viewings_ibfk_1` FOREIGN KEY (`viewer_id`) REFERENCES `viewers` (`viewer_id`),
  ADD CONSTRAINT `viewings_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
