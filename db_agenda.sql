-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 06-11-2023 a las 02:24:51
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_agenda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amigos`
--

CREATE TABLE `amigos` (
  `identificion` int NOT NULL,
  `primer_nombre` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `segundo_nombre` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `primer_apellido` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `segundo_apellido` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `correo` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `nacimiento` date NOT NULL,
  `edad` int NOT NULL,
  `pais` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `canton` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `distrito` varchar(30) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `amigos`
--

INSERT INTO `amigos` (`identificion`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `correo`, `nacimiento`, `edad`, `pais`, `canton`, `distrito`) VALUES
(1, 'Anderson', 'Vladimir', 'Amaya', 'Diaz', 'andersonamaya61@gmail.com', '1999-09-16', 24, 'El Salvador', 'Colonia ciudad Jardin', 'San Miguel');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gustos`
--

CREATE TABLE `gustos` (
  `id_gustos` int NOT NULL,
  `nombre` varchar(25) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `gustos`
--

INSERT INTO `gustos` (`id_gustos`, `nombre`) VALUES
(1, 'Pizza'),
(2, 'Macarrones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gustos_amigos`
--

CREATE TABLE `gustos_amigos` (
  `id` int NOT NULL,
  `identificacion` int NOT NULL,
  `id_gustos` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `gustos_amigos`
--

INSERT INTO `gustos_amigos` (`id`, `identificacion`, `id_gustos`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas`
--

CREATE TABLE `mascotas` (
  `id_mascota` int NOT NULL,
  `tipo` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `nombre` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `identificacion` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mascotas`
--

INSERT INTO `mascotas` (`id_mascota`, `tipo`, `nombre`, `identificacion`) VALUES
(1, 'Pitbull', 'Princesa', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos`
--

CREATE TABLE `telefonos` (
  `id_telefono` int NOT NULL,
  `tipo` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `numero` varchar(40) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `telefonos`
--

INSERT INTO `telefonos` (`id_telefono`, `tipo`, `numero`) VALUES
(1, 'HONOR', '60591214'),
(2, 'HUAWEI', '75345879');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos_amigos`
--

CREATE TABLE `telefonos_amigos` (
  `id` int NOT NULL,
  `identificacion` int NOT NULL,
  `id_telefono` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `telefonos_amigos`
--

INSERT INTO `telefonos_amigos` (`id`, `identificacion`, `id_telefono`) VALUES
(1, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `amigos`
--
ALTER TABLE `amigos`
  ADD PRIMARY KEY (`identificion`);

--
-- Indices de la tabla `gustos`
--
ALTER TABLE `gustos`
  ADD PRIMARY KEY (`id_gustos`);

--
-- Indices de la tabla `gustos_amigos`
--
ALTER TABLE `gustos_amigos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identificacion` (`identificacion`),
  ADD UNIQUE KEY `id_gustos` (`id_gustos`);

--
-- Indices de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD PRIMARY KEY (`id_mascota`),
  ADD UNIQUE KEY `identificacion` (`identificacion`);

--
-- Indices de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD PRIMARY KEY (`id_telefono`);

--
-- Indices de la tabla `telefonos_amigos`
--
ALTER TABLE `telefonos_amigos`
  ADD UNIQUE KEY `identificacion` (`identificacion`),
  ADD UNIQUE KEY `id_telefono` (`id_telefono`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `amigos`
--
ALTER TABLE `amigos`
  MODIFY `identificion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `gustos`
--
ALTER TABLE `gustos`
  MODIFY `id_gustos` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `gustos_amigos`
--
ALTER TABLE `gustos_amigos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  MODIFY `id_mascota` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `gustos_amigos`
--
ALTER TABLE `gustos_amigos`
  ADD CONSTRAINT `gustos_amigos_ibfk_1` FOREIGN KEY (`identificacion`) REFERENCES `amigos` (`identificion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gustos_amigos_ibfk_2` FOREIGN KEY (`id_gustos`) REFERENCES `gustos` (`id_gustos`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD CONSTRAINT `mascotas_ibfk_1` FOREIGN KEY (`identificacion`) REFERENCES `amigos` (`identificion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `telefonos_amigos`
--
ALTER TABLE `telefonos_amigos`
  ADD CONSTRAINT `telefonos_amigos_ibfk_1` FOREIGN KEY (`identificacion`) REFERENCES `amigos` (`identificion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `telefonos_amigos_ibfk_2` FOREIGN KEY (`id_telefono`) REFERENCES `telefonos` (`id_telefono`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
