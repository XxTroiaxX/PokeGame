-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 03, 2022 at 05:49 PM
-- Server version: 10.3.32-MariaDB-cll-lve
-- PHP Version: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thetgcju_pokemon`
--

-- --------------------------------------------------------

--
-- Table structure for table `historicobatalhas`
--

CREATE TABLE `historicobatalhas` (
  `IDHistorico` int(11) NOT NULL,
  `IDPokedexAmigo` int(11) NOT NULL,
  `IDPokedexInimigo` int(11) NOT NULL,
  `Estado` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `historicobatalhas`
--

INSERT INTO `historicobatalhas` (`IDHistorico`, `IDPokedexAmigo`, `IDPokedexInimigo`, `Estado`) VALUES
(37, 48, 38, 'Ganhou'),
(38, 47, 39, 'Ganhou'),
(39, 45, 40, 'Perdeu'),
(40, 45, 41, 'Ganhou'),
(41, 48, 42, 'Perdeu'),
(42, 45, 43, 'Perdeu'),
(43, 45, 44, 'Perdeu'),
(44, 50, 45, 'Ganhou'),
(45, 50, 46, 'Perdeu'),
(46, 45, 47, 'Ganhou'),
(47, 49, 48, 'Ganhou'),
(48, 48, 49, 'Ganhou');

-- --------------------------------------------------------

--
-- Table structure for table `pokeatacks`
--

CREATE TABLE `pokeatacks` (
  `IDAtacks` int(11) NOT NULL,
  `IDPokedex` int(11) NOT NULL,
  `Ataque` varchar(100) NOT NULL,
  `Dano` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pokeatacks`
--

INSERT INTO `pokeatacks` (`IDAtacks`, `IDPokedex`, `Ataque`, `Dano`) VALUES
(258, 45, 'Bubble', '12'),
(259, 45, 'Aqua Jet', '45'),
(260, 45, 'Water Pulse', '20'),
(261, 45, 'Aqua tail', '32'),
(262, 46, 'Vine Whip', '7'),
(263, 46, 'Seed Bomb', '32'),
(264, 46, 'Sludge Bomb', '50'),
(265, 46, 'Fustration', '10'),
(266, 47, 'Ember', '10'),
(267, 47, 'Flamethrower', '50'),
(268, 47, 'Flame Charge', '35'),
(269, 47, 'Flame Burst', '43'),
(270, 48, 'Thunder Shock', '5'),
(271, 48, 'Discharge', '50'),
(272, 48, 'Wild Charge', '47'),
(273, 48, 'Thunder', '36'),
(278, 50, 'Dragon Tail', '16'),
(279, 50, 'Draco Meteor', '36'),
(280, 50, 'Outrage', '49'),
(281, 50, 'Steel Wing', '11'),
(286, 49, 'Ember', '12'),
(287, 49, 'Flame Wheel', '32'),
(288, 49, 'Flame Charge', '50'),
(289, 49, 'Return', '22');

-- --------------------------------------------------------

--
-- Table structure for table `pokedex`
--

