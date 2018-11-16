CREATE DATABASE /*!32312 IF NOT EXISTS*/ alquiler_autos;
USE alquiler_autos;
set foreign_key_checks=0;
DROP TABLE IF EXISTS `relacion_nn`;
CREATE TABLE `relacion_nn` (
	`attr1` varchar(25),
	`attr2` varchar(25),
	`fk_patent_relacion_nn` varchar(25),
	`fk_document_relacion_nn` varchar(25),
	FOREIGN KEY (
	 fk_document_relacion_nn
	) REFERENCES Person(
	document
	),
	FOREIGN KEY (
	 fk_patent_relacion_nn
	) REFERENCES Vehicle(
	patent
	),
	UNIQUE (
	attr1
	),
	UNIQUE (
	attr1
	),
PRIMARY KEY (`fk_patent_relacion_nn`, `fk_document_relacion_nn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Person`;
CREATE TABLE `Person` (
	`attribute_2_Person` decimal(10, 2),
	`attribute_1_Person` decimal(10, 2),
	`multival_attr_Person` varchar(25),
	`address` varchar(25),
	`document` varchar(25),
	`phones` varchar(25),
PRIMARY KEY (`document`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Client`;
CREATE TABLE `Client` (
	`fk_document_Client` varchar(25),
	FOREIGN KEY (
	 fk_document_Client
	) REFERENCES Person(
	document
	),
PRIMARY KEY (`fk_document_Client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Partner`;
CREATE TABLE `Partner` (
	`car_quantity` int(25),
	`fk_document_Partner` varchar(25),
	FOREIGN KEY (
	 fk_document_Partner
	) REFERENCES Person(
	document
	),
PRIMARY KEY (`fk_document_Partner`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Mphones_Person`;
CREATE TABLE `Mphones_Person` (
	`phones_Mphones_Person` varchar(25),
	`fk_document_Mphones_Person` varchar(25),
	FOREIGN KEY (
	 fk_document_Mphones_Person
	) REFERENCES Person(
	document
	),
PRIMARY KEY (`phones_Mphones_Person`, `fk_document_Mphones_Person`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Vehicle`;
CREATE TABLE `Vehicle` (
	`brand` varchar(25),
	`kilometers` decimal(10, 2),
	`model` int(25),
	`patent` varchar(25),
	`fk_fk_document_Client_Vehicle` varchar(25),
	`fk_fk_document_Partner_Vehicle` varchar(25),
	FOREIGN KEY (
	 fk_fk_document_Partner_Vehicle
	) REFERENCES Partner(
	fk_document_Partner
	),
	FOREIGN KEY (
	 fk_fk_document_Client_Vehicle
	) REFERENCES Client(
	fk_document_Client
	),
PRIMARY KEY (`patent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Mmultival_attr_Person`;
CREATE TABLE `Mmultival_attr_Person` (
	`multival_attr_Mmultival_attr_Person` varchar(25),
	`fk_document_Mmultival_attr_Person` varchar(25),
	FOREIGN KEY (
	 fk_document_Mmultival_attr_Person
	) REFERENCES Person(
	document
	),
PRIMARY KEY (`multival_attr_Mmultival_attr_Person`, `fk_document_Mmultival_attr_Person`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
