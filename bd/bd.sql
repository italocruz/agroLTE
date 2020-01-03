-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03-Jan-2020 às 02:36
-- Versão do servidor: 10.4.6-MariaDB
-- versão do PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `agro`
--
CREATE DATABASE IF NOT EXISTS `agro` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `agro`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `boleto`
--

CREATE TABLE `boleto` (
  `id` int(11) UNSIGNED NOT NULL,
  `dataVcto` date NOT NULL,
  `valor` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `credor` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `obs` varchar(35) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '0=aberto, 1=pago'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `boleto`
--

INSERT INTO `boleto` (`id`, `dataVcto`, `valor`, `credor`, `obs`, `status`) VALUES
(1, '2020-01-02', '70,00', 'Agespisa', 'Conta de água', '1'),
(3, '2020-01-02', '50,00', 'Teste', '', '0'),
(4, '2020-01-02', '1.137,89', 'Teste', '', '0'),
(5, '2020-01-01', '2.239,80', 'Equatorial', 'Energia', '1'),
(6, '2019-12-30', '2.000,00', 'Agespisa', 'Conta de Ã¡gua', '0'),
(7, '2020-01-04', '2.000,00', 'Norte RaÃ§Ãµes', '', '0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `carga`
--

CREATE TABLE `carga` (
  `id` int(11) UNSIGNED NOT NULL,
  `data` date NOT NULL,
  `peso` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `motorista` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `valorSaca` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `qtdSacas50` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `qtdSacas25` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `carga`
--

INSERT INTO `carga` (`id`, `data`, `peso`, `motorista`, `valorSaca`, `qtdSacas50`, `qtdSacas25`) VALUES
(18, '2020-01-01', '50.240', 'Marcus Vinícius', '60,00', '900', '210');

-- --------------------------------------------------------

--
-- Estrutura da tabela `despesa`
--

CREATE TABLE `despesa` (
  `id` int(11) UNSIGNED NOT NULL,
  `descricao` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `valor` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `requerente` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `despesa`
--

INSERT INTO `despesa` (`id`, `descricao`, `valor`, `requerente`, `data`) VALUES
(2, 'Açougue', '70,00', '2', '2019-12-30'),
(3, 'Mecânico', '70,00', '3', '2019-12-30'),
(4, 'Mecânico', '50,00', '2', '2019-12-31'),
(5, 'teste', '1', '0', '2020-01-02');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `id` int(11) UNSIGNED NOT NULL,
  `data` date NOT NULL,
  `valor` decimal(7,2) NOT NULL,
  `tipoPagamento` varchar(1) COLLATE utf8_unicode_ci NOT NULL COMMENT 'carga = 1, boleto = 2, funcionário = 3, estiva = 4',
  `descricao` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '[imposto, ração, água, luz, internet, etc],[salário, férias, 13, acerto, etc]',
  `idCarga` int(11) UNSIGNED DEFAULT NULL,
  `idBoleto` int(11) UNSIGNED DEFAULT NULL,
  `idFuncionario` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `pagamento`
--

INSERT INTO `pagamento` (`id`, `data`, `valor`, `tipoPagamento`, `descricao`, `idCarga`, `idBoleto`, `idFuncionario`) VALUES
(6, '2020-01-02', '2239.80', '1', 'Depósito', 18, NULL, NULL),
(9, '2020-01-02', '1137.89', '4', 'Estiva', 18, NULL, NULL),
(10, '2020-01-02', '70.00', '4', 'Sacas', 18, NULL, NULL),
(11, '2020-01-01', '2239.80', '4', 'Depósito', 18, NULL, NULL),
(13, '2020-01-02', '50.00', '4', 'Depósito', 18, NULL, NULL),
(14, '2020-01-02', '10000.00', '1', 'Depósito', 18, NULL, NULL),
(15, '2020-01-02', '780.00', '1', 'Depósito', 18, NULL, NULL),
(17, '2020-01-02', '4000.00', '1', 'Depósito', 18, NULL, NULL),
(18, '2019-12-31', '2000.00', '1', 'Depósito', 18, NULL, NULL),
(19, '2020-01-02', '2000.00', '1', 'Depósito', 18, NULL, NULL),
(20, '2020-01-02', '2000.00', '1', 'Depósito', 18, NULL, NULL),
(21, '2020-01-02', '2000.00', '1', 'Depósito', 18, NULL, NULL),
(22, '2020-01-02', '2000.00', '1', 'Depósito', 18, NULL, NULL),
(23, '2020-01-02', '2000.00', '1', 'Depósito', 18, NULL, NULL),
(24, '2020-01-02', '70.00', '2', 'Credor: Agespisa - Obs: Conta de água', NULL, 1, NULL),
(25, '2020-01-03', '2.24', '2', 'Credor: Equatorial - Obs: Energia', NULL, 5, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `requerente`
--

CREATE TABLE `requerente` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `requerente`
--

INSERT INTO `requerente` (`id`, `nome`) VALUES
(1, 'Depósito'),
(2, 'Aparecida'),
(3, 'José'),
(4, 'Priscila'),
(5, 'Ítalo'),
(6, 'Outro');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) UNSIGNED NOT NULL,
  `nome` varchar(50) NOT NULL,
  `usuario` varchar(25) NOT NULL,
  `senha` varchar(40) NOT NULL,
  `nivel` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `usuario`, `senha`, `nivel`) VALUES
(1, 'Usuário Teste', 'teste', '2e6f9b0d5885b6010f9167787445617f553a735f', 1),
(2, 'Administrador Teste', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `id` int(11) UNSIGNED NOT NULL,
  `produto` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `valorVenda` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `quantidade` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `data` date NOT NULL,
  `tipo` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`id`, `produto`, `valorVenda`, `quantidade`, `data`, `tipo`) VALUES
(2, 'Mista', '37,00', '1', '2019-12-28', 'Ração'),
(4, 'Crescimento', '61,00', '1', '2019-12-28', 'Ração'),
(6, 'Crescimento', '122,00', '2', '2019-12-30', 'Ração'),
(7, 'Milho 50 kg', '1.060,00', '20', '2019-12-30', 'Milho'),
(10, 'Xerém', '86,00', '2', '2019-12-30', 'Ração'),
(12, 'Soja', '20,00', '10 kg', '2019-12-30', 'Ração'),
(13, 'Milho 50 kg', '265,00', '5', '2019-12-30', 'Milho'),
(14, 'Milho 50 kg', '106,00', '2', '2019-12-30', 'Milho'),
(15, 'Mista', '3,60', '2 kg', '2019-12-30', 'Ração'),
(16, 'Ração de gato', '12,00', '1 kg', '2019-12-30', 'Ração'),
(17, 'Milho 50 kg', '53,00', '1', '2019-12-31', 'Milho'),
(18, 'XerÃ©m', '10,00', '10,00 reais', '2020-01-03', 'RaÃ§Ã£o');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `boleto`
--
ALTER TABLE `boleto`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `carga`
--
ALTER TABLE `carga`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `despesa`
--
ALTER TABLE `despesa`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD KEY `nivel` (`nivel`);

--
-- Índices para tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `boleto`
--
ALTER TABLE `boleto`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `carga`
--
ALTER TABLE `carga`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `despesa`
--
ALTER TABLE `despesa`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- Banco de dados: `controlestoque`
--
CREATE DATABASE IF NOT EXISTS `controlestoque` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `controlestoque`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `NomeCliente` varchar(100) NOT NULL,
  `EmailCliente` varchar(100) NOT NULL,
  `cpfCliente` int(11) NOT NULL,
  `statusCliente` int(1) NOT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  `dataRegCliente` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`idCliente`, `NomeCliente`, `EmailCliente`, `cpfCliente`, `statusCliente`, `Usuario_idUsuario`, `dataRegCliente`) VALUES
(1, 'teste', 'teste', 1234, 1, 2, '2018-11-01 23:39:57'),
(2, 'teste2', 'teste2', 12345, 1, 2, '2018-11-01 23:49:55'),
(3, 'teste3', 'teste3@teste3.com', 2345, 1, 2, '2018-11-02 22:07:51'),
(4, 'teste3', 'teste3@teste3.com', 23456, 1, 2, '2018-11-02 22:10:11'),
(5, 'teste3', 'teste3@teste3.com', 23456989, 1, 2, '2018-11-02 22:12:05');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fabricante`
--

CREATE TABLE `fabricante` (
  `idFabricante` int(11) NOT NULL,
  `NomeFabricante` varchar(75) NOT NULL,
  `CNPJFabricante` varchar(75) NOT NULL,
  `EmailFabricante` varchar(75) NOT NULL,
  `EnderecoFabricante` varchar(75) NOT NULL,
  `TelefoneFabricante` varchar(75) NOT NULL,
  `Public` int(1) NOT NULL,
  `Ativo` int(1) NOT NULL,
  `Usuario_idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `fabricante`
--

INSERT INTO `fabricante` (`idFabricante`, `NomeFabricante`, `CNPJFabricante`, `EmailFabricante`, `EnderecoFabricante`, `TelefoneFabricante`, `Public`, `Ativo`, `Usuario_idUser`) VALUES
(1, 'Compaq', '212221211212211', 'ibm@ibm.com', 'Rua Central do Brasil - nÂº 200', '11 34343-4334', 1, 1, 1),
(2, 'Intel', '11111111111111', 'intel@intel.com', 'Rua 3', '121212212', 1, 1, 1),
(3, 'DELL', '2222222222222', 'dell@dell.com', 'Rua Central do Brasil - nÂº 203', '+5531988848700', 0, 0, 1),
(4, 'CaderbrÃ¡s Bico Internacional Ltda', '05.117571/002-05', 'nadir@distribuidoradistrioeste.com.br', 'Av Germano Dix - 4800 Pirassununga - SP', '(19)3561-3092', 1, 1, 1),
(6, 'Lenovo', '11111111111112', 'lenovo@lenovo.com', 'Rua 4', '333333333333', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens`
--

CREATE TABLE `itens` (
  `idItens` int(11) NOT NULL,
  `QuantItens` decimal(10,0) NOT NULL,
  `QuantItensVend` decimal(10,0) NOT NULL,
  `ValCompItens` decimal(10,2) NOT NULL,
  `ValVendItens` decimal(10,2) NOT NULL,
  `DataCompraItens` date NOT NULL,
  `DataVenci_Itens` date DEFAULT NULL,
  `ItensAtivo` tinyint(4) NOT NULL,
  `ItensPublic` int(1) NOT NULL,
  `Produto_CodRefProduto` int(11) NOT NULL,
  `Fabricante_idFabricante` int(11) NOT NULL,
  `Usuario_idUser` int(11) NOT NULL,
  `DataRegistro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `itens`
--

INSERT INTO `itens` (`idItens`, `QuantItens`, `QuantItensVend`, `ValCompItens`, `ValVendItens`, `DataCompraItens`, `DataVenci_Itens`, `ItensAtivo`, `ItensPublic`, `Produto_CodRefProduto`, `Fabricante_idFabricante`, `Usuario_idUser`, `DataRegistro`) VALUES
(11, '5', '2', '7.00', '11.00', '2018-10-27', '2018-10-31', 1, 1, 4, 2, 1, '2018-10-27 20:38:39'),
(12, '100', '40', '99.00', '1100.00', '2018-10-27', '2018-10-31', 1, 0, 3, 4, 1, '2018-10-27 20:43:12');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `CodRefProduto` int(11) NOT NULL,
  `NomeProduto` varchar(75) NOT NULL,
  `Ativo` int(1) NOT NULL,
  `PublicProduto` int(1) NOT NULL,
  `Usuario_idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`CodRefProduto`, `NomeProduto`, `Ativo`, `PublicProduto`, `Usuario_idUser`) VALUES
(1, 'Caderno 80 folhas 3', 1, 0, 1),
(2, 'Caderno 200 folhas', 1, 0, 1),
(3, 'Caderno 500 folhas', 1, 1, 1),
(4, 'Notebook 2', 1, 1, 1),
(5, 'Computador Lenovo', 1, 1, 1),
(6, 'Caneta esferogrÃ¡fica Preta', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `representante`
--

CREATE TABLE `representante` (
  `idRepresentante` int(11) NOT NULL,
  `NomeRepresentante` varchar(75) NOT NULL,
  `TelefoneRepresentante` varchar(20) NOT NULL,
  `EmailRepresentante` varchar(45) NOT NULL,
  `repAtivo` int(1) NOT NULL,
  `repPublic` int(1) NOT NULL,
  `Fabricante_idFabricante` int(11) NOT NULL,
  `Usuario_idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `representante`
--

INSERT INTO `representante` (`idRepresentante`, `NomeRepresentante`, `TelefoneRepresentante`, `EmailRepresentante`, `repAtivo`, `repPublic`, `Fabricante_idFabricante`, `Usuario_idUser`) VALUES
(1, 'Francisco Algusto', '11 9999-9999', 'franciscoalgusto@ibm.com', 1, 1, 1, 1),
(2, 'FabrÃ­cio PaixÃ£o ', '31 98888-8888', 'fabriciotp@ibm.com', 1, 1, 1, 1),
(3, 'Marcos Rafael', '43434343', 'marcosrafael@intel.com', 1, 1, 2, 1),
(4, 'Antonio Carlos ', '31988848780', 'antoniocarlos@dell.com', 0, 0, 3, 1),
(5, 'Distrioeste - Distribuidora e atacadista', '49 3331-3122', 'nadir@distribuidoradistrioeste.com.br', 1, 1, 4, 1),
(6, 'Thiago Rui', '55555555555', 'thiagorui@lenovo.com', 1, 1, 6, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idUser` int(11) NOT NULL,
  `Username` varchar(75) NOT NULL,
  `Email` varchar(75) NOT NULL,
  `Password` varchar(75) NOT NULL,
  `imagem` varchar(100) NOT NULL,
  `Dataregistro` date NOT NULL,
  `Permissao` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idUser`, `Username`, `Email`, `Password`, `imagem`, `Dataregistro`, `Permissao`) VALUES
(1, 'admin', 'admin@estoque.com', '21232f297a57a5a743894a0e4a801fc3', 'dist/img/fabriciopaixao.jpg', '2017-04-03', 1),
(2, 'vendedor', 'vendedor@estoque.com', '21232f297a57a5a743894a0e4a801fc3', 'dist/img/fabriciopaixao.jpg', '2017-04-03', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `idvendas` int(11) NOT NULL,
  `quantitens` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `iditem` int(11) NOT NULL,
  `cliente_idCliente` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `datareg` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`idvendas`, `quantitens`, `valor`, `iditem`, `cliente_idCliente`, `idusuario`, `datareg`) VALUES
(1, 5, '75.00', 1, 0, 2, '2018-09-26 12:34:53'),
(2, 10, '150.00', 1, 0, 2, '2018-09-26 12:35:33'),
(3, 150, '60000.00', 2, 0, 2, '2018-09-26 12:38:23'),
(4, 10, '4000.00', 2, 0, 2, '2018-09-27 11:18:50'),
(5, 20, '22000.00', 12, 2, 2, '2018-11-01 23:49:55'),
(6, 20, '22000.00', 12, 2, 2, '2018-11-01 23:55:56');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Índices para tabela `fabricante`
--
ALTER TABLE `fabricante`
  ADD PRIMARY KEY (`idFabricante`),
  ADD KEY `fk_Fabricante_Usuario1_idx` (`Usuario_idUser`);

--
-- Índices para tabela `itens`
--
ALTER TABLE `itens`
  ADD PRIMARY KEY (`idItens`),
  ADD KEY `fk_Itens_Produto1_idx` (`Produto_CodRefProduto`),
  ADD KEY `fk_Itens_Fabricante1_idx` (`Fabricante_idFabricante`),
  ADD KEY `fk_Itens_Usuario1_idx` (`Usuario_idUser`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`CodRefProduto`),
  ADD KEY `fk_Produto_Usuario_idx` (`Usuario_idUser`);

--
-- Índices para tabela `representante`
--
ALTER TABLE `representante`
  ADD PRIMARY KEY (`idRepresentante`),
  ADD KEY `fk_Representante_Fabricante1_idx` (`Fabricante_idFabricante`),
  ADD KEY `fk_Representante_Usuario1_idx` (`Usuario_idUser`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUser`);

--
-- Índices para tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`idvendas`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `fabricante`
--
ALTER TABLE `fabricante`
  MODIFY `idFabricante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `itens`
--
ALTER TABLE `itens`
  MODIFY `idItens` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `CodRefProduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `representante`
--
ALTER TABLE `representante`
  MODIFY `idRepresentante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `idvendas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `fabricante`
--
ALTER TABLE `fabricante`
  ADD CONSTRAINT `fk_Fabricante_Usuario1` FOREIGN KEY (`Usuario_idUser`) REFERENCES `usuario` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `itens`
--
ALTER TABLE `itens`
  ADD CONSTRAINT `fk_Itens_Fabricante1` FOREIGN KEY (`Fabricante_idFabricante`) REFERENCES `fabricante` (`idFabricante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Itens_Produto1` FOREIGN KEY (`Produto_CodRefProduto`) REFERENCES `produtos` (`CodRefProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Itens_Usuario1` FOREIGN KEY (`Usuario_idUser`) REFERENCES `usuario` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `fk_Produto_Usuario` FOREIGN KEY (`Usuario_idUser`) REFERENCES `usuario` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `representante`
--
ALTER TABLE `representante`
  ADD CONSTRAINT `fk_Representante_Fabricante1` FOREIGN KEY (`Fabricante_idFabricante`) REFERENCES `fabricante` (`idFabricante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Representante_Usuario1` FOREIGN KEY (`Usuario_idUser`) REFERENCES `usuario` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Banco de dados: `estudo`
--
CREATE DATABASE IF NOT EXISTS `estudo` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `estudo`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `id` int(11) NOT NULL,
  `nome` varchar(95) DEFAULT NULL,
  `sobrenome` varchar(45) DEFAULT NULL,
  `email` varchar(95) DEFAULT NULL,
  `situacao` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pessoa`
--

INSERT INTO `pessoa` (`id`, `nome`, `sobrenome`, `email`, `situacao`) VALUES
(1, 'Italo', 'Cruz', 'teste@teste.com', 'Ativo'),
(2, 'Francisco', 'Cruz', 'teste@teste.com', 'Inativo');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Banco de dados: `funildevendas`
--
CREATE DATABASE IF NOT EXISTS `funildevendas` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `funildevendas`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nome` varchar(220) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`id`, `nome`) VALUES
(1, 'Informatica'),
(2, 'Lideranca');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cursos`
--

CREATE TABLE `cursos` (
  `id` int(11) NOT NULL,
  `nome` varchar(220) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `detalhes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cursos`
--

INSERT INTO `cursos` (`id`, `nome`, `categoria_id`, `detalhes`) VALUES
(1, 'Curso de HTML5, CSS3 e Bootstrap', 1, 'Fusce ut lorem commodo, semper libero eu, pharetra felis. Nunc sit amet vulputate turpis. Vestibulum tristique rutrum mauris, fringilla cursus tellus congue quis. Aliquam bibendum consectetur velit, quis consequat lectus convallis eget. Vivamus ornare sollicitudin diam, aliquet posuere nulla lobortis non. Praesent lobortis nisi eget luctus porttitor. Cras dignissim dolor vitae porta cursus. Suspendisse neque lectus, fermentum elementum tellus at, blandit ornare felis. Proin vel aliquam massa, et laoreet mi. Nam viverra libero id mi aliquam, non aliquet dolor luctus.'),
(2, 'Curso de PHP, MySQLi e Bootstrap', 1, 'Pellentesque eu porta velit. Cras ornare laoreet vehicula. Fusce sit amet hendrerit erat. Cras bibendum nisl eu tellus vestibulum pretium. Curabitur tortor tellus, porttitor ut erat sed, dictum tempor augue. Maecenas quis gravida elit, nec vehicula metus. Sed sit amet arcu in magna tincidunt posuere ac ac nisi. Aenean risus nulla, posuere in leo quis, molestie bibendum risus. Vivamus finibus a orci sit amet imperdiet. Proin pharetra sed nisl id tempor.'),
(3, 'Curso de Oratoria', 2, 'Proin aliquet, leo vehicula consectetur faucibus, quam augue congue nunc, eget blandit velit velit ac sem. Fusce nec imperdiet tortor, non ultrices libero. Aenean id quam eu enim semper egestas quis quis orci. Phasellus accumsan sed ex id tincidunt. Proin molestie dignissim quam id blandit. Quisque scelerisque venenatis ante a consequat. Donec dignissim eu nunc ut rutrum. Maecenas vehicula aliquam est, vel ultrices metus auctor sit amet. Phasellus pretium ligula a dapibus laoreet. Phasellus sed sodales nibh. Nullam sit amet erat at tortor ultrices rhoncus. Curabitur id luctus lacus.'),
(4, 'Curso de Marketing Pessoal', 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque et viverra nulla. Curabitur blandit purus quis est lobortis aliquet. Proin sit amet nulla tristique massa elementum ultricies. Integer lacinia in nisl et sodales. Sed ipsum lectus, lacinia eu velit in, tristique accumsan lectus. Donec quis risus nec orci placerat varius lobortis blandit nibh. Pellentesque pharetra nulla magna, sed pretium est gravida at. Nulla interdum erat egestas fermentum mattis. Donec hendrerit in magna quis pharetra. Integer auctor erat in lacus viverra, dapibus egestas ante congue. Phasellus ipsum lectus, faucibus vitae enim quis, aliquam pharetra ex. Quisque volutpat nulla sed sapien condimentum, et iaculis turpis efficitur. Maecenas et enim ultrices, blandit enim sed, ultricies dolor. Mauris faucibus tellus augue, euismod ultricies lectus imperdiet eget.');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Banco de dados: `pdv2016`
--
CREATE DATABASE IF NOT EXISTS `pdv2016` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pdv2016`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_categories`
--

CREATE TABLE `tec_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(100) DEFAULT 'no_image.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_categories`
--

INSERT INTO `tec_categories` (`id`, `code`, `name`, `image`) VALUES
(1, 'G01', 'SERVIÇOS RAPIDOS', 'bdbc68aa9847d3dad074112ca58a3d42.jpg'),
(2, 'G02', 'GRÁFICA RAPIDA', 'e3c45122fa6a568f0a5a1e24f0c03968.jpg'),
(3, '01', 'testeeeeeee', 'no_image.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_combo_items`
--

CREATE TABLE `tec_combo_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `price` decimal(25,2) DEFAULT NULL,
  `cost` decimal(25,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_combo_items`
--

INSERT INTO `tec_combo_items` (`id`, `product_id`, `item_code`, `quantity`, `price`, `cost`) VALUES
(5, 18, '03', '1.0000', NULL, NULL),
(6, 18, '02', '1.0000', NULL, NULL),
(7, 18, '0015', '1.0000', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_customers`
--

CREATE TABLE `tec_customers` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cf1` varchar(255) NOT NULL,
  `cf2` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_customers`
--

INSERT INTO `tec_customers` (`id`, `name`, `cf1`, `cf2`, `phone`, `email`) VALUES
(1, 'Cliente Padrão', '9999999999', '99999999', '012345678', 'cliente@pdvparatodos.com.br'),
(2, 'Francisco', '', '', '', 'chico@gmail.com'),
(3, 'Aline', '', '', '', ''),
(4, 'teste01', '', '', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_expenses`
--

CREATE TABLE `tec_expenses` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,2) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_gift_cards`
--

CREATE TABLE `tec_gift_cards` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,2) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `balance` decimal(25,2) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_gift_cards`
--

INSERT INTO `tec_gift_cards` (`id`, `date`, `card_no`, `value`, `customer_id`, `balance`, `expiry`, `created_by`) VALUES
(8, '2016-04-13 19:13:20', '3301 5200 7106 8984', '200.00', NULL, '200.00', NULL, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_groups`
--

CREATE TABLE `tec_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_groups`
--

INSERT INTO `tec_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'staff', 'Staff');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_login_attempts`
--

CREATE TABLE `tec_login_attempts` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_login_attempts`
--

INSERT INTO `tec_login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(18, 0x3a3a31, 'cadprojetos@live.com', 1576109662),
(20, 0x3a3a31, 'admin', 1576110912),
(21, 0x3a3a31, 'admin', 1576111708),
(25, 0x3a3a31, 'admin@admin.com', 1576113516);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_payments`
--

CREATE TABLE `tec_payments` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `sale_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,2) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,2) DEFAULT 0.00,
  `pos_balance` decimal(25,2) DEFAULT 0.00,
  `gc_no` varchar(20) DEFAULT NULL,
  `reference` varchar(50) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_payments`
--

INSERT INTO `tec_payments` (`id`, `date`, `sale_id`, `customer_id`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `note`, `pos_paid`, `pos_balance`, `gc_no`, `reference`, `updated_by`, `updated_at`) VALUES
(1, '2015-11-02 13:47:00', 1, 1, NULL, 'CC', '', '', '', '', '', 'Visa', '4.00', NULL, 1, NULL, '', '0.00', '0.00', '', '', NULL, NULL),
(2, '2015-11-03 12:43:13', 2, 1, NULL, 'cash', '', '', '', '', '', '', '16.00', NULL, 1, NULL, '', '20.00', '4.00', '', NULL, NULL, NULL),
(3, '2015-12-12 19:10:09', 4, 1, NULL, 'cash', '', '', '', '', '', '', '10.99', NULL, 2, NULL, '', '50.00', '39.01', '', NULL, NULL, NULL),
(4, '2015-12-12 19:13:40', 5, 1, NULL, 'cash', '', '', '', '', '', '', '32.97', NULL, 2, NULL, '', '70.00', '37.03', '', NULL, NULL, NULL),
(5, '2016-01-22 17:29:59', 6, 1, NULL, 'cash', '', '', '', '', '', '', '20.00', NULL, 1, NULL, '', '20.00', '0.00', '', NULL, NULL, NULL),
(6, '2016-01-25 23:15:47', 7, 1, NULL, 'cash', '', '', '', '', '', '', '4.00', NULL, 1, NULL, '', '10.00', '6.00', '', NULL, NULL, NULL),
(7, '2016-01-25 23:50:55', 8, 1, NULL, 'cash', '', '', '', '', '', '', '4.00', NULL, 1, NULL, '', '10.00', '6.00', '', NULL, NULL, NULL),
(8, '2016-01-25 23:54:16', 10, 1, NULL, 'cash', '', '', '', '', '', '', '6.00', NULL, 1, NULL, '', '50.00', '44.00', '', NULL, NULL, NULL),
(9, '2016-01-26 00:00:29', 11, 1, NULL, 'cash', '', '', '', '', '', '', '4.00', NULL, 1, NULL, '', '4.00', '6.00', '', NULL, NULL, NULL),
(10, '2016-01-26 00:02:46', 12, 1, NULL, 'cash', '', '', '', '', '', '', '7.00', NULL, 1, NULL, '', '10.00', '3.00', '', NULL, NULL, NULL),
(11, '2016-01-26 00:04:10', 13, 1, NULL, 'cash', '', '', '', '', '', '', '2.00', NULL, 1, NULL, '', '5.00', '3.00', '', NULL, NULL, NULL),
(12, '2016-01-26 00:04:47', 14, 1, NULL, 'cash', '', '', '', '', '', '', '8.00', NULL, 1, NULL, '', '10.00', '2.00', '', NULL, NULL, NULL),
(13, '2016-01-26 00:11:13', 15, 1, NULL, 'cash', '', '', '', '', '', '', '24.00', NULL, 1, NULL, '', '50.00', '26.00', '', NULL, NULL, NULL),
(14, '2016-03-05 15:17:18', 16, 1, NULL, 'cash', '', '', '', '', '', '', '4.00', NULL, 1, NULL, '', '10.00', '6.00', '', NULL, NULL, NULL),
(15, '2016-03-05 23:35:02', 13, 1, NULL, 'cash', '', '', '', '', '', '', '8.00', NULL, 2, NULL, '', '8.00', '0.00', '', NULL, NULL, NULL),
(16, '2016-03-05 23:37:09', 14, 1, NULL, 'cash', '', '', '', '', '', '', '12.00', NULL, 2, NULL, '', '50.00', '38.00', '', NULL, NULL, NULL),
(17, '2016-03-06 06:27:05', 16, 1, NULL, 'cash', '', '', '', '', '', '', '8.00', NULL, 3, NULL, '', '20.00', '12.00', '', NULL, NULL, NULL),
(18, '2016-03-08 19:35:11', 17, 1, NULL, 'cash', '', '', '', '', '', '', '5.00', NULL, 3, NULL, '', '20.00', '15.00', '', NULL, NULL, NULL),
(19, '2016-03-30 23:13:15', 18, 1, NULL, 'cash', '', '', '', '', '', 'MasterCard', '4.00', NULL, 4, NULL, '', '4.00', '0.00', '', NULL, NULL, NULL),
(20, '2016-03-31 00:02:11', 19, 1, NULL, 'cash', '', '', '', '', '', '', '10.00', NULL, 5, NULL, '', '20.00', '10.00', '', NULL, NULL, NULL),
(21, '2016-03-31 00:24:02', 20, 1, NULL, 'CC', '', '', '', '', '', 'Visa', '4.00', NULL, 5, NULL, '', '4.00', '0.00', '', NULL, NULL, NULL),
(22, '2016-03-31 00:43:17', 21, 1, NULL, 'cash', '', '', '', '', '', '', '2.00', NULL, 5, NULL, '', '20.00', '18.00', '', NULL, NULL, NULL),
(23, '2016-03-31 15:43:17', 22, 1, NULL, 'cash', '', '', '', '', '', '', '7.00', NULL, 5, NULL, '', '10.00', '3.00', '', NULL, NULL, NULL),
(24, '2016-03-31 20:15:29', 23, 1, NULL, 'cash', '', '', '', '', '', '', '2.00', NULL, 5, NULL, '', '2.00', '0.00', '', NULL, NULL, NULL),
(25, '2016-03-31 21:06:07', 25, 1, NULL, 'cash', '', '', '', '', '', '', '32.00', NULL, 5, NULL, '', '32.00', '0.00', '', NULL, NULL, NULL),
(26, '2016-03-31 23:59:48', 26, 1, NULL, 'cash', '', '', '', '', '', '', '10.00', NULL, 5, NULL, '', '100.00', '90.00', '', NULL, NULL, NULL),
(27, '2016-04-01 00:04:54', 27, 3, NULL, 'cash', '', '', '', '', '', '', '22.00', NULL, 5, NULL, '', '100.00', '78.00', '', NULL, NULL, NULL),
(28, '2016-04-01 00:06:03', 28, 3, NULL, 'cash', '', '', '', '', '', '', '20.00', NULL, 5, NULL, '', '20.00', '0.00', '', NULL, NULL, NULL),
(29, '2016-04-01 00:06:56', 29, 1, NULL, 'gift_card', '', '', '', '', '', '', '4.00', NULL, 5, NULL, '', '4.00', '0.00', '2020 2020 2020 2020', NULL, NULL, NULL),
(30, '2016-04-01 00:08:17', 30, 1, NULL, 'gift_card', '', '', '', '', '', '', '16.00', NULL, 5, NULL, '', '16.00', '-16.00', '2020 2020 2020 2020', NULL, NULL, NULL),
(31, '2016-04-01 02:52:53', 31, 1, NULL, 'cash', '', '', '', '', '', '', '0.25', NULL, 6, NULL, '', '1.00', '0.75', '', NULL, NULL, NULL),
(32, '2016-04-01 13:50:42', 32, 2, NULL, 'cash', '', '', '', '', '', '', '2.75', NULL, 5, NULL, '', '10.00', '7.25', '', NULL, NULL, NULL),
(33, '2016-04-10 13:49:45', 33, 1, NULL, 'cash', '', '', '', '', '', '', '0.75', NULL, 7, NULL, '', '0.75', '4.25', '', NULL, NULL, NULL),
(34, '2016-04-10 13:50:35', 34, 1, NULL, 'cash', '', '', '', '', '', '', '6.25', NULL, 7, NULL, '', '20.00', '13.75', '', NULL, NULL, NULL),
(35, '2016-04-10 14:26:48', 35, 1, NULL, 'cash', '', '', '', '', '', '', '5.25', NULL, 7, NULL, '', '10.00', '4.75', '', NULL, NULL, NULL),
(36, '2016-04-10 14:33:00', 36, 2, NULL, 'cash', '', '', '', '', '', 'Visa', '4.25', NULL, 7, NULL, '', '0.00', '0.00', '', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_products`
--

CREATE TABLE `tec_products` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` char(255) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT 1,
  `price` decimal(25,2) NOT NULL,
  `image` varchar(255) DEFAULT 'no_image.png',
  `tax` varchar(20) DEFAULT NULL,
  `cost` decimal(25,2) DEFAULT NULL,
  `tax_method` tinyint(1) DEFAULT 1,
  `quantity` decimal(15,2) DEFAULT 0.00,
  `barcode_symbology` varchar(20) NOT NULL DEFAULT 'code39',
  `type` varchar(20) NOT NULL DEFAULT 'standard',
  `details` text DEFAULT NULL,
  `alert_quantity` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_products`
--

INSERT INTO `tec_products` (`id`, `code`, `name`, `category_id`, `price`, `image`, `tax`, `cost`, `tax_method`, `quantity`, `barcode_symbology`, `type`, `details`, `alert_quantity`) VALUES
(23, '02', 'IMPRESSÃO - P/B', 1, '0.50', '99ba15cb71eafc2bf6675c47eda93853.gif', '0', '0.10', 1, '-3.00', 'code39', 'standard', 'PRETO E BRANCO - A4', '0.00'),
(24, '03', 'XEROX - COLORIDA', 1, '2.00', '1c485ac2a3a40d5065a8ff8736311008.gif', '0', '0.10', 1, '-8.00', 'code39', 'standard', 'A4', '0.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_purchases`
--

CREATE TABLE `tec_purchases` (
  `id` int(11) NOT NULL,
  `reference` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,2) NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `received` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_purchases`
--

INSERT INTO `tec_purchases` (`id`, `reference`, `date`, `note`, `total`, `attachment`, `supplier_id`, `received`) VALUES
(1, '', '2015-11-02 13:51:00', '', '30.00', NULL, NULL, NULL),
(2, '', '2016-01-25 23:19:00', '', '40.00', NULL, NULL, NULL),
(3, '', '2016-01-26 00:09:00', '', '40.00', NULL, NULL, NULL),
(5, '', '2016-04-13 11:38:00', '', '0.10', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_purchase_items`
--

CREATE TABLE `tec_purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(15,2) NOT NULL,
  `cost` decimal(25,2) NOT NULL,
  `subtotal` decimal(25,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_purchase_items`
--

INSERT INTO `tec_purchase_items` (`id`, `purchase_id`, `product_id`, `quantity`, `cost`, `subtotal`) VALUES
(1, 1, 6, '10.00', '3.00', '30.00'),
(2, 2, 14, '10.00', '4.00', '40.00'),
(3, 3, 1, '10.00', '4.00', '40.00'),
(7, 5, 23, '1.00', '0.10', '0.10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_registers`
--

CREATE TABLE `tec_registers` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,2) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,2) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,2) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_registers`
--

INSERT INTO `tec_registers` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`) VALUES
(1, '2015-11-02 12:39:22', 1, '0.00', 'close', '0.00', 0, 1, '0.00', 0, 1, '', '2015-11-02 13:49:29', NULL, 1),
(2, '2015-11-02 14:00:24', 1, '0.00', 'close', '36.00', 0, 0, '36.00', 0, 0, '', '2016-01-25 23:11:28', NULL, 1),
(3, '2015-12-12 18:59:48', 2, '50.00', 'close', '101.96', 0, 0, '101.96', 0, 0, '', '2016-03-05 23:36:08', NULL, 2),
(4, '2016-01-25 23:12:25', 1, '0.00', 'close', '2.00', 0, 0, '2.00', 0, 0, '', '2016-01-25 23:28:28', '0', 1),
(5, '2016-01-25 23:46:53', 1, '0.00', 'close', '0.00', 0, 0, '0.00', 0, 0, '', '2016-01-25 23:48:44', NULL, 1),
(6, '2016-01-25 23:50:22', 1, '100.00', 'close', '110.00', 0, 0, '110.00', 0, 0, '', '2016-01-25 23:56:02', NULL, 1),
(7, '2016-01-25 23:59:31', 1, '100.00', 'close', '104.00', 0, 0, '104.00', 0, 0, '', '2016-01-26 00:01:16', NULL, 1),
(8, '2016-01-26 00:01:58', 1, '100.00', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, '2016-03-05 23:36:43', 2, '200.00', 'close', '212.00', 0, 0, '212.00', 0, 0, '', '2016-03-08 01:40:06', NULL, 2),
(10, '2016-03-06 06:17:16', 3, '200.00', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, '2016-03-29 14:18:24', 4, '100.00', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, '2016-03-29 14:18:24', 4, '100.00', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, '2016-03-29 14:31:12', 5, '0.00', 'close', '19.00', 0, 1, '19.00', 0, 1, '', '2016-03-31 20:10:01', NULL, 5),
(14, '2016-03-31 20:14:17', 5, '100.00', 'close', '134.00', 0, 0, '134.00', 0, 0, '', '2016-03-31 21:07:22', NULL, 5),
(15, '2016-03-31 23:59:11', 5, '100.00', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, '2016-04-01 02:07:39', 6, '100.00', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, '2016-04-10 13:03:46', 7, '50.00', 'close', '57.00', 0, 0, '57.00', 0, 0, '', '2016-04-10 14:12:49', NULL, 7),
(18, '2016-04-10 14:22:29', 7, '50.00', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_sales`
--

CREATE TABLE `tec_sales` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(55) NOT NULL,
  `total` decimal(25,2) NOT NULL,
  `product_discount` decimal(25,2) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,2) DEFAULT NULL,
  `total_discount` decimal(25,2) DEFAULT NULL,
  `product_tax` decimal(25,2) DEFAULT NULL,
  `order_tax_id` varchar(20) DEFAULT NULL,
  `order_tax` decimal(25,2) DEFAULT NULL,
  `total_tax` decimal(25,2) DEFAULT NULL,
  `grand_total` decimal(25,2) NOT NULL,
  `total_items` int(11) DEFAULT NULL,
  `total_quantity` decimal(15,2) DEFAULT NULL,
  `paid` decimal(25,2) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `rounding` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_sales`
--

INSERT INTO `tec_sales` (`id`, `date`, `customer_id`, `customer_name`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `grand_total`, `total_items`, `total_quantity`, `paid`, `created_by`, `updated_by`, `updated_at`, `note`, `status`, `rounding`) VALUES
(1, '2015-11-02 11:42:47', 1, 'Cliente Padr?o', '4.00', '0.00', NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', '4.00', 2, '2.00', '4.00', 1, 1, '2015-11-02 11:47:25', '', 'paid', '0.00'),
(2, '2015-11-03 10:43:13', 1, 'Cliente Padr?o', '16.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '16.00', 5, '6.00', '16.00', 1, NULL, NULL, '', 'paid', '0.00'),
(3, '2015-12-12 17:08:16', 1, 'Cliente Padr?o', '10.47', '0.00', NULL, '0.00', '0.00', '0.52', '0%', '0.00', '0.52', '10.99', 1, '1.00', '0.00', 2, NULL, NULL, '', 'due', '0.00'),
(4, '2015-12-12 17:10:09', 1, 'Cliente Padr?o', '10.99', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '10.99', 3, '3.00', '10.99', 2, NULL, NULL, '', 'paid', '0.00'),
(5, '2015-12-12 17:13:40', 1, 'Cliente Padr?o', '31.41', '0.00', NULL, '0.00', '0.00', '1.56', '0%', '0.00', '1.56', '32.97', 1, '3.00', '32.97', 2, NULL, NULL, '', 'paid', '0.00'),
(6, '2016-01-22 15:29:59', 1, 'Cliente Padr?o', '20.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '20.00', 6, '8.00', '20.00', 1, NULL, NULL, '', 'paid', '0.00'),
(8, '2016-01-25 21:50:55', 1, 'Cliente Padr?o', '4.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '4.00', 2, '2.00', '4.00', 1, NULL, NULL, '', 'paid', '0.00'),
(9, '2016-01-25 21:52:35', 1, 'Cliente Padr?o', '6.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '6.00', 3, '3.00', '6.00', 1, NULL, NULL, '', 'paid', '0.00'),
(10, '2016-01-25 21:54:16', 1, 'Cliente Padr?o', '6.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '6.00', 3, '3.00', '6.00', 1, NULL, NULL, '', 'paid', '0.00'),
(11, '2016-01-25 22:00:29', 1, 'Cliente Padr?o', '4.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '4.00', 2, '2.00', '4.00', 1, NULL, NULL, '', 'paid', '0.00'),
(12, '2016-01-25 22:02:46', 1, 'Cliente Padr?o', '7.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '7.00', 3, '3.00', '7.00', 1, NULL, NULL, '', 'paid', '0.00'),
(13, '2016-03-05 20:35:02', 1, 'Cliente Padr?o', '8.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '8.00', 3, '3.00', '8.00', 2, NULL, NULL, '', 'paid', '0.00'),
(14, '2016-03-05 20:37:09', 1, 'Cliente Padr?o', '12.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '12.00', 3, '6.00', '12.00', 2, NULL, NULL, '', 'paid', '0.00'),
(15, '2016-03-06 03:19:06', 1, 'Cliente Padr?o', '8.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '8.00', 3, '4.00', '0.00', 3, NULL, NULL, '', 'due', '0.00'),
(16, '2016-03-06 03:27:05', 1, 'Cliente Padr?o', '8.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '8.00', 2, '4.00', '8.00', 3, NULL, NULL, '', 'paid', '0.00'),
(17, '2016-03-08 16:35:11', 1, 'Cliente Padr?o', '5.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '5.00', 3, '3.00', '5.00', 3, NULL, NULL, '', 'paid', '0.00'),
(18, '2016-03-30 20:13:15', 1, 'Cliente Padr?o', '4.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '4.00', 2, '2.00', '4.00', 4, NULL, NULL, '', 'paid', '0.00'),
(19, '2016-03-30 21:02:11', 1, 'Cliente Padr?o', '10.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '10.00', 2, '5.00', '10.00', 5, NULL, NULL, '', 'paid', '0.00'),
(20, '2016-03-30 21:24:02', 1, 'Cliente Padr?o', '4.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '4.00', 2, '2.00', '4.00', 5, NULL, NULL, '', 'paid', '0.00'),
(22, '2016-03-31 12:43:17', 1, 'Cliente Padr?o', '7.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '7.00', 3, '4.00', '7.00', 5, NULL, NULL, '', 'paid', '0.00'),
(27, '2016-03-31 21:04:54', 3, 'Aline', '22.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '22.00', 2, '11.00', '22.00', 5, NULL, NULL, '', 'paid', '0.00'),
(31, '2016-03-31 23:52:53', 1, 'Cliente Padrão', '0.25', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '0.25', 1, '1.00', '0.25', 6, NULL, NULL, '', 'paid', '0.00'),
(32, '2016-04-01 10:50:42', 2, 'Francisco', '2.75', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '2.75', 3, '3.00', '2.75', 5, NULL, NULL, '', 'paid', '0.00'),
(33, '2016-04-10 10:49:45', 1, 'Cliente Padrão', '0.75', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '0.75', 2, '2.00', '0.75', 7, NULL, NULL, '', 'paid', '0.00'),
(34, '2016-04-10 10:50:35', 1, 'Cliente Padrão', '6.25', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '6.25', 2, '4.00', '6.25', 7, NULL, NULL, '', 'paid', '0.00'),
(35, '2016-04-10 11:26:48', 1, 'Cliente Padrão', '5.25', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '5.25', 3, '5.00', '5.25', 7, NULL, NULL, '', 'paid', '0.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_sale_items`
--

CREATE TABLE `tec_sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(15,2) NOT NULL,
  `unit_price` decimal(25,2) NOT NULL,
  `net_unit_price` decimal(25,2) NOT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,2) DEFAULT NULL,
  `tax` int(20) DEFAULT NULL,
  `item_tax` decimal(25,2) DEFAULT NULL,
  `subtotal` decimal(25,2) NOT NULL,
  `real_unit_price` decimal(25,2) DEFAULT NULL,
  `cost` decimal(25,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_sale_items`
--

INSERT INTO `tec_sale_items` (`id`, `sale_id`, `product_id`, `quantity`, `unit_price`, `net_unit_price`, `discount`, `item_discount`, `tax`, `item_tax`, `subtotal`, `real_unit_price`, `cost`) VALUES
(3, 1, 1, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(4, 1, 15, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(5, 2, 1, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(6, 2, 3, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '3.00'),
(7, 2, 9, '2.00', '4.00', '4.00', '0', '0.00', 0, '0.00', '8.00', '4.00', '6.00'),
(8, 2, 14, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(9, 2, 15, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(10, 3, 18, '1.00', '10.99', '10.47', '0', '0.00', 5, '0.52', '10.99', '10.99', '8.71'),
(11, 4, 15, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(12, 4, 19, '1.00', '7.99', '7.99', '0', '0.00', 0, '0.00', '7.99', '7.99', '4.72'),
(13, 4, 20, '1.00', '1.00', '1.00', '0', '0.00', 0, '0.00', '1.00', '1.00', '0.27'),
(14, 5, 18, '3.00', '10.99', '10.47', '0', '0.00', 5, '1.56', '32.97', '10.99', '8.71'),
(15, 6, 6, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '3.00'),
(16, 6, 10, '1.00', '4.00', '4.00', '0', '0.00', 0, '0.00', '4.00', '4.00', '6.00'),
(17, 6, 11, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '3.00'),
(18, 6, 14, '2.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '4.00', '2.00', '4.00'),
(19, 6, 15, '2.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '4.00', '2.00', '4.00'),
(20, 6, 17, '1.00', '4.00', '4.00', '0', '0.00', 0, '0.00', '4.00', '4.00', '6.00'),
(23, 8, 1, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(24, 8, 14, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(25, 9, 4, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '3.00'),
(26, 9, 8, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(27, 9, 14, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(28, 10, 8, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(29, 10, 11, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '3.00'),
(30, 10, 14, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(31, 11, 3, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '3.00'),
(32, 11, 15, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(33, 12, 1, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(34, 12, 2, '1.00', '1.00', '1.00', '0', '0.00', 0, '0.00', '1.00', '1.00', '3.00'),
(35, 12, 17, '1.00', '4.00', '4.00', '0', '0.00', 0, '0.00', '4.00', '4.00', '6.00'),
(36, 13, 14, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(37, 14, 10, '1.00', '4.00', '4.00', '0', '0.00', 0, '0.00', '4.00', '4.00', '6.00'),
(38, 14, 14, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(39, 14, 15, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(40, 15, 1, '12.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '24.00', '2.00', '4.00'),
(41, 16, 14, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(42, 16, 15, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(43, 13, 4, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '3.00'),
(44, 13, 10, '1.00', '4.00', '4.00', '0', '0.00', 0, '0.00', '4.00', '4.00', '6.00'),
(45, 13, 11, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '3.00'),
(46, 14, 14, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(47, 14, 15, '4.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '8.00', '2.00', '4.00'),
(48, 14, 16, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '3.00'),
(49, 15, 14, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(50, 15, 15, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(51, 15, 16, '2.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '4.00', '2.00', '3.00'),
(52, 16, 14, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(53, 16, 15, '3.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '6.00', '2.00', '4.00'),
(54, 17, 1, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(55, 17, 2, '1.00', '1.00', '1.00', '0', '0.00', 0, '0.00', '1.00', '1.00', '3.00'),
(56, 17, 4, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '3.00'),
(57, 18, 14, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(58, 18, 15, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(59, 19, 14, '2.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '4.00', '2.00', '4.00'),
(60, 19, 16, '3.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '6.00', '2.00', '3.00'),
(61, 20, 1, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(62, 20, 16, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '3.00'),
(64, 22, 2, '1.00', '1.00', '1.00', '0', '0.00', 0, '0.00', '1.00', '1.00', '3.00'),
(65, 22, 8, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(66, 22, 14, '2.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '4.00', '2.00', '4.00'),
(78, 27, 14, '6.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '12.00', '2.00', '4.00'),
(79, 27, 15, '5.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '10.00', '2.00', '4.00'),
(83, 31, 22, '1.00', '0.25', '0.25', '0', '0.00', 0, '0.00', '0.25', '0.25', '0.10'),
(84, 32, 22, '1.00', '0.25', '0.25', '0', '0.00', 0, '0.00', '0.25', '0.25', '0.10'),
(85, 32, 23, '1.00', '0.50', '0.50', '0', '0.00', 0, '0.00', '0.50', '0.50', '0.10'),
(86, 32, 24, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '0.10'),
(87, 33, 22, '1.00', '0.25', '0.25', '0', '0.00', 0, '0.00', '0.25', '0.25', '0.10'),
(88, 33, 23, '1.00', '0.50', '0.50', '0', '0.00', 0, '0.00', '0.50', '0.50', '0.10'),
(89, 34, 22, '1.00', '0.25', '0.25', '0', '0.00', 0, '0.00', '0.25', '0.25', '0.10'),
(90, 34, 24, '3.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '6.00', '2.00', '0.10'),
(91, 35, 22, '1.00', '0.25', '0.25', '0', '0.00', 0, '0.00', '0.25', '0.25', '0.10'),
(92, 35, 23, '2.00', '0.50', '0.50', '0', '0.00', 0, '0.00', '1.00', '0.50', '0.10'),
(93, 35, 24, '2.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '4.00', '2.00', '0.10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_sessions`
--

CREATE TABLE `tec_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_sessions`
--

INSERT INTO `tec_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('01qssb6882ub7s74efgtr3se2l', '::1', 1576110338, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131303333383b),
('04dop6bsjqmqj1hqj0hba6mtuf', '::1', 1576113255, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333235353b),
('074e7m8d8j1cb6h6aqr8togiei', '::1', 1576108791, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363130383739313b),
('09119m0olhtvom0cfu0hv2dbve', '::1', 1576113299, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333239393b),
('09olv9e6sgsqs4nbm7lnp21cll', '::1', 1576113406, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333430363b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2235223b66697273745f6e616d657c733a31333a2261646d696e697374726163616f223b6c6173745f6e616d657c733a373a2261646d696e6973223b637265617465645f6f6e7c733a33323a22323932392f303330332f323031363136313631362031313a31373a333720414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353736313133333937223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b),
('0hebef1fmh1sdriji3ktq8vnau', '::1', 1576113299, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333239393b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2235223b66697273745f6e616d657c733a31333a2261646d696e697374726163616f223b6c6173745f6e616d657c733a373a2261646d696e6973223b637265617465645f6f6e7c733a33323a22323932392f303330332f323031363136313631362031313a31373a333720414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353736313133323639223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b6d6573736167657c733a34323a223c703e4c6f6761646f20636f6d207375636573736f212053656a612042656d2056696e646f213c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226e6577223b7d),
('0j4hkjbmp7vuao772lqhuho9s3', '::1', 1576108633, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363130383633333b),
('18robq1e3m9oi53mnus5t827cj', '::1', 1576109697, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363130393639373b),
('1ckposv5t5bgih02fq1tfa0de7', '::1', 1576113516, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333531363b),
('1dr871isr3kbq47jraeofv6cnv', '::1', 1576110914, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131303931343b),
('1fjvuqmd4n98ft5p9d05273ric', '::1', 1576113276, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333237363b),
('1flhitfc2peitcqbua64gs7sou', '::1', 1576110915, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131303931353b6572726f727c733a37333a223c703e566f63c3aa2066657a20332074656e746174697661732073656d207375636573736f2e2054656e7465206e6f76616d656e746520636f6d203130206d696e75746f733c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1j91pb6cjsk348b3jnohol07e5', '::1', 1576109653, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363130393635333b6964656e746974797c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365726e616d657c733a363a226a726e657874223b656d61696c7c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a363a2254686961676f223b6c6173745f6e616d657c733a383a22656d6d616e75656c223b637265617465645f6f6e7c733a33323a22323932392f303330332f323031363136313631362031303a35323a313820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353736313038383532223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b6d6573736167657c733a34323a223c703e4c6f6761646f20636f6d207375636573736f212053656a612042656d2056696e646f213c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226e6577223b7d),
('1mn77vtb22lc0dl6jcn5hhr92u', '::1', 1576112099, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131323039393b),
('1t150fmal0u4162l2kmgjiqpe3', '::1', 1576112192, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131323139323b),
('215153f3341e5d3f207eec80f3c33efccd91476e', '179.127.205.58', 1460574523, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436303537343232333b6964656e746974797c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365726e616d657c733a363a226a726e657874223b656d61696c7c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a363a22496e6163696f223b6c6173745f6e616d657c733a363a224a756e696f72223b637265617465645f6f6e7c733a32323a2232392f30332f323031362031303a35323a313820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343630353533303437223b6c6173745f69707c733a31343a223137392e3132372e3230352e3538223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223131223b636173685f696e5f68616e647c733a363a223130302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031362d30332d32392031313a31383a3234223b),
('2dt0rqrkaboh7lumvhesjss62f', '::1', 1576110334, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131303333343b),
('2erddefmv0j153ce08s73rlke4', '::1', 1576108791, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363130383739313b),
('2ocjbok9v8rsdtfspokqs6p23c', '::1', 1576110026, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131303032363b),
('2pgmate6gtm8e1q8u9jgtbkkfi', '::1', 1576112763, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131323736333b),
('3frdqgib2trt87v77e9p7qmcor', '::1', 1576111726, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131313732363b6572726f727c733a37333a223c703e566f63c3aa2066657a20332074656e746174697661732073656d207375636573736f2e2054656e7465206e6f76616d656e746520636f6d203130206d696e75746f733c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3gedah9qt2ip3bvtbsp3h46dig', '::1', 1576113516, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333531363b6572726f727c733a34363a223c703e4c6f67696e2066616c686f752c20706f72206661766f722074656e7465206e6f76616d656e74653c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4j5bop6ha2uv5iuafbf0htjkb8', '::1', 1576110912, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131303931323b),
('4p2ufgvpqs35d2k9skrjgq1fbu', '::1', 1576113179, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333137393b),
('51ddqavcm780riakf9fkc3kpkb', '::1', 1576113171, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333137313b6572726f727c733a37333a223c703e566f63c3aa2066657a20332074656e746174697661732073656d207375636573736f2e2054656e7465206e6f76616d656e746520636f6d203130206d696e75746f733c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5e113d1f21bc1ce2d5a866a128644313b7e660eb', '179.127.205.58', 1460574220, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436303537333932313b6964656e746974797c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365726e616d657c733a363a226a726e657874223b656d61696c7c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a363a22496e6163696f223b6c6173745f6e616d657c733a363a224a756e696f72223b637265617465645f6f6e7c733a32323a2232392f30332f323031362031303a35323a313820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343630353533303437223b6c6173745f69707c733a31343a223137392e3132372e3230352e3538223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223131223b636173685f696e5f68616e647c733a363a223130302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031362d30332d32392031313a31383a3234223b),
('5glds4klhemtmksprqqr03iunr', '::1', 1576113105, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333130353b6572726f727c733a37333a223c703e566f63c3aa2066657a20332074656e746174697661732073656d207375636573736f2e2054656e7465206e6f76616d656e746520636f6d203130206d696e75746f733c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('6da5006a22102b6e04fe56221e8588844737f848', '179.127.205.58', 1460574838, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436303537343534363b6964656e746974797c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365726e616d657c733a363a226a726e657874223b656d61696c7c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a363a22496e6163696f223b6c6173745f6e616d657c733a363a224a756e696f72223b637265617465645f6f6e7c733a32323a2232392f30332f323031362031303a35323a313820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343630353533303437223b6c6173745f69707c733a31343a223137392e3132372e3230352e3538223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223131223b636173685f696e5f68616e647c733a363a223130302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031362d30332d32392031313a31383a3234223b6d6573736167657c733a32393a2244657370657361204578636c75c3ad646120636f6d207375636573736f223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226e6577223b7d),
('6e07e35e236aa27e692ba431e9d5f95e808bc0db', '179.127.205.58', 1460573618, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436303537333536343b6964656e746974797c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365726e616d657c733a363a226a726e657874223b656d61696c7c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a363a22496e6163696f223b6c6173745f6e616d657c733a363a224a756e696f72223b637265617465645f6f6e7c733a32323a2232392f30332f323031362031303a35323a313820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343630353533303437223b6c6173745f69707c733a31343a223137392e3132372e3230352e3538223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223131223b636173685f696e5f68616e647c733a363a223130302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031362d30332d32392031313a31383a3234223b),
('6f5aqgq4cjkuet8m8shq9tb5hb', '::1', 1576113452, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333435323b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2235223b66697273745f6e616d657c733a31333a2261646d696e697374726163616f223b6c6173745f6e616d657c733a373a2261646d696e6973223b637265617465645f6f6e7c733a33323a22323932392f303330332f323031363136313631362031313a31373a333720414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353736313133343238223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b),
('6hkelh0gna47lus2sat1uqb0h6', '::1', 1576110021, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131303032313b6572726f727c733a34363a223c703e4c6f67696e2066616c686f752c20706f72206661766f722074656e7465206e6f76616d656e74653c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('6ui5honbqrpq9uo2ilsbh7bkdl', '::1', 1576113212, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333231323b),
('70vck82f5o9mte52q9dev5sapk', '::1', 1576110346, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131303334363b),
('7cb29b98c434f82eee16377a4668398c9a39b8fc', '179.127.205.58', 1460575256, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436303537343939303b6964656e746974797c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365726e616d657c733a363a226a726e657874223b656d61696c7c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a363a22496e6163696f223b6c6173745f6e616d657c733a363a224a756e696f72223b637265617465645f6f6e7c733a32323a2232392f30332f323031362031303a35323a313820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343630353533303437223b6c6173745f69707c733a31343a223137392e3132372e3230352e3538223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223131223b636173685f696e5f68616e647c733a363a223130302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031362d30332d32392031313a31383a3234223b),
('7lqq4johsu9bi2pemv4vidrfsc', '::1', 1576110913, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131303931333b6572726f727c733a37333a223c703e566f63c3aa2066657a20332074656e746174697661732073656d207375636573736f2e2054656e7465206e6f76616d656e746520636f6d203130206d696e75746f733c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7re99m602gj5iguac73ngtkimv', '::1', 1576110031, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131303033313b6572726f727c733a37333a223c703e566f63c3aa2066657a20332074656e746174697661732073656d207375636573736f2e2054656e7465206e6f76616d656e746520636f6d203130206d696e75746f733c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7vcuve1npve1j8bq1fpiggreeg', '::1', 1576111727, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131313732373b),
('81alhoh927dnqnjnk9tkkf0p72', '::1', 1576112759, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131323735393b),
('81e675fdf473629f2cabaa15450c2d6e22ed5366', '179.127.205.58', 1460575927, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436303537353932373b6964656e746974797c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365726e616d657c733a363a226a726e657874223b656d61696c7c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a363a22496e6163696f223b6c6173745f6e616d657c733a363a224a756e696f72223b637265617465645f6f6e7c733a32323a2232392f30332f323031362031303a35323a313820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343630353533303437223b6c6173745f69707c733a31343a223137392e3132372e3230352e3538223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223131223b636173685f696e5f68616e647c733a363a223130302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031362d30332d32392031313a31383a3234223b),
('8329a922bee47c86cc33235acb9a3d9440b90411', '179.127.205.58', 1460575357, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436303537353334323b6964656e746974797c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365726e616d657c733a363a226a726e657874223b656d61696c7c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a363a22496e6163696f223b6c6173745f6e616d657c733a363a224a756e696f72223b637265617465645f6f6e7c733a32323a2232392f30332f323031362031303a35323a313820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343630353533303437223b6c6173745f69707c733a31343a223137392e3132372e3230352e3538223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223131223b636173685f696e5f68616e647c733a363a223130302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031362d30332d32392031313a31383a3234223b),
('865umqe99ceo4j2g2apbu731eq', '::1', 1576113397, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333339373b),
('8aqh1j41f5l256ehnkfk7juc6l', '::1', 1576113265, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333236353b),
('8g9h0oh6lmc8frij4ainqh7h8v', '::1', 1576110339, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131303333383b),
('96tm1bsu7ccf5qn0btmcg4n4p6', '::1', 1576113394, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333339343b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2235223b66697273745f6e616d657c733a31333a2261646d696e697374726163616f223b6c6173745f6e616d657c733a373a2261646d696e6973223b637265617465645f6f6e7c733a33323a22323932392f303330332f323031363136313631362031313a31373a333720414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353736313133323939223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b6d6573736167657c733a34323a223c703e4c6f6761646f20636f6d207375636573736f212053656a612042656d2056696e646f213c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226e6577223b7d),
('9ca6dioe83udp1osme7mag8q5i', '::1', 1576108668, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363130383636383b),
('9mopvrnvsslusfqjtih63eomml', '::1', 1576110914, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131303931343b6572726f727c733a37333a223c703e566f63c3aa2066657a20332074656e746174697661732073656d207375636573736f2e2054656e7465206e6f76616d656e746520636f6d203130206d696e75746f733c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a48gp546gc67gtep0q6ik3ebmi', '::1', 1576113249, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333234393b),
('afj8ltlm9rk21484n9mk0uob6k', '::1', 1576113299, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333239393b),
('agcvsnbrn9uhue9vla7itor7oc', '::1', 1576112192, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131323139323b6572726f727c733a34363a223c703e4c6f67696e2066616c686f752c20706f72206661766f722074656e7465206e6f76616d656e74653c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ah16lotu172sjvd40ueov488e7', '::1', 1576108852, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363130383835323b),
('am5pf2n5toj9pv1cvuoqg1sp6j', '::1', 1576110883, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131303838333b),
('ao0rrv06nk17vpmrv7h4t2u4fp', '::1', 1576110031, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131303033313b),
('at62eqttqm1tecvj18gs4ku45b', '::1', 1576112584, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131323538343b),
('ataei4hfrb6fnbhq00nteso2gn', '::1', 1576113198, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333139383b6572726f727c733a37333a223c703e566f63c3aa2066657a20332074656e746174697661732073656d207375636573736f2e2054656e7465206e6f76616d656e746520636f6d203130206d696e75746f733c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('atuth101t6p0d57ll35qjvrmf2', '::1', 1576110913, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131303931333b),
('b7ea6f297b276894517070eaa031f2a0a566c7af', '::1', 1461106485, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436313130363435353b6964656e746974797c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365726e616d657c733a363a226a726e657874223b656d61696c7c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a363a2254686961676f223b6c6173745f6e616d657c733a383a22656d6d616e75656c223b637265617465645f6f6e7c733a33323a22323932392f303330332f323031363136313631362031303a35323a313820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343630353639323731223b6c6173745f69707c733a31343a223137392e3132372e3230352e3538223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223131223b636173685f696e5f68616e647c733a363a223130302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031362d30332d32392031313a31383a3234223b),
('b815bc0kvmeq8a8sdbq7ufesv3', '::1', 1576110026, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131303032363b),
('bg78t57ch8e4gt8lnf6kjca5fh', '::1', 1576113179, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333137393b6572726f727c733a37333a223c703e566f63c3aa2066657a20332074656e746174697661732073656d207375636573736f2e2054656e7465206e6f76616d656e746520636f6d203130206d696e75746f733c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('bk8n0tl4ojb212e1gnfjg5mvih', '::1', 1576111708, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131313730383b6572726f727c733a34363a223c703e4c6f67696e2066616c686f752c20706f72206661766f722074656e7465206e6f76616d656e74653c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('btngtid3arlsnuqtmchdajj06e', '::1', 1576112818, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131323831383b),
('buci5ghett28o466hb591442st', '::1', 1576113193, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333139333b),
('bud9ponvpjj79isbgojssr799i', '::1', 1576113276, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333237363b),
('bulbilsbsq7p7buccbrsoj0crk', '::1', 1576110873, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131303837333b),
('c114a686f9eed7caf8a0810f512ace3914c120cd', '179.127.205.58', 1460569304, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436303536393236383b6964656e746974797c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365726e616d657c733a363a226a726e657874223b656d61696c7c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a363a22496e6163696f223b6c6173745f6e616d657c733a363a224a756e696f72223b637265617465645f6f6e7c733a32323a2232392f30332f323031362031303a35323a313820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343630353533303437223b6c6173745f69707c733a31343a223137392e3132372e3230352e3538223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223131223b636173685f696e5f68616e647c733a363a223130302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031362d30332d32392031313a31383a3234223b),
('cgbk7vqliq7l7gcs754l6ip9ls', '::1', 1576112682, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131323638323b),
('ch19tc0ftm5sjdl04t3vrrktp4', '::1', 1576109662, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363130393636323b6572726f727c733a34363a223c703e4c6f67696e2066616c686f752c20706f72206661766f722074656e7465206e6f76616d656e74653c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('dni91ts1falhogpom7lbap53am', '::1', 1576110478, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131303437383b),
('e181na3rfkmrgkqtojrk4r9gt3', '::1', 1576109662, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363130393636323b),
('e7064h48167conivmgv9kpbalu', '::1', 1576113265, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333236353b),
('emv5jpu68ep50q5fbgjj3svhb8', '::1', 1576113212, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333231323b6572726f727c733a37333a223c703e566f63c3aa2066657a20332074656e746174697661732073656d207375636573736f2e2054656e7465206e6f76616d656e746520636f6d203130206d696e75746f733c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f2bki2e6j5ptom2c930ndn3i9j', '::1', 1576110025, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131303032353b),
('f2tpnfb78t8st7k5mt3a7a7fvd', '::1', 1576113171, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333137313b),
('f51p3bgmobaj4fv9mmr4cmmn5s', '::1', 1576113398, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333339383b),
('fbq6ibienfoiuqvas2s526kmb5', '::1', 1576112695, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131323639353b),
('fe3he77549b94khdfogv4heh34', '::1', 1576113198, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333139383b),
('fipqil95tgom0td1lnpmoiihaq', '::1', 1576111708, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131313730383b),
('fml11u51h80tgpk386dkrvtpi8', '::1', 1576110913, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131303931333b6572726f727c733a37333a223c703e566f63c3aa2066657a20332074656e746174697661732073656d207375636573736f2e2054656e7465206e6f76616d656e746520636f6d203130206d696e75746f733c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('g5mpo0ik4giii0p5gbg1pkgi71', '::1', 1576113397, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333339373b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2235223b66697273745f6e616d657c733a31333a2261646d696e697374726163616f223b6c6173745f6e616d657c733a373a2261646d696e6973223b637265617465645f6f6e7c733a33323a22323932392f303330332f323031363136313631362031313a31373a333720414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353736313133333934223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b6d6573736167657c733a34323a223c703e4c6f6761646f20636f6d207375636573736f212053656a612042656d2056696e646f213c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226e6577223b7d),
('gba9a58h48implv3t9ihb6vtn5', '::1', 1576110910, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131303931303b),
('git9fkss3fhk3uk2qk9vgs3a4g', '::1', 1576112210, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131323231303b),
('gkgp7eof345tujhn73mjgse8ts', '::1', 1576113218, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333231383b),
('gp78vo7g2dn19gq621ljbtnff6', '::1', 1576111687, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131313638373b),
('h7abdddvautr3hro9i7mjabjpk', '::1', 1576110478, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131303437383b6572726f727c733a37333a223c703e566f63c3aa2066657a20332074656e746174697661732073656d207375636573736f2e2054656e7465206e6f76616d656e746520636f6d203130206d696e75746f733c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('habj42030kdk064g1ckutrshch', '::1', 1576108791, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363130383739313b6964656e746974797c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365726e616d657c733a363a226a726e657874223b656d61696c7c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a363a2254686961676f223b6c6173745f6e616d657c733a383a22656d6d616e75656c223b637265617465645f6f6e7c733a33323a22323932392f303330332f323031363136313631362031303a35323a313820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343631313036343731223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b6d6573736167657c733a34323a223c703e4c6f6761646f20636f6d207375636573736f212053656a612042656d2056696e646f213c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226e6577223b7d),
('hi6qfs0m8utm8ejq8enkgblakd', '::1', 1576113265, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333236353b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2235223b66697273745f6e616d657c733a31333a2261646d696e697374726163616f223b6c6173745f6e616d657c733a373a2261646d696e6973223b637265617465645f6f6e7c733a33323a22323932392f303330332f323031363136313631362031313a31373a333720414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343539353138353932223b6c6173745f69707c733a31343a223138372e34312e3230352e313136223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b6d6573736167657c733a34323a223c703e4c6f6761646f20636f6d207375636573736f212053656a612042656d2056696e646f213c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226e6577223b7d),
('hjkoi3fj7h5pb81kc15c4imm8r', '::1', 1576112166, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131323136363b),
('hjm3eq2aakbbseqqbj4jsp6h9i', '::1', 1576113269, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333236393b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2235223b66697273745f6e616d657c733a31333a2261646d696e697374726163616f223b6c6173745f6e616d657c733a373a2261646d696e6973223b637265617465645f6f6e7c733a33323a22323932392f303330332f323031363136313631362031313a31373a333720414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353736313133323635223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b6d6573736167657c733a34323a223c703e4c6f6761646f20636f6d207375636573736f212053656a612042656d2056696e646f213c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226e6577223b7d),
('ijtsomntba1ol1c1cb2pgp0avg', '::1', 1576108602, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363130383630323b),
('in8n6n3nc6da19le0eg2gf313c', '::1', 1576113239, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333233393b),
('j5dvemudkg34e91ah9nu0q5vhl', '::1', 1576113312, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333331323b),
('jbqjcd7be8h5vcfps4dc4v46vj', '::1', 1576108852, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363130383835323b6964656e746974797c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365726e616d657c733a363a226a726e657874223b656d61696c7c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a363a2254686961676f223b6c6173745f6e616d657c733a383a22656d6d616e75656c223b637265617465645f6f6e7c733a33323a22323932392f303330332f323031363136313631362031303a35323a313820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353736313038373931223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b6d6573736167657c733a34323a223c703e4c6f6761646f20636f6d207375636573736f212053656a612042656d2056696e646f213c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226e6577223b7d),
('jbu48r12cm3dk32dodli5lrvfa', '::1', 1576109653, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363130393635333b),
('jo6ou5hssrdumg13k260e6ppm4', '::1', 1576109357, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363130393335373b),
('jpk0a6tg7pq7hphg85g856deup', '::1', 1576113269, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333236393b),
('k231k25pg9r6f3ahcp7usi0jc6', '::1', 1576112584, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131323538343b6572726f727c733a37333a223c703e566f63c3aa2066657a20332074656e746174697661732073656d207375636573736f2e2054656e7465206e6f76616d656e746520636f6d203130206d696e75746f733c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ka41ge2t0neuiqd9bfq5o9ce62', '::1', 1576113070, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333037303b),
('kb994njk0h410bf2eeatr28m3o', '::1', 1576109025, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363130393032353b6572726f727c733a34363a223c703e4c6f67696e2066616c686f752c20706f72206661766f722074656e7465206e6f76616d656e74653c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('l1cqichut5joe962h5jpgrmlc9', '::1', 1576109356, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363130393335363b6964656e746974797c733a31353a2274657374654074657374652e636f6d223b757365726e616d657c733a353a227465737465223b656d61696c7c733a31353a2274657374654074657374652e636f6d223b757365725f69647c733a313a2237223b66697273745f6e616d657c733a353a227465737465223b6c6173745f6e616d657c733a353a227465737465223b637265617465645f6f6e7c733a33323a22313031302f303430342f323031363136313631362031303a30323a313920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343630343836373632223b6c6173745f69707c733a31343a223137372e3132352e3132302e3432223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b6d6573736167657c733a34323a223c703e4c6f6761646f20636f6d207375636573736f212053656a612042656d2056696e646f213c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226e6577223b7d),
('lc8dum7lg0pf3m7ibvqd0039a5', '::1', 1576108590, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363130383539303b),
('lnjfjsudah8saq2662vofa59n5', '::1', 1576112304, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131323330343b6572726f727c733a37333a223c703e566f63c3aa2066657a20332074656e746174697661732073656d207375636573736f2e2054656e7465206e6f76616d656e746520636f6d203130206d696e75746f733c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('lrjgpbhr38vvqc97ub380ip02h', '::1', 1576113088, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333038383b6572726f727c733a34363a223c703e4c6f67696e2066616c686f752c20706f72206661766f722074656e7465206e6f76616d656e74653c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('m1hvs1p650bmksdudfhet5i351', '::1', 1576112166, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131323136363b6572726f727c733a34363a223c703e4c6f67696e2066616c686f752c20706f72206661766f722074656e7465206e6f76616d656e74653c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('mau78qg521fr4gm3gi4e00rutu', '::1', 1576110320, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131303332303b),
('mkemlm92msbsreos0j0ijpk8qa', '::1', 1576112099, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131323039393b6572726f727c733a37333a223c703e566f63c3aa2066657a20332074656e746174697661732073656d207375636573736f2e2054656e7465206e6f76616d656e746520636f6d203130206d696e75746f733c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('mv8r9i013uncl7smci2usog6ud', '::1', 1576113276, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333237363b6964656e746974797c733a31353a2274657374654074657374652e636f6d223b757365726e616d657c733a353a227465737465223b656d61696c7c733a31353a2274657374654074657374652e636f6d223b757365725f69647c733a313a2237223b66697273745f6e616d657c733a353a227465737465223b6c6173745f6e616d657c733a353a227465737465223b637265617465645f6f6e7c733a33323a22313031302f303430342f323031363136313631362031303a30323a313920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353736313039333536223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b6d6573736167657c733a34323a223c703e4c6f6761646f20636f6d207375636573736f212053656a612042656d2056696e646f213c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226e6577223b7d),
('mvhldb9cv3vag27l3v7o5sskfi', '::1', 1576112920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131323932303b),
('n17s08nigo5eije5u93u8kg9kv', '::1', 1576113088, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333038383b),
('o16knj7m4qgt960a41a772kf89', '::1', 1576112304, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131323330343b),
('o8k2m1adu2b3ih9p6sa13mkdbt', '::1', 1576109356, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363130393335363b),
('oa041imc1d8n2omss47emrc7m0', '::1', 1576110913, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131303931333b),
('opaeuul43a883p1i0q9eepbe6c', '::1', 1576113394, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333339343b),
('p8jifb2jj8fntn4tau79486urn', '::1', 1576108852, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363130383835323b),
('p9hf4ef5l483j1m9dl2pfjs805', '::1', 1576113269, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333236393b),
('pcaocogog9amnnfs6tvj2kgnqk', '::1', 1576110873, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131303837333b),
('pvpcob29ulpfg0k594oiknes4a', '::1', 1576113428, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333432383b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2235223b66697273745f6e616d657c733a31333a2261646d696e697374726163616f223b6c6173745f6e616d657c733a373a2261646d696e6973223b637265617465645f6f6e7c733a33323a22323932392f303330332f323031363136313631362031313a31373a333720414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353736313133333937223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b),
('q3edn317662kv4uuhffdq2skb0', '::1', 1576112050, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131323035303b),
('q5r28vgb2kasrir4busqffs3e8', '::1', 1576112054, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131323035343b),
('q8rvmemt1s5jqu19s5qlcjle1b', '::1', 1576110021, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131303032313b),
('q9qum5npbgsf38ht6b5b9927h8', '::1', 1576113101, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333130313b),
('qaiehnpqcr35rabflujur8fji2', '::1', 1576109025, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363130393032353b),
('rjaa0nd89nkt8so46g2bejhosn', '::1', 1576113105, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333130353b),
('rmn4dat9ojg7uhreqp6hk1b9mb', '::1', 1576110915, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131303931353b),
('s74br4qupf96tl39jadae8skor', '::1', 1576108584, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363130383538343b),
('sdggnap0uafdbo08es1k73r9np', '::1', 1576112682, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131323638323b6572726f727c733a37333a223c703e566f63c3aa2066657a20332074656e746174697661732073656d207375636573736f2e2054656e7465206e6f76616d656e746520636f6d203130206d696e75746f733c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('t3ohlv54jljio6vupnq6t1iaas', '::1', 1576108688, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363130383638373b),
('u0kcdtlad8brtqn5kjvm6vjt1j', '::1', 1576110345, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131303334353b),
('u654628obh2hmlmc4ptaeddso9', '::1', 1576109654, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363130393635343b),
('uba1rksnoqpgv7srn27t3pbraq', '::1', 1576109697, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363130393639373b6572726f727c733a36363a223c703e4f20656e64657265c3a76f20646520652d6d61696c20656e74726172206ec3a36f2070657274656e63652061206e656e68756d6120636f6e74612e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ugmaokjsob5ag05mnb1kqm1h6q', '::1', 1576113394, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131333339343b),
('uklsoml6dl27mgmko767odtvdl', '::1', 1576110912, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131303931323b6572726f727c733a34363a223c703e4c6f67696e2066616c686f752c20706f72206661766f722074656e7465206e6f76616d656e74653c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('uopr8ijcggsh4pllto9gcot7le', '::1', 1576112824, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131323832343b),
('vpor8rqu2h9p1ln20iaudcecie', '::1', 1576110024, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363131303032343b);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_settings`
--

CREATE TABLE `tec_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `dateformat` varchar(20) DEFAULT NULL,
  `timeformat` varchar(20) DEFAULT NULL,
  `default_email` varchar(100) NOT NULL,
  `language` varchar(20) NOT NULL,
  `version` varchar(5) NOT NULL DEFAULT '1.0',
  `theme` varchar(20) NOT NULL,
  `timezone` varchar(255) NOT NULL DEFAULT '0',
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `smtp_host` varchar(255) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(5) DEFAULT NULL,
  `mmode` tinyint(1) NOT NULL,
  `captcha` tinyint(1) NOT NULL DEFAULT 1,
  `mailpath` varchar(55) DEFAULT NULL,
  `currency_prefix` varchar(3) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_tax_rate` varchar(20) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `total_rows` int(2) NOT NULL,
  `header` varchar(1000) NOT NULL,
  `footer` varchar(1000) NOT NULL,
  `bsty` tinyint(4) NOT NULL,
  `display_kb` tinyint(4) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_discount` varchar(20) NOT NULL,
  `item_addition` tinyint(1) NOT NULL,
  `barcode_symbology` varchar(55) NOT NULL,
  `pro_limit` tinyint(4) NOT NULL,
  `decimals` tinyint(1) NOT NULL DEFAULT 2,
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_order` varchar(55) DEFAULT NULL,
  `print_bill` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `char_per_line` tinyint(4) DEFAULT 42,
  `rounding` tinyint(1) DEFAULT 0,
  `pin_code` varchar(20) DEFAULT NULL,
  `stripe` tinyint(1) DEFAULT NULL,
  `stripe_secret_key` varchar(100) DEFAULT NULL,
  `stripe_publishable_key` varchar(100) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_settings`
--

INSERT INTO `tec_settings` (`setting_id`, `logo`, `site_name`, `tel`, `dateformat`, `timeformat`, `default_email`, `language`, `version`, `theme`, `timezone`, `protocol`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `mmode`, `captcha`, `mailpath`, `currency_prefix`, `default_customer`, `default_tax_rate`, `rows_per_page`, `total_rows`, `header`, `footer`, `bsty`, `display_kb`, `default_category`, `default_discount`, `item_addition`, `barcode_symbology`, `pro_limit`, `decimals`, `thousands_sep`, `decimals_sep`, `focus_add_item`, `add_customer`, `toggle_category_slider`, `cancel_sale`, `suspend_sale`, `print_order`, `print_bill`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `java_applet`, `receipt_printer`, `pos_printers`, `cash_drawer_codes`, `char_per_line`, `rounding`, `pin_code`, `stripe`, `stripe_secret_key`, `stripe_publishable_key`, `purchase_code`, `envato_username`) VALUES
(1, 'logo11.png', 'CADPROJETOS', '89 99430-2106', 'dd/mm/Yyyy', 'h:i:s A', 'cadprojetos@live.com', 'portugues', '4.0', 'default', 'Amercia/Belem', 'mail', 'pop.gmail.com', 'geraldopatricio.melo@gmail.com', '', '25', '', 0, 0, NULL, 'R$ ', 1, '0%', 25, 30, '<h2>CADPROJETOS - PDV</h2>Rua Afonso Marques, 441 - Centro,<br>\r\n                                                                                              CEP 62.300-000 - Viçosa - CE<br>', 'Volte Sempre!\r\n<br>', 3, 0, 1, '0', 1, '', 100, 2, ',', '.', 'F7', 'ALT+F2', 'ALT+F10', 'F3', 'F2', 'F6', 'F4', 'F1', 'Ctrl+F1', 'F5', 'ALT+F7', 0, '', '', '', 42, 0, '1234', 1, 'sk_test_jHf4cEzAYtgcXvgWPCsQAn50', 'pk_test_beat8SWPORb0OVdF2H77A7uG', 'ff2400d9-f3aa-4db5-9dc5-4eee236c6254', 'patriciomelo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_suppliers`
--

CREATE TABLE `tec_suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cf1` varchar(255) NOT NULL,
  `cf2` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_suppliers`
--

INSERT INTO `tec_suppliers` (`id`, `name`, `cf1`, `cf2`, `phone`, `email`) VALUES
(2, 'thiago', '03184809307', '', '8899874257', 'thiagoeps@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_suspended_items`
--

CREATE TABLE `tec_suspended_items` (
  `id` int(11) NOT NULL,
  `suspend_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(15,2) NOT NULL,
  `unit_price` decimal(25,2) NOT NULL,
  `net_unit_price` decimal(25,2) NOT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,2) DEFAULT NULL,
  `tax` int(20) DEFAULT NULL,
  `item_tax` decimal(25,2) DEFAULT NULL,
  `subtotal` decimal(25,2) NOT NULL,
  `real_unit_price` decimal(25,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_suspended_items`
--

INSERT INTO `tec_suspended_items` (`id`, `suspend_id`, `product_id`, `quantity`, `unit_price`, `net_unit_price`, `discount`, `item_discount`, `tax`, `item_tax`, `subtotal`, `real_unit_price`) VALUES
(1, 1, 6, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00'),
(2, 1, 15, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00'),
(3, 1, 16, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00'),
(4, 2, 15, '3.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '6.00', '2.00'),
(5, 2, 16, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_suspended_sales`
--

CREATE TABLE `tec_suspended_sales` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(55) NOT NULL,
  `total` decimal(25,2) NOT NULL,
  `product_discount` decimal(25,2) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,2) DEFAULT NULL,
  `total_discount` decimal(25,2) DEFAULT NULL,
  `product_tax` decimal(25,2) DEFAULT NULL,
  `order_tax_id` varchar(20) DEFAULT NULL,
  `order_tax` decimal(25,2) DEFAULT NULL,
  `total_tax` decimal(25,2) DEFAULT NULL,
  `grand_total` decimal(25,2) NOT NULL,
  `total_items` int(11) DEFAULT NULL,
  `total_quantity` decimal(15,2) DEFAULT NULL,
  `paid` decimal(25,2) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `hold_ref` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_suspended_sales`
--

INSERT INTO `tec_suspended_sales` (`id`, `date`, `customer_id`, `customer_name`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `grand_total`, `total_items`, `total_quantity`, `paid`, `created_by`, `updated_by`, `updated_at`, `note`, `hold_ref`) VALUES
(1, '2016-03-08 16:37:01', 1, 'Cliente Padr?o', '6.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '6.00', 3, '3.00', '0.00', 3, NULL, NULL, '', '01'),
(2, '2016-03-30 20:11:01', 1, 'Cliente Padr?o', '8.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '8.00', 2, '4.00', '0.00', 4, NULL, NULL, '', 'teste');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_users`
--

CREATE TABLE `tec_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_users`
--

INSERT INTO `tec_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`) VALUES
(4, 0x3a3a31, 0x3136382e39302e38382e3432, 'jrnext', '6f4bcfca0a1c7fc5b172be05f8c31523f03db7bb', NULL, 'cadprojetos@live.com', NULL, NULL, NULL, NULL, 1459259538, 1576109653, 1, 'Thiago', 'emmanuel', NULL, '89 9 99097243', NULL, 'male', 1),
(5, 0x3a3a31, 0x3136382e39302e38382e3432, 'admin', 'a3e84f445471add71de9e0dddfcf205f245163cb', NULL, 'admin@admin.com', NULL, NULL, NULL, NULL, 1459261057, 1576113452, 1, 'administracao', 'adminis', NULL, '89 9 94302106', NULL, 'male', 1),
(7, 0x3a3a31, 0x3137392e3132372e3230352e3538, 'teste', 'teste', NULL, 'teste@teste.com', NULL, NULL, NULL, NULL, 1460293339, 1576113276, 1, 'teste', 'teste', NULL, '8899874257', NULL, 'male', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_user_logins`
--

CREATE TABLE `tec_user_logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_user_logins`
--

INSERT INTO `tec_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(1, 1, NULL, 0x3a3a31, 'geraldopatricio.melo@gmail.com', '2015-11-02 12:33:39'),
(2, 1, NULL, 0x3a3a31, 'geraldopatricio.melo@gmail.com', '2015-11-02 12:53:18'),
(3, 1, NULL, 0x3a3a31, 'geraldopatricio.melo@gmail.com', '2015-11-02 13:15:21'),
(4, 1, NULL, 0x3a3a31, 'geraldopatricio.melo@gmail.com', '2015-11-02 13:15:30'),
(5, 1, NULL, 0x3139312e3230372e3135392e313737, 'geraldopatricio.melo@gmail.com', '2015-11-02 22:20:35'),
(6, 1, NULL, 0x3139312e3230372e3135392e313737, 'geraldopatricio.melo@gmail.com', '2015-11-02 22:30:36'),
(7, 1, NULL, 0x3139312e3230372e3135392e313737, 'geraldopatricio.melo@gmail.com', '2015-11-02 22:31:22'),
(8, 1, NULL, 0x3138392e38392e3235302e313934, 'geraldopatricio.melo@gmail.com', '2015-11-03 12:34:44'),
(9, 1, NULL, 0x3137372e3134352e352e313135, 'geraldopatricio.melo@gmail.com', '2015-11-11 20:38:46'),
(10, 1, NULL, 0x3230302e3232322e32312e313338, 'geraldopatricio.melo@gmail.com', '2015-11-25 10:45:05'),
(11, 1, NULL, 0x3138372e3131362e3233312e313231, 'geraldopatricio.melo@gmail.com', '2015-12-12 03:37:53'),
(12, 2, NULL, 0x3138372e3131342e39302e3834, 'pdv@pdvparatodos.com.br', '2015-12-12 19:59:25'),
(13, 1, NULL, 0x3138392e38392e3235302e313934, 'geraldopatricio.melo@gmail.com', '2016-01-16 13:56:15'),
(14, 1, NULL, 0x3138392e38392e3235302e313934, 'geraldopatricio.melo@gmail.com', '2016-01-21 16:22:16'),
(15, 1, NULL, 0x3138392e38392e3235302e313934, 'geraldopatricio.melo@gmail.com', '2016-01-21 19:06:56'),
(16, 1, NULL, 0x3138392e38392e3235302e313934, 'geraldopatricio.melo@gmail.com', '2016-01-22 14:44:26'),
(17, 1, NULL, 0x3137372e3137322e31362e323232, 'geraldopatricio.melo@gmail.com', '2016-01-22 15:06:16'),
(18, 1, NULL, 0x3138392e38392e3235302e313934, 'geraldopatricio.melo@gmail.com', '2016-01-22 18:29:43'),
(19, 1, NULL, 0x3137372e3137322e31362e323232, 'geraldopatricio.melo@gmail.com', '2016-01-22 22:51:12'),
(20, 1, NULL, 0x3139312e3139352e3235302e3333, 'geraldopatricio.melo@gmail.com', '2016-01-25 23:15:36'),
(21, 1, NULL, 0x3137392e3130302e3133362e3737, 'geraldopatricio.melo@gmail.com', '2016-01-26 00:11:10'),
(22, 1, NULL, 0x3137392e3130302e3133362e3737, 'geraldopatricio.melo@gmail.com', '2016-01-26 00:11:52'),
(23, 1, NULL, 0x3137392e3130302e3133362e3737, 'geraldopatricio.melo@gmail.com', '2016-01-26 00:49:37'),
(24, 1, NULL, 0x3137392e3130302e3133362e3737, 'geraldopatricio.melo@gmail.com', '2016-01-26 00:49:56'),
(25, 1, NULL, 0x3137392e3130302e3133362e3737, 'geraldopatricio.melo@gmail.com', '2016-01-26 00:59:18'),
(26, 1, NULL, 0x3137392e3130302e3133362e3737, 'geraldopatricio.melo@gmail.com', '2016-01-26 01:01:39'),
(27, 1, NULL, 0x3a3a31, 'geraldopatricio.melo@gmail.com', '2016-03-05 15:12:12'),
(28, 1, NULL, 0x3a3a31, 'geraldopatricio.melo@gmail.com', '2016-03-05 15:12:12'),
(29, 1, NULL, 0x3a3a31, 'geraldopatricio.melo@gmail.com', '2016-03-05 15:43:30'),
(30, 3, NULL, 0x3a3a31, 'contato@scriptcerto.com.br', '2016-03-05 15:48:06'),
(31, 3, NULL, 0x3a3a31, 'contato@scriptcerto.com.br', '2016-03-05 22:20:49'),
(32, 2, NULL, 0x3a3a31, 'pdv@pdvparatodos.com.br', '2016-03-05 23:32:51'),
(33, 3, NULL, 0x3a3a31, 'contato@scriptcerto.com.br', '2016-03-06 06:15:29'),
(34, 2, NULL, 0x3a3a31, 'pdv@pdvparatodos.com.br', '2016-03-07 21:56:57'),
(35, 2, NULL, 0x3a3a31, 'pdv@pdvparatodos.com.br', '2016-03-08 01:39:04'),
(36, 3, NULL, 0x3a3a31, 'contato@scriptcerto.com.br', '2016-03-08 19:34:35'),
(37, 3, NULL, 0x3a3a31, 'contato@scriptcerto.com.br', '2016-03-09 01:08:22'),
(38, 3, NULL, 0x3136382e39302e38382e3432, 'contato@scriptcerto.com.br', '2016-03-29 13:47:27'),
(39, 4, NULL, 0x3136382e39302e38382e3432, 'jrnext@outlook.com', '2016-03-29 14:18:08'),
(40, 5, NULL, 0x3136382e39302e38382e3432, 'admin@admin.com', '2016-03-29 14:30:35'),
(41, 4, NULL, 0x3138372e34312e3139362e313136, 'jrnext@outlook.com', '2016-03-29 18:22:52'),
(42, 4, NULL, 0x3138372e36322e3135392e3636, 'jrnext@outlook.com', '2016-03-30 02:05:45'),
(43, 4, NULL, 0x3138372e31342e3233372e3638, 'jrnext@outlook.com', '2016-03-30 10:20:10'),
(44, 4, NULL, 0x3138372e36322e3135392e3636, 'jrnext@outlook.com', '2016-03-30 10:31:41'),
(45, 4, NULL, 0x3137372e3138332e3233342e323133, 'jrnext@outlook.com', '2016-03-30 10:55:00'),
(46, 4, NULL, 0x3137372e35352e3234312e323037, 'jrnext@outlook.com', '2016-03-30 11:14:20'),
(47, 4, NULL, 0x3137372e3230372e3233372e3533, 'jrnext@outlook.com', '2016-03-30 13:04:31'),
(48, 5, NULL, 0x3138372e36322e3135392e3636, 'admin@admin.com', '2016-03-30 13:09:01'),
(49, 4, NULL, 0x3137372e35352e3234312e323037, 'jrnext@outlook.com', '2016-03-30 22:24:31'),
(50, 4, NULL, 0x3137372e35352e3234312e323037, 'jrnext@outlook.com', '2016-03-30 23:10:05'),
(51, 5, NULL, 0x3137392e3132352e35312e323530, 'admin@admin.com', '2016-03-31 00:00:32'),
(52, 5, NULL, 0x3137392e3132352e35312e323530, 'admin@admin.com', '2016-03-31 00:42:32'),
(53, 4, NULL, 0x3136382e39302e38382e3432, 'jrnext@outlook.com', '2016-03-31 14:27:20'),
(54, 5, NULL, 0x3138392e31322e3233392e3539, 'admin@admin.com', '2016-03-31 15:04:56'),
(55, 5, NULL, 0x3138372e3132332e3137332e323037, 'admin@admin.com', '2016-03-31 20:09:36'),
(56, 5, NULL, 0x3138372e3132332e3137332e323037, 'admin@admin.com', '2016-03-31 20:50:27'),
(57, 5, NULL, 0x3137392e3138332e3137332e3333, 'admin@admin.com', '2016-03-31 23:59:01'),
(58, 4, NULL, 0x3137392e3139372e3232322e313436, 'jrnext@outlook.com', '2016-04-01 00:18:22'),
(59, 5, NULL, 0x3230312e312e37302e3735, 'admin@admin.com', '2016-04-01 01:58:38'),
(60, 6, NULL, 0x3230312e312e37302e3735, 'lojadecriacao@hotmail.com', '2016-04-01 02:01:20'),
(61, 5, NULL, 0x3138372e3132332e3137332e323037, 'admin@admin.com', '2016-04-01 02:06:27'),
(62, 6, NULL, 0x3230312e312e37302e3735, 'lojadecriacao@hotmail.com', '2016-04-01 02:06:55'),
(63, 5, NULL, 0x3230312e312e37302e3735, 'admin@admin.com', '2016-04-01 02:55:29'),
(64, 5, NULL, 0x3138372e34312e3230352e313136, 'admin@admin.com', '2016-04-01 13:49:52'),
(65, 4, NULL, 0x3138372e36322e3135392e3636, 'jrnext@outlook.com', '2016-04-01 16:37:38'),
(66, 4, NULL, 0x3138372e36322e3135392e3636, 'jrnext@outlook.com', '2016-04-01 17:09:28'),
(67, 4, NULL, 0x3137392e3132372e3230302e3138, 'cadprojetos@live.com', '2016-04-01 19:55:27'),
(68, 4, NULL, 0x3137392e3132372e3230302e3138, 'cadprojetos@live.com', '2016-04-02 13:55:13'),
(69, 4, NULL, 0x3137392e3132372e3230302e3138, 'cadprojetos@live.com', '2016-04-04 20:54:14'),
(70, 4, NULL, 0x3137392e3132372e3230302e3138, 'cadprojetos@live.com', '2016-04-07 12:25:54'),
(71, 4, NULL, 0x3137392e3132372e3230352e3538, 'cadprojetos@live.com', '2016-04-10 13:00:50'),
(72, 7, NULL, 0x3130372e3136372e3131322e3732, 'teste@teste.com', '2016-04-10 13:03:28'),
(73, 7, NULL, 0x3137372e3132352e3132302e3432, 'teste@teste.com', '2016-04-10 13:41:34'),
(74, 7, NULL, 0x3137372e3132352e3132302e3432, 'teste@teste.com', '2016-04-10 14:08:40'),
(75, 7, NULL, 0x3137372e3132352e3132302e3432, 'teste@teste.com', '2016-04-10 14:20:51'),
(76, 7, NULL, 0x3137372e3132352e3132302e3432, 'teste@teste.com', '2016-04-10 14:21:26'),
(77, 7, NULL, 0x3137372e3132352e3132302e3432, 'teste@teste.com', '2016-04-10 14:22:02'),
(78, 7, NULL, 0x3137372e3132352e3132302e3432, 'teste@teste.com', '2016-04-10 14:29:48'),
(79, 4, NULL, 0x3137392e3132372e3230352e3538, 'cadprojetos@live.com', '2016-04-11 16:57:18'),
(80, 7, NULL, 0x3137372e3132352e3132302e3432, 'teste@teste.com', '2016-04-12 18:46:02'),
(81, 4, NULL, 0x3137392e3132372e3230352e3538, 'cadprojetos@live.com', '2016-04-12 23:42:19'),
(82, 4, NULL, 0x3137392e3132372e3230352e3538, 'cadprojetos@live.com', '2016-04-13 01:26:13'),
(83, 4, NULL, 0x3137392e3132372e3230352e3538, 'cadprojetos@live.com', '2016-04-13 11:28:10'),
(84, 4, NULL, 0x3137392e3132372e3230352e3538, 'cadprojetos@live.com', '2016-04-13 11:45:36'),
(85, 4, NULL, 0x3138372e36322e3135392e3636, 'cadprojetos@live.com', '2016-04-13 11:51:16'),
(86, 4, NULL, 0x3137392e3132372e3230352e3538, 'cadprojetos@live.com', '2016-04-13 13:11:01'),
(87, 4, NULL, 0x3137392e3132372e3230352e3538, 'cadprojetos@live.com', '2016-04-13 17:41:11'),
(88, 4, NULL, 0x3a3a31, 'cadprojetos@live.com', '2016-04-19 22:54:31'),
(89, 4, NULL, 0x3a3a31, 'cadprojetos@live.com', '2019-12-11 23:59:51'),
(90, 4, NULL, 0x3a3a31, 'cadprojetos@live.com', '2019-12-12 00:00:52'),
(91, 7, NULL, 0x3a3a31, 'teste@teste.com', '2019-12-12 00:09:16'),
(92, 4, NULL, 0x3a3a31, 'cadprojetos@live.com', '2019-12-12 00:14:13'),
(93, 5, NULL, 0x3a3a31, 'admin@admin.com', '2019-12-12 01:14:25'),
(94, 5, NULL, 0x3a3a31, 'admin@admin.com', '2019-12-12 01:14:29'),
(95, 7, NULL, 0x3a3a31, 'teste@teste.com', '2019-12-12 01:14:36'),
(96, 5, NULL, 0x3a3a31, 'admin@admin.com', '2019-12-12 01:14:59'),
(97, 5, NULL, 0x3a3a31, 'admin@admin.com', '2019-12-12 01:16:34'),
(98, 5, NULL, 0x3a3a31, 'admin@admin.com', '2019-12-12 01:16:37'),
(99, 5, NULL, 0x3a3a31, 'admin@admin.com', '2019-12-12 01:17:08'),
(100, 5, NULL, 0x3a3a31, 'admin@admin.com', '2019-12-12 01:17:32');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tec_categories`
--
ALTER TABLE `tec_categories`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tec_combo_items`
--
ALTER TABLE `tec_combo_items`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tec_customers`
--
ALTER TABLE `tec_customers`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tec_expenses`
--
ALTER TABLE `tec_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tec_gift_cards`
--
ALTER TABLE `tec_gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Índices para tabela `tec_groups`
--
ALTER TABLE `tec_groups`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tec_login_attempts`
--
ALTER TABLE `tec_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tec_payments`
--
ALTER TABLE `tec_payments`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tec_products`
--
ALTER TABLE `tec_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Índices para tabela `tec_purchases`
--
ALTER TABLE `tec_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tec_purchase_items`
--
ALTER TABLE `tec_purchase_items`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tec_registers`
--
ALTER TABLE `tec_registers`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tec_sales`
--
ALTER TABLE `tec_sales`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tec_sale_items`
--
ALTER TABLE `tec_sale_items`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tec_sessions`
--
ALTER TABLE `tec_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Índices para tabela `tec_settings`
--
ALTER TABLE `tec_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Índices para tabela `tec_suppliers`
--
ALTER TABLE `tec_suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tec_suspended_items`
--
ALTER TABLE `tec_suspended_items`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tec_suspended_sales`
--
ALTER TABLE `tec_suspended_sales`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tec_users`
--
ALTER TABLE `tec_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`);

--
-- Índices para tabela `tec_user_logins`
--
ALTER TABLE `tec_user_logins`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tec_categories`
--
ALTER TABLE `tec_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tec_combo_items`
--
ALTER TABLE `tec_combo_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `tec_customers`
--
ALTER TABLE `tec_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tec_expenses`
--
ALTER TABLE `tec_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tec_gift_cards`
--
ALTER TABLE `tec_gift_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `tec_groups`
--
ALTER TABLE `tec_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tec_login_attempts`
--
ALTER TABLE `tec_login_attempts`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `tec_payments`
--
ALTER TABLE `tec_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de tabela `tec_products`
--
ALTER TABLE `tec_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `tec_purchases`
--
ALTER TABLE `tec_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tec_purchase_items`
--
ALTER TABLE `tec_purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `tec_registers`
--
ALTER TABLE `tec_registers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `tec_sales`
--
ALTER TABLE `tec_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de tabela `tec_sale_items`
--
ALTER TABLE `tec_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT de tabela `tec_suppliers`
--
ALTER TABLE `tec_suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tec_suspended_items`
--
ALTER TABLE `tec_suspended_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `tec_suspended_sales`
--
ALTER TABLE `tec_suspended_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `tec_users`
--
ALTER TABLE `tec_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `tec_user_logins`
--
ALTER TABLE `tec_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- Banco de dados: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Extraindo dados da tabela `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"agro\",\"table\":\"boleto\"},{\"db\":\"agro\",\"table\":\"venda\"},{\"db\":\"agro\",\"table\":\"produto\"},{\"db\":\"agro\",\"table\":\"produtos\"},{\"db\":\"funildevendas\",\"table\":\"cursos\"},{\"db\":\"funildevendas\",\"table\":\"categorias\"},{\"db\":\"pdv2016\",\"table\":\"tec_users\"},{\"db\":\"pdv2016\",\"table\":\"tec_suspended_sales\"},{\"db\":\"pdv2016\",\"table\":\"tec_user_logins\"},{\"db\":\"cadproje_pdv2016\",\"table\":\"tec_categories\"}]');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Extraindo dados da tabela `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2020-01-02 23:28:45', '{\"lang\":\"pt\",\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Índices para tabela `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Índices para tabela `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Índices para tabela `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Índices para tabela `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Índices para tabela `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Índices para tabela `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Índices para tabela `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Índices para tabela `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Índices para tabela `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Índices para tabela `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Índices para tabela `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Índices para tabela `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Índices para tabela `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Índices para tabela `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Índices para tabela `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Índices para tabela `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Índices para tabela `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Banco de dados: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