CREATE TABLE `pokedex` (
  `IDPokedex` int(11) NOT NULL,
  `IDTypePoke` int(11) NOT NULL,
  `PokeName` varchar(100) NOT NULL,
  `PokeVida` varchar(100) NOT NULL,
  `PokeFoto` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pokedex`
--

INSERT INTO `pokedex` (`IDPokedex`, `IDTypePoke`, `PokeName`, `PokeVida`, `PokeFoto`) VALUES
(45, 1, 'Squirtle', '100', 'https://poke.thetroia.com/pokemons/38833530.png'),
(46, 17, 'Bulbasaur', '100', 'https://poke.thetroia.com/pokemons/60408965.png'),
(47, 2, 'Charmander', '100', 'https://poke.thetroia.com/pokemons/2568880.png'),
(48, 4, 'Pikachu', '100', 'https://poke.thetroia.com/pokemons/73513110.png'),
(49, 2, 'Chimchar', '100', 'https://poke.thetroia.com/pokemons/12998825.png'),
(50, 3, 'Dragonite', '100', 'https://poke.thetroia.com/pokemons/14713661.png');

-- --------------------------------------------------------

--
-- Table structure for table `pokemoninimigo`
--

CREATE TABLE `pokemoninimigo` (
  `IDPokemonInimigo` int(11) NOT NULL,
  `IDPokedex` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pokemoninimigo`
--

INSERT INTO `pokemoninimigo` (`IDPokemonInimigo`, `IDPokedex`) VALUES
(46, 45),
(38, 46),
(40, 46),
(41, 46),
(42, 46),
(45, 46),
(48, 46),
(47, 47),
(39, 48),
(44, 48),
(43, 50),
(49, 50);

-- --------------------------------------------------------

--
-- Table structure for table `pokenivel`
--

CREATE TABLE `pokenivel` (
  `IDPokenivel` int(11) NOT NULL,
  `IDPokedex` int(11) NOT NULL,
  `Nivel` int(11) NOT NULL,
  `NivelXP` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pokenivel`
--

INSERT INTO `pokenivel` (`IDPokenivel`, `IDPokedex`, `Nivel`, `NivelXP`) VALUES
(45, 45, 1, 30),
(46, 46, 1, 20),
(47, 47, 1, 10),
(48, 48, 1, 30),
(49, 49, 1, 10),
(50, 50, 1, 20);

-- --------------------------------------------------------

--
-- Table structure for table `typepoke`
--

CREATE TABLE `typepoke` (
  `IDTypePoke` int(11) NOT NULL,
  `TypePoke` varchar(100) NOT NULL,
  `TypeFoto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `typepoke`
--

INSERT INTO `typepoke` (`IDTypePoke`, `TypePoke`, `TypeFoto`) VALUES
(1, 'Agua', 'https://poke.thetroia.com/icons/Agua.png'),
(2, 'Fogo', 'https://poke.thetroia.com/icons/Fogo.png'),
(3, 'Dragão', 'https://poke.thetroia.com/icons/Dragao.png'),
(4, 'Elétrico', 'https://poke.thetroia.com/icons/Eletrico.png'),
(5, 'Fada', 'https://poke.thetroia.com/icons/Fada.png'),
(6, 'Fantasma', 'https://poke.thetroia.com/icons/Fantasma.png'),
(7, 'Gelo', 'https://poke.thetroia.com/icons/Gelo.png'),
(8, 'Lutador', 'https://poke.thetroia.com/icons/Lutador.png'),
(9, 'Metálico', 'https://poke.thetroia.com/icons/Metalico.png'),
(10, 'Noturno', 'https://poke.thetroia.com/icons/Noturno.png'),
(11, 'Pedra', 'https://poke.thetroia.com/icons/Pedra.png'),
(13, 'Psíquico', 'https://poke.thetroia.com/icons/Psiquico.png'),
(14, 'Terra', 'https://poke.thetroia.com/icons/Terra.png'),
(15, 'Inseto', 'https://poke.thetroia.com/icons/Inseto.png'),
(16, 'Normal', 'https://poke.thetroia.com/icons/Normal.png'),
(17, 'Planta', 'https://poke.thetroia.com/icons/Planta.png'),
(18, 'Venenoso', 'https://poke.thetroia.com/icons/Venenoso.png'),
(19, 'Voador', 'https://poke.thetroia.com/icons/Voador.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `historicobatalhas`
--
ALTER TABLE `historicobatalhas`
  ADD PRIMARY KEY (`IDHistorico`),
  ADD KEY `historiobatalhas_ibfk_1` (`IDPokedexAmigo`),
  ADD KEY `historiobatalhas_ibfk_2` (`IDPokedexInimigo`);

--
-- Indexes for table `pokeatacks`
--
ALTER TABLE `pokeatacks`
  ADD PRIMARY KEY (`IDAtacks`),
  ADD KEY `pokeatacks_ibfk_1` (`IDPokedex`);

--
-- Indexes for table `pokedex`
--
ALTER TABLE `pokedex`
  ADD PRIMARY KEY (`IDPokedex`),
  ADD KEY `IDTypePoke` (`IDTypePoke`);

--
-- Indexes for table `pokemoninimigo`
--
ALTER TABLE `pokemoninimigo`
  ADD PRIMARY KEY (`IDPokemonInimigo`),
  ADD KEY `pokemoninimigo_ibfk_1` (`IDPokedex`);

--
-- Indexes for table `pokenivel`
--
ALTER TABLE `pokenivel`
  ADD PRIMARY KEY (`IDPokenivel`),
  ADD KEY `pokenivel_ibfk_1` (`IDPokedex`);

--
-- Indexes for table `typepoke`
--
ALTER TABLE `typepoke`
  ADD PRIMARY KEY (`IDTypePoke`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `historicobatalhas`
--
ALTER TABLE `historicobatalhas`
  MODIFY `IDHistorico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `pokeatacks`
--
ALTER TABLE `pokeatacks`
  MODIFY `IDAtacks` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=294;

--
-- AUTO_INCREMENT for table `pokedex`
--
ALTER TABLE `pokedex`
  MODIFY `IDPokedex` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `pokemoninimigo`
--
ALTER TABLE `pokemoninimigo`
  MODIFY `IDPokemonInimigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `pokenivel`
--
ALTER TABLE `pokenivel`
  MODIFY `IDPokenivel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `typepoke`
--
ALTER TABLE `typepoke`
  MODIFY `IDTypePoke` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `historicobatalhas`
--
ALTER TABLE `historicobatalhas`
  ADD CONSTRAINT `historicobatalhas_ibfk_1` FOREIGN KEY (`IDPokedexAmigo`) REFERENCES `pokedex` (`IDPokedex`) ON DELETE CASCADE,
  ADD CONSTRAINT `historicobatalhas_ibfk_2` FOREIGN KEY (`IDPokedexInimigo`) REFERENCES `pokemoninimigo` (`IDPokemonInimigo`) ON DELETE CASCADE;

--
-- Constraints for table `pokeatacks`
--
ALTER TABLE `pokeatacks`
  ADD CONSTRAINT `pokeatacks_ibfk_1` FOREIGN KEY (`IDPokedex`) REFERENCES `pokedex` (`IDPokedex`) ON DELETE CASCADE;

--
-- Constraints for table `pokedex`
--
ALTER TABLE `pokedex`
  ADD CONSTRAINT `pokedex_ibfk_1` FOREIGN KEY (`IDTypePoke`) REFERENCES `typepoke` (`IDTypePoke`);

--
-- Constraints for table `pokemoninimigo`
--
ALTER TABLE `pokemoninimigo`
  ADD CONSTRAINT `pokemoninimigo_ibfk_1` FOREIGN KEY (`IDPokedex`) REFERENCES `pokedex` (`IDPokedex`) ON DELETE CASCADE;

--
-- Constraints for table `pokenivel`
--
ALTER TABLE `pokenivel`
  ADD CONSTRAINT `pokenivel_ibfk_1` FOREIGN KEY (`IDPokedex`) REFERENCES `pokedex` (`IDPokedex`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
