-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 21-03-2018 a las 19:13:09
-- Versión del servidor: 5.7.21-0ubuntu0.17.10.1
-- Versión de PHP: 7.1.11-0ubuntu0.17.10.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Coches`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Marca`
--

CREATE TABLE `Marca` (
  `codMarc` int(11) NOT NULL,
  `NomMarca` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Marca`
--

INSERT INTO `Marca` (`codMarc`, `NomMarca`) VALUES
(1, 'ALFA ROMEO'),
(2, 'Audi'),
(3, 'BMW'),
(4, 'CHEVROLET'),
(5, 'CITROEN'),
(6, 'DACIA'),
(7, 'FIAT'),
(8, 'FORD'),
(9, 'HONDA'),
(10, 'HYUNDAI'),
(11, 'KIA'),
(12, 'LEXUS'),
(13, 'MERCEDES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Modelo`
--

CREATE TABLE `Modelo` (
  `codMod` int(11) NOT NULL,
  `nonMod` varchar(100) NOT NULL,
  `cod_marca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Modelo`
--

INSERT INTO `Modelo` (`codMod`, `nonMod`, `cod_marca`) VALUES
(1, 'A4', 2),
(2, 'GIULIETTA', 1),
(3, 'X7', 3),
(4, 'spark', 4),
(5, 'Cactus', 5),
(6, 'Duster', 6),
(7, 'Panda', 7),
(8, 'Mustang gt', 8),
(9, 'Civic', 9),
(10, 'i30', 10),
(11, 'Optima', 11),
(12, 'Suv', 12),
(13, 'Glc', 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Tipo`
--

CREATE TABLE `Tipo` (
  `codTipo` int(11) NOT NULL,
  `nomTipo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Tipo`
--

INSERT INTO `Tipo` (`codTipo`, `nomTipo`) VALUES
(1, 'Turismo'),
(2, 'Industrial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Vehiculo`
--

CREATE TABLE `Vehiculo` (
  `codVeh` int(11) NOT NULL,
  `matVeh` varchar(100) NOT NULL,
  `vinVeh` varchar(1000) NOT NULL,
  `cod_tipo` int(11) NOT NULL,
  `cod_mod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Vehiculo`
--

INSERT INTO `Vehiculo` (`codVeh`, `matVeh`, `vinVeh`, `cod_tipo`, `cod_mod`) VALUES
(26, 'MA-7895-KJG', '123454POIUYT', 2, 8),
(27, '788789', 'grtyryrt', 1, 1),
(28, 'qweqe', 'rqwewrw', 1, 1),
(29, 'sdfsdf', 'fsdfsdfsd', 1, 6),
(30, 'asdasdasd', 'asdasd', 1, 13),
(31, 'gfhjghj', 'ghjghj', 1, 7);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Marca`
--
ALTER TABLE `Marca`
  ADD PRIMARY KEY (`codMarc`),
  ADD KEY `codMarc` (`codMarc`);

--
-- Indices de la tabla `Modelo`
--
ALTER TABLE `Modelo`
  ADD PRIMARY KEY (`codMod`),
  ADD KEY `cod_marca` (`cod_marca`);

--
-- Indices de la tabla `Tipo`
--
ALTER TABLE `Tipo`
  ADD PRIMARY KEY (`codTipo`);

--
-- Indices de la tabla `Vehiculo`
--
ALTER TABLE `Vehiculo`
  ADD PRIMARY KEY (`codVeh`),
  ADD KEY `cod_tipo` (`cod_tipo`),
  ADD KEY `cod_mod` (`cod_mod`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Marca`
--
ALTER TABLE `Marca`
  MODIFY `codMarc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `Modelo`
--
ALTER TABLE `Modelo`
  MODIFY `codMod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `Tipo`
--
ALTER TABLE `Tipo`
  MODIFY `codTipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `Vehiculo`
--
ALTER TABLE `Vehiculo`
  MODIFY `codVeh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Modelo`
--
ALTER TABLE `Modelo`
  ADD CONSTRAINT `Modelo_ibfk_1` FOREIGN KEY (`cod_marca`) REFERENCES `Marca` (`codMarc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Vehiculo`
--
ALTER TABLE `Vehiculo`
  ADD CONSTRAINT `Vehiculo_ibfk_1` FOREIGN KEY (`cod_mod`) REFERENCES `Modelo` (`codMod`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Vehiculo_ibfk_2` FOREIGN KEY (`cod_tipo`) REFERENCES `Tipo` (`codTipo`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
