-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2015 at 07:23 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `414_weather`
--

-- --------------------------------------------------------

--
-- Table structure for table `weather_by_city`
--

CREATE TABLE IF NOT EXISTS `weather_by_city` (
  `city_name` varchar(255) NOT NULL,
  `main_weather_cond` varchar(255) NOT NULL,
  `weather_description` varchar(255) NOT NULL,
  `id` varchar(2) NOT NULL,
  `temp_kelvin` decimal(10,0) NOT NULL,
  `humidity` decimal(10,0) NOT NULL,
  `wind_speed` decimal(10,0) NOT NULL,
  `wind_degree_angle` int(11) NOT NULL,
  `percent_cloudy` decimal(10,0) NOT NULL,
  `sunrise_time_utc` int(11) NOT NULL,
  `sunset_time_utc` int(11) NOT NULL,
  `time_pulled` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `weather_by_city`
--

INSERT INTO `weather_by_city` (`city_name`, `main_weather_cond`, `weather_description`, `id`, `temp_kelvin`, `humidity`, `wind_speed`, `wind_degree_angle`, `percent_cloudy`, `sunrise_time_utc`, `sunset_time_utc`, `time_pulled`) VALUES
('Aiea', '"Clouds"', '"scattered clouds"', '03', '298', '75', '7', 78, '44', 1447000717, 1447041123, '2015-11-08 06:17:32'),
('Anahola', '"Clouds"', '"scattered clouds"', '03', '298', '93', '5', 80, '32', 1447001110, 1447041391, '2015-11-08 06:17:32'),
('Barbers-Point', '"Clouds"', '"few clouds"', '02', '299', '93', '9', 73, '20', 1447000748, 1447041164, '2015-11-08 06:17:33'),
('Captain-Cook', '"Clouds"', '"scattered clouds"', '03', '299', '100', '9', 60, '32', 1447000083, 1447040794, '2015-11-08 06:17:33'),
('Eleele', '"Clouds"', '"few clouds"', '02', '300', '100', '10', 69, '20', 1447001156, 1447041475, '2015-11-08 06:17:33'),
('Ewa-Beach', '"Clouds"', '"few clouds"', '02', '299', '93', '9', 73, '20', 1447000732, 1447041147, '2015-11-08 06:17:33'),
('Fort-Shafter', '"Clouds"', '"scattered clouds"', '03', '298', '75', '7', 78, '44', 1447000713, 1447041118, '2015-11-08 06:17:34'),
('Haiku', '"Clouds"', '"few clouds"', '02', '298', '73', '4', 68, '20', 1447000290, 1447040772, '2015-11-08 06:17:34'),
('Hakalau', '"Rain"', '"light rain"', '10', '282', '99', '2', 227, '92', 1446962426, 1446991483, '2015-11-08 06:17:34'),
('Haleiwa', '"Clear"', '"sky is clear"', '01', '299', '65', '4', 70, '1', 1447000777, 1447041149, '2015-11-08 06:17:34'),
('Hana', '"Clouds"', '"broken clouds"', '04', '298', '100', '10', 65, '80', 1447000200, 1447040709, '2015-11-08 06:17:34'),
('Hanalei', '"Clouds"', '"scattered clouds"', '03', '298', '93', '5', 80, '32', 1447001158, 1447041425, '2015-11-08 06:17:35'),
('Hanamaulu', '"Clouds"', '"few clouds"', '02', '300', '100', '10', 69, '20', 1447001108, 1447041413, '2015-11-08 06:17:35'),
('Hanapepe', '"Clouds"', '"few clouds"', '02', '300', '100', '10', 69, '20', 1447001159, 1447041478, '2015-11-08 06:17:35'),
('Hauula', '"Clouds"', '"scattered clouds"', '03', '298', '75', '7', 78, '44', 1447000731, 1447041099, '2015-11-08 06:17:35'),
('Hawaii-National-Park', '"Rain"', '"light rain"', '10', '295', '100', '6', 74, '88', 1446999914, 1447040636, '2015-11-08 06:17:35'),
('Hawaiian-Ocean-View', '"Rain"', '"light rain"', '10', '295', '100', '6', 74, '88', 1446999954, 1447040711, '2015-11-08 06:17:36'),
('Hawi', '"Clouds"', '"broken clouds"', '04', '298', '100', '10', 65, '80', 1447000120, 1447040713, '2015-11-08 06:17:36'),
('Hickam-AFB', '"Clouds"', '"scattered clouds"', '03', '298', '75', '7', 78, '44', 1447000720, 1447041130, '2015-11-08 06:17:36'),
('Hilo', '"Rain"', '"light rain"', '10', '295', '100', '10', 66, '92', 1446999901, 1447040576, '2015-11-08 06:17:36'),
('Holualoa', '"Clouds"', '"scattered clouds"', '03', '299', '100', '9', 60, '32', 1447000099, 1447040792, '2015-11-08 06:17:36'),
('Honaunau', '"Rain"', '"light rain"', '10', '299', '100', '9', 78, '80', 1447000064, 1447040783, '2015-11-08 06:17:37'),
('Honokaa', '"Clouds"', '"broken clouds"', '04', '299', '100', '10', 74, '80', 1447000021, 1447040639, '2015-11-08 06:17:37'),
('Honolulu', '"Clouds"', '"scattered clouds"', '03', '298', '75', '7', 78, '44', 1447000694, 1447041112, '2015-11-08 06:17:37'),
('Honomu', '"Rain"', '"light rain"', '10', '295', '100', '10', 66, '92', 1446999914, 1447040573, '2015-11-08 06:17:37'),
('Hoolehua', '"Clouds"', '"scattered clouds"', '03', '299', '100', '10', 74, '32', 1447000485, 1447040928, '2015-11-08 06:17:37'),
('Kaaawa', '"Clouds"', '"scattered clouds"', '03', '298', '75', '7', 78, '44', 1447000712, 1447041089, '2015-11-08 06:17:38'),
('Kahului', '"Clouds"', '"few clouds"', '02', '298', '73', '4', 68, '20', 1447000326, 1447040813, '2015-11-08 06:17:38'),
('Kailua', '"Clouds"', '"scattered clouds"', '03', '298', '75', '7', 78, '44', 1447000673, 1447041076, '2015-11-08 06:17:38'),
('Kailua-Kona', '"Clouds"', '"scattered clouds"', '03', '299', '100', '9', 60, '32', 1447000113, 1447040802, '2015-11-08 06:17:38'),
('Kalaheo', '"Clouds"', '"few clouds"', '02', '300', '100', '10', 69, '20', 1447001145, 1447041462, '2015-11-08 06:17:38'),
('Kalaupapa', '"Clouds"', '"scattered clouds"', '03', '299', '100', '10', 74, '32', 1447000485, 1447040928, '2015-11-08 06:17:39'),
('Kamuela', '"Clouds"', '"broken clouds"', '04', '299', '100', '10', 74, '80', 1447000064, 1447040692, '2015-11-08 06:17:39'),
('Kaneohe', '"Clouds"', '"scattered clouds"', '03', '298', '75', '7', 78, '44', 1447000689, 1447041089, '2015-11-08 06:17:39'),
('Kapaa', '"Clouds"', '"scattered clouds"', '03', '298', '93', '5', 80, '32', 1447001108, 1447041399, '2015-11-08 06:17:39'),
('Kapaau', '"Clouds"', '"broken clouds"', '04', '298', '100', '10', 65, '80', 1447000112, 1447040706, '2015-11-08 06:17:39'),
('Kapolei', '"Clouds"', '"few clouds"', '02', '299', '93', '9', 73, '20', 1447000748, 1447041164, '2015-11-08 06:17:40'),
('Kaumakani', '"Clouds"', '"few clouds"', '02', '300', '100', '10', 69, '20', 1447001159, 1447041478, '2015-11-08 06:17:40'),
('Kaunakakai', '"Clouds"', '"scattered clouds"', '03', '299', '100', '10', 74, '32', 1447000474, 1447040929, '2015-11-08 06:17:40'),
('Kawela-Bay', '"Clouds"', '"few clouds"', '02', '299', '93', '9', 73, '20', 1447000769, 1447041128, '2015-11-08 06:17:40'),
('Keaau', '"Rain"', '"light rain"', '10', '295', '100', '10', 66, '92', 1446999881, 1447040573, '2015-11-08 06:17:40'),
('Kealakekua', '"Clouds"', '"scattered clouds"', '03', '299', '100', '9', 60, '32', 1447000084, 1447040793, '2015-11-08 06:17:41'),
('Kealia', '"Clouds"', '"scattered clouds"', '03', '298', '93', '5', 80, '32', 1447001108, 1447041399, '2015-11-08 06:17:41'),
('Keauhou', '"Clouds"', '"scattered clouds"', '03', '299', '100', '9', 60, '32', 1447000097, 1447040798, '2015-11-08 06:17:41'),
('Kekaha', '"Clouds"', '"few clouds"', '02', '300', '100', '10', 69, '20', 1447001192, 1447041501, '2015-11-08 06:17:41'),
('Kihei', '"Clouds"', '"few clouds"', '02', '298', '73', '4', 68, '20', 1447000318, 1447040821, '2015-11-08 06:17:41'),
('Kilauea', '"Clouds"', '"scattered clouds"', '03', '298', '93', '5', 80, '32', 1447001140, 1447041409, '2015-11-08 06:17:42'),
('Koloa', '"Clouds"', '"few clouds"', '02', '300', '100', '10', 69, '20', 1447001127, 1447041447, '2015-11-08 06:17:42'),
('Kualapuu', '"Clouds"', '"scattered clouds"', '03', '299', '100', '10', 74, '32', 1447000485, 1447040928, '2015-11-08 06:17:42'),
('Kula', '"Clear"', '"sky is clear"', '02', '276', '83', '1', 344, '8', 1446957554, 1446994710, '2015-11-08 06:17:42'),
('Kunia', '"Clear"', '"Sky is Clear"', '01', '284', '62', '2', 232, '0', 1446936638, 1446973503, '2015-11-08 06:17:42'),
('Kurtistown', '"Rain"', '"light rain"', '10', '295', '100', '10', 66, '92', 1446999884, 1447040580, '2015-11-08 06:17:43'),
('Lahaina', '"Clouds"', '"few clouds"', '02', '298', '73', '4', 68, '20', 1447000376, 1447040864, '2015-11-08 06:17:43'),
('Laie', '"Clouds"', '"scattered clouds"', '03', '298', '75', '7', 78, '44', 1447000739, 1447041101, '2015-11-08 06:17:43'),
('Lanai-City', '"Clouds"', '"few clouds"', '02', '298', '73', '4', 68, '20', 1447000430, 1447040926, '2015-11-08 06:17:43'),
('Laupahoehoe', '"Rain"', '"light rain"', '10', '295', '100', '10', 66, '92', 1446999914, 1447040573, '2015-11-08 06:17:43'),
('Lawai', '"Clouds"', '"few clouds"', '02', '300', '100', '10', 69, '20', 1447001140, 1447041458, '2015-11-08 06:17:44'),
('Lihue', '"Clouds"', '"few clouds"', '02', '300', '100', '10', 69, '20', 1447001112, 1447041419, '2015-11-08 06:17:44'),
('Makawao', '"Clouds"', '"few clouds"', '02', '298', '73', '4', 68, '20', 1447000285, 1447040777, '2015-11-08 06:17:44'),
('Makaweli', '"Clouds"', '"few clouds"', '02', '300', '100', '10', 69, '20', 1447001182, 1447041493, '2015-11-08 06:17:44'),
('Maunaloa', '"Rain"', '"light rain"', '10', '283', '97', '5', 209, '92', 1446962451, 1446991546, '2015-11-08 06:17:44'),
('Mililani', '"Clouds"', '"scattered clouds"', '03', '298', '75', '7', 78, '44', 1447000739, 1447041134, '2015-11-08 06:17:44'),
('Mountain-View', '"Clear"', '"Sky is Clear"', '01', '283', '100', '2', 324, '0', 1446993625, 1447030994, '2015-11-08 06:17:45'),
('Naalehu', '"Rain"', '"light rain"', '10', '299', '100', '9', 78, '80', 1447000009, 1447040790, '2015-11-08 06:17:45'),
('Ninole', '"Rain"', '"light rain"', '10', '295', '100', '10', 66, '92', 1446999914, 1447040573, '2015-11-08 06:17:45'),
('Ocean-View', '"Clouds"', '"few clouds"', '02', '287', '100', '11', 325, '12', 1446982446, 1447019423, '2015-11-08 06:17:45'),
('Ookala', '"Clouds"', '"broken clouds"', '04', '299', '100', '10', 74, '80', 1447000021, 1447040639, '2015-11-08 06:17:46'),
('Paauhau', '"Clouds"', '"broken clouds"', '04', '299', '100', '10', 74, '80', 1447000021, 1447040639, '2015-11-08 06:17:46'),
('Paauilo', '"Clouds"', '"broken clouds"', '04', '299', '100', '10', 74, '80', 1447000021, 1447040639, '2015-11-08 06:17:46'),
('Pahala', '"Rain"', '"light rain"', '10', '295', '100', '6', 74, '88', 1446999953, 1447040712, '2015-11-08 06:17:46'),
('Pahoa', '"Rain"', '"light rain"', '10', '297', '100', '9', 67, '92', 1446999854, 1447040566, '2015-11-08 06:17:46'),
('Paia', '"Clouds"', '"few clouds"', '02', '298', '73', '4', 68, '20', 1447000303, 1447040788, '2015-11-08 06:17:46'),
('Papaaloa', '"Rain"', '"light rain"', '10', '295', '100', '10', 66, '92', 1446999914, 1447040573, '2015-11-08 06:17:47'),
('Papaikou', '"Rain"', '"light rain"', '10', '295', '100', '10', 66, '92', 1446999908, 1447040574, '2015-11-08 06:17:47'),
('Pearl-City', '"Clouds"', '"scattered clouds"', '03', '298', '75', '7', 78, '44', 1447000729, 1447041131, '2015-11-08 06:17:47'),
('Pearl-Harbor', '"Clouds"', '"scattered clouds"', '03', '298', '75', '7', 78, '44', 1447000720, 1447041130, '2015-11-08 06:17:47'),
('Pepeekeo', '"Rain"', '"light rain"', '10', '295', '100', '10', 66, '92', 1446999914, 1447040573, '2015-11-08 06:17:47'),
('Princeville', '"Clouds"', '"overcast clouds"', '04', '281', '86', '6', 292, '92', 1446980102, 1447015334, '2015-11-08 06:17:48'),
('Pukalani', '"Clouds"', '"few clouds"', '02', '298', '73', '4', 68, '20', 1447000291, 1447040786, '2015-11-08 06:17:48'),
('Puunene', '"Clouds"', '"few clouds"', '02', '298', '73', '4', 68, '20', 1447000326, 1447040813, '2015-11-08 06:17:48'),
('Schofield-Barracks', '"Clouds"', '"few clouds"', '02', '299', '93', '9', 73, '20', 1447000758, 1447041145, '2015-11-08 06:17:48'),
('Volcano', '"Rain"', '"light rain"', '10', '295', '100', '6', 74, '88', 1446999913, 1447040637, '2015-11-08 06:17:48'),
('Wahiawa', '"Clouds"', '"few clouds"', '02', '299', '93', '9', 73, '20', 1447000748, 1447041135, '2015-11-08 06:17:49'),
('Waialua', '"Clear"', '"sky is clear"', '01', '299', '65', '4', 70, '1', 1447000781, 1447041155, '2015-11-08 06:17:49'),
('Waianae', '"Clouds"', '"few clouds"', '02', '299', '93', '9', 73, '20', 1447000784, 1447041181, '2015-11-08 06:17:49'),
('Waikoloa', '"Clouds"', '"scattered clouds"', '03', '299', '100', '9', 60, '32', 1447000086, 1447040727, '2015-11-08 06:17:49'),
('Wailuku', '"Clouds"', '"few clouds"', '02', '298', '73', '4', 68, '20', 1447000333, 1447040820, '2015-11-08 06:17:49'),
('Waimanalo', '"Clouds"', '"scattered clouds"', '03', '298', '75', '7', 78, '44', 1447000664, 1447041075, '2015-11-08 06:17:49'),
('Waimea', '"Clouds"', '"broken clouds"', '04', '299', '100', '10', 74, '80', 1447000064, 1447040692, '2015-11-08 06:17:50'),
('Waipahu', '"Clouds"', '"few clouds"', '02', '299', '93', '9', 73, '20', 1447000737, 1447041142, '2015-11-08 06:17:50'),
('Wake-Island', '"Clear"', '"Sky is Clear"', '01', '290', '53', '2', 257, '0', 1446915720, 1446965938, '2015-11-08 06:17:50'),
('Wheeler-Army-Airfield', '"Clouds"', '"few clouds"', '02', '299', '93', '9', 73, '20', 1447000752, 1447041141, '2015-11-08 06:17:50');

-- --------------------------------------------------------

--
-- Table structure for table `weather_codes_file_locations`
--

CREATE TABLE IF NOT EXISTS `weather_codes_file_locations` (
  `Code` varchar(2) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Animation/Audio` varchar(255) DEFAULT NULL,
  `Audio` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `weather_codes_file_locations`
--

INSERT INTO `weather_codes_file_locations` (`Code`, `Description`, `Animation/Audio`, `Audio`) VALUES
('01', 'clear sky', NULL, NULL),
('02', 'few clouds', NULL, NULL),
('03', 'scattered clouds', NULL, NULL),
('04', 'broken clouds', NULL, NULL),
('09', 'shower rain', NULL, NULL),
('10', 'rain', NULL, NULL),
('11', 'thunderstorm', NULL, NULL),
('13', 'snow', NULL, NULL),
('50', 'mist', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `weather_by_city`
--
ALTER TABLE `weather_by_city`
 ADD PRIMARY KEY (`city_name`);

--
-- Indexes for table `weather_codes_file_locations`
--
ALTER TABLE `weather_codes_file_locations`
 ADD PRIMARY KEY (`Code`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
