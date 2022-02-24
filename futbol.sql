-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-02-2022 a las 09:00:23
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `futbol`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `codEquipo` int(11) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `liga` int(11) NOT NULL,
  `localidad` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`codEquipo`, `nombre`, `liga`, `localidad`) VALUES
(1111, 'Real Madrid', 1, 'Madrid'),
(1112, 'Barcelona', 5, 'Barcelona'),
(1113, 'Atletico de madrid', 2, 'Madrid'),
(1114, 'Valencia', 6, 'Valencia'),
(1115, 'Athletic CLUB', 8, 'Pais Vasco'),
(1116, 'sevilla', 5, 'Sevilla'),
(1117, 'Espanyol', 9, 'Barcelona'),
(1118, 'Real Sociedad', 2, 'San Sebastian'),
(1119, 'Real Zaragoza', 6, 'Zaragoza'),
(1120, 'Betis', 6, 'Sevilla'),
(1121, 'Deportivo de la coruña', 5, 'La coruña'),
(1122, 'Celta de Vigo', 2, 'Viga'),
(1123, 'Valladolid', 6, 'Valladolid'),
(1124, 'Racing de Santander', 6, 'Santander'),
(1125, 'Sporting de gijon', 0, 'gijon'),
(1126, 'Osasuna', 1, 'Pamplona'),
(1127, 'Real Oviedo', 3, 'Oviedo'),
(1128, 'Mallorca', 3, 'Mallorca'),
(1129, 'Las palmas', 2, 'Las Palmas'),
(1130, 'Malaga', 6, 'Malaga');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

CREATE TABLE `jugadores` (
  `numeroID` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `codEquipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `jugadores`
--

INSERT INTO `jugadores` (`numeroID`, `nombre`, `codEquipo`) VALUES
(22222, 'Brandon Thomas Llamas', 1130),
(22223, 'Sergio Ramos', 1111);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`codEquipo`),
  ADD KEY `nombre` (`nombre`);

--
-- Indices de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD PRIMARY KEY (`numeroID`),
  ADD KEY `codEquipo` (`codEquipo`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD CONSTRAINT `jugadores_ibfk_1` FOREIGN KEY (`codEquipo`) REFERENCES `equipos` (`codEquipo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
