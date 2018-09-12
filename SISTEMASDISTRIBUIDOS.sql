-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 11-09-2018 a las 22:15:37
-- Versión del servidor: 5.7.23-0ubuntu0.16.04.1
-- Versión de PHP: 7.0.30-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `SISTEMASDISTRIBUIDOS`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(10) NOT NULL,
  `identificacion` varchar(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `identificacion`, `nombre`, `apellido`, `direccion`) VALUES
(1, '45563583', 'Meyling Karina', 'Castro Argumedo', 'Torres'),
(2, '1128047195', 'Jheysser \r\n', 'Machacon Martinez', ''),
(3, '112587465', 'Israel', 'Herrera Echenique\r\n', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` int(10) NOT NULL,
  `cliente_id` varchar(100) NOT NULL,
  `fecha_compra` date NOT NULL,
  `codigo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id`, `cliente_id`, `fecha_compra`, `codigo`) VALUES
(1, '1', '2018-09-07', '123456'),
(2, '1', '2018-09-08', 'AC4566'),
(3, '1', '2018-09-10', 'AC0001'),
(4, '1', '2018-09-12', 'AC0002'),
(5, '1', '2018-09-13', 'AC003'),
(7, '2', '2018-09-07', 'AC004'),
(8, '2', '2018-09-08', 'AC005'),
(9, '2', '2018-09-11', 'AC006'),
(10, '2', '2018-09-12', 'AC007'),
(11, '2', '2018-09-14', 'AC007'),
(13, '3', '2018-09-08', 'AC008'),
(14, '3', '2018-09-08', 'AC009'),
(15, '3', '2018-09-10', 'AC010'),
(16, '3', '2018-09-12', 'AC011'),
(17, '3', '2018-09-02', 'AC013');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(10) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `tipo_producto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `codigo`, `descripcion`, `precio`, `tipo_producto`) VALUES
(1, '1', 'Manzana', '2000', '1'),
(2, '02', 'Pera', '1500', '1'),
(3, '03', 'Uva', '5000', '1'),
(4, '04', 'Banano', '500', '1'),
(5, '002', 'Mojarra', '8000', '3'),
(6, '003', 'Basa', '10000', '3'),
(7, '003', 'Bocahico', '12000', '3'),
(8, '02', 'Zanahoria', '800', '2'),
(9, '002', 'Tomate', '200', '2'),
(10, '003', 'Cebolla', '300', '2'),
(13, '003', 'Atun', '6000', '3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_factura`
--

CREATE TABLE `producto_factura` (
  `id` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto_factura`
--

INSERT INTO `producto_factura` (`id`, `id_factura`, `id_producto`) VALUES
(1, 1, 3),
(2, 1, 7),
(3, 1, 5),
(4, 1, 10),
(5, 1, 8),
(6, 1, 13),
(7, 1, 4),
(8, 1, 7),
(9, 2, 1),
(10, 2, 13),
(11, 2, 2),
(12, 2, 12),
(13, 2, 3),
(14, 2, 11),
(15, 2, 4),
(16, 2, 5),
(17, 3, 10),
(18, 3, 5),
(19, 3, 1),
(20, 3, 12),
(21, 3, 13),
(22, 3, 8),
(23, 3, 7),
(24, 3, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_producto`
--

CREATE TABLE `tipo_producto` (
  `id` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_producto`
--

INSERT INTO `tipo_producto` (`id`, `nombre`) VALUES
(1, 'Frutas'),
(2, 'Hortalizas'),
(3, 'Pescados'),
(4, 'Tecnologia');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `producto_factura`
--
ALTER TABLE `producto_factura`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `producto_factura`
--
ALTER TABLE `producto_factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
