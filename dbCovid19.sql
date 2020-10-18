CREATE DATABASE covid19;
USE covid19;

--
-- Table structure for table `nazionale`
--

CREATE TABLE `nazionale` (
  `data` date DEFAULT NULL,
  `stato` varchar(64) DEFAULT NULL,
  `ricoverati_con_sintomi` int DEFAULT NULL,
  `terapia_intensiva` int DEFAULT NULL,
  `totale_ospedalizzati` int DEFAULT NULL,
  `isolamento_domiciliare` int DEFAULT NULL,
  `totale_positivi` int DEFAULT NULL,
  `variazione_totale_positivi` int DEFAULT NULL,
  `nuovi_positivi` int DEFAULT NULL,
  `dimessi_guariti` int DEFAULT NULL,
  `deceduti` int DEFAULT NULL,
  `casi_da_sospetto_diagnostico` int DEFAULT NULL,
  `casi_da_screening` int DEFAULT NULL,
  `totale_casi` int DEFAULT NULL,
  `tamponi` int DEFAULT NULL,
  `casi_testati` int DEFAULT NULL
);

--
-- Table structure for table `province`
--

CREATE TABLE `province` (
  `data` date DEFAULT NULL,
  `stato` varchar(64) DEFAULT NULL,
  `codice_regione` int DEFAULT NULL,
  `denominazione_regione` varchar(64) DEFAULT NULL,
  `codice_provincia` varchar(64) DEFAULT NULL,
  `denominazione_provincia` varchar(64) DEFAULT NULL,
  `sigla_provincia` varchar(2) DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `long` float DEFAULT NULL,
  `totale_casi` int DEFAULT NULL
);

--
-- Table structure for table `regioni`
--

CREATE TABLE `regioni` (
  `data` date DEFAULT NULL,
  `stato` varchar(64) DEFAULT NULL,
  `codice_regione` int DEFAULT NULL,
  `denominazione_regione` varchar(64) DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `long` float DEFAULT NULL,
  `ricoverati_con_sintomi` int DEFAULT NULL,
  `terapia_intensiva` int DEFAULT NULL,
  `totale_ospedalizzati` int DEFAULT NULL,
  `isolamento_domiciliare` int DEFAULT NULL,
  `totale_positivi` int DEFAULT NULL,
  `variazione_totale_positivi` int DEFAULT NULL,
  `nuovi_positivi` int DEFAULT NULL,
  `dimessi_guariti` int DEFAULT NULL,
  `deceduti` int DEFAULT NULL,
  `casi_da_sospetto_diagnostico` int DEFAULT NULL,
  `casi_da_screening` int DEFAULT NULL,
  `totale_casi` int DEFAULT NULL,
  `tamponi` int DEFAULT NULL,
  `casi_testati` int DEFAULT NULL
);