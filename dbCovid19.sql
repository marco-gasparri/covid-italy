CREATE DATABASE covid19;
USE covid19;

CREATE TABLE `dati_statici` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `regione` varchar(255) DEFAULT NULL,
  `posti_attuali` int(11) DEFAULT NULL,
  `posti_programmati_agg` int(11) DEFAULT NULL,
  `popolazione` int(11) DEFAULT NULL,
  `soglia_emergenza` int(11) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `rt_iss` double DEFAULT NULL,
  `rt_iss_prec` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

CREATE TABLE `immunizzazioni` (
  `data_immunizzazione` text,
  `immunizzati` text,
  `booster` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `immunzzazioni_regioni` (
  `time` datetime DEFAULT NULL,
  `regione` varchar(255) DEFAULT NULL,
  `immunizzazioni` double DEFAULT NULL,
  `booster` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `nazionale` (
  `data` date DEFAULT NULL,
  `stato` varchar(64) DEFAULT NULL,
  `ricoverati_con_sintomi` int(11) DEFAULT NULL,
  `terapia_intensiva` int(11) DEFAULT NULL,
  `totale_ospedalizzati` int(11) DEFAULT NULL,
  `isolamento_domiciliare` int(11) DEFAULT NULL,
  `totale_positivi` int(11) DEFAULT NULL,
  `variazione_totale_positivi` int(11) DEFAULT NULL,
  `nuovi_positivi` int(11) DEFAULT NULL,
  `dimessi_guariti` int(11) DEFAULT NULL,
  `deceduti` int(11) DEFAULT NULL,
  `casi_da_sospetto_diagnostico` int(11) DEFAULT NULL,
  `casi_da_screening` int(11) DEFAULT NULL,
  `totale_casi` int(11) DEFAULT NULL,
  `tamponi` int(11) DEFAULT NULL,
  `casi_testati` int(11) DEFAULT NULL,
  `ingressi_terapia_intensiva` int(11) DEFAULT NULL,
  `note` text,
  `note_test` text,
  `note_casi` text,
  `tamponi_test_antigenico_rapido` int(11) DEFAULT NULL,
  `tamponi_test_molecolare` int(11) DEFAULT NULL,
  `totale_positivi_test_antigenico_rapido` int(11) DEFAULT NULL,
  `totale_positivi_test_molecolare` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `province` (
  `data` date DEFAULT NULL,
  `stato` varchar(64) DEFAULT NULL,
  `codice_regione` int(11) DEFAULT NULL,
  `denominazione_regione` varchar(64) DEFAULT NULL,
  `codice_provincia` varchar(64) DEFAULT NULL,
  `denominazione_provincia` varchar(64) DEFAULT NULL,
  `sigla_provincia` varchar(2) DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `long` float DEFAULT NULL,
  `totale_casi` int(11) DEFAULT NULL,
  `note` text,
  `codice_nuts_3` text,
  `codice_nuts_2` text,
  `codice_nuts_1` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `regioni` (
  `data` date DEFAULT NULL,
  `stato` varchar(64) DEFAULT NULL,
  `codice_regione` int(11) DEFAULT NULL,
  `denominazione_regione` varchar(64) DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `long` float DEFAULT NULL,
  `ricoverati_con_sintomi` int(11) DEFAULT NULL,
  `terapia_intensiva` int(11) DEFAULT NULL,
  `totale_ospedalizzati` int(11) DEFAULT NULL,
  `isolamento_domiciliare` int(11) DEFAULT NULL,
  `totale_positivi` int(11) DEFAULT NULL,
  `variazione_totale_positivi` int(11) DEFAULT NULL,
  `nuovi_positivi` int(11) DEFAULT NULL,
  `dimessi_guariti` int(11) DEFAULT NULL,
  `deceduti` int(11) DEFAULT NULL,
  `casi_da_sospetto_diagnostico` int(11) DEFAULT NULL,
  `casi_da_screening` int(11) DEFAULT NULL,
  `totale_casi` int(11) DEFAULT NULL,
  `tamponi` int(11) DEFAULT NULL,
  `casi_testati` int(11) DEFAULT NULL,
  `ingressi_terapia_intensiva` int(11) DEFAULT NULL,
  `note` text,
  `note_casi` text,
  `note_test` text,
  `tamponi_test_antigenico_rapido` int(11) DEFAULT NULL,
  `tamponi_test_molecolare` int(11) DEFAULT NULL,
  `totale_positivi_test_antigenico_rapido` int(11) DEFAULT NULL,
  `totale_positivi_test_molecolare` int(11) DEFAULT NULL,
  `codice_nuts_2` text,
  `codice_nuts_1` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `somministrazioni` (
  `data_somministrazione` date DEFAULT NULL,
  `area` text,
  `totale` int(11) DEFAULT NULL,
  `prima_dose` text,
  `seconda_dose` text,
  `nome_area` text,
  `codice_regione_ISTAT` int(11) DEFAULT NULL,
  `codice_NUTS2` text,
  `codice_NUTS1` text,
  `dose_addizionale_booster` int(11) DEFAULT NULL,
  `pregressa_infezione` int(11) DEFAULT NULL,
  `sesso_femminile` int(11) DEFAULT NULL,
  `sesso_maschile` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `somministrazioni_fasce` (
  `data_somministrazione` date DEFAULT NULL,
  `fornitore` text,
  `area` text,
  `fascia_anagrafica` int(11) DEFAULT NULL,
  `sesso_maschile` int(11) DEFAULT NULL,
  `sesso_femminile` int(11) DEFAULT NULL,
  `prima_dose` int(11) DEFAULT '0',
  `seconda_dose` int(11) DEFAULT '0',
  `nome_area` text,
  `codice_regione_ISTAT` int(11) DEFAULT NULL,
  `codice_NUTS2` text,
  `codice_NUTS1` text,
  `dose_addizionale_booster` int(11) DEFAULT NULL,
  `pregressa_infezione` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `somministrazioni_summary` (
  `area` text,
  `dosi_somministrate` int(11) DEFAULT NULL,
  `dosi_consegnate` int(11) DEFAULT NULL,
  `percentuale_somministrazione` double DEFAULT NULL,
  `ultimo_aggiornamento` date DEFAULT NULL,
  `nome_area` text,
  `codice_regione_ISTAT` int(11) DEFAULT NULL,
  `codice_NUTS2` text,
  `codice_NUTS1` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `statistiche` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tempo_raddoppio` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE PROCEDURE `tempo_raddoppio`(
  giorni INTEGER
)
BEGIN
    DECLARE sumDays INTEGER DEFAULT 0;
  DECLARE daysInternal INTEGER DEFAULT 0;
  DECLARE deltaDays INTEGER DEFAULT 0;
  DECLARE endDate DATE DEFAULT NULL;
  DECLARE initialValuePositives INTEGER DEFAULT -1;
  DECLARE casesTemp INTEGER DEFAULT -1;
  DECLARE retVal DOUBLE DEFAULT 0;

  DECLARE retTest INTEGER DEFAULT 0;
  
  DEClARE curCases 
    CURSOR FOR 
      SELECT totale_positivi FROM nazionale WHERE `data` <= endDate
      ORDER BY `data` DESC;
  
  WHILE deltaDays < giorni DO
    SET endDate = SUBDATE(CURDATE(), deltaDays);
    SET daysInternal = 0;
    SET initialValuePositives = -1;
    OPEN curCases;
      getAvg: LOOP
        FETCH curCases INTO casesTemp;
        IF initialValuePositives = -1 THEN
          SET initialValuePositives = casesTemp;
        ELSE
          IF(casesTemp < initialValuePositives / 2) THEN
            LEAVE getAvg;
          END IF;
        END IF;
        SET daysInternal = daysInternal + 1;
      END LOOP getAvg;
      SET sumDays = sumDays + daysInternal;
    CLOSE curCases;
  SET deltaDays = deltaDays + 1;
  END WHILE;
  SET retVal = sumDays / giorni;
  START TRANSACTION;
    UPDATE statistiche SET tempo_raddoppio = retVal;
  COMMIT;
END;
CREATE PROCEDURE `update_immunizzati`()
BEGIN
    DECLARE done INT DEFAULT FALSE;
  DECLARE selDate date;
    DECLARE tot1 INTEGER DEFAULT 0;
    DECLARE tot2 INTEGER DEFAULT 0;
  DECLARE tot INTEGER DEFAULT 0;
  DECLARE boosters INTEGER DEFAULT 0;
  DEClARE cur1 CURSOR FOR SELECT DISTINCT data_somministrazione FROM somministrazioni;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  TRUNCATE immunizzazioni;

    OPEN cur1;
        readLoop: LOOP
            FETCH cur1 INTO selDate;
            IF done THEN
            LEAVE readLoop;
          END IF;
          SELECT sum(seconda_dose) INTO tot1 FROM somministrazioni where data_somministrazione <= selDate and data_somministrazione >= '2021-01-01';
          SELECT sum(prima_dose) INTO tot2 FROM somministrazioni_fasce WHERE fornitore='Janssen' and data_somministrazione <= selDate and data_somministrazione >= '2021-01-01';
      SELECT sum(dose_addizionale_booster) INTO boosters FROM somministrazioni WHERE data_somministrazione <= selDate and data_somministrazione >= '2021-01-01';
      SET tot = tot1 + tot2;
            INSERT INTO immunizzazioni(data_immunizzazione, immunizzati, booster) VALUES (selDate, tot, boosters);
      SET tot1 = 0;
      SET tot2 = 0;
      SET tot = 0;
      SET boosters = 0;
        END LOOP readLoop;
    CLOSE cur1;
END;
CREATE PROCEDURE `update_immunizzati_regioni`()
BEGIN
  INSERT INTO immunzzazioni_regioni(`time`, `regione`, `immunizzazioni`, `booster`)
  SELECT time, regione, Immunizzazioni, Boosters from(
  SELECT now() as "time", 
  regione,
  somministrazioni_fasce.area as "areaLoc",
  ((sum(seconda_dose)+(SELECT IF(SUM(prima_dose) IS NULL, 0, sum(prima_dose)) FROM somministrazioni_fasce WHERE fornitore='Janssen' and somministrazioni_fasce.area = areaLoc))/popolazione)*100 as "Immunizzazioni",
  (sum(dose_addizionale_booster))/(sum(seconda_dose)+(SELECT IF(SUM(prima_dose) IS NULL, 0, sum(prima_dose)) FROM somministrazioni_fasce WHERE fornitore='Janssen' and somministrazioni_fasce.area = areaLoc))*100 as "Boosters"
  FROM somministrazioni_fasce, dati_statici
  WHERE dati_statici.area = somministrazioni_fasce.area
  GROUP BY regione, somministrazioni_fasce.area, popolazione
  ORDER BY `Immunizzazioni` desc
  ) as t;
END;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `decessi_giornalieri` AS select `c2`.`data` AS `data`,(`c2`.`deceduti` - `c1`.`deceduti`) AS `deceduti` from (`nazionale` `c1` join `nazionale` `c2`) where (`c1`.`data` = (`c2`.`data` - interval 1 day));
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `incrementi_settimanali` AS select (`week3`.`data` - interval weekday(`week3`.`data`) day) AS `time`,(((max(`week3`.`tamponi`) - max(`week2`.`tamponi`)) / (max(`week2`.`tamponi`) - max(`week1`.`tamponi`))) * 100) AS `delta_tamp_sett`,((sum(`week2`.`nuovi_positivi`) / sum(`week1`.`nuovi_positivi`)) * 100) AS `delta_pos_sett` from ((`nazionale` `week1` join `nazionale` `week2`) join `nazionale` `week3`) where (((`week1`.`data` - interval weekday(`week1`.`data`) day) = (((`week2`.`data` - interval weekday(`week2`.`data`) day) - interval 1 day) - interval weekday(((`week2`.`data` - interval weekday(`week2`.`data`) day) - interval 1 day)) day)) and ((`week2`.`data` - interval weekday(`week2`.`data`) day) = (((`week3`.`data` - interval weekday(`week3`.`data`) day) - interval 1 day) - interval weekday(((`week3`.`data` - interval weekday(`week3`.`data`) day) - interval 1 day)) day))) group by `time`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vaccini_somministrazioni_latest` AS select `covid19`.`vaccini_somministrazioni`.`regione` AS `regione`,`covid19`.`vaccini_somministrazioni`.`somministrazioni` AS `somministrazioni`,`covid19`.`vaccini_somministrazioni`.`percentuale` AS `percentuale`,`covid19`.`vaccini_somministrazioni`.`dosiConsegnate` AS `dosiConsegnate`,`covid19`.`vaccini_somministrazioni`.`aggiornamento` AS `aggiornamento`,`covid19`.`vaccini_somministrazioni`.`codice_regione` AS `codice_regione`,date_format(`t`.`max_time`,'%Y-%m-%d') AS `data` from (`covid19`.`vaccini_somministrazioni` join (select max(`covid19`.`vaccini_somministrazioni`.`aggiornamento`) AS `max_time` from `covid19`.`vaccini_somministrazioni` group by cast(`covid19`.`vaccini_somministrazioni`.`aggiornamento` as date)) `t` on((`covid19`.`vaccini_somministrazioni`.`aggiornamento` = `t`.`max_time`)));