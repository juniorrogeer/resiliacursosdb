-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09-Fev-2023 às 23:45
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `resiliacursosdb`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `alunos`
--

CREATE TABLE `alunos` (
  `matricula_aluno` int(11) NOT NULL,
  `nome_aluno` varchar(50) DEFAULT NULL,
  `cpf_aluno` varchar(11) DEFAULT NULL,
  `data_nasc_aluno` date DEFAULT NULL,
  `codigo_turma` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `alunos`
--

INSERT INTO `alunos` (`matricula_aluno`, `nome_aluno`, `cpf_aluno`, `data_nasc_aluno`, `codigo_turma`) VALUES
(1, 'Kylian Mbappe', '12345678900', '1993-02-03', 100),
(2, 'Neymar Junior', '33366677788', '1993-02-11', 200),
(3, 'Mesut Oezil', '66655544400', '1995-02-01', 300),
(4, 'Thierry Henry', '99988877744', '1993-02-03', 100);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cursos`
--

CREATE TABLE `cursos` (
  `codigo_curso` int(11) DEFAULT NULL,
  `nome_curso` varchar(30) DEFAULT NULL,
  `codigo_turma` int(11) DEFAULT NULL,
  `nome_professor` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cursos`
--

INSERT INTO `cursos` (`codigo_curso`, `nome_curso`, `codigo_turma`, `nome_professor`) VALUES
(10, 'Historia', 100, 'Pep Guardiola'),
(20, 'Geografia', 300, 'Carlo Ancelotti'),
(30, 'Português', 200, 'Jose Mourinho'),
(40, 'Matemática', 300, 'Abel Ferreira');

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE `turma` (
  `codigo_turma` int(11) NOT NULL,
  `turno` varchar(30) DEFAULT NULL,
  `quantidade_alunos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `turma`
--

INSERT INTO `turma` (`codigo_turma`, `turno`, `quantidade_alunos`) VALUES
(100, 'Manha', 1000),
(200, 'Tarde', 1500),
(300, 'Noite', 800);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`matricula_aluno`),
  ADD KEY `codigo_turma` (`codigo_turma`);

--
-- Índices para tabela `cursos`
--
ALTER TABLE `cursos`
  ADD KEY `codigo_turma` (`codigo_turma`);

--
-- Índices para tabela `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`codigo_turma`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `alunos`
--
ALTER TABLE `alunos`
  ADD CONSTRAINT `alunos_ibfk_1` FOREIGN KEY (`codigo_turma`) REFERENCES `turma` (`codigo_turma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`codigo_turma`) REFERENCES `turma` (`codigo_turma`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
