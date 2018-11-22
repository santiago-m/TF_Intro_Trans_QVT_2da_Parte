CREATE DATABASE /*!32312 IF NOT EXISTS*/ rent_a_car;
USE rent_a_car;
set foreign_key_checks=0;
DROP TABLE IF EXISTS `Client`;
CREATE TABLE `Client` (
	`document_Client` varchar(25),
	`address_Client` varchar(25),
PRIMARY KEY (`document_Client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Rent`;
CREATE TABLE `Rent` (
	`paid_amount` decimal(10, 2),
	`document_Client_Rent` varchar(25),
	`price_by_kilometer` decimal(10, 2),
	`kilometers_done` decimal(10, 2),
	`patent_Rent` varchar(25),
	`date` datetime,
	`rent_code` varchar(25),
	FOREIGN KEY (
	 `document_Client_Rent`
	) REFERENCES `Client`(
	`document_Client`
	),
	FOREIGN KEY (
	 `patent_Rent`
	) REFERENCES `Vehicle`(
	`patent`
	),
PRIMARY KEY (`rent_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Vehicle`;
CREATE TABLE `Vehicle` (
	`brand` varchar(25),
	`model` int(25),
	`kilometers` decimal(10, 2),
	`patent` varchar(25),
PRIMARY KEY (`patent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Mprice_scale_Rent`;
CREATE TABLE `Mprice_scale_Rent` (
	`rent_code_Mprice_scale_Rent` varchar(25),
	`price_scale_Mprice_scale_Rent` varchar(25),
	FOREIGN KEY (
	 `rent_code_Mprice_scale_Rent`
	) REFERENCES `Rent`(
	`rent_code`
	),
PRIMARY KEY (`rent_code_Mprice_scale_Rent`, `price_scale_Mprice_scale_Rent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Mphones_Partner`;
CREATE TABLE `Mphones_Partner` (
	`phones_Mphones_Partner` varchar(25),
	`document_Mphones_Partner` varchar(25),
	FOREIGN KEY (
	 `document_Mphones_Partner`
	) REFERENCES `Partner`(
	`document_Partner`
	),
PRIMARY KEY (`phones_Mphones_Partner`, `document_Mphones_Partner`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Mphones_Client`;
CREATE TABLE `Mphones_Client` (
	`phones_Mphones_Client` varchar(25),
	`document_Mphones_Client` varchar(25),
	FOREIGN KEY (
	 `document_Mphones_Client`
	) REFERENCES `Client`(
	`document_Client`
	),
PRIMARY KEY (`phones_Mphones_Client`, `document_Mphones_Client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Partner`;
CREATE TABLE `Partner` (
	`address_Partner` varchar(25),
	`document_Partner` varchar(25),
	`car_quantity` int(25),
PRIMARY KEY (`document_Partner`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
