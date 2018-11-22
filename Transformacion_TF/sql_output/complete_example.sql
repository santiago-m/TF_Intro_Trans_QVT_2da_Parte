CREATE DATABASE /*!32312 IF NOT EXISTS*/ complete_example;
USE complete_example;
set foreign_key_checks=0;
DROP TABLE IF EXISTS `Client`;
CREATE TABLE `Client` (
	`document_Client` varchar(25),
	FOREIGN KEY (
	 `document_Client`
	) REFERENCES `Person`(
	`document`
	),
PRIMARY KEY (`document_Client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Mmultival_attr_Person`;
CREATE TABLE `Mmultival_attr_Person` (
	`multival_attr_Mmultival_attr_Person` varchar(25),
	`document_Mmultival_attr_Person` varchar(25),
	FOREIGN KEY (
	 `document_Mmultival_attr_Person`
	) REFERENCES `Person`(
	`document`
	),
PRIMARY KEY (`multival_attr_Mmultival_attr_Person`, `document_Mmultival_attr_Person`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Mphones_Person`;
CREATE TABLE `Mphones_Person` (
	`phones_Mphones_Person` varchar(25),
	`document_Mphones_Person` varchar(25),
	FOREIGN KEY (
	 `document_Mphones_Person`
	) REFERENCES `Person`(
	`document`
	),
PRIMARY KEY (`phones_Mphones_Person`, `document_Mphones_Person`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Person`;
CREATE TABLE `Person` (
	`attribute_1_Person` decimal(10, 2),
	`attribute_2_Person` decimal(10, 2),
	`address` varchar(25),
	`att` varchar(25),
	`att_Father` varchar(25),
	`document` varchar(25),
	`document_Father` varchar(25),
PRIMARY KEY (`document`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Father2`;
CREATE TABLE `Father2` (
	`document_Client2_Father2` varchar(25),
	`document_Client_Father2` varchar(25),
	FOREIGN KEY (
	 `document_Client2_Father2`
	) REFERENCES `Client`(
	`document_Client`
	),
	FOREIGN KEY (
	 `document_Client_Father2`
	) REFERENCES `Client`(
	`document_Client`
	),
PRIMARY KEY (`document_Client2_Father2`, `document_Client_Father2`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Partner`;
CREATE TABLE `Partner` (
	`document_Partner` varchar(25),
	`car_quantity` int(25),
	FOREIGN KEY (
	 `document_Partner`
	) REFERENCES `Person`(
	`document`
	),
PRIMARY KEY (`document_Partner`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Vehicle`;
CREATE TABLE `Vehicle` (
	`kilometers` decimal(10, 2),
	`code` varchar(25),
	`patent` varchar(25),
	`brand` varchar(25),
	`model` int(25),
	`document_Partner_Vehicle` varchar(25),
	`date` datetime,
	`paid_amount` decimal(10, 2),
	`document_Client_Vehicle` varchar(25),
	`kilometers_done` decimal(10, 2),
	FOREIGN KEY (
	 `document_Client_Vehicle`
	) REFERENCES `Client`(
	`document_Client`
	),
	FOREIGN KEY (
	 `document_Partner_Vehicle`
	) REFERENCES `Partner`(
	`document_Partner`
	),
PRIMARY KEY (`patent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `relacion_nn`;
CREATE TABLE `relacion_nn` (
	`patent_relacion_nn` varchar(25),
	`document_relacion_nn` varchar(25),
	`attr2` varchar(25),
	`attr1` varchar(25),
	FOREIGN KEY (
	 `document_relacion_nn`
	) REFERENCES `Person`(
	`document`
	),
	FOREIGN KEY (
	 `patent_relacion_nn`
	) REFERENCES `Vehicle`(
	`patent`
	),
PRIMARY KEY (`patent_relacion_nn`, `document_relacion_nn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
