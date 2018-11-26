CREATE DATABASE /*!32312 IF NOT EXISTS*/ rent_a_car;
USE rent_a_car;
set foreign_key_checks=0;
DROP TABLE IF EXISTS `Price_Scale`;
CREATE TABLE `Price_Scale` (
	`value` varchar(25),
	`code` int(25),
PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Rent`;
CREATE TABLE `Rent` (
	`rent_code` varchar(25),
	`patent_Rent` varchar(25),
	`date` datetime,
	`kilometers_done` decimal(10, 2),
	`paid_amount` decimal(10, 2),
	`Persons_document_in_Client_Rent` varchar(25),
	FOREIGN KEY (
	 `Persons_document_in_Client_Rent`
	) REFERENCES `Client`(
	`Persons_document_in_Client`
	),
	FOREIGN KEY (
	 `patent_Rent`
	) REFERENCES `Vehicle`(
	`patent`
	),
PRIMARY KEY (`rent_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Client`;
CREATE TABLE `Client` (
	`Persons_address_in_Client` varchar(25),
	`Persons_document_in_Client` varchar(25),
PRIMARY KEY (`Persons_document_in_Client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Vehicle`;
CREATE TABLE `Vehicle` (
	`kilometers` decimal(10, 2),
	`patent` varchar(25),
	`brand` varchar(25),
	`model` int(25),
PRIMARY KEY (`patent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Mphones_Client`;
CREATE TABLE `Mphones_Client` (
	`document_Client` varchar(25),
	`phones_Client` varchar(25),
	FOREIGN KEY (
	 `document_Client`
	) REFERENCES `Client`(
	`Persons_document_in_Client`
	),
PRIMARY KEY (`document_Client`, `phones_Client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Partner`;
CREATE TABLE `Partner` (
	`car_quantity` int(25),
	`Persons_address_in_Partner` varchar(25),
	`Persons_document_in_Partner` varchar(25),
PRIMARY KEY (`Persons_document_in_Partner`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Mphones_Partner`;
CREATE TABLE `Mphones_Partner` (
	`phones_Partner` varchar(25),
	`document_Partner` varchar(25),
	FOREIGN KEY (
	 `document_Partner`
	) REFERENCES `Partner`(
	`Persons_document_in_Partner`
	),
PRIMARY KEY (`phones_Partner`, `document_Partner`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
