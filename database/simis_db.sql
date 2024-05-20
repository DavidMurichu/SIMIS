/*
SQLyog Ultimate v12.09 (32 bit)
MySQL - 5.7.33-0ubuntu0.16.04.1 : Database - simisbranch
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `accounttypes` */

DROP TABLE IF EXISTS `accounttypes`;

CREATE TABLE `accounttypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL COMMENT 'Account Type',
  `remarks` text COMMENT 'Remarks',
  `balance` enum('DR','CR') DEFAULT NULL COMMENT 'Debit/Credit',
  `ipaddress` varchar(32) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `acctypes` */

DROP TABLE IF EXISTS `acctypes`;

CREATE TABLE `acctypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT 'Name',
  `subaccounttypeid` int(11) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(64) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `acctypesfksubaccounttypes` (`subaccounttypeid`),
  CONSTRAINT `acctype_jm_subaccounts` FOREIGN KEY (`subaccounttypeid`) REFERENCES `subaccounttypes` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Table structure for table `asset_computationmethods` */

DROP TABLE IF EXISTS `asset_computationmethods`;

CREATE TABLE `asset_computationmethods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Computation Method',
  `computationformula` text COMMENT 'Formula Description',
  `descripition` text COMMENT 'Description',
  `remarks` text COMMENT 'Comments',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `asset_fleetownership` */

DROP TABLE IF EXISTS `asset_fleetownership`;

CREATE TABLE `asset_fleetownership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownerid` int(11) NOT NULL COMMENT 'Fleet Owner',
  `fleetid` int(11) NOT NULL COMMENT 'Fleet',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `asset_fleetroutes` */

DROP TABLE IF EXISTS `asset_fleetroutes`;

CREATE TABLE `asset_fleetroutes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Fleet Route',
  `fromtown` varchar(32) NOT NULL COMMENT 'Departure Town',
  `destinationtown` varchar(32) NOT NULL COMMENT 'Destinaton Town',
  `distance` double DEFAULT '0' COMMENT 'Route Distance',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `asset_fleetroutessubstations` */

DROP TABLE IF EXISTS `asset_fleetroutessubstations`;

CREATE TABLE `asset_fleetroutessubstations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT ' Route Substation/Town',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `logitude` double DEFAULT '34' COMMENT 'Longitude',
  `latitude` double DEFAULT '35' COMMENT 'Latitude',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `asset_fleetroutessubstationsdrawing` */

DROP TABLE IF EXISTS `asset_fleetroutessubstationsdrawing`;

CREATE TABLE `asset_fleetroutessubstationsdrawing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `routeid` int(11) NOT NULL COMMENT 'Route',
  `fromsubstatationid` int(11) NOT NULL COMMENT 'From Substation',
  `tomsubstatationid` int(11) NOT NULL COMMENT 'To Substation',
  `distancebetween` double DEFAULT '0' COMMENT 'Distance Between',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asset_fleetroutessubstationsdrawing_jm_routes` (`routeid`),
  KEY `asset_fleetroutessubstationsdrawing_jm_substation` (`fromsubstatationid`),
  KEY `asset_fleetroutessubstationsdrawing_jm_tosubstation` (`tomsubstatationid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `asset_fleetserviceschecklist` */

DROP TABLE IF EXISTS `asset_fleetserviceschecklist`;

CREATE TABLE `asset_fleetserviceschecklist` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL COMMENT 'Fleet Service Type',
  `duration` tinyint(4) DEFAULT NULL COMMENT 'Expected Duration(Months)',
  `remarks` text COMMENT 'Comment',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `asset_fleetservicescomposition` */

DROP TABLE IF EXISTS `asset_fleetservicescomposition`;

CREATE TABLE `asset_fleetservicescomposition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fleetservceid` int(11) NOT NULL COMMENT 'Fleet Service',
  `checklistitem` int(11) NOT NULL COMMENT 'Servoce checklist Item',
  `cost` double DEFAULT '0' COMMENT 'Check List Cost',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asset_fleetservicescomposition_jm_checklist` (`checklistitem`),
  KEY `asset_fleetservicescomposition_jm_fleetservices` (`fleetservceid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `asset_fleetsownership` */

DROP TABLE IF EXISTS `asset_fleetsownership`;

CREATE TABLE `asset_fleetsownership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) NOT NULL COMMENT 'Member Name',
  `fleetid` int(11) NOT NULL COMMENT 'Fleet Plate',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `asset_suppliers` */

DROP TABLE IF EXISTS `asset_suppliers`;

CREATE TABLE `asset_suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Supplier Name',
  `contactperson` varchar(64) DEFAULT NULL COMMENT 'Contact Person',
  `contacttel` varchar(20) DEFAULT NULL COMMENT 'Contact Tel',
  `location` text COMMENT 'Vendor Location',
  `mobileno` varchar(20) NOT NULL COMMENT 'Mobile No.',
  `address` text COMMENT 'Address',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `asset_timemethods` */

DROP TABLE IF EXISTS `asset_timemethods`;

CREATE TABLE `asset_timemethods` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL COMMENT 'Time Method',
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `assetaccountid` int(11) NOT NULL COMMENT 'Asset Account',
  `deprecationaccountid` int(11) DEFAULT NULL COMMENT 'Deprecation Account',
  `remarks` text COMMENT 'Remarks',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_assets` */

DROP TABLE IF EXISTS `assets_assets`;

CREATE TABLE `assets_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT 'Asset Name',
  `photo` varchar(64) DEFAULT NULL COMMENT 'Asset Image',
  `documentno` varchar(32) NOT NULL COMMENT 'Asset Document No.',
  `categoryid` int(11) NOT NULL COMMENT 'Asset Category',
  `value` double DEFAULT '0' COMMENT 'Asset Value',
  `salvagevalue` double DEFAULT '0' COMMENT 'Salvage Value',
  `purchasedon` date NOT NULL COMMENT 'Purchase Date',
  `supplierid` int(11) NOT NULL COMMENT 'Asset Supplier',
  `lpono` varchar(32) DEFAULT NULL COMMENT 'Asset LPO NO.',
  `deliveryno` varchar(32) DEFAULT NULL COMMENT 'Delivery No.',
  `remarks` text COMMENT 'Remarks',
  `memo` text COMMENT 'Memo',
  `ipaddress` varchar(32) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `category_asset` (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_breakdowns` */

DROP TABLE IF EXISTS `assets_breakdowns`;

CREATE TABLE `assets_breakdowns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetid` int(11) NOT NULL COMMENT 'Asset',
  `description` text COMMENT 'Description',
  `brokedownon` date DEFAULT NULL COMMENT 'Asset Breakdown Date',
  `reactivatedon` date DEFAULT NULL COMMENT 'Asset Reactivation Date',
  `cost` double DEFAULT '0' COMMENT 'Cost',
  `refno` varchar(32) DEFAULT NULL COMMENT 'Ref No',
  `remarks` text COMMENT 'Comments',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_breakdowns_jm_assets` (`assetid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_categorys` */

DROP TABLE IF EXISTS `assets_categorys`;

CREATE TABLE `assets_categorys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Asset Category',
  `timemethodid` int(11) NOT NULL COMMENT 'Time Method',
  `noofdeprecation` double DEFAULT '0' COMMENT 'Noof Deprecation',
  `endingdate` date DEFAULT NULL COMMENT 'Ending Date',
  `periodlength` int(11) DEFAULT NULL COMMENT 'Period Lenght',
  `computationmethodid` int(11) NOT NULL COMMENT 'Computation Method',
  `degressivefactor` double DEFAULT '0' COMMENT 'Degressive Factor',
  `firstentry` date DEFAULT NULL COMMENT 'First Entry',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_categorys_jm_assets_timemethos` (`timemethodid`),
  KEY `assets_categorys_jm_assets_computationmethods` (`computationmethodid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetaccidents` */

DROP TABLE IF EXISTS `assets_fleetaccidents`;

CREATE TABLE `assets_fleetaccidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fleetid` int(11) NOT NULL COMMENT 'Fleet',
  `description` text COMMENT 'Description',
  `accidentdate` date DEFAULT NULL COMMENT 'Accident Date',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_fleetaccidents_jm_assets_fleets` (`fleetid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetbodysubtypes` */

DROP TABLE IF EXISTS `assets_fleetbodysubtypes`;

CREATE TABLE `assets_fleetbodysubtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bodytypeid` int(11) NOT NULL COMMENT 'Body Type Name',
  `name` varchar(32) NOT NULL COMMENT 'Sub Body Type',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_fleetbodysubtypes_jm_assets_fleetbodytypes` (`bodytypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetbodytypes` */

DROP TABLE IF EXISTS `assets_fleetbodytypes`;

CREATE TABLE `assets_fleetbodytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Body Type Name',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetbrakesystems` */

DROP TABLE IF EXISTS `assets_fleetbrakesystems`;

CREATE TABLE `assets_fleetbrakesystems` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL COMMENT 'Brake Type',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetcolors` */

DROP TABLE IF EXISTS `assets_fleetcolors`;

CREATE TABLE `assets_fleetcolors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Color',
  `remarks` text COMMENT 'Comments',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetcontributions` */

DROP TABLE IF EXISTS `assets_fleetcontributions`;

CREATE TABLE `assets_fleetcontributions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fleedid` int(11) NOT NULL COMMENT 'Fleet',
  `contributiondate` date DEFAULT NULL COMMENT 'Contribution Date',
  `expectedcontribution` double DEFAULT NULL COMMENT 'Expected Contribution',
  `amountcontributed` double DEFAULT '0' COMMENT 'Amount Contributed',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `monthly_renewal` double DEFAULT '0' COMMENT 'Fleet Monthly Renewal Contributions',
  `operationamount` double DEFAULT '0' COMMENT ' Operation Amount',
  `receiptno` varchar(32) DEFAULT NULL COMMENT 'Receipt No',
  `documentno` varchar(32) DEFAULT NULL COMMENT 'Document No',
  PRIMARY KEY (`id`),
  KEY `assets_fleetcontributions_jm_assets_fleets` (`fleedid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetdrivetypes` */

DROP TABLE IF EXISTS `assets_fleetdrivetypes`;

CREATE TABLE `assets_fleetdrivetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Drive Type',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleeteenginecamtype` */

DROP TABLE IF EXISTS `assets_fleeteenginecamtype`;

CREATE TABLE `assets_fleeteenginecamtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Engine Cam Type',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetengineaspirations` */

DROP TABLE IF EXISTS `assets_fleetengineaspirations`;

CREATE TABLE `assets_fleetengineaspirations` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL COMMENT 'Engine Aspiration',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetengineblocktypes` */

DROP TABLE IF EXISTS `assets_fleetengineblocktypes`;

CREATE TABLE `assets_fleetengineblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Engine Block Type',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetfueling` */

DROP TABLE IF EXISTS `assets_fleetfueling`;

CREATE TABLE `assets_fleetfueling` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fleetid` int(11) NOT NULL COMMENT 'Fleet',
  `fuletypeid` int(11) NOT NULL COMMENT 'Fule Type',
  `quantity` double DEFAULT '0' COMMENT 'Quantity',
  `volume` double DEFAULT '0' COMMENT 'Volume',
  `priceperunit` double DEFAULT '0' COMMENT 'Price Per Unit',
  `totalcost` double DEFAULT '0' COMMENT 'Total Cost',
  `reference` varchar(32) DEFAULT NULL COMMENT 'Ref No.',
  `cost` double DEFAULT '0' COMMENT 'Fuel Cost',
  `fueledon` date DEFAULT NULL COMMENT 'Fueling Date',
  `employeeid` int(11) NOT NULL COMMENT 'Fueled By',
  `documentno` varchar(32) DEFAULT NULL COMMENT 'Fueling Document NO',
  `startodometer` int(11) DEFAULT NULL COMMENT 'Start Odometer',
  `endodometer` int(11) DEFAULT NULL COMMENT 'End Odometer',
  `destination` text COMMENT 'Destination',
  `remarks` text COMMENT 'Comments',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_fleetfueling_jm_assets_fleets` (`fleetid`),
  KEY `assets_fleetfueling_jm_assets_fleetoperators` (`employeeid`),
  KEY `assets_fleetfueling_jm_assets_fleetfueltypes` (`fuletypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetfueltypes` */

DROP TABLE IF EXISTS `assets_fleetfueltypes`;

CREATE TABLE `assets_fleetfueltypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Fuel Type',
  `fueluomid` int(11) NOT NULL COMMENT 'Fuel UOM',
  `fuelvendorid` int(11) NOT NULL COMMENT 'Fuel Vendor',
  `createdby` int(11) DEFAULT NULL,
  `remarks` text COMMENT 'Comments',
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_fleetfueltypes_jm_assets_fleetfuelunit` (`fueluomid`),
  KEY `assets_fleetfueltypes_jm_assets_fleetfuelvendors` (`fuelvendorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetfuelunits` */

DROP TABLE IF EXISTS `assets_fleetfuelunits`;

CREATE TABLE `assets_fleetfuelunits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Fleet Fuel Unit',
  `remarks` text COMMENT 'Comment',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetfuelvendors` */

DROP TABLE IF EXISTS `assets_fleetfuelvendors`;

CREATE TABLE `assets_fleetfuelvendors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Fuel Vendor Name',
  `contactperson` varchar(64) DEFAULT NULL COMMENT 'Contact Person',
  `contacttel` varchar(20) DEFAULT NULL COMMENT 'Contact Tel',
  `location` text COMMENT 'Vendor Location',
  `mobileno` varchar(20) NOT NULL COMMENT 'Mobile No.',
  `address` text COMMENT 'Address',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetinpectionstatus` */

DROP TABLE IF EXISTS `assets_fleetinpectionstatus`;

CREATE TABLE `assets_fleetinpectionstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `color` varchar(32) DEFAULT NULL COMMENT 'Status Color',
  `colorweight` int(11) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetinspectionhistory` */

DROP TABLE IF EXISTS `assets_fleetinspectionhistory`;

CREATE TABLE `assets_fleetinspectionhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Inspection Name',
  `fleetid` int(11) NOT NULL COMMENT 'Fleet',
  `submissionform` varchar(32) DEFAULT NULL COMMENT 'Inspection Submission Form',
  `typeid` int(11) NOT NULL COMMENT 'Inspect Type',
  `stageid` int(11) DEFAULT NULL COMMENT 'Inspection Stage',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_fleetinspectionhistory_jm_assets_fleets` (`fleetid`),
  KEY `assets_fleetinspectionhistory_jm_assetsfleetinspectionstages` (`stageid`),
  KEY `assets_fleetinspectionhistory_jm_assetsfleetinspectiontypes` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetinspectionstages` */

DROP TABLE IF EXISTS `assets_fleetinspectionstages`;

CREATE TABLE `assets_fleetinspectionstages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Inspection Stage',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetinspectiontypes` */

DROP TABLE IF EXISTS `assets_fleetinspectiontypes`;

CREATE TABLE `assets_fleetinspectiontypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Inspection',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetinspectons` */

DROP TABLE IF EXISTS `assets_fleetinspectons`;

CREATE TABLE `assets_fleetinspectons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fleetid` int(11) NOT NULL COMMENT 'Fleet',
  `inspectiondate` date NOT NULL COMMENT 'Inspecton Date',
  `refno` varchar(32) NOT NULL COMMENT 'Ref No.',
  `duration` tinyint(4) NOT NULL COMMENT 'Inspection Duration',
  `inspectiondocument` varchar(32) NOT NULL COMMENT 'Inspecton File',
  `expireson` date DEFAULT NULL COMMENT 'inspection Expiry',
  `expectedduration` tinyint(4) NOT NULL COMMENT 'Inspection Period (Months)',
  `insuarancerefno` varchar(32) NOT NULL COMMENT 'Ref No.',
  `insuaranceamount` double DEFAULT '0' COMMENT 'Insuarance Amount',
  `remarks` text COMMENT 'Comments',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_fleetinspectons_jm_assets_fleets` (`fleetid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetinsurances` */

DROP TABLE IF EXISTS `assets_fleetinsurances`;

CREATE TABLE `assets_fleetinsurances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fleetid` int(11) NOT NULL COMMENT 'Fleet',
  `insurercompanyid` int(11) NOT NULL COMMENT 'Insuarance Company',
  `refno` varchar(32) NOT NULL COMMENT 'Ref No.',
  `insuredon` date NOT NULL COMMENT 'Insured On',
  `duration` tinyint(4) NOT NULL COMMENT 'Insuarance Duration',
  `file` varchar(32) NOT NULL COMMENT 'Insuarance File',
  `expireson` date DEFAULT NULL COMMENT 'Insuarance Expiry',
  `permitperiod` tinyint(4) NOT NULL COMMENT 'Permit Period (Months)',
  `startfrom` date NOT NULL COMMENT 'Start From',
  `expiry` date DEFAULT NULL COMMENT 'Expiry',
  `insuarancerefno` varchar(32) NOT NULL COMMENT 'Ref No.',
  `insuaranceamount` double DEFAULT '0' COMMENT 'Insuarance Amount',
  `insuarancedocumenturl` varchar(32) DEFAULT NULL COMMENT 'Insuarance Document',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_fleetinsurances_jm_assets_fleets` (`fleetid`),
  KEY `assets_fleetinsurances_jm_assets_insuarers` (`insurercompanyid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetissues` */

DROP TABLE IF EXISTS `assets_fleetissues`;

CREATE TABLE `assets_fleetissues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fleetid` int(11) NOT NULL COMMENT 'Fleet',
  `title` text COMMENT 'Title',
  `remarks` text COMMENT 'Remarks',
  `assignedtoid` int(11) DEFAULT NULL COMMENT 'Assigned To',
  `datedue` date DEFAULT NULL COMMENT 'Date Due',
  `fleetissuestatusid` int(11) NOT NULL COMMENT 'Fleet Issue Status',
  `reportedby` int(11) NOT NULL COMMENT 'Reported By',
  `description` text COMMENT 'Descripition',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_fleetissues_jm_assets_fleetoperators` (`reportedby`),
  KEY `assets_fleetissues_jm_assets_fleets` (`fleetid`),
  KEY `assets_fleetissues_jm_asset_fleetinspectionstatus` (`fleetissuestatusid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetloanvendors` */

DROP TABLE IF EXISTS `assets_fleetloanvendors`;

CREATE TABLE `assets_fleetloanvendors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Fleet Vendor',
  `address` text COMMENT 'Address',
  `contactperson` varchar(64) DEFAULT NULL COMMENT 'Contact Person',
  `mobile` varchar(20) DEFAULT NULL COMMENT 'Mobile',
  `contacttel` varchar(32) DEFAULT NULL COMMENT 'Contact Tel',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetmaintenances` */

DROP TABLE IF EXISTS `assets_fleetmaintenances`;

CREATE TABLE `assets_fleetmaintenances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fleetid` int(11) NOT NULL COMMENT 'Fleet',
  `maintenanceon` date DEFAULT NULL COMMENT 'Maintenance Date',
  `startmileage` int(11) DEFAULT NULL COMMENT 'Start Mileage',
  `endmileage` int(11) DEFAULT NULL COMMENT 'End Mileage',
  `supplierid` int(11) NOT NULL COMMENT 'Supplier Name',
  `purchasemodeid` int(11) NOT NULL COMMENT 'Purchase Mode',
  `oiladded` double DEFAULT '0' COMMENT 'Oil Added',
  `oilcost` double DEFAULT '0' COMMENT 'Oil Cost',
  `fueladded` double DEFAULT '0' COMMENT 'Fuel Added',
  `fuelcost` double DEFAULT '0' COMMENT 'Fuel Cost',
  `remarks` text COMMENT 'Comments',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_fleetmaintenances_jm_assets_assets_fleets` (`fleetid`),
  KEY `assets_fleetmaintenances` (`supplierid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetmakes` */

DROP TABLE IF EXISTS `assets_fleetmakes`;

CREATE TABLE `assets_fleetmakes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Fleet Make',
  `remarks` text COMMENT 'Comments',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetmanufacturer` */

DROP TABLE IF EXISTS `assets_fleetmanufacturer`;

CREATE TABLE `assets_fleetmanufacturer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Manufacturer Name',
  `modelid` int(11) NOT NULL COMMENT 'Fleet Model',
  `countryid` int(11) NOT NULL COMMENT 'Country',
  `location` text COMMENT 'Manufacturer Location',
  `mobileno` varchar(20) NOT NULL COMMENT 'Mobile No.',
  `address` text COMMENT 'Address',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_fleetmanufacturer_jm_sys_countries` (`countryid`),
  KEY `assets_fleetmanufacturer_jm_asset_fleetmodels` (`modelid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetmodels` */

DROP TABLE IF EXISTS `assets_fleetmodels`;

CREATE TABLE `assets_fleetmodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Fleet Model',
  `logo` varchar(32) DEFAULT NULL COMMENT 'Model Logo',
  `fleetmakeid` int(11) NOT NULL COMMENT 'Fleet Make',
  `remarks` text COMMENT 'Comments',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_fleetmodels_jm_` (`fleetmakeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetodometertypes` */

DROP TABLE IF EXISTS `assets_fleetodometertypes`;

CREATE TABLE `assets_fleetodometertypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT ' Meter Type',
  `remarks` text COMMENT 'Comments',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetoperators` */

DROP TABLE IF EXISTS `assets_fleetoperators`;

CREATE TABLE `assets_fleetoperators` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL COMMENT 'Full Name',
  `idno` varchar(32) NOT NULL COMMENT 'ID No.',
  `krapin` varchar(32) DEFAULT NULL COMMENT 'KRA PIN',
  `mobile` varchar(32) NOT NULL COMMENT 'Mobile No.',
  `passporturl` varchar(128) DEFAULT NULL COMMENT 'Upload Passport',
  `countyid` int(11) NOT NULL COMMENT 'County',
  `town` varchar(32) DEFAULT NULL COMMENT 'Town',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `licenceno` varchar(32) NOT NULL COMMENT 'Operator License No.',
  `licenceurl` varchar(128) DEFAULT NULL COMMENT 'Upload Licence',
  `goodconductno` varchar(32) NOT NULL COMMENT 'Good Conduct No.',
  `goodconducturl` varchar(128) DEFAULT NULL COMMENT 'Upload Good Conduct',
  PRIMARY KEY (`id`),
  KEY `assets_fleetoperators_jm_sys_countys` (`countyid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetorders` */

DROP TABLE IF EXISTS `assets_fleetorders`;

CREATE TABLE `assets_fleetorders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Order',
  `fleetid` int(11) NOT NULL COMMENT 'Fleet',
  `orderstatusid` int(11) NOT NULL COMMENT 'Fleet Order Status',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_fleetorders_jm_assets_fleets` (`fleetid`),
  KEY `assets_fleetorders_jm_orders` (`orderstatusid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetorderstatus` */

DROP TABLE IF EXISTS `assets_fleetorderstatus`;

CREATE TABLE `assets_fleetorderstatus` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL COMMENT 'Fleet Order',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetowners` */

DROP TABLE IF EXISTS `assets_fleetowners`;

CREATE TABLE `assets_fleetowners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT 'Full Name',
  `idno` varchar(32) NOT NULL COMMENT 'ID No.',
  `krapin` varchar(32) DEFAULT NULL COMMENT 'KRA PIN',
  `mobile` varchar(32) NOT NULL COMMENT 'Mobile No.',
  `countyid` int(11) NOT NULL COMMENT 'County',
  `town` varchar(32) DEFAULT NULL COMMENT 'Town',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `memberno` varchar(32) NOT NULL COMMENT 'Membership NO.',
  `registrationdate` date DEFAULT NULL COMMENT 'Registration Date',
  `gender` enum('Male','Female') DEFAULT NULL COMMENT 'Gender',
  `personalemail` varchar(64) DEFAULT NULL COMMENT 'Personal Email',
  `dob` date DEFAULT NULL COMMENT 'Date Of Birth',
  `chargedregistrationfee` enum('0','1') DEFAULT '1' COMMENT 'Charge Reg Fee',
  `registrationfee` double DEFAULT '0' COMMENT 'Registration Amount',
  `passporturl` varchar(64) DEFAULT NULL COMMENT 'Upload Passport',
  `frontidimage` varchar(64) DEFAULT NULL COMMENT 'Front ID Image',
  `backidimage` varchar(64) DEFAULT NULL COMMENT 'Back ID Image',
  `kradocument` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_fleetowners_jm_sys_countys` (`countyid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleets` */

DROP TABLE IF EXISTS `assets_fleets`;

CREATE TABLE `assets_fleets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modelid` int(11) NOT NULL COMMENT 'Model',
  `manufacturerid` int(11) DEFAULT NULL COMMENT 'Fleet Manufacturer',
  `colorid` int(11) NOT NULL COMMENT 'Fleet Color',
  `fleetfueltypeid` int(11) NOT NULL COMMENT 'Fuel Type',
  `subbodytypeid` int(11) NOT NULL COMMENT 'Fleet Body Type',
  `assetid` int(11) NOT NULL COMMENT 'Asset',
  `fleetmodelid` int(11) DEFAULT NULL COMMENT 'Fleet Model',
  `width` double DEFAULT '0' COMMENT 'Fleet Width',
  `height` double DEFAULT '0' COMMENT 'Fleet Height',
  `length` double DEFAULT '0' COMMENT 'Fleet Lenght',
  `cargovolume` double DEFAULT '0' COMMENT 'Cargo Volume',
  `interiorvolume` double DEFAULT '0' COMMENT 'Interior Volume',
  `passangercapacity` tinyint(4) DEFAULT NULL COMMENT 'Passanger Capacity',
  `bedlenght` double DEFAULT '0' COMMENT 'Bend Lenght',
  `groundclearance` double DEFAULT '0' COMMENT 'Ground Clearance',
  `curbweight` double DEFAULT '0' COMMENT 'Curb Weight',
  `grossvehicleweight` double DEFAULT '0' COMMENT 'Gross Fleet Weight',
  `basetowingcapacity` double DEFAULT '0' COMMENT 'Base Towing Capacity',
  `maxpayload` double DEFAULT '0' COMMENT 'Max Payload',
  `purchasedate` date DEFAULT NULL COMMENT 'Purchase Date',
  `purchasemeter` varchar(32) DEFAULT NULL COMMENT 'Purchase Meter',
  `warrantyexpirationdate` date DEFAULT NULL COMMENT 'Warranty Expiry Date',
  `warrantyexpirationmeter` varchar(32) DEFAULT NULL COMMENT 'Warranty Expiration Meter',
  `residualvalue` varchar(32) DEFAULT NULL COMMENT 'Residual Value',
  `year` tinyint(4) DEFAULT NULL COMMENT 'Year Of Make',
  `fleettypeid` int(11) DEFAULT NULL COMMENT 'Fleet Type',
  `plateno` varchar(32) NOT NULL COMMENT 'Plate No.',
  `fleetodometertypeid` int(11) NOT NULL COMMENT 'Fleet Odometer',
  `mileage` double DEFAULT '0' COMMENT 'Mileage',
  `lastservicemileage` double DEFAULT '0' COMMENT 'Last Service Mirage',
  `driverid` int(11) NOT NULL COMMENT 'Driver/Operator',
  `departmentid` int(11) DEFAULT NULL COMMENT 'Department',
  `enginechasisno` varchar(32) NOT NULL COMMENT 'Engine Chasis No',
  `descripition` text COMMENT 'Descripition',
  `enginebrand` varchar(32) DEFAULT NULL COMMENT 'Engin Brand',
  `engineaspirationid` int(11) DEFAULT NULL COMMENT 'Engine Spiration',
  `engineblocktypeid` int(11) DEFAULT NULL COMMENT 'Engine Block Type',
  `enginebore` varchar(32) DEFAULT NULL COMMENT 'Engine Bore',
  `enginecamtypeid` int(11) DEFAULT NULL COMMENT 'Engine Camtype',
  `enginecompression` varchar(32) DEFAULT NULL COMMENT 'Engine Compression',
  `enginecylinders` tinyint(4) DEFAULT NULL COMMENT 'Engine Cylinders',
  `enginedisplacement` varchar(32) DEFAULT NULL COMMENT 'Engine Displacement',
  `redlinrpm` varchar(32) DEFAULT NULL COMMENT 'Engine Rpm',
  `enginestrock` varchar(32) DEFAULT NULL COMMENT 'Engine Strock',
  `enginevalves` tinyint(4) DEFAULT NULL COMMENT 'Engine Valves',
  `transmission` varchar(32) DEFAULT NULL COMMENT 'Engine Transmission',
  `transmissionbrand` varchar(32) DEFAULT NULL COMMENT 'Transmission Brand',
  `transmissiontypeid` int(11) DEFAULT NULL COMMENT 'Transmission Type',
  `transmissiongears` varchar(32) DEFAULT NULL COMMENT 'Transmission Gears',
  `drivetypeid` int(11) NOT NULL COMMENT 'Drive Type',
  `brakesystemid` int(11) NOT NULL COMMENT 'Brake System',
  `fronttrackwidth` double DEFAULT '0' COMMENT 'Front Track Width',
  `reartrackwidth` double DEFAULT '0' COMMENT 'Rrear Track Width',
  `wheelbase` varchar(32) DEFAULT NULL COMMENT 'Wheel Base',
  `fronttirepsi` double DEFAULT '0' COMMENT 'Front Tire Psi',
  `reartirepsi` double DEFAULT '0' COMMENT 'Rear Tire Psi',
  `rearaxletype` varchar(32) DEFAULT NULL COMMENT 'Rear Axle Type',
  `frontwheeldiameter` double DEFAULT '0' COMMENT 'Front Wheel Diameter',
  `reartiretype` varchar(32) DEFAULT NULL COMMENT 'Rear Tyre Type',
  `rearwheeldiameter` double DEFAULT '0' COMMENT 'Rear Wheel Diameter',
  `fuelcapacity` double DEFAULT '0' COMMENT 'Fuel Capacity',
  `fueltank2capacity` double DEFAULT '0' COMMENT 'Tank2 Fuel Capacity',
  `oilcapacity` double DEFAULT '0' COMMENT 'Oil Capacity',
  `loanstartedate` date DEFAULT NULL COMMENT 'Loan Start Date',
  `loanendedate` date DEFAULT NULL COMMENT 'Loan End Date',
  `loaninterestrate` double DEFAULT '0' COMMENT 'Loan Interest Rate',
  `loannotes` text COMMENT 'Loan Notes',
  `loanrepayment` double DEFAULT '0' COMMENT 'Loan Repayment Period',
  `loanvendorid` int(11) DEFAULT NULL COMMENT 'Loan Creditor',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `frontimage` varchar(128) NOT NULL COMMENT 'Fleet Front Image',
  `sideimage` varchar(128) DEFAULT NULL COMMENT 'Fleet Side Image',
  `memberid` int(11) NOT NULL DEFAULT '1' COMMENT 'Fleet Owner',
  `fleetno` varchar(32) NOT NULL COMMENT 'Fleet NO',
  PRIMARY KEY (`id`),
  KEY `assets_fleets_jm_assets_categorys` (`assetid`),
  KEY `asset_fleets_jm_brakesystem` (`brakesystemid`),
  KEY `colorid` (`colorid`),
  KEY `assets_fleets_jm_hrm_departments` (`departmentid`),
  KEY `assets_fleets_jm_fleetoperator` (`driverid`),
  KEY `asset_fleets_jm_engineaspiration` (`engineaspirationid`),
  KEY `assets_fleets_engineblocktypes` (`engineblocktypeid`),
  KEY `asset_fleet_engineacpt` (`enginecamtypeid`),
  KEY `assets_fleets_jm_fueltypes` (`fleetfueltypeid`),
  KEY `asset_fleet_jm_loanvendors` (`loanvendorid`),
  KEY `assets_fleet_manufacturers` (`manufacturerid`),
  KEY `asset_fleets_jm_asset_fleetmodels` (`modelid`),
  KEY `assets_fleets_subbodytype` (`subbodytypeid`),
  KEY `fleets_transmissiontype` (`transmissiontypeid`),
  KEY `assets_fleetdrivetype_assets_fleets` (`drivetypeid`),
  KEY `assets_fleets_jm_fleetowners` (`memberid`),
  CONSTRAINT `assets_fleets_jm_fleetowners` FOREIGN KEY (`memberid`) REFERENCES `assets_fleetowners` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetschedules` */

DROP TABLE IF EXISTS `assets_fleetschedules`;

CREATE TABLE `assets_fleetschedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fleetid` int(11) NOT NULL COMMENT 'Fleet',
  `operatorid` int(11) NOT NULL COMMENT 'Operator Name',
  `taskid` int(11) DEFAULT NULL COMMENT 'Project/Task',
  `routeid` int(11) DEFAULT NULL COMMENT 'Route',
  `source` varchar(32) NOT NULL COMMENT 'Source',
  `destination` varchar(32) NOT NULL COMMENT 'Destination',
  `departuretime` datetime DEFAULT NULL COMMENT 'Departure Time',
  `expectedarrivaltime` datetime DEFAULT NULL COMMENT 'Expected Arrival Time',
  `arrivaltime` datetime DEFAULT NULL COMMENT 'Arrival Time',
  `remarks` text COMMENT 'Comments',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_fleetschedules_jm_operators` (`operatorid`),
  KEY `fleetschedule_jm_fleet` (`fleetid`),
  KEY `assets_fleetschedules_jm_fleetroute` (`routeid`),
  KEY `schedule_jm_pmtasks` (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetservices` */

DROP TABLE IF EXISTS `assets_fleetservices`;

CREATE TABLE `assets_fleetservices` (
  `id` int(11) NOT NULL,
  `fleetid` int(11) NOT NULL COMMENT 'Fleet',
  `description` text COMMENT 'Description',
  `supplierid` int(11) DEFAULT NULL COMMENT 'Service Supplier',
  `totalcost` double DEFAULT '0' COMMENT 'Total Cost',
  `odometer` int(11) DEFAULT NULL COMMENT 'Odometer',
  `remarks` text COMMENT 'Comments',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `documentno` varchar(32) DEFAULT NULL COMMENT 'Service Document NO',
  `servicedon` date NOT NULL COMMENT 'Service Date',
  `documenturl` varchar(32) DEFAULT NULL COMMENT 'Upload Document',
  PRIMARY KEY (`id`),
  KEY `fleetservices_jmsupplers` (`supplierid`),
  KEY `fleetservices_jm_fleets` (`fleetid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetserviceschedules` */

DROP TABLE IF EXISTS `assets_fleetserviceschedules`;

CREATE TABLE `assets_fleetserviceschedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fleetid` int(11) NOT NULL COMMENT 'Fleet',
  `servicedate` date DEFAULT NULL COMMENT 'Service Date',
  `servicechecklistitem` int(11) NOT NULL COMMENT 'Service Item',
  `description` text COMMENT 'Description',
  `recommendations` text COMMENT 'Recommendations',
  `remarks` text COMMENT 'Comments',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asset_fleetschedule_jm_fleets` (`fleetid`),
  KEY `asset_fleetschedule_jm_fleetsserviceitem` (`servicechecklistitem`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetstatus` */

DROP TABLE IF EXISTS `assets_fleetstatus`;

CREATE TABLE `assets_fleetstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Status Name',
  `statuscolor` varchar(32) DEFAULT NULL COMMENT 'Fleet Color',
  `colorweight` tinyint(4) DEFAULT NULL COMMENT 'Color Weight',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleettransmissiontypes` */

DROP TABLE IF EXISTS `assets_fleettransmissiontypes`;

CREATE TABLE `assets_fleettransmissiontypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Transmission Type',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleettypes` */

DROP TABLE IF EXISTS `assets_fleettypes`;

CREATE TABLE `assets_fleettypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Fleet Type',
  `remarks` text COMMENT 'Comments',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetvendors` */

DROP TABLE IF EXISTS `assets_fleetvendors`;

CREATE TABLE `assets_fleetvendors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Fleet Vendor',
  `city` varchar(32) DEFAULT NULL COMMENT 'City',
  `town` varchar(32) DEFAULT NULL COMMENT 'Town',
  `neighbourhood` varchar(32) DEFAULT NULL COMMENT 'Neighbourhood ',
  `contactname` varchar(64) DEFAULT NULL COMMENT 'contact Name',
  `website` varchar(32) DEFAULT NULL COMMENT 'Website',
  `streetaddress` text COMMENT 'Street Address',
  `mobile` varchar(20) NOT NULL COMMENT 'Mobile No',
  `email` varchar(64) NOT NULL COMMENT 'Email Adddress',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetvendorsfleetsmodels` */

DROP TABLE IF EXISTS `assets_fleetvendorsfleetsmodels`;

CREATE TABLE `assets_fleetvendorsfleetsmodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendorid` int(11) NOT NULL COMMENT 'Fleet Vendor',
  `modelid` int(11) NOT NULL COMMENT 'Fleet Model ',
  `cost` double DEFAULT '0' COMMENT 'Fleet Cost',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_fleetvendorsfleetsmodels_jm_fleetmodels` (`modelid`),
  KEY `assets_fleetvendorsfleetsmodels_jm_assets_fleetvendors` (`vendorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_fleetworkstatus` */

DROP TABLE IF EXISTS `assets_fleetworkstatus`;

CREATE TABLE `assets_fleetworkstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Work Status',
  `remarks` text COMMENT 'Remarks',
  `color` varchar(32) DEFAULT NULL COMMENT 'Color',
  `colorweight` tinyint(4) DEFAULT NULL COMMENT 'Color Weight',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_inspectionitems` */

DROP TABLE IF EXISTS `assets_inspectionitems`;

CREATE TABLE `assets_inspectionitems` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL COMMENT 'Inspection Items',
  `categoryid` int(11) NOT NULL COMMENT 'Asset Type',
  `remarks` text COMMENT 'Comments',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_inspectionitems` (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_inspections` */

DROP TABLE IF EXISTS `assets_inspections`;

CREATE TABLE `assets_inspections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetid` int(11) NOT NULL COMMENT 'Asset',
  `inspectionitemid` int(11) NOT NULL COMMENT 'Inspection Item',
  `value` double DEFAULT '0' COMMENT 'Inpection Value',
  `remarks` text COMMENT 'Comments',
  `inspectedon` date DEFAULT NULL COMMENT 'Inspection Date',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_inspections_jm_assets` (`assetid`),
  KEY `inspecton_jm_inspectionitems` (`inspectionitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_insurances` */

DROP TABLE IF EXISTS `assets_insurances`;

CREATE TABLE `assets_insurances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetid` int(11) NOT NULL COMMENT 'Asset',
  `insurerid` int(11) NOT NULL COMMENT 'Insuarance ',
  `insurercompanyid` int(11) NOT NULL COMMENT 'Insuarance Company',
  `refno` varchar(32) NOT NULL COMMENT 'Ref No.',
  `insuredon` date NOT NULL COMMENT 'Insured On',
  `file` varchar(32) NOT NULL COMMENT 'Insuarance File',
  `expireson` date DEFAULT NULL COMMENT 'Insuarance Expiry',
  `remarks` text COMMENT 'Comments',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_insurances_jm_assets` (`assetid`),
  KEY `assets_insurances_jm_insuarer` (`insurercompanyid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_insurers` */

DROP TABLE IF EXISTS `assets_insurers`;

CREATE TABLE `assets_insurers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Insuarance Company',
  `physicaladdress` text COMMENT 'Adddress',
  `contactperson` varchar(64) DEFAULT NULL COMMENT 'Contact Person',
  `contacttel` varchar(20) DEFAULT NULL COMMENT 'Contact Tel',
  `remarks` text COMMENT 'Comments',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_permitauthoritys` */

DROP TABLE IF EXISTS `assets_permitauthoritys`;

CREATE TABLE `assets_permitauthoritys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Permit Authority',
  `physicaladdress` text COMMENT 'Adddress',
  `contactperson` varchar(64) DEFAULT NULL COMMENT 'Contact Person',
  `contacttel` varchar(20) DEFAULT NULL COMMENT 'Contact Tel',
  `remarks` text COMMENT 'Comments',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_permits` */

DROP TABLE IF EXISTS `assets_permits`;

CREATE TABLE `assets_permits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fleetid` int(11) NOT NULL COMMENT 'Fleet',
  `permitperiod` tinyint(4) NOT NULL COMMENT 'Permit Period (Months)',
  `dateapplied` date DEFAULT NULL COMMENT 'Date Applied',
  `dateissued` date DEFAULT NULL COMMENT 'Date Issued',
  `startfrom` date NOT NULL COMMENT 'Start From',
  `expiry` date DEFAULT NULL COMMENT 'Expiry',
  `permitdocumentno` varchar(32) NOT NULL COMMENT 'Ref No.',
  `permitamount` double DEFAULT '0' COMMENT 'Permit Amount',
  `permitdocumenturl` varchar(32) DEFAULT NULL COMMENT 'Permit Document',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `permitauthorityid` int(11) NOT NULL COMMENT 'Permit Authority',
  `region` text COMMENT 'Region',
  PRIMARY KEY (`id`),
  KEY `assets_permits_jm_assets_fleets` (`fleetid`),
  KEY `assets_permits_jm_permitauthority` (`permitauthorityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_services` */

DROP TABLE IF EXISTS `assets_services`;

CREATE TABLE `assets_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetid` int(11) NOT NULL COMMENT 'Asset',
  `servicescheduleid` int(11) NOT NULL COMMENT 'Service Schedule',
  `supplierid` int(11) NOT NULL COMMENT 'Service Provider',
  `documentno` varchar(32) DEFAULT NULL COMMENT 'Service Document NO',
  `servicedocumentuploadurl` varchar(32) DEFAULT NULL COMMENT 'Upload Document',
  `servicedon` date DEFAULT NULL COMMENT 'Serviced On',
  `servicetypeid` int(11) NOT NULL COMMENT 'Service Type',
  `description` text COMMENT 'Description',
  `recommendations` text COMMENT 'Recommendations',
  `remarks` text COMMENT 'Comments',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_services_jm_assets` (`assetid`),
  KEY `assets_services_jm_assetservces` (`servicetypeid`),
  KEY `assets_services_jm_serviceprovider` (`supplierid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_serviceschedules` */

DROP TABLE IF EXISTS `assets_serviceschedules`;

CREATE TABLE `assets_serviceschedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetid` int(11) NOT NULL COMMENT 'Asset',
  `servicedate` date DEFAULT NULL COMMENT 'Service Date',
  `servicetypeid` int(11) NOT NULL COMMENT 'Service Type',
  `description` text COMMENT 'Description',
  `recommendations` text COMMENT 'Recommendations',
  `remarks` text COMMENT 'Comments',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_servicesproviders` */

DROP TABLE IF EXISTS `assets_servicesproviders`;

CREATE TABLE `assets_servicesproviders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Service Provider Name',
  `contactperson` varchar(64) DEFAULT NULL COMMENT 'Contact Person',
  `contacttel` varchar(20) DEFAULT NULL COMMENT 'Contact Tel',
  `location` text COMMENT 'Vendor Location',
  `mobileno` varchar(20) NOT NULL COMMENT 'Mobile No.',
  `address` text COMMENT 'Address',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_servicetypes` */

DROP TABLE IF EXISTS `assets_servicetypes`;

CREATE TABLE `assets_servicetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Service Type',
  `duration` varchar(32) NOT NULL COMMENT 'Service Duration',
  `remarks` text COMMENT 'Comments',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `assets_status` */

DROP TABLE IF EXISTS `assets_status`;

CREATE TABLE `assets_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Status',
  `color` varchar(32) DEFAULT NULL COMMENT 'Status Color',
  `colorweight` tinyint(4) DEFAULT NULL COMMENT 'Status Weight',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `auth_branches` */

DROP TABLE IF EXISTS `auth_branches`;

CREATE TABLE `auth_branches` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(100) NOT NULL COMMENT 'Branch Name',
  `location` varchar(255) DEFAULT NULL COMMENT 'Location Description',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `bankacctypes` */

DROP TABLE IF EXISTS `bankacctypes`;

CREATE TABLE `bankacctypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL COMMENT 'Created By',
  `createdon` datetime DEFAULT NULL COMMENT 'Created On',
  `lasteditedby` int(11) DEFAULT NULL COMMENT 'Last Edited By',
  `lasteditedon` datetime DEFAULT NULL COMMENT 'Last Edited On',
  `ipaddress` varchar(32) DEFAULT NULL COMMENT 'IP Address',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `bankbranches` */

DROP TABLE IF EXISTS `bankbranches`;

CREATE TABLE `bankbranches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `banks` */

DROP TABLE IF EXISTS `banks`;

CREATE TABLE `banks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `charges` */

DROP TABLE IF EXISTS `charges`;

CREATE TABLE `charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `chargetime` enum('Disbursement','Installment','Overdue','Apprication') NOT NULL COMMENT 'Charge Time',
  `chargecalculation` enum('Flat','% of Principal','% of Reducing Balance') NOT NULL COMMENT 'Charge Calculation',
  `amount` double NOT NULL COMMENT 'Amount',
  `accountid` int(11) NOT NULL COMMENT 'GL Account',
  `status` enum('Active','Inactive') DEFAULT NULL,
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL COMMENT 'Created By',
  `createdon` datetime DEFAULT NULL COMMENT 'Created On',
  `lasteditedby` int(11) DEFAULT NULL COMMENT 'Last Edited By',
  `lasteditedon` datetime DEFAULT NULL COMMENT 'Last Edited On',
  `ipaddress` varchar(32) DEFAULT NULL COMMENT 'IP Address',
  `collectedthrough` int(11) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `collaterals` */

DROP TABLE IF EXISTS `collaterals`;

CREATE TABLE `collaterals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) NOT NULL COMMENT 'Member',
  `collateralno` varchar(32) NOT NULL COMMENT 'Collateral No',
  `description` text NOT NULL COMMENT 'Description',
  `collateralvalue` double NOT NULL COMMENT 'Collateral Value',
  `collateraltype` enum('Movable','Immovable') NOT NULL COMMENT 'Collateral Type',
  `status` enum('Active','Inactive','Suspended','Withdrawn') NOT NULL COMMENT 'Status',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL COMMENT 'Created By',
  `createdon` datetime DEFAULT NULL COMMENT 'Created On',
  `lasteditedby` int(11) DEFAULT NULL COMMENT 'Last Edited By',
  `lasteditedon` datetime DEFAULT NULL COMMENT 'Last Edited On',
  `ipaddress` varchar(32) DEFAULT NULL COMMENT 'IP Address',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `companyconfigs` */

DROP TABLE IF EXISTS `companyconfigs`;

CREATE TABLE `companyconfigs` (
  `id` int(11) NOT NULL,
  `companyname` varchar(32) NOT NULL COMMENT 'Company Name',
  `companyaddress` text COMMENT 'Address',
  `companytown` varchar(32) DEFAULT NULL COMMENT 'Town',
  `companyslogan` text COMMENT 'Slogan',
  `companytel` varchar(64) DEFAULT NULL COMMENT 'Company Tel',
  `companypinno` varchar(32) DEFAULT NULL COMMENT 'KRA Pin No',
  `companyvatno` varchar(32) DEFAULT NULL COMMENT 'Company Vat No',
  `companywebsite` varchar(64) DEFAULT NULL COMMENT 'Company Web Site',
  `companyemail` varchar(32) DEFAULT NULL COMMENT 'Company Email',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(64) DEFAULT NULL,
  `location` text,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_account_name` varchar(255) DEFAULT NULL,
  `bank_account_no` varchar(255) DEFAULT NULL,
  `bank_code` varchar(32) DEFAULT NULL,
  `till_no` varchar(32) DEFAULT NULL,
  `paybill_no` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `constituencys` */

DROP TABLE IF EXISTS `constituencys`;

CREATE TABLE `constituencys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `countyid` int(11) DEFAULT NULL COMMENT 'County',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Table structure for table `countys` */

DROP TABLE IF EXISTS `countys`;

CREATE TABLE `countys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

/*Table structure for table `currencys` */

DROP TABLE IF EXISTS `currencys`;

CREATE TABLE `currencys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL COMMENT 'Created By',
  `createdon` datetime DEFAULT NULL COMMENT 'Created On',
  `lasteditedby` int(11) DEFAULT NULL COMMENT 'Last Edited By',
  `lasteditedon` datetime DEFAULT NULL COMMENT 'Last Edited On',
  `ipaddress` varchar(32) DEFAULT NULL COMMENT 'IP Address',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `departments` */

DROP TABLE IF EXISTS `departments`;

CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `description` text,
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `department` (`department`,`code`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Table structure for table `employeesrejectedleave` */

DROP TABLE IF EXISTS `employeesrejectedleave`;

CREATE TABLE `employeesrejectedleave` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `leaveid` int(11) NOT NULL,
  `approvallevelid` int(11) NOT NULL,
  `rejectedon` date DEFAULT NULL,
  `rejectreason` text,
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `expenses` */

DROP TABLE IF EXISTS `expenses`;

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT 'Name',
  `expensetypeid` int(11) NOT NULL COMMENT 'Expense Type',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `description` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(64) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  `branch_id` int(11) unsigned DEFAULT NULL COMMENT 'Branch Name',
  PRIMARY KEY (`id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `auth_branches` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Table structure for table `exptransactions` */

DROP TABLE IF EXISTS `exptransactions`;

CREATE TABLE `exptransactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documentno` varchar(32) NOT NULL COMMENT 'Document No',
  `receiptno` varchar(32) DEFAULT NULL COMMENT 'Receipt No',
  `expenseid` int(11) DEFAULT NULL COMMENT 'Expense',
  `quantity` double NOT NULL COMMENT 'Quantity',
  `amount` double NOT NULL COMMENT 'Amount',
  `total` double DEFAULT NULL COMMENT 'Total',
  `vat_class` int(11) DEFAULT NULL,
  `vat_total` double NOT NULL,
  `expensedate` date DEFAULT NULL COMMENT 'Expense Date',
  `paymentmodeid` int(11) DEFAULT NULL COMMENT 'Payment Mode',
  `bankid` int(11) DEFAULT NULL COMMENT 'Bank',
  `authorized_by` int(11) DEFAULT NULL COMMENT 'Expenses Authorized By',
  `description` text COMMENT 'Expense Description',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(64) DEFAULT NULL,
  `branch_id` int(11) unsigned DEFAULT NULL COMMENT 'Branch Name',
  PRIMARY KEY (`id`),
  KEY `exptransactionsfkexpenses` (`expenseid`),
  KEY `exptransactionsfkpaymentmodes` (`paymentmodeid`),
  KEY `exptransactionsfkbanks` (`bankid`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `exptransactions_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `auth_branches` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

/*Table structure for table `fn_expesestypes` */

DROP TABLE IF EXISTS `fn_expesestypes`;

CREATE TABLE `fn_expesestypes` (
  `id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_enabled` enum('YES','NO') DEFAULT 'YES',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `gates` */

DROP TABLE IF EXISTS `gates`;

CREATE TABLE `gates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `routeid` int(11) NOT NULL COMMENT 'Route',
  `routedetailid` int(11) NOT NULL COMMENT 'Route Detail',
  `rule` varchar(255) NOT NULL COMMENT 'Rule',
  `results` varchar(32) NOT NULL COMMENT 'Results',
  `remarks` text,
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gatesfkroutes` (`routeid`),
  KEY `gatesfkroutedetails` (`routedetailid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `generaljournalaccounts` */

DROP TABLE IF EXISTS `generaljournalaccounts`;

CREATE TABLE `generaljournalaccounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refid` int(11) DEFAULT NULL COMMENT 'Ref',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `name` varchar(64) NOT NULL COMMENT 'Name',
  `acctypeid` int(11) DEFAULT NULL COMMENT 'Account Type',
  `categoryid` int(11) DEFAULT NULL COMMENT 'Category',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(64) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `branch_id` int(11) unsigned DEFAULT NULL COMMENT 'Bramch',
  PRIMARY KEY (`id`),
  KEY `generaljournalaccounts_jm_acctypes` (`acctypeid`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `generaljournalaccounts_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `auth_branches` (`id`),
  CONSTRAINT `generaljournalaccounts_jm_acctypes` FOREIGN KEY (`acctypeid`) REFERENCES `acctypes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1241 DEFAULT CHARSET=latin1;

/*Table structure for table `generaljournals` */

DROP TABLE IF EXISTS `generaljournals`;

CREATE TABLE `generaljournals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountid` int(11) DEFAULT NULL COMMENT 'Account',
  `daccountid` int(11) DEFAULT NULL COMMENT 'Other account',
  `documentno` int(11) NOT NULL COMMENT 'Document No',
  `transactionid` int(11) DEFAULT NULL COMMENT 'Transaction',
  `remarks` text COMMENT 'Remarks',
  `transactdate` date DEFAULT NULL COMMENT 'Transaction Date',
  `debit` double DEFAULT NULL COMMENT 'Debit',
  `credit` double DEFAULT NULL COMMENT 'Credit',
  `jvno` varchar(32) DEFAULT NULL COMMENT 'JV No',
  `transactionno` varchar(32) DEFAULT NULL COMMENT 'Transaction No',
  `memo` text,
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(64) DEFAULT NULL,
  `reconciled` enum('NO','YES') DEFAULT 'NO',
  `branch_id` int(11) unsigned DEFAULT NULL COMMENT 'Branch Name',
  PRIMARY KEY (`id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `generaljournals_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `auth_branches` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1354 DEFAULT CHARSET=latin1;

/*Table structure for table `groups` */

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `guarantors` */

DROP TABLE IF EXISTS `guarantors`;

CREATE TABLE `guarantors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(64) DEFAULT NULL,
  `idno` varchar(12) DEFAULT NULL,
  `mobileno` varchar(15) DEFAULT NULL,
  `krapin` varchar(15) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `address` text,
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `registrationdate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `hr_bankbranches` */

DROP TABLE IF EXISTS `hr_bankbranches`;

CREATE TABLE `hr_bankbranches` (
  `id` int(11) NOT NULL,
  `bankid` int(11) DEFAULT NULL,
  `branchname` varchar(32) DEFAULT NULL,
  `description` text,
  `location` text,
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkhr_bankbranchesrefhr_banks` (`bankid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `hr_banks` */

DROP TABLE IF EXISTS `hr_banks`;

CREATE TABLE `hr_banks` (
  `id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_allowances` */

DROP TABLE IF EXISTS `hrm_allowances`;

CREATE TABLE `hrm_allowances` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `percenttaxable` double DEFAULT NULL COMMENT 'Percent Taxable',
  `allowancetypeid` int(11) unsigned DEFAULT NULL COMMENT 'Allowance Type',
  `appliesto` enum('All','Individuals') DEFAULT NULL COMMENT 'Applies To',
  `noncashbenefit` enum('Yes','No') DEFAULT 'No' COMMENT 'Non-Cash Benefit',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `allowancetypeid` (`allowancetypeid`),
  CONSTRAINT `hrm_allowances_ibfk_1` FOREIGN KEY (`allowancetypeid`) REFERENCES `hrm_allowancetypes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_allowancetypes` */

DROP TABLE IF EXISTS `hrm_allowancetypes`;

CREATE TABLE `hrm_allowancetypes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT NULL COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_arrears` */

DROP TABLE IF EXISTS `hrm_arrears`;

CREATE TABLE `hrm_arrears` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `taxable` enum('Yes','No') NOT NULL COMMENT 'Taxable',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT NULL COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_assignments` */

DROP TABLE IF EXISTS `hrm_assignments`;

CREATE TABLE `hrm_assignments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `departmentid` int(11) unsigned NOT NULL COMMENT 'Department',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `departmentid` (`departmentid`),
  CONSTRAINT `hrm_assignments_ibfk_1` FOREIGN KEY (`departmentid`) REFERENCES `hrm_departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_bankbranches` */

DROP TABLE IF EXISTS `hrm_bankbranches`;

CREATE TABLE `hrm_bankbranches` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_casualsworkingdays` */

DROP TABLE IF EXISTS `hrm_casualsworkingdays`;

CREATE TABLE `hrm_casualsworkingdays` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employeeid` int(11) unsigned NOT NULL COMMENT 'Employee',
  `day` date NOT NULL COMMENT 'Date',
  `amount` double NOT NULL COMMENT 'Amount',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(64) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `employeeid` (`employeeid`),
  CONSTRAINT `hrm_casualsworkingdays_ibfk_1` FOREIGN KEY (`employeeid`) REFERENCES `hrm_employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_constituencys` */

DROP TABLE IF EXISTS `hrm_constituencys`;

CREATE TABLE `hrm_constituencys` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `countyid` int(11) DEFAULT NULL COMMENT 'County',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_countys` */

DROP TABLE IF EXISTS `hrm_countys`;

CREATE TABLE `hrm_countys` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_deductions` */

DROP TABLE IF EXISTS `hrm_deductions`;

CREATE TABLE `hrm_deductions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `deductiontypeid` int(11) unsigned NOT NULL COMMENT 'Deduction Type',
  `appliesto` enum('All','Individuals') NOT NULL COMMENT 'Applies To',
  `taxable` enum('Yes','No') NOT NULL COMMENT 'Taxable',
  `employerpays` enum('Yes','No') NOT NULL COMMENT 'Employer Contributes',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `deductiontypeid` (`deductiontypeid`),
  CONSTRAINT `hrm_deductions_ibfk_1` FOREIGN KEY (`deductiontypeid`) REFERENCES `hrm_deductiontypes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_deductiontypes` */

DROP TABLE IF EXISTS `hrm_deductiontypes`;

CREATE TABLE `hrm_deductiontypes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_departments` */

DROP TABLE IF EXISTS `hrm_departments`;

CREATE TABLE `hrm_departments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Ative',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_employeeallowances` */

DROP TABLE IF EXISTS `hrm_employeeallowances`;

CREATE TABLE `hrm_employeeallowances` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employeeid` int(11) unsigned NOT NULL COMMENT 'Employee Name',
  `allowanceid` int(11) unsigned NOT NULL COMMENT 'Allowance',
  `amount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Amount',
  `fromdate` date NOT NULL COMMENT 'From Date',
  `todate` date NOT NULL COMMENT 'To Date',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `employeeid` (`employeeid`),
  KEY `allowanceid` (`allowanceid`),
  CONSTRAINT `hrm_employeeallowances_ibfk_1` FOREIGN KEY (`employeeid`) REFERENCES `hrm_employees` (`id`),
  CONSTRAINT `hrm_employeeallowances_ibfk_2` FOREIGN KEY (`allowanceid`) REFERENCES `hrm_allowances` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_employeeapprovedleaves` */

DROP TABLE IF EXISTS `hrm_employeeapprovedleaves`;

CREATE TABLE `hrm_employeeapprovedleaves` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `leaveid` int(11) unsigned NOT NULL COMMENT 'Leave',
  `grantedon` datetime NOT NULL COMMENT 'Granted On',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `leaveid` (`leaveid`),
  CONSTRAINT `hrm_employeeapprovedleaves_ibfk_1` FOREIGN KEY (`leaveid`) REFERENCES `hrm_employeeleaveapplications` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_employeearrears` */

DROP TABLE IF EXISTS `hrm_employeearrears`;

CREATE TABLE `hrm_employeearrears` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employeeid` int(11) unsigned NOT NULL COMMENT 'Employee',
  `arrearid` int(11) unsigned NOT NULL COMMENT 'Arrear',
  `amount` double(10,2) DEFAULT '0.00' COMMENT 'Amount',
  `month` int(11) NOT NULL COMMENT 'Month',
  `Year` int(11) NOT NULL COMMENT 'Year',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `arrearid` (`arrearid`),
  KEY `employeeid` (`employeeid`),
  CONSTRAINT `hrm_employeearrears_ibfk_1` FOREIGN KEY (`arrearid`) REFERENCES `hrm_arrears` (`id`),
  CONSTRAINT `hrm_employeearrears_ibfk_2` FOREIGN KEY (`employeeid`) REFERENCES `hrm_employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_employeebanks` */

DROP TABLE IF EXISTS `hrm_employeebanks`;

CREATE TABLE `hrm_employeebanks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_employeedeductionexempt` */

DROP TABLE IF EXISTS `hrm_employeedeductionexempt`;

CREATE TABLE `hrm_employeedeductionexempt` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employeeid` int(11) unsigned NOT NULL COMMENT 'Employee',
  `deductionid` int(11) unsigned NOT NULL COMMENT 'Deduction',
  `fromdate` date NOT NULL COMMENT 'From date',
  `todate` date NOT NULL COMMENT 'To Date',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `employeeid` (`employeeid`),
  KEY `deductionid` (`deductionid`),
  CONSTRAINT `hrm_employeedeductionexempt_ibfk_1` FOREIGN KEY (`employeeid`) REFERENCES `hrm_employees` (`id`),
  CONSTRAINT `hrm_employeedeductionexempt_ibfk_2` FOREIGN KEY (`deductionid`) REFERENCES `hrm_deductions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_employeedeductions` */

DROP TABLE IF EXISTS `hrm_employeedeductions`;

CREATE TABLE `hrm_employeedeductions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employeeid` int(11) unsigned NOT NULL COMMENT 'Employee',
  `deductionid` int(11) unsigned NOT NULL COMMENT 'Deduction',
  `amount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Amount',
  `fromdate` date NOT NULL COMMENT 'From Date',
  `todate` date NOT NULL COMMENT 'To Date',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `deductionid` (`deductionid`,`employeeid`),
  KEY `employeeid` (`employeeid`),
  CONSTRAINT `hrm_employeedeductions_ibfk_1` FOREIGN KEY (`deductionid`) REFERENCES `hrm_deductions` (`id`),
  CONSTRAINT `hrm_employeedeductions_ibfk_2` FOREIGN KEY (`employeeid`) REFERENCES `hrm_employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_employeedocuments` */

DROP TABLE IF EXISTS `hrm_employeedocuments`;

CREATE TABLE `hrm_employeedocuments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employeeid` int(11) unsigned NOT NULL COMMENT 'Employee Name',
  `title` varchar(32) NOT NULL COMMENT 'Title',
  `documentname` varchar(32) NOT NULL COMMENT 'Document Name',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `employeeid` (`employeeid`),
  CONSTRAINT `hrm_employeedocuments_ibfk_1` FOREIGN KEY (`employeeid`) REFERENCES `hrm_employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_employeeleaveapplications` */

DROP TABLE IF EXISTS `hrm_employeeleaveapplications`;

CREATE TABLE `hrm_employeeleaveapplications` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employeeid` int(11) unsigned NOT NULL COMMENT 'Employee',
  `leavetypeid` int(11) unsigned NOT NULL COMMENT 'Leave Type',
  `startdate` date NOT NULL COMMENT 'Start Date',
  `enddate` date NOT NULL COMMENT 'End Date',
  `duration` double DEFAULT NULL COMMENT 'Duration',
  `appliedon` date NOT NULL COMMENT 'Applied On',
  `status` enum('pending','declined','granted') NOT NULL COMMENT 'Status',
  `remarks` text,
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `employeeleaveapplicationsfkemployees` (`employeeid`),
  KEY `employeeleaveapplicationsfkleavetypes` (`leavetypeid`),
  CONSTRAINT `hrm_employeeleaveapplications_ibfk_1` FOREIGN KEY (`employeeid`) REFERENCES `hrm_employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_employeeleaveapprovallevelusers` */

DROP TABLE IF EXISTS `hrm_employeeleaveapprovallevelusers`;

CREATE TABLE `hrm_employeeleaveapprovallevelusers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL COMMENT 'User',
  `approvallevelid` int(11) unsigned NOT NULL COMMENT 'Approval Level',
  `departmentid` int(11) DEFAULT NULL COMMENT 'Department',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_employeeleavedayscf` */

DROP TABLE IF EXISTS `hrm_employeeleavedayscf`;

CREATE TABLE `hrm_employeeleavedayscf` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employeeid` int(11) unsigned NOT NULL COMMENT 'Employee',
  `leavetypeid` int(11) unsigned NOT NULL COMMENT 'Leave Type',
  `year` double NOT NULL COMMENT 'Year',
  `noofdays` double NOT NULL COMMENT 'No Of Days',
  `remarks` text,
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `employeeleavedayscffkemployees` (`employeeid`),
  KEY `employeeleavedayscffkleavetypes` (`leavetypeid`),
  CONSTRAINT `hrm_employeeleavedayscf_ibfk_1` FOREIGN KEY (`employeeid`) REFERENCES `hrm_employees` (`id`),
  CONSTRAINT `hrm_employeeleavedayscf_ibfk_2` FOREIGN KEY (`leavetypeid`) REFERENCES `hrm_leavetypes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_employeeleaveextensions` */

DROP TABLE IF EXISTS `hrm_employeeleaveextensions`;

CREATE TABLE `hrm_employeeleaveextensions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employeeleaveapplicationid` int(11) unsigned NOT NULL COMMENT 'Employee Application',
  `days` double DEFAULT NULL COMMENT 'Days',
  `type` enum('Extension','Recalling') NOT NULL COMMENT 'Type',
  `remarks` text,
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `employeeleaveextensionsfkemployeeleaveapplications` (`employeeleaveapplicationid`),
  CONSTRAINT `hrm_employeeleaveextensions_ibfk_1` FOREIGN KEY (`employeeleaveapplicationid`) REFERENCES `hrm_employeeleaveapplications` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_employeeloans` */

DROP TABLE IF EXISTS `hrm_employeeloans`;

CREATE TABLE `hrm_employeeloans` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `loanid` int(11) unsigned NOT NULL COMMENT 'Loan',
  `employeeid` int(11) unsigned NOT NULL COMMENT 'Employee',
  `principalamount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Principal Amount',
  `method` enum('straight-line','reducing-balance') NOT NULL COMMENT 'Method',
  `initialvalue` int(11) NOT NULL COMMENT 'Initial Value',
  `amountpayable` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Monthly Installments',
  `period` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Period',
  `interestrate` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Interest Rate',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `employeeid` (`employeeid`),
  KEY `loanid` (`loanid`),
  CONSTRAINT `hrm_employeeloans_ibfk_1` FOREIGN KEY (`employeeid`) REFERENCES `hrm_employees` (`id`),
  CONSTRAINT `hrm_employeeloans_ibfk_2` FOREIGN KEY (`loanid`) REFERENCES `hrm_employeesleaveapprovalflow` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_employeeovertimes` */

DROP TABLE IF EXISTS `hrm_employeeovertimes`;

CREATE TABLE `hrm_employeeovertimes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employeeid` int(11) unsigned NOT NULL COMMENT 'Employee',
  `overtimeid` int(11) unsigned NOT NULL COMMENT 'Overtime',
  `hours` double NOT NULL COMMENT 'Overtime Hours',
  `fromdate` date NOT NULL COMMENT 'From Date',
  `todate` date NOT NULL COMMENT 'To Date',
  `month` int(11) NOT NULL COMMENT 'Month',
  `year` varchar(32) NOT NULL COMMENT 'Year',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `employeeid` (`employeeid`),
  KEY `overtimeid` (`overtimeid`),
  KEY `month` (`month`),
  CONSTRAINT `hrm_employeeovertimes_ibfk_1` FOREIGN KEY (`employeeid`) REFERENCES `hrm_employees` (`id`),
  CONSTRAINT `hrm_employeeovertimes_ibfk_2` FOREIGN KEY (`overtimeid`) REFERENCES `hrm_overtimes` (`id`),
  CONSTRAINT `hrm_employeeovertimes_ibfk_3` FOREIGN KEY (`month`) REFERENCES `sys_months` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_employeepaidallowances` */

DROP TABLE IF EXISTS `hrm_employeepaidallowances`;

CREATE TABLE `hrm_employeepaidallowances` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `allowanceid` int(11) unsigned NOT NULL COMMENT 'Allowance',
  `employeeid` int(11) unsigned NOT NULL COMMENT 'Employee',
  `amount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Amount',
  `month` int(11) NOT NULL COMMENT 'Month',
  `year` int(11) NOT NULL COMMENT 'Year',
  `paidon` date NOT NULL COMMENT 'Date',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `employeeid` (`employeeid`),
  KEY `allowanceid` (`allowanceid`),
  CONSTRAINT `hrm_employeepaidallowances_ibfk_1` FOREIGN KEY (`employeeid`) REFERENCES `hrm_employees` (`id`),
  CONSTRAINT `hrm_employeepaidallowances_ibfk_2` FOREIGN KEY (`allowanceid`) REFERENCES `hrm_allowances` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_employeepaidarrears` */

DROP TABLE IF EXISTS `hrm_employeepaidarrears`;

CREATE TABLE `hrm_employeepaidarrears` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `arrearid` int(11) unsigned NOT NULL COMMENT 'Arrear',
  `employeeid` int(11) unsigned NOT NULL COMMENT 'Employeeid',
  `amount` double(10,2) DEFAULT '0.00' COMMENT 'Amount',
  `month` int(11) DEFAULT NULL COMMENT 'Month',
  `year` int(11) DEFAULT NULL COMMENT 'Year',
  `paidon` date DEFAULT NULL COMMENT 'Paid On',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `employeeid` (`employeeid`),
  KEY `arrearid` (`arrearid`),
  CONSTRAINT `hrm_employeepaidarrears_ibfk_1` FOREIGN KEY (`employeeid`) REFERENCES `hrm_employees` (`id`),
  CONSTRAINT `hrm_employeepaidarrears_ibfk_2` FOREIGN KEY (`arrearid`) REFERENCES `hrm_arrears` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_employeepaiddeductions` */

DROP TABLE IF EXISTS `hrm_employeepaiddeductions`;

CREATE TABLE `hrm_employeepaiddeductions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employeeid` int(11) unsigned NOT NULL COMMENT 'Employeeid',
  `deductionid` int(11) unsigned DEFAULT NULL COMMENT 'Deduction',
  `loanid` int(11) unsigned DEFAULT NULL COMMENT 'Loan',
  `amount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Amount',
  `employeramount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Employer Amount',
  `month` int(11) DEFAULT NULL COMMENT 'Month',
  `year` int(11) DEFAULT NULL COMMENT 'Year',
  `paidon` date DEFAULT NULL COMMENT 'Paid On',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `interest` enum('Yes','No') DEFAULT 'No',
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `employeeid` (`employeeid`),
  KEY `loanid` (`loanid`),
  KEY `hrm_employeepaiddeductions_ibfk_3` (`deductionid`),
  CONSTRAINT `hrm_employeepaiddeductions_ibfk_1` FOREIGN KEY (`employeeid`) REFERENCES `hrm_employees` (`id`),
  CONSTRAINT `hrm_employeepaiddeductions_ibfk_2` FOREIGN KEY (`loanid`) REFERENCES `hrm_loans` (`id`),
  CONSTRAINT `hrm_employeepaiddeductions_ibfk_3` FOREIGN KEY (`deductionid`) REFERENCES `hrm_deductions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_employeepaidovertimes` */

DROP TABLE IF EXISTS `hrm_employeepaidovertimes`;

CREATE TABLE `hrm_employeepaidovertimes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `overtimeid` int(11) unsigned NOT NULL COMMENT 'Overtime',
  `employeeid` int(11) unsigned NOT NULL COMMENT 'Employee',
  `amount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Amount',
  `month` int(11) DEFAULT NULL COMMENT 'Month',
  `year` int(11) DEFAULT NULL COMMENT 'Year',
  `paidon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `overtimeid` (`overtimeid`),
  KEY `employeeid` (`employeeid`),
  CONSTRAINT `hrm_employeepaidovertimes_ibfk_1` FOREIGN KEY (`overtimeid`) REFERENCES `hrm_overtimes` (`id`),
  CONSTRAINT `hrm_employeepaidovertimes_ibfk_2` FOREIGN KEY (`employeeid`) REFERENCES `hrm_employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_employeepaidpayments` */

DROP TABLE IF EXISTS `hrm_employeepaidpayments`;

CREATE TABLE `hrm_employeepaidpayments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employeeid` int(11) unsigned NOT NULL COMMENT 'Employee',
  `assignmentid` int(11) unsigned NOT NULL COMMENT 'Assignment',
  `paymentmodeid` int(11) DEFAULT NULL COMMENT 'Payment Mode',
  `bankid` int(11) DEFAULT NULL COMMENT 'Bank',
  `employeebankid` int(11) unsigned DEFAULT NULL COMMENT 'Employee Bank',
  `bankbrancheid` int(11) unsigned DEFAULT NULL COMMENT 'Bank Branch',
  `bankacc` varchar(32) DEFAULT NULL COMMENT 'Bank Account',
  `month` int(11) DEFAULT NULL COMMENT 'Month',
  `year` int(11) DEFAULT NULL COMMENT 'Year',
  `basicsalary` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Basic Salary',
  `totalallowances` double(10,2) DEFAULT '0.00' COMMENT 'Total Allowances',
  `totaldeductions` double(10,2) DEFAULT '0.00' COMMENT 'Total Deductions',
  `netpay` double(10,2) DEFAULT '0.00' COMMENT 'Net Pay',
  `paidon` date DEFAULT NULL COMMENT 'Paid On',
  `fromdate` date DEFAULT NULL COMMENT 'From Date',
  `todate` date DEFAULT NULL COMMENT 'To Date',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `employeeid` (`employeeid`),
  KEY `assignmentid` (`assignmentid`),
  KEY `paymentmodeid` (`paymentmodeid`),
  KEY `bankid` (`bankid`),
  KEY `employeebankid` (`employeebankid`),
  KEY `bankbrancheid` (`bankbrancheid`),
  CONSTRAINT `hrm_employeepaidpayments_ibfk_1` FOREIGN KEY (`employeeid`) REFERENCES `hrm_employees` (`id`),
  CONSTRAINT `hrm_employeepaidpayments_ibfk_2` FOREIGN KEY (`assignmentid`) REFERENCES `hrm_assignments` (`id`),
  CONSTRAINT `hrm_employeepaidpayments_ibfk_3` FOREIGN KEY (`paymentmodeid`) REFERENCES `paymentmodes` (`id`),
  CONSTRAINT `hrm_employeepaidpayments_ibfk_4` FOREIGN KEY (`bankid`) REFERENCES `banks` (`id`),
  CONSTRAINT `hrm_employeepaidpayments_ibfk_5` FOREIGN KEY (`employeebankid`) REFERENCES `hrm_employeebanks` (`id`),
  CONSTRAINT `hrm_employeepaidpayments_ibfk_6` FOREIGN KEY (`bankbrancheid`) REFERENCES `hrm_bankbranches` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_employeepaidsurchages` */

DROP TABLE IF EXISTS `hrm_employeepaidsurchages`;

CREATE TABLE `hrm_employeepaidsurchages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employeeid` int(11) unsigned NOT NULL COMMENT 'Employeeid',
  `surchageid` int(11) unsigned NOT NULL COMMENT 'Surchages',
  `amount` double(10,2) DEFAULT '0.00' COMMENT 'Amount',
  `month` int(11) DEFAULT NULL COMMENT 'Month',
  `year` int(11) DEFAULT NULL COMMENT 'Year',
  `paidon` date DEFAULT NULL COMMENT 'Paid On',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `surchageid` (`surchageid`),
  KEY `employeeid` (`employeeid`),
  CONSTRAINT `hrm_employeepaidsurchages_ibfk_1` FOREIGN KEY (`surchageid`) REFERENCES `hrm_surchages` (`id`),
  CONSTRAINT `hrm_employeepaidsurchages_ibfk_2` FOREIGN KEY (`employeeid`) REFERENCES `hrm_employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_employeepayments` */

DROP TABLE IF EXISTS `hrm_employeepayments`;

CREATE TABLE `hrm_employeepayments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leave` varchar(32) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `creaedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_employees` */

DROP TABLE IF EXISTS `hrm_employees`;

CREATE TABLE `hrm_employees` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `payrollno` varchar(32) NOT NULL COMMENT 'payroll No',
  `surname` varchar(32) NOT NULL COMMENT 'Surname',
  `middlename` varchar(32) DEFAULT NULL COMMENT 'Middle Name',
  `lastname` varchar(32) NOT NULL COMMENT 'Last Name',
  `employmenttypeid` int(11) unsigned NOT NULL COMMENT 'Employment Type',
  `gender` tinyint(11) unsigned NOT NULL COMMENT 'Gender',
  `startdate` date NOT NULL COMMENT 'Start Date',
  `enddate` date DEFAULT NULL COMMENT 'End date',
  `dob` date DEFAULT NULL COMMENT 'DOB',
  `idno` varchar(32) NOT NULL COMMENT 'ID No.',
  `passportno` varchar(32) DEFAULT NULL COMMENT 'PassPort No',
  `phoneno` varchar(32) DEFAULT NULL COMMENT 'Tel No',
  `email` varchar(32) DEFAULT NULL COMMENT 'Personal Email',
  `officemail` varchar(32) DEFAULT NULL COMMENT 'Office Email',
  `physicaladdress` text COMMENT 'Address',
  `nationalityid` int(11) unsigned NOT NULL COMMENT 'Nationality',
  `countyid` int(11) unsigned DEFAULT NULL COMMENT 'County',
  `constituencyid` int(11) unsigned DEFAULT NULL COMMENT 'Constituency',
  `location` varchar(32) DEFAULT NULL COMMENT 'Location',
  `town` varchar(32) DEFAULT NULL COMMENT 'Home Town',
  `maritalstatus` tinyint(3) unsigned DEFAULT NULL COMMENT 'Marital Status',
  `nssfno` varchar(32) DEFAULT NULL COMMENT 'NSSF No',
  `nhifno` varchar(32) DEFAULT NULL COMMENT 'NHIF No',
  `krapinno` varchar(32) DEFAULT NULL COMMENT 'KRA PIN',
  `helbno` varchar(32) DEFAULT NULL COMMENT 'HELB No',
  `employeebankid` int(11) unsigned DEFAULT NULL COMMENT 'Bank',
  `bankbrancheid` int(11) unsigned DEFAULT NULL COMMENT 'Branch',
  `bankaccountno` varchar(32) DEFAULT NULL COMMENT 'Account No',
  `basicsalary` double DEFAULT '0' COMMENT 'Basic Salary',
  `assignmentid` int(11) unsigned NOT NULL COMMENT 'Assignment',
  `statusid` int(11) unsigned NOT NULL COMMENT 'Status',
  `passportphoto` varchar(32) DEFAULT NULL COMMENT 'PassPort Photo',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `residency` enum('Resident','Non-Resident') DEFAULT 'Resident',
  `employment` enum('Primary Employment','Secondary Employment') DEFAULT 'Primary Employment',
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `employmenttypeid` (`employmenttypeid`),
  KEY `countyid` (`countyid`),
  KEY `bankbrancheid` (`bankbrancheid`),
  KEY `assignmentid` (`assignmentid`),
  KEY `employeebankid` (`employeebankid`),
  KEY `statusid` (`statusid`),
  KEY `nationalityid` (`nationalityid`),
  KEY `gender` (`gender`),
  KEY `constituencyid` (`constituencyid`),
  KEY `maritalstatus` (`maritalstatus`),
  CONSTRAINT `hrm_employees_ibfk_1` FOREIGN KEY (`employmenttypeid`) REFERENCES `hrm_employmenttypes` (`id`),
  CONSTRAINT `hrm_employees_ibfk_10` FOREIGN KEY (`constituencyid`) REFERENCES `hrm_constituencys` (`id`),
  CONSTRAINT `hrm_employees_ibfk_11` FOREIGN KEY (`maritalstatus`) REFERENCES `hrm_maritalstatus` (`id`),
  CONSTRAINT `hrm_employees_ibfk_3` FOREIGN KEY (`countyid`) REFERENCES `hrm_countys` (`id`),
  CONSTRAINT `hrm_employees_ibfk_4` FOREIGN KEY (`bankbrancheid`) REFERENCES `hrm_bankbranches` (`id`),
  CONSTRAINT `hrm_employees_ibfk_5` FOREIGN KEY (`assignmentid`) REFERENCES `hrm_assignments` (`id`),
  CONSTRAINT `hrm_employees_ibfk_6` FOREIGN KEY (`employeebankid`) REFERENCES `hrm_employeebanks` (`id`),
  CONSTRAINT `hrm_employees_ibfk_7` FOREIGN KEY (`statusid`) REFERENCES `hrm_status` (`id`),
  CONSTRAINT `hrm_employees_ibfk_8` FOREIGN KEY (`nationalityid`) REFERENCES `hrm_nationalitys` (`id`),
  CONSTRAINT `hrm_employees_ibfk_9` FOREIGN KEY (`gender`) REFERENCES `sys_gender` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_employeesleaveapprovalflow` */

DROP TABLE IF EXISTS `hrm_employeesleaveapprovalflow`;

CREATE TABLE `hrm_employeesleaveapprovalflow` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `comesbefore` int(11) unsigned NOT NULL COMMENT 'Comes Before',
  `approvallevelid` int(11) unsigned NOT NULL COMMENT ' Level',
  `followsid` int(11) unsigned NOT NULL COMMENT 'Follows Level',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('1','0') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `FK_employeesleaveapprovalflow` (`approvallevelid`),
  KEY `FKs_employeesleaveapprovalflow` (`followsid`),
  KEY `comesbefore` (`comesbefore`),
  CONSTRAINT `hrm_employeesleaveapprovalflow_ibfk_1` FOREIGN KEY (`approvallevelid`) REFERENCES `hrm_employeesleaveapprovallevels` (`id`),
  CONSTRAINT `hrm_employeesleaveapprovalflow_ibfk_2` FOREIGN KEY (`followsid`) REFERENCES `hrm_employeesleaveapprovallevels` (`id`),
  CONSTRAINT `hrm_employeesleaveapprovalflow_ibfk_3` FOREIGN KEY (`comesbefore`) REFERENCES `hrm_employeesleaveapprovallevels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_employeesleaveapprovallevels` */

DROP TABLE IF EXISTS `hrm_employeesleaveapprovallevels`;

CREATE TABLE `hrm_employeesleaveapprovallevels` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userlevelid` int(11) NOT NULL COMMENT 'User Level',
  `name` varchar(32) NOT NULL COMMENT ' Level',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `userlevelid` (`userlevelid`),
  CONSTRAINT `hrm_employeesleaveapprovallevels_ibfk_1` FOREIGN KEY (`userlevelid`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_employeesleaveapprovals` */

DROP TABLE IF EXISTS `hrm_employeesleaveapprovals`;

CREATE TABLE `hrm_employeesleaveapprovals` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employeeleaveid` int(11) unsigned NOT NULL COMMENT ' Level',
  `approvallevelid` int(11) unsigned NOT NULL,
  `approvaldate` date NOT NULL COMMENT 'Approval Date',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `employeeleaveid` (`employeeleaveid`),
  KEY `approvallevelid` (`approvallevelid`),
  CONSTRAINT `hrm_employeesleaveapprovals_ibfk_1` FOREIGN KEY (`employeeleaveid`) REFERENCES `hrm_employeeleaveapplications` (`id`),
  CONSTRAINT `hrm_employeesleaveapprovals_ibfk_2` FOREIGN KEY (`approvallevelid`) REFERENCES `hrm_employeesleaveapprovallevels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_employeespaidsurchages` */

DROP TABLE IF EXISTS `hrm_employeespaidsurchages`;

CREATE TABLE `hrm_employeespaidsurchages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `surchageid` int(11) unsigned NOT NULL COMMENT 'Surchages',
  `employeeid` int(11) unsigned NOT NULL COMMENT 'Employeeid',
  `amount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Amount',
  `month` int(11) DEFAULT NULL COMMENT 'Month',
  `year` int(11) DEFAULT NULL COMMENT 'Year',
  `paidon` date DEFAULT NULL COMMENT 'Paid On',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `employeeid` (`employeeid`),
  KEY `hrm_employeespaidsurchages_ibfk_2` (`surchageid`),
  CONSTRAINT `hrm_employeespaidsurchages_ibfk_1` FOREIGN KEY (`employeeid`) REFERENCES `hrm_employees` (`id`),
  CONSTRAINT `hrm_employeespaidsurchages_ibfk_2` FOREIGN KEY (`surchageid`) REFERENCES `hrm_employeesurchages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_employeesrejectedleave` */

DROP TABLE IF EXISTS `hrm_employeesrejectedleave`;

CREATE TABLE `hrm_employeesrejectedleave` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `leaveid` int(11) unsigned NOT NULL COMMENT 'Employee Leave',
  `approvallevelid` int(11) unsigned NOT NULL COMMENT 'Approval Level',
  `rejectedon` date DEFAULT NULL COMMENT 'Date Rejected',
  `rejectreason` text COMMENT 'Reject Reason',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `leaveid` (`leaveid`),
  KEY `approvallevelid` (`approvallevelid`),
  CONSTRAINT `hrm_employeesrejectedleave_ibfk_1` FOREIGN KEY (`leaveid`) REFERENCES `hrm_employeeleaveapplications` (`id`),
  CONSTRAINT `hrm_employeesrejectedleave_ibfk_2` FOREIGN KEY (`approvallevelid`) REFERENCES `hrm_employeesleaveapprovallevels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_employeestatuss` */

DROP TABLE IF EXISTS `hrm_employeestatuss`;

CREATE TABLE `hrm_employeestatuss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leave` varchar(32) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `creaedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_employeesurchages` */

DROP TABLE IF EXISTS `hrm_employeesurchages`;

CREATE TABLE `hrm_employeesurchages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employeeid` int(11) unsigned NOT NULL COMMENT 'Employee',
  `surchageid` int(11) unsigned NOT NULL COMMENT 'Surchages',
  `amount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Amount',
  `fromdate` date NOT NULL COMMENT 'From Date',
  `todate` date NOT NULL COMMENT 'To Date',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `surchageid` (`surchageid`),
  KEY `employeeid` (`employeeid`),
  CONSTRAINT `hrm_employeesurchages_ibfk_1` FOREIGN KEY (`surchageid`) REFERENCES `hrm_surchages` (`id`),
  CONSTRAINT `hrm_employeesurchages_ibfk_2` FOREIGN KEY (`employeeid`) REFERENCES `hrm_employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_employeesurchages_audit` */

DROP TABLE IF EXISTS `hrm_employeesurchages_audit`;

CREATE TABLE `hrm_employeesurchages_audit` (
  `id` int(11) NOT NULL,
  `action` varchar(32) DEFAULT NULL,
  `actionby` int(11) DEFAULT NULL,
  `rowid` int(11) DEFAULT NULL,
  `surchageid` text COMMENT 'Surchages',
  `amount` text COMMENT 'Amount',
  `fromdate` text COMMENT 'From Date',
  `todate` text COMMENT 'To Date',
  `employeeid` text COMMENT 'Employee',
  `remarks` text COMMENT 'Remarks',
  `actiondate` datetime DEFAULT NULL COMMENT 'Action Date',
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_employmenttypes` */

DROP TABLE IF EXISTS `hrm_employmenttypes`;

CREATE TABLE `hrm_employmenttypes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_grades` */

DROP TABLE IF EXISTS `hrm_grades`;

CREATE TABLE `hrm_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leave` varchar(32) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `creaedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_holidays` */

DROP TABLE IF EXISTS `hrm_holidays`;

CREATE TABLE `hrm_holidays` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT 'Name',
  `ondate` date NOT NULL COMMENT 'Date',
  `recurse` enum('Yes','No') NOT NULL COMMENT 'Recurse',
  `remarks` text,
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_leaves` */

DROP TABLE IF EXISTS `hrm_leaves`;

CREATE TABLE `hrm_leaves` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leave` varchar(32) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `creaedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_leavetypes` */

DROP TABLE IF EXISTS `hrm_leavetypes`;

CREATE TABLE `hrm_leavetypes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT 'Name',
  `noofdays` double NOT NULL COMMENT 'No Of Days',
  `daytype` enum('Working Days','Calendar Days') NOT NULL COMMENT 'Type Of Days',
  `maxcf` double NOT NULL COMMENT 'Max Carry Foward Days',
  `earningrate` double NOT NULL COMMENT 'Earning Rate',
  `earningperiod` enum('Week','Month','Year') NOT NULL COMMENT 'Earning Period',
  `gender` enum('Male','Female','Both') NOT NULL COMMENT 'Gender',
  `remarks` text,
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_loans` */

DROP TABLE IF EXISTS `hrm_loans`;

CREATE TABLE `hrm_loans` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `method` enum('straight-line','reducing-balance') NOT NULL COMMENT 'Method',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_maritalstatus` */

DROP TABLE IF EXISTS `hrm_maritalstatus`;

CREATE TABLE `hrm_maritalstatus` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT 'Marital Status',
  `remarks` varchar(250) DEFAULT NULL COMMENT 'Remarks',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_nationalitys` */

DROP TABLE IF EXISTS `hrm_nationalitys`;

CREATE TABLE `hrm_nationalitys` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_nhifs` */

DROP TABLE IF EXISTS `hrm_nhifs`;

CREATE TABLE `hrm_nhifs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lowerboundary` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Lower Boundary',
  `upperboundary` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Upper Boundary',
  `amount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Amount',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_nssfs` */

DROP TABLE IF EXISTS `hrm_nssfs`;

CREATE TABLE `hrm_nssfs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lowerboundary` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Lower Boundary',
  `upperboundary` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Upper Boundary',
  `amount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Amount',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_overtimes` */

DROP TABLE IF EXISTS `hrm_overtimes`;

CREATE TABLE `hrm_overtimes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `rate` double NOT NULL COMMENT 'Rate',
  `hours` double NOT NULL COMMENT 'Max Week Working Hours',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_payes` */

DROP TABLE IF EXISTS `hrm_payes`;

CREATE TABLE `hrm_payes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lowerboundary` double NOT NULL COMMENT 'Lower Boundary',
  `upperboundary` double DEFAULT NULL COMMENT 'Upper Boundary',
  `percentage` double NOT NULL COMMENT 'Percentage',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_reliefs` */

DROP TABLE IF EXISTS `hrm_reliefs`;

CREATE TABLE `hrm_reliefs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `amount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Amount',
  `appliesto` enum('All','Individuals') NOT NULL COMMENT 'Applies To',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'IS Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_status` */

DROP TABLE IF EXISTS `hrm_status`;

CREATE TABLE `hrm_status` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_surchages` */

DROP TABLE IF EXISTS `hrm_surchages`;

CREATE TABLE `hrm_surchages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `taxable` enum('Yes','No') NOT NULL COMMENT 'Taxable',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_surchagetypes` */

DROP TABLE IF EXISTS `hrm_surchagetypes`;

CREATE TABLE `hrm_surchagetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leave` varchar(32) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `creaedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `hrm_workingdays` */

DROP TABLE IF EXISTS `hrm_workingdays`;

CREATE TABLE `hrm_workingdays` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT 'Name',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `incomes` */

DROP TABLE IF EXISTS `incomes`;

CREATE TABLE `incomes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT 'Name',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(64) DEFAULT NULL,
  `branch_id` int(11) unsigned DEFAULT NULL COMMENT 'Branch Name',
  PRIMARY KEY (`id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `incomes_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `auth_branches` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Table structure for table `inctransactions` */

DROP TABLE IF EXISTS `inctransactions`;

CREATE TABLE `inctransactions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `paymenttermid` int(11) NOT NULL,
  `memberid` int(11) unsigned NOT NULL,
  `studentclasspromotiontermid` int(11) unsigned DEFAULT NULL COMMENT 'Class Term',
  `documentno` varchar(32) NOT NULL COMMENT 'Document No',
  `paymentmodeid` int(11) DEFAULT NULL COMMENT 'Payment Mode',
  `bankid` int(11) DEFAULT NULL COMMENT 'Bank',
  `transactionno` varchar(32) DEFAULT NULL COMMENT 'Transaction No',
  `quantity` double NOT NULL COMMENT 'Quantity',
  `amount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Amount',
  `total` double(10,2) DEFAULT '0.00' COMMENT 'Total',
  `incomedate` date NOT NULL COMMENT 'Income Date',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(64) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `branch_id` int(11) unsigned DEFAULT NULL COMMENT 'Branch Name',
  PRIMARY KEY (`id`),
  KEY `inctransactionsfkpaymentmodes` (`paymentmodeid`),
  KEY `inctransactionsfkbanks` (`bankid`),
  KEY `paymenttermid` (`paymenttermid`),
  KEY `memberid` (`memberid`),
  KEY `studentclasspromotiontermid` (`studentclasspromotiontermid`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `inctransactions_ibfk_1` FOREIGN KEY (`paymenttermid`) REFERENCES `paymentterms` (`id`),
  CONSTRAINT `inctransactions_ibfk_2` FOREIGN KEY (`memberid`) REFERENCES `sch_students` (`id`),
  CONSTRAINT `inctransactions_ibfk_3` FOREIGN KEY (`paymentmodeid`) REFERENCES `paymentmodes` (`id`),
  CONSTRAINT `inctransactions_ibfk_4` FOREIGN KEY (`studentclasspromotiontermid`) REFERENCES `sch_studentclassterms` (`id`),
  CONSTRAINT `inctransactions_ibfk_5` FOREIGN KEY (`branch_id`) REFERENCES `auth_branches` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=latin1;

/*Table structure for table `items` */

DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `itemcode` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `description` tinytext COMMENT 'Description',
  `itemname` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `departmentid` int(11) DEFAULT NULL,
  `manufacturer` varchar(108) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `strength` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `costprice` double NOT NULL DEFAULT '0',
  `discount` double DEFAULT '0',
  `tradeprice` double DEFAULT '0',
  `retailprice` double NOT NULL DEFAULT '0',
  `applicabletax` varchar(10) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT '0',
  `reorderlevel` double NOT NULL DEFAULT '0',
  `maxreorderlevel` double DEFAULT NULL,
  `quantity` double NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT '1',
  `expirydate` datetime NOT NULL,
  `createdby` int(11) NOT NULL DEFAULT '0',
  `createdon` datetime NOT NULL,
  `lasteditedby` int(11) NOT NULL,
  `lasteditedon` datetime NOT NULL,
  `istaxable` enum('yes','no') DEFAULT NULL,
  `is_discountenabled` enum('yes','no') DEFAULT 'no',
  `is_discountfixedamount` enum('yes','no') DEFAULT 'no',
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `itemcode` (`itemcode`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=latin1;

/*Table structure for table `levels` */

DROP TABLE IF EXISTS `levels`;

CREATE TABLE `levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT 'Name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `ln_loanrepaymentreversals` */

DROP TABLE IF EXISTS `ln_loanrepaymentreversals`;

CREATE TABLE `ln_loanrepaymentreversals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loanid` int(11) DEFAULT NULL,
  `interest` double DEFAULT '0',
  `principal` double DEFAULT '0',
  `savings` double DEFAULT '0',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `loanapplications` */

DROP TABLE IF EXISTS `loanapplications`;

CREATE TABLE `loanapplications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) NOT NULL COMMENT 'Member',
  `guarantor1` int(11) NOT NULL,
  `guarantor2` int(11) NOT NULL,
  `loandocument` text NOT NULL,
  `loanrefno` varchar(32) NOT NULL COMMENT 'Loan Ref No',
  `saccoloanid` int(11) NOT NULL COMMENT 'Loan',
  `purpose` varchar(32) NOT NULL COMMENT 'Purpose',
  `amount` double NOT NULL COMMENT 'Loan Amount',
  `principalamount` double NOT NULL COMMENT 'Principal Amount',
  `installlments` double NOT NULL COMMENT 'Installment Amount',
  `duration` int(11) NOT NULL COMMENT 'No Of Repayments',
  `appliedon` date NOT NULL COMMENT 'Application Date',
  `firstrepaymentdate` date DEFAULT NULL,
  `status` enum('Pending','Approved','Declined','Management_Approved','Credit_Approved','Disbursed','Completed') DEFAULT 'Pending',
  `applicationdocument` varchar(64) DEFAULT NULL COMMENT 'Application Document',
  `nextrepaymentmonth` int(11) DEFAULT NULL,
  `nextrepaymentyear` int(11) DEFAULT NULL,
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL COMMENT 'Created By',
  `createdon` datetime DEFAULT NULL COMMENT 'Created On',
  `lasteditedby` int(11) DEFAULT NULL COMMENT 'Last Edited By',
  `lasteditedon` datetime DEFAULT NULL COMMENT 'Last Edited On',
  `ipaddress` varchar(32) DEFAULT NULL COMMENT 'IP Address',
  `repaymentperiodid` int(11) DEFAULT NULL,
  `approvedamount` double DEFAULT '0',
  `loansecurity` double DEFAULT '0',
  `disbursedamount` double DEFAULT '0',
  `totalamountloandue` double DEFAULT '0',
  `subproductid` int(11) DEFAULT NULL,
  `is_enabled` enum('Yes','No') DEFAULT 'Yes',
  `penaltyamount` double DEFAULT '0',
  `otherguarantor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loanapplications_jm_repaymentperiods` (`repaymentperiodid`),
  KEY `loanapplication_jm_members` (`memberid`),
  CONSTRAINT `loanapplication_jm_members` FOREIGN KEY (`memberid`) REFERENCES `members` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `loanapplications_jm_repaymentperiods` FOREIGN KEY (`repaymentperiodid`) REFERENCES `repaymentperiods` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `loanapprovals` */

DROP TABLE IF EXISTS `loanapprovals`;

CREATE TABLE `loanapprovals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `approvedamount` double DEFAULT '0',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  `loanid` int(11) DEFAULT NULL,
  `approvedon` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loanapprovals_jm_users` (`userid`),
  KEY `loanapprovals_jm_loanapplications` (`loanid`),
  KEY `loanapprovals_jm_members` (`memberid`),
  CONSTRAINT `loanapprovals_jm_loanapplications` FOREIGN KEY (`loanid`) REFERENCES `loanapplications` (`id`),
  CONSTRAINT `loanapprovals_jm_members` FOREIGN KEY (`memberid`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `loandisbursements` */

DROP TABLE IF EXISTS `loandisbursements`;

CREATE TABLE `loandisbursements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documentno` int(11) DEFAULT NULL,
  `loanapplicationid` int(11) NOT NULL COMMENT 'Loan Application Ref No',
  `disbursedon` date NOT NULL COMMENT 'Disbursed On',
  `amount` double NOT NULL COMMENT 'Amount',
  `currencyid` int(11) NOT NULL COMMENT 'Currency',
  `paymentmodeid` int(11) NOT NULL COMMENT 'Paymentmode',
  `transactioncode` varchar(32) DEFAULT NULL COMMENT 'transactioncode',
  `bankid` int(11) DEFAULT NULL COMMENT 'Banks',
  `deductdisbursementcharges` enum('Yes','No') DEFAULT NULL COMMENT 'Deduct Disbursement Charges from Amount',
  `chequeno` varchar(32) DEFAULT NULL COMMENT 'Cheque No',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL COMMENT 'Created By',
  `createdon` datetime DEFAULT NULL COMMENT 'Created On',
  `lasteditedby` int(11) DEFAULT NULL COMMENT 'Last Edited By',
  `lasteditedon` datetime DEFAULT NULL COMMENT 'Last Edited On',
  `ipaddress` varchar(32) DEFAULT NULL COMMENT 'IP Address',
  `firstrepaymentdate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loandisbursementsfkloanapplications` (`loanapplicationid`),
  KEY `loandisbursementsfkcurrencys` (`currencyid`),
  KEY `loandisbursementsfkpaymentmodes` (`paymentmodeid`),
  KEY `loandisbursementsfkbanks` (`bankid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `loanguarantors` */

DROP TABLE IF EXISTS `loanguarantors`;

CREATE TABLE `loanguarantors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loanapplicationid` int(11) NOT NULL COMMENT 'Loan Application Ref No',
  `memberid` int(11) DEFAULT NULL COMMENT 'Guarantor',
  `collateraltype` enum('Shares','Savings','Collateral') NOT NULL COMMENT 'Collateral Type',
  `collateralid` int(11) DEFAULT NULL COMMENT 'Collateral',
  `collateralamount` double NOT NULL COMMENT 'Collateral Amount',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL COMMENT 'Created By',
  `createdon` datetime DEFAULT NULL COMMENT 'Created On',
  `lasteditedby` int(11) DEFAULT NULL COMMENT 'Last Edited By',
  `lasteditedon` datetime DEFAULT NULL COMMENT 'Last Edited On',
  `ipaddress` varchar(32) DEFAULT NULL COMMENT 'IP Address',
  `otherguarantors` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loanguarantorsfkloanapplications` (`loanapplicationid`),
  KEY `loanguarantorsfkmembers` (`memberid`),
  KEY `loanguarantorsfkcollaterals` (`collateralid`),
  KEY `loanguarantors_jm_guarantors` (`otherguarantors`),
  CONSTRAINT `loanguarantors_jm_guarantors` FOREIGN KEY (`otherguarantors`) REFERENCES `guarantors` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `loanrepayments` */

DROP TABLE IF EXISTS `loanrepayments`;

CREATE TABLE `loanrepayments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loanapplicationid` int(11) NOT NULL COMMENT 'Loan Application Ref No',
  `documentno` varchar(32) NOT NULL COMMENT 'Documentno',
  `month` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `paymentmodeid` int(11) NOT NULL COMMENT 'Payment Mode',
  `bankid` int(11) DEFAULT NULL COMMENT 'Bank',
  `transactioncode` varchar(32) DEFAULT NULL COMMENT 'Transaction Code',
  `currencyid` int(11) NOT NULL COMMENT 'Currency',
  `paidon` date NOT NULL COMMENT 'Paid On',
  `paidby` varchar(64) DEFAULT NULL COMMENT 'Paid By',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL COMMENT 'Created By',
  `createdon` datetime DEFAULT NULL COMMENT 'Created On',
  `lasteditedby` int(11) DEFAULT NULL COMMENT 'Last Edited By',
  `lasteditedon` datetime DEFAULT NULL COMMENT 'Last Edited On',
  `ipaddress` varchar(32) DEFAULT NULL COMMENT 'IP Address',
  `nextrepaymentdate` date DEFAULT NULL,
  `interestpaid` double DEFAULT '0',
  `principalpaid` double DEFAULT '0',
  `loanbalance` double DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `loanrepaymentsfkloanapplications` (`loanapplicationid`),
  KEY `loanrepaymentsfkpaymentmodes` (`paymentmodeid`),
  KEY `loanrepaymentsfkbanks` (`bankid`),
  KEY `loanrepaymentsfkcurrencys` (`currencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `loanrepaymentschedule` */

DROP TABLE IF EXISTS `loanrepaymentschedule`;

CREATE TABLE `loanrepaymentschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loanid` int(11) DEFAULT NULL,
  `paymentdate` date DEFAULT NULL,
  `paidon` date DEFAULT NULL,
  `principaldue` double DEFAULT '0',
  `principalpaid` double DEFAULT '0',
  `loanbalance` double DEFAULT '0',
  `interest` double DEFAULT '0',
  `interestpaid` double DEFAULT '0',
  `fee` double DEFAULT '0',
  `amountdue` double DEFAULT '0',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `paystatus` enum('0','1') DEFAULT '0',
  `paymentdocumentno` varchar(32) DEFAULT NULL,
  `savings` double DEFAULT '0',
  `amountpaid` double DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `loanrepaymentschedulerefloanapplications` (`loanid`),
  CONSTRAINT `loanrepaymentschedule_jm_loanapplications` FOREIGN KEY (`loanid`) REFERENCES `loanapplications` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `loantypes` */

DROP TABLE IF EXISTS `loantypes`;

CREATE TABLE `loantypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL COMMENT 'Created By',
  `createdon` datetime DEFAULT NULL COMMENT 'Created On',
  `lasteditedby` int(11) DEFAULT NULL COMMENT 'Last Edited By',
  `lasteditedon` datetime DEFAULT NULL COMMENT 'Last Edited On',
  `ipaddress` varchar(32) DEFAULT NULL COMMENT 'IP Address',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `member_zones` */

DROP TABLE IF EXISTS `member_zones`;

CREATE TABLE `member_zones` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `memberbankdetails` */

DROP TABLE IF EXISTS `memberbankdetails`;

CREATE TABLE `memberbankdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) NOT NULL COMMENT 'Member',
  `memberbankid` int(11) NOT NULL COMMENT 'Bank',
  `bankbranchid` int(11) NOT NULL COMMENT 'Bank Branch',
  `bankacctypeid` int(11) NOT NULL COMMENT 'Bank Account Type',
  `accountno` varchar(32) NOT NULL COMMENT 'Account No',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL COMMENT 'Created By',
  `createdon` datetime DEFAULT NULL COMMENT 'Created On',
  `lasteditedby` int(11) DEFAULT NULL COMMENT 'Last Edited By',
  `lasteditedon` datetime DEFAULT NULL COMMENT 'Last Edited On',
  `ipaddress` varchar(32) DEFAULT NULL COMMENT 'IP Address',
  PRIMARY KEY (`id`),
  KEY `memberbankdetailsfkmembers` (`memberid`),
  KEY `memberbankdetailsfkmemberbanks` (`memberbankid`),
  KEY `memberbankdetailsfkbankbranches` (`bankbranchid`),
  KEY `memberbankdetailsfkbankacctypes` (`bankacctypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `memberbanks` */

DROP TABLE IF EXISTS `memberbanks`;

CREATE TABLE `memberbanks` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL COMMENT 'Created By',
  `createdon` datetime DEFAULT NULL COMMENT 'Created On',
  `lasteditedby` int(11) DEFAULT NULL COMMENT 'Last Edited By',
  `lasteditedon` datetime DEFAULT NULL COMMENT 'Last Edited On',
  `ipaddress` varchar(32) DEFAULT NULL COMMENT 'IP Address',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `memberpayables` */

DROP TABLE IF EXISTS `memberpayables`;

CREATE TABLE `memberpayables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paymenttermid` int(11) NOT NULL COMMENT 'Payment Term',
  `memberid` int(11) unsigned NOT NULL COMMENT 'Member',
  `studentclasspromotiontermid` int(11) unsigned DEFAULT NULL COMMENT 'Student Class Promotion',
  `documentno` varchar(32) NOT NULL COMMENT 'Document No',
  `invoicedon` date NOT NULL COMMENT 'Invoiced On',
  `amount` double NOT NULL COMMENT 'Amount',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL COMMENT 'Created By',
  `createdon` datetime DEFAULT NULL COMMENT 'Created On',
  `lasteditedby` int(11) DEFAULT NULL COMMENT 'Last Edited By',
  `lasteditedon` datetime DEFAULT NULL COMMENT 'Last Edited On',
  `ipaddress` varchar(32) DEFAULT NULL COMMENT 'IP Address',
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `memberpayablesfkpaymentterms` (`paymenttermid`),
  KEY `memberpayablesfkmembers` (`memberid`),
  KEY `studentclasspromotionid` (`studentclasspromotiontermid`),
  CONSTRAINT `memberpayables_ibfk_1` FOREIGN KEY (`paymenttermid`) REFERENCES `paymentterms` (`id`),
  CONSTRAINT `memberpayables_ibfk_2` FOREIGN KEY (`studentclasspromotiontermid`) REFERENCES `sch_studentclassterms` (`id`),
  CONSTRAINT `memberpayablesfkmembers` FOREIGN KEY (`memberid`) REFERENCES `sch_students` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=543 DEFAULT CHARSET=latin1;

/*Table structure for table `memberpayables_audit` */

DROP TABLE IF EXISTS `memberpayables_audit`;

CREATE TABLE `memberpayables_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pk` int(11) NOT NULL COMMENT 'pk',
  `paymenttermid` int(11) NOT NULL COMMENT 'Payment Term',
  `memberid` int(11) unsigned NOT NULL COMMENT 'Member',
  `studentclasspromotiontermid` int(11) unsigned DEFAULT NULL COMMENT 'Student Class Promotion',
  `documentno` varchar(32) NOT NULL COMMENT 'Document No',
  `invoicedon` date NOT NULL COMMENT 'Invoiced On',
  `amount` double NOT NULL COMMENT 'Amount',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL COMMENT 'Created By',
  `createdon` datetime DEFAULT NULL COMMENT 'Created On',
  `lasteditedby` int(11) DEFAULT NULL COMMENT 'Last Edited By',
  `lasteditedon` datetime DEFAULT NULL COMMENT 'Last Edited On',
  `ipaddress` varchar(32) DEFAULT NULL COMMENT 'IP Address',
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  `action` tinyint(2) DEFAULT NULL COMMENT 'Action',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Table structure for table `members` */

DROP TABLE IF EXISTS `members`;

CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberno` varchar(32) NOT NULL COMMENT 'Member No',
  `zoneid` int(11) NOT NULL,
  `refer_memberno` varchar(200) DEFAULT NULL,
  `firstname` varchar(64) DEFAULT NULL COMMENT 'First Name',
  `middlename` varchar(64) DEFAULT NULL COMMENT 'Middle Name',
  `lastname` varchar(64) DEFAULT NULL COMMENT 'Last Name',
  `dob` date NOT NULL COMMENT 'DOB',
  `gender` enum('Male','Female') NOT NULL COMMENT 'Gender',
  `idno` int(11) NOT NULL COMMENT 'ID No',
  `estate` varchar(64) DEFAULT NULL COMMENT 'Estate',
  `postaladdress` varchar(64) DEFAULT NULL COMMENT 'Postal Address',
  `nationalityid` int(11) NOT NULL COMMENT 'Nationality',
  `religion` varchar(32) DEFAULT NULL COMMENT 'Religion',
  `countyid` int(11) DEFAULT NULL COMMENT 'County/State',
  `constituencyid` int(11) DEFAULT NULL COMMENT 'Constituency',
  `mobileno` varchar(32) DEFAULT NULL COMMENT 'Mobile No',
  `officecell` varchar(32) DEFAULT NULL COMMENT 'Office Cell No',
  `krapinno` varchar(32) DEFAULT NULL COMMENT 'KRA Pin No',
  `personal_email` varchar(64) DEFAULT NULL COMMENT 'Personal E-mail',
  `office_email` varchar(32) DEFAULT NULL COMMENT 'Office E-mail',
  `status` enum('Active','Inactive','Suspended','Withdrawn','Deceased') NOT NULL COMMENT 'Status',
  `chargeregistrationfee` enum('Yes','No') NOT NULL COMMENT 'Charge Registration Fee',
  `fcm_token` varchar(255) DEFAULT NULL,
  `comments` text COMMENT 'Text',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL COMMENT 'Created By',
  `createdon` datetime DEFAULT NULL COMMENT 'Created On',
  `lasteditedby` int(11) DEFAULT NULL COMMENT 'Last Edited By',
  `lasteditedon` datetime DEFAULT NULL COMMENT 'Last Edited On',
  `ipaddress` varchar(32) DEFAULT NULL COMMENT 'IP Address',
  `registrationdate` date DEFAULT NULL,
  `fullname` text,
  `specialmember` enum('0','1') DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idno` (`idno`),
  KEY `membersfknationalitys` (`nationalityid`),
  KEY `membersfkcountys` (`countyid`),
  KEY `membersfkconstituencys` (`constituencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `memberswelfare` */

DROP TABLE IF EXISTS `memberswelfare`;

CREATE TABLE `memberswelfare` (
  `currencyid` int(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `minopeningbalance` double DEFAULT '0',
  `penaltyaccountid` int(11) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT NULL,
  `remarks` text,
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `memberswelfarepayments` */

DROP TABLE IF EXISTS `memberswelfarepayments`;

CREATE TABLE `memberswelfarepayments` (
  `id` int(11) NOT NULL,
  `welfareid` int(11) DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  `documentno` varchar(32) DEFAULT NULL,
  `amount` double DEFAULT '0',
  `paymentmodeid` int(11) DEFAULT NULL,
  `bankid` int(11) DEFAULT NULL,
  `currencyid` int(11) DEFAULT NULL,
  `paidon` date DEFAULT NULL,
  `paidby` varchar(32) DEFAULT NULL,
  `remarks` text,
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `transactioncode` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `membertransfers` */

DROP TABLE IF EXISTS `membertransfers`;

CREATE TABLE `membertransfers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `frommemberid` int(11) NOT NULL COMMENT 'From Member',
  `tomemberid` int(11) NOT NULL COMMENT 'To Member',
  `fromaccountid` int(11) NOT NULL COMMENT 'From Account',
  `toaccountid` int(11) NOT NULL COMMENT 'To Account',
  `amount` double NOT NULL COMMENT 'Amount',
  `transferdate` date NOT NULL COMMENT 'Transefer Date',
  `description` text COMMENT 'Description',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL COMMENT 'Created By',
  `createdon` datetime DEFAULT NULL COMMENT 'Created On',
  `lasteditedby` int(11) DEFAULT NULL COMMENT 'Last Edited By',
  `lasteditedon` datetime DEFAULT NULL COMMENT 'Last Edited On',
  `ipaddress` varchar(32) DEFAULT NULL COMMENT 'IP Address',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `modules` */

DROP TABLE IF EXISTS `modules`;

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL COMMENT 'Name ',
  `status` int(11) DEFAULT NULL,
  `icon` varchar(32) DEFAULT NULL,
  `iconcolor` varchar(32) DEFAULT NULL,
  `shortname` varchar(32) DEFAULT NULL,
  `navigation` varchar(32) NOT NULL COMMENT 'Navigation',
  `alternativeicon` varchar(32) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL COMMENT 'Priority',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `mpesa_apitransactionsattempts` */

DROP TABLE IF EXISTS `mpesa_apitransactionsattempts`;

CREATE TABLE `mpesa_apitransactionsattempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `confirmation_response` text COMMENT 'Confirmation Load',
  `validation_response` text COMMENT 'Validation Load',
  `type` tinyint(2) DEFAULT NULL COMMENT '1 Validation, 2 Confirmation',
  `message` text COMMENT 'Message',
  `createdon` datetime DEFAULT CURRENT_TIMESTAMP,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

/*Table structure for table `mpesa_mpesatransactionerrorlogs` */

DROP TABLE IF EXISTS `mpesa_mpesatransactionerrorlogs`;

CREATE TABLE `mpesa_mpesatransactionerrorlogs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `paymentid` int(11) DEFAULT NULL COMMENT 'MPESA Transaction Log',
  `error` text COMMENT 'Error',
  `json` text COMMENT 'Payment Json',
  `createdon` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT CURRENT_TIMESTAMP,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Table structure for table `mpesa_transactions` */

DROP TABLE IF EXISTS `mpesa_transactions`;

CREATE TABLE `mpesa_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transactionType` varchar(40) DEFAULT NULL,
  `transID` varchar(40) DEFAULT NULL,
  `transTime` varchar(40) DEFAULT NULL,
  `transAmount` double DEFAULT '0',
  `businessShortCode` varchar(15) DEFAULT NULL,
  `billRefNumber` varchar(40) DEFAULT NULL,
  `invoiceNumber` varchar(40) DEFAULT NULL,
  `thirdPartyTransID` varchar(40) DEFAULT NULL,
  `MSISDN` varchar(20) DEFAULT NULL,
  `firstName` varchar(60) DEFAULT NULL,
  `middleName` varchar(60) DEFAULT NULL,
  `lastName` varchar(60) DEFAULT NULL,
  `orgAccountBalance` double DEFAULT '0',
  `createdon` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5100 DEFAULT CHARSET=latin1;

/*Table structure for table `mpesa_transactions_dublicates` */

DROP TABLE IF EXISTS `mpesa_transactions_dublicates`;

CREATE TABLE `mpesa_transactions_dublicates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transactionType` varchar(40) DEFAULT NULL,
  `transID` varchar(40) DEFAULT NULL,
  `transTime` varchar(40) DEFAULT NULL,
  `transAmount` double DEFAULT '0',
  `businessShortCode` varchar(40) DEFAULT NULL,
  `billRefNumber` varchar(40) DEFAULT NULL,
  `invoiceNumber` varchar(40) DEFAULT NULL,
  `MSISDN` varchar(40) DEFAULT NULL,
  `orgAccountBalance` double DEFAULT '0',
  `firstName` varchar(60) DEFAULT NULL,
  `middleName` varchar(60) DEFAULT NULL,
  `lastName` varchar(60) DEFAULT NULL,
  `createdon` datetime DEFAULT CURRENT_TIMESTAMP,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `mpesa_transactions_logs` */

DROP TABLE IF EXISTS `mpesa_transactions_logs`;

CREATE TABLE `mpesa_transactions_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment` text,
  `createdon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Table structure for table `nationalitys` */

DROP TABLE IF EXISTS `nationalitys`;

CREATE TABLE `nationalitys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `nextofkin` */

DROP TABLE IF EXISTS `nextofkin`;

CREATE TABLE `nextofkin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) NOT NULL COMMENT 'Member',
  `firstname` varchar(64) NOT NULL COMMENT 'First Name',
  `middlename` varchar(64) DEFAULT NULL COMMENT 'Middlename',
  `lastname` varchar(32) NOT NULL COMMENT 'Last Name',
  `relationshipid` int(11) NOT NULL COMMENT 'RelationShip',
  `percentage` int(11) NOT NULL COMMENT 'Percentage',
  `dob` date NOT NULL COMMENT 'DOB',
  `idno` int(11) DEFAULT NULL COMMENT 'ID No',
  `tel` varchar(32) DEFAULT NULL COMMENT 'Tel No',
  `passportphoto` varchar(64) DEFAULT NULL COMMENT 'PassPort Photo',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL COMMENT 'Created By',
  `createdon` datetime DEFAULT NULL COMMENT 'Created On',
  `lasteditedby` int(11) DEFAULT NULL COMMENT 'Last Edited By',
  `lasteditedon` datetime DEFAULT NULL COMMENT 'Last Edited On',
  `ipaddress` varchar(32) DEFAULT NULL COMMENT 'IP Address',
  PRIMARY KEY (`id`),
  KEY `nextofkinfkmembers` (`memberid`),
  KEY `nextofkinfkrelationships` (`relationshipid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `notificationrecipients` */

DROP TABLE IF EXISTS `notificationrecipients`;

CREATE TABLE `notificationrecipients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notificationid` int(11) NOT NULL COMMENT 'Notification',
  `userid` int(11) DEFAULT NULL,
  `employeeid` int(11) NOT NULL COMMENT 'To',
  `fromemployeeid` int(11) DEFAULT NULL,
  `email` varchar(32) NOT NULL COMMENT 'Email',
  `tel` varchar(32) NOT NULL COMMENT 'Tel',
  `notifiedon` datetime NOT NULL COMMENT 'Notified On',
  `readon` datetime NOT NULL COMMENT 'Read on',
  `status` enum('read','not-read') NOT NULL DEFAULT 'not-read' COMMENT 'Status',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `notifications` */

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notificationtype` enum('email','sms','dashbord') NOT NULL DEFAULT 'dashbord' COMMENT 'Notification Type',
  `subject` varchar(64) NOT NULL COMMENT 'Subject',
  `body` text NOT NULL COMMENT 'Body',
  `taskid` int(11) NOT NULL COMMENT 'Task',
  `remarks` text,
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `paymentmodes` */

DROP TABLE IF EXISTS `paymentmodes`;

CREATE TABLE `paymentmodes` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `acctypeid` int(11) DEFAULT NULL COMMENT 'Acctype',
  `is_bank` enum('0','1') DEFAULT '0' COMMENT 'Is Bank',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `payments` */

DROP TABLE IF EXISTS `payments`;

CREATE TABLE `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paymenttermid` varchar(50) NOT NULL DEFAULT '3',
  `memberid` int(11) NOT NULL,
  `documentno` varchar(32) DEFAULT NULL,
  `transactionno` varchar(32) DEFAULT NULL,
  `paidon` date NOT NULL,
  `amount` double NOT NULL,
  `remarks` text,
  `createdby` text,
  `createdon` datetime DEFAULT NULL,
  `lasteditedon` datetime NOT NULL,
  `lasteditedby` text NOT NULL,
  `month` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `paymentterms` */

DROP TABLE IF EXISTS `paymentterms`;

CREATE TABLE `paymentterms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `incomeid` int(11) NOT NULL COMMENT 'Income',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL COMMENT 'Created By',
  `createdon` datetime DEFAULT NULL COMMENT 'Created On',
  `lasteditedby` int(11) DEFAULT NULL COMMENT 'Last Edited By',
  `lasteditedon` datetime DEFAULT NULL COMMENT 'Last Edited On',
  `ipaddress` varchar(32) DEFAULT NULL COMMENT 'IP Address',
  `branch_id` int(11) unsigned DEFAULT NULL COMMENT 'Branch Name',
  PRIMARY KEY (`id`),
  KEY `paymenttermsfkincomes` (`incomeid`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `paymentterms_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `auth_branches` (`id`),
  CONSTRAINT `paymenttermsfkincomes` FOREIGN KEY (`incomeid`) REFERENCES `incomes` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Table structure for table `pm_clientprojects` */

DROP TABLE IF EXISTS `pm_clientprojects`;

CREATE TABLE `pm_clientprojects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL COMMENT 'Client ',
  `projectid` int(11) NOT NULL COMMENT 'Project',
  `startdate` date NOT NULL COMMENT 'Project Start Date',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `projectid` (`projectid`),
  CONSTRAINT `pm_clientprojects_ibfk_3` FOREIGN KEY (`clientid`) REFERENCES `pm_projectclients` (`id`),
  CONSTRAINT `pm_clientprojects_ibfk_4` FOREIGN KEY (`projectid`) REFERENCES `pm_projects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `pm_projectclients` */

DROP TABLE IF EXISTS `pm_projectclients`;

CREATE TABLE `pm_projectclients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Client Name',
  `city` varchar(32) DEFAULT NULL COMMENT 'City',
  `town` varchar(32) DEFAULT NULL COMMENT 'Town',
  `neighbourhood` varchar(32) DEFAULT NULL COMMENT 'Neighbourhood ',
  `contactname` varchar(64) DEFAULT NULL COMMENT 'Contact Name',
  `website` varchar(32) DEFAULT NULL COMMENT 'Website',
  `streetaddress` text COMMENT 'Street Address',
  `mobile` varchar(20) NOT NULL COMMENT 'Mobile No',
  `email` varchar(64) NOT NULL COMMENT 'Email Adddress',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `plotno` varchar(32) NOT NULL COMMENT 'Plot No',
  `clientno` int(11) NOT NULL COMMENT 'Client No',
  `contactmobile` varchar(32) DEFAULT NULL COMMENT 'Contact Person Mobile',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `pm_projects` */

DROP TABLE IF EXISTS `pm_projects`;

CREATE TABLE `pm_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) DEFAULT NULL COMMENT 'Client Name',
  `projecttypeid` int(11) NOT NULL COMMENT 'Project Type',
  `name` varchar(32) NOT NULL COMMENT 'Project Name',
  `description` text COMMENT 'Description',
  `amount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Project Amount',
  `depositpaid` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Deposit Paid',
  `startdate` date NOT NULL COMMENT 'Start Date',
  `expectedcompletion` date DEFAULT NULL COMMENT 'Expected Complition Date',
  `actualcompletion` date DEFAULT NULL COMMENT 'Actual Completon Date',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_jm_client` (`customerid`),
  KEY `projecttypeid` (`projecttypeid`),
  CONSTRAINT `pm_projects_ibfk_1` FOREIGN KEY (`projecttypeid`) REFERENCES `pm_projecttypes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `pm_projecttasks` */

DROP TABLE IF EXISTS `pm_projecttasks`;

CREATE TABLE `pm_projecttasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` int(11) NOT NULL COMMENT 'Project',
  `taskid` int(11) NOT NULL COMMENT 'Task',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `projectid` (`projectid`),
  KEY `taskid` (`taskid`),
  CONSTRAINT `pm_projecttasks_ibfk_2` FOREIGN KEY (`taskid`) REFERENCES `pm_tasks` (`id`),
  CONSTRAINT `pm_projecttasks_ibfk_3` FOREIGN KEY (`projectid`) REFERENCES `pm_projects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `pm_projecttypes` */

DROP TABLE IF EXISTS `pm_projecttypes`;

CREATE TABLE `pm_projecttypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Project Type',
  `description` text COMMENT 'Description',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `pm_tasks` */

DROP TABLE IF EXISTS `pm_tasks`;

CREATE TABLE `pm_tasks` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL COMMENT 'Task Name',
  `tasktype` int(11) NOT NULL COMMENT 'Task Type',
  `description` text COMMENT 'Description',
  `projectid` int(11) NOT NULL COMMENT 'Project Name',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pm_tasks_jm_projects` (`projectid`),
  KEY `pm_tasks_jm_tasktypes` (`tasktype`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `pm_tasktypes` */

DROP TABLE IF EXISTS `pm_tasktypes`;

CREATE TABLE `pm_tasktypes` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL COMMENT 'Task Type Name',
  `description` text COMMENT 'Description',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `reg_membersattendance` */

DROP TABLE IF EXISTS `reg_membersattendance`;

CREATE TABLE `reg_membersattendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) NOT NULL,
  `meetingdate` date DEFAULT NULL,
  `present` enum('present','absent') DEFAULT NULL,
  `arrivaltime` enum('late','ontime') DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `absentreason` text,
  `fine` double DEFAULT '0',
  `finepaymentstatus` enum('paid','unpaid') DEFAULT 'unpaid',
  `hascontributed` enum('yes','no') DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `reg_membersattendance_ref_members` (`memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `relationships` */

DROP TABLE IF EXISTS `relationships`;

CREATE TABLE `relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL COMMENT 'Created By',
  `createdon` datetime DEFAULT NULL COMMENT 'Created On',
  `lasteditedby` int(11) DEFAULT NULL COMMENT 'Last Edited By',
  `lasteditedon` datetime DEFAULT NULL COMMENT 'Last Edited On',
  `ipaddress` varchar(32) DEFAULT NULL COMMENT 'IP Address',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `repaymentperiods` */

DROP TABLE IF EXISTS `repaymentperiods`;

CREATE TABLE `repaymentperiods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `period` varchar(32) DEFAULT NULL,
  `interest` double DEFAULT '0',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `remarks` text,
  `status` enum('0','1') DEFAULT '1',
  `periodfactor` double DEFAULT '1',
  `periodvalue` double DEFAULT '1',
  `totalduration` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `description` text,
  `tableid` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1616 DEFAULT CHARSET=latin1;

/*Table structure for table `routedetails` */

DROP TABLE IF EXISTS `routedetails`;

CREATE TABLE `routedetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `routeid` int(11) NOT NULL,
  `hasgates` enum('Yes','No') DEFAULT 'No',
  `userid` int(11) DEFAULT NULL,
  `follows` int(11) DEFAULT NULL,
  `squery` varchar(255) DEFAULT NULL,
  `approval` enum('Yes','No') DEFAULT NULL,
  `remarks` text,
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `routes` */

DROP TABLE IF EXISTS `routes`;

CREATE TABLE `routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT 'Name',
  `moduleid` int(11) NOT NULL COMMENT 'Module',
  `roleid` int(11) NOT NULL COMMENT 'Role',
  `hasgate` enum('Yes','No') NOT NULL DEFAULT 'No' COMMENT 'Has Gate',
  `remarks` text,
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `routesfkmodules` (`moduleid`),
  KEY `routesfkroles` (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `rules` */

DROP TABLE IF EXISTS `rules`;

CREATE TABLE `rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `levelid` int(11) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7218 DEFAULT CHARSET=latin1;

/*Table structure for table `sacco_assetcategories` */

DROP TABLE IF EXISTS `sacco_assetcategories`;

CREATE TABLE `sacco_assetcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sacco_assetsregistration` */

DROP TABLE IF EXISTS `sacco_assetsregistration`;

CREATE TABLE `sacco_assetsregistration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetname` varchar(32) DEFAULT NULL,
  `aquisitiondate` date DEFAULT NULL,
  `location` text,
  `assetvalue` double DEFAULT '0',
  `appreciationdepreciatiation` enum('appreciate','depreciate') DEFAULT NULL,
  `appreciatedepreciatevalue` double DEFAULT '0',
  `fullyacquired` enum('yes','no') DEFAULT NULL,
  `remainingbalance` double DEFAULT '0',
  `acquiredfrom` varchar(32) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `assetcategoryid` int(11) DEFAULT '2',
  `paidthrough` enum('cash','cheque') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sacco_assetsregistration_jm_sacco_assetcategories` (`assetcategoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sacco_debtstypes` */

DROP TABLE IF EXISTS `sacco_debtstypes`;

CREATE TABLE `sacco_debtstypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sacco_installmentpenalties` */

DROP TABLE IF EXISTS `sacco_installmentpenalties`;

CREATE TABLE `sacco_installmentpenalties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `saccoloanid` int(11) NOT NULL,
  `penaltyas` enum('fixedvalue','%') DEFAULT NULL,
  `percentageof` enum('Principal','installment','Interest','Defaulted Amount') DEFAULT NULL,
  `amount` double DEFAULT '1',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_enabled` enum('Yes','No') DEFAULT 'No',
  PRIMARY KEY (`id`),
  KEY `sacco_installmentpenalties_jm_saccoloans` (`saccoloanid`),
  CONSTRAINT `sacco_installmentpenalties_jm_saccoloans` FOREIGN KEY (`saccoloanid`) REFERENCES `saccoloans` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sacco_loanpenalties` */

DROP TABLE IF EXISTS `sacco_loanpenalties`;

CREATE TABLE `sacco_loanpenalties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loan` int(11) NOT NULL,
  `penalty` double DEFAULT '0',
  `installmentid` int(11) DEFAULT NULL,
  `installmentdue` double DEFAULT '0',
  `datedue` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sacco_installmentpenalties_jm_loanapplications` (`loan`),
  KEY `sacco_installmentpenalties_jm_loanrepaymentschedule` (`installmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sacco_loanprocessingfeechargetime` */

DROP TABLE IF EXISTS `sacco_loanprocessingfeechargetime`;

CREATE TABLE `sacco_loanprocessingfeechargetime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` varchar(64) DEFAULT NULL,
  `description` text,
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sacco_loansavings` */

DROP TABLE IF EXISTS `sacco_loansavings`;

CREATE TABLE `sacco_loansavings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loanid` int(11) DEFAULT NULL,
  `savingamount` double DEFAULT '0',
  `savedon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sacco_loansavings_jm_loanapplications` (`loanid`),
  CONSTRAINT `sacco_loansavings_jm_loanapplications` FOREIGN KEY (`loanid`) REFERENCES `loanapplications` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sacco_loansavingsconfig` */

DROP TABLE IF EXISTS `sacco_loansavingsconfig`;

CREATE TABLE `sacco_loansavingsconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loanamount` double DEFAULT '0',
  `savingsamount` double DEFAULT '0',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `saccoloanid` int(11) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  PRIMARY KEY (`id`),
  KEY `sacco_loansavvingsconfig_jm_saccoloans` (`saccoloanid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sacco_memberloanreconciliations` */

DROP TABLE IF EXISTS `sacco_memberloanreconciliations`;

CREATE TABLE `sacco_memberloanreconciliations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `loanbalance` double DEFAULT '0',
  `savingsamount` double DEFAULT '0',
  `fine` double DEFAULT '0',
  `loansecurity` double DEFAULT '0',
  `retainedsavings` double DEFAULT '0',
  `refunded` double DEFAULT '0',
  `paymentmodeid` int(11) DEFAULT NULL,
  `bankid` int(11) DEFAULT NULL,
  `reconciliationdate` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `sacco_membersdebts` */

DROP TABLE IF EXISTS `sacco_membersdebts`;

CREATE TABLE `sacco_membersdebts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) NOT NULL,
  `typeid` int(11) DEFAULT NULL,
  `amount` double DEFAULT '0',
  `memo` text,
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `paymentstatus` enum('paid','unpaid') DEFAULT 'unpaid',
  `debtreferenceno` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `memberdebit_jm_members` (`memberid`),
  KEY `memberdebit_jm_sacco_membersdebtstypes` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sacco_membersdebtspayments` */

DROP TABLE IF EXISTS `sacco_membersdebtspayments`;

CREATE TABLE `sacco_membersdebtspayments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) NOT NULL,
  `typeid` int(11) NOT NULL,
  `amount` double DEFAULT '0',
  `memo` text,
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `paymentmode` varchar(32) DEFAULT NULL,
  `bankid` int(11) DEFAULT NULL,
  `paidon` date DEFAULT NULL,
  `documentno` varchar(32) DEFAULT NULL,
  `chequeno` varchar(32) DEFAULT NULL,
  `paidby` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sacco_membersdebtspayments_jm_sacco_membersdebtstypes` (`typeid`),
  KEY `sacco_membersdebtspayments_jm_members` (`memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sacco_membersdebtstypes` */

DROP TABLE IF EXISTS `sacco_membersdebtstypes`;

CREATE TABLE `sacco_membersdebtstypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `debttypeid` int(11) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `amount` double DEFAULT '0',
  `remarks` text,
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `paidstatus` enum('paid','unpaid') DEFAULT 'unpaid',
  `accountid` int(11) DEFAULT NULL,
  `value` enum('percentage','fixvalue') DEFAULT NULL,
  `aslookup` enum('yes','no') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sacco_membersdebtstypes_jm_sacco_debtstypes` (`debttypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sacco_memberswelfare` */

DROP TABLE IF EXISTS `sacco_memberswelfare`;

CREATE TABLE `sacco_memberswelfare` (
  `id` int(11) NOT NULL,
  `welfaretypeid` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `creationdate` date DEFAULT NULL,
  `amount` double DEFAULT '0',
  `creationreason` text,
  `remarks` text,
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sacco_memberswelfare_jm_sacco_welfaretypes` (`welfaretypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sacco_saccoloansubproducts` */

DROP TABLE IF EXISTS `sacco_saccoloansubproducts`;

CREATE TABLE `sacco_saccoloansubproducts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `saccoloanid` int(11) DEFAULT NULL,
  `subproductname` varchar(32) DEFAULT NULL,
  `shortname` varchar(10) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  PRIMARY KEY (`id`),
  KEY `sacco_saccoloansubproducts_jm_saccoloans` (`saccoloanid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sacco_specialmembers` */

DROP TABLE IF EXISTS `sacco_specialmembers`;

CREATE TABLE `sacco_specialmembers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `memberid` (`memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sacco_unreconciledpayments` */

DROP TABLE IF EXISTS `sacco_unreconciledpayments`;

CREATE TABLE `sacco_unreconciledpayments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT '0',
  `paidon` date DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `mobileno` varchar(15) DEFAULT NULL,
  `paidby` varchar(64) DEFAULT NULL,
  `status` enum('reconciled','unreconciled') DEFAULT 'unreconciled',
  `message` text,
  `transactioncode` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `sacco_welfaretypes` */

DROP TABLE IF EXISTS `sacco_welfaretypes`;

CREATE TABLE `sacco_welfaretypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `amount` double DEFAULT '0',
  `remarks` text,
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `saccoloans` */

DROP TABLE IF EXISTS `saccoloans`;

CREATE TABLE `saccoloans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productname` varchar(64) NOT NULL COMMENT 'Product Name',
  `shortname` varchar(32) NOT NULL COMMENT 'Short Name',
  `descriptions` text NOT NULL COMMENT 'Descriptions',
  `loantypeid` int(11) NOT NULL COMMENT 'Product Type',
  `appraisalperiod` varchar(32) NOT NULL COMMENT 'Estimated Appraisal Period',
  `startdate` date NOT NULL COMMENT 'Start Date',
  `closedate` date NOT NULL COMMENT 'Close Date',
  `accountid` int(11) NOT NULL COMMENT 'Account',
  `status` enum('Active','Inactive') NOT NULL COMMENT 'Status',
  `maturityperiod` varchar(32) NOT NULL COMMENT 'Maturity Period',
  `minprincipal` double NOT NULL COMMENT 'Minimum Principal',
  `maximumprincipal` double NOT NULL COMMENT 'Maximum Principal',
  `overduedate` int(11) NOT NULL COMMENT 'Over Due Date',
  `nonperformingdate` int(11) NOT NULL COMMENT 'Non-Performing Asset Date',
  `minimumguarantors` int(11) DEFAULT NULL,
  `maximumguarantors` int(11) DEFAULT NULL,
  `loancharges` varchar(32) DEFAULT NULL COMMENT 'Charges',
  `multiple_of_savings` double DEFAULT NULL,
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL COMMENT 'Created By',
  `createdon` datetime DEFAULT NULL COMMENT 'Created On',
  `lasteditedby` int(11) DEFAULT NULL COMMENT 'Last Edited By',
  `lasteditedon` datetime DEFAULT NULL COMMENT 'Last Edited On',
  `ipaddress` varchar(32) DEFAULT NULL COMMENT 'IP Address',
  `interestmethodid` int(11) DEFAULT NULL,
  `interestchargedper` enum('month','year') DEFAULT NULL,
  `defaultinterestrate` double DEFAULT '0',
  `maximuminterestrate` double DEFAULT '0',
  `minimuminterestrate` double DEFAULT '0',
  `defaultrepaymentperiod` int(11) DEFAULT NULL,
  `requiregurantor` enum('Yes','No') DEFAULT 'Yes',
  `multipleamount` double DEFAULT '0',
  `checkloansecurity` enum('Yes','No') DEFAULT 'No',
  `graceperiod` int(11) DEFAULT NULL,
  `psavingamount` double DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `saccoloansfkloantypes` (`loantypeid`),
  KEY `saccoloansrefsys_interesttypes` (`interestmethodid`),
  CONSTRAINT `saccoloans_jm_sys_interesttypes` FOREIGN KEY (`interestmethodid`) REFERENCES `sys_interesttypes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sales` */

DROP TABLE IF EXISTS `sales`;

CREATE TABLE `sales` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) unsigned NOT NULL COMMENT 'Item',
  `documentno` bigint(32) NOT NULL COMMENT 'Document No',
  `studentid` int(11) unsigned NOT NULL COMMENT 'Learner Name',
  `description` varchar(64) NOT NULL COMMENT 'Description',
  `quantity` double DEFAULT NULL COMMENT 'Quantity',
  `costprice` double DEFAULT NULL COMMENT 'Cost Price',
  `retailprice` double DEFAULT NULL COMMENT 'Retail Price',
  `tradeprice` double DEFAULT NULL COMMENT 'Trade Price',
  `discount` double DEFAULT NULL COMMENT 'Discount',
  `tax` double DEFAULT NULL COMMENT 'Tax',
  `bonus` double DEFAULT NULL COMMENT 'Bonus',
  `profit` double DEFAULT NULL COMMENT 'Profit',
  `total` double DEFAULT NULL COMMENT 'Total',
  `soldthru` varchar(15) NOT NULL COMMENT 'Sold Thro',
  `paystatus` int(11) DEFAULT NULL COMMENT 'Paystatus',
  `soldon` date NOT NULL COMMENT 'Issuance Date',
  `expirydate` date DEFAULT NULL COMMENT 'Expiry Date',
  `memo` text NOT NULL COMMENT 'Memo',
  `ipaddress` varchar(32) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createdon` datetime NOT NULL,
  `lasteditedby` int(11) NOT NULL,
  `lasteditedon` datetime NOT NULL,
  `invoiceno` varchar(64) DEFAULT NULL COMMENT 'Invoice No',
  `supplierid` int(11) DEFAULT NULL COMMENT 'Supplier Name',
  `cr` int(11) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `itemid` (`itemid`),
  KEY `studentid` (`studentid`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`id`),
  CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`studentid`) REFERENCES `sch_students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;

/*Table structure for table `sales_audit` */

DROP TABLE IF EXISTS `sales_audit`;

CREATE TABLE `sales_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` int(11) DEFAULT NULL,
  `itemid` int(11) DEFAULT NULL,
  `documentno` bigint(32) NOT NULL,
  `studentid` int(11) NOT NULL,
  `description` varchar(64) NOT NULL,
  `quantity` double DEFAULT NULL,
  `costprice` double DEFAULT NULL,
  `retailprice` double DEFAULT NULL,
  `tradeprice` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `bonus` double DEFAULT NULL,
  `profit` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `soldthru` varchar(15) NOT NULL,
  `paystatus` int(11) DEFAULT NULL,
  `soldon` date NOT NULL,
  `expirydate` date DEFAULT NULL,
  `memo` text NOT NULL,
  `lasteditedby` int(11) NOT NULL,
  `lasteditedon` datetime NOT NULL,
  `action` varchar(32) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `savings` */

DROP TABLE IF EXISTS `savings`;

CREATE TABLE `savings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `currencyid` int(11) NOT NULL COMMENT 'Currency',
  `minopeningbalance` double NOT NULL COMMENT 'Min Opening Balance',
  `chargetransferfees` enum('Yes','No') NOT NULL COMMENT 'Charge Transfer Fees',
  `penaltyaccountid` int(11) DEFAULT NULL COMMENT 'Penalty Account',
  `feesaccountid` int(11) DEFAULT NULL COMMENT 'Fees Account',
  `status` enum('Active','Inactive') NOT NULL COMMENT 'Status',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL COMMENT 'Created By',
  `createdon` datetime DEFAULT NULL COMMENT 'Created On',
  `lasteditedby` int(11) DEFAULT NULL COMMENT 'Last Edited By',
  `lasteditedon` datetime DEFAULT NULL COMMENT 'Last Edited On',
  `ipaddress` varchar(32) DEFAULT NULL COMMENT 'IP Address',
  PRIMARY KEY (`id`),
  KEY `savingsfkcurrencys` (`currencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `savingspayments` */

DROP TABLE IF EXISTS `savingspayments`;

CREATE TABLE `savingspayments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) NOT NULL COMMENT 'Member',
  `month` int(11) NOT NULL COMMENT 'Month',
  `year` int(11) NOT NULL COMMENT 'Year',
  `documentno` varchar(32) NOT NULL COMMENT 'Document No',
  `savingsid` int(11) NOT NULL COMMENT 'Savings',
  `amount` double NOT NULL COMMENT 'Amount',
  `paymentmodeid` int(11) NOT NULL COMMENT 'Payment Mode',
  `bankid` int(11) DEFAULT NULL COMMENT 'Bank',
  `transactioncode` varchar(32) DEFAULT NULL COMMENT 'Transaction No',
  `currencyid` int(11) NOT NULL COMMENT 'Currency',
  `paidon` date NOT NULL COMMENT 'Paid On',
  `paidby` varchar(32) DEFAULT NULL COMMENT 'Paid By',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL COMMENT 'Created By',
  `createdon` datetime DEFAULT NULL COMMENT 'Created On',
  `lasteditedby` int(11) DEFAULT NULL COMMENT 'Last Edited By',
  `lasteditedon` datetime DEFAULT NULL COMMENT 'Last Edited On',
  `ipaddress` varchar(32) DEFAULT NULL COMMENT 'IP Address',
  PRIMARY KEY (`id`),
  KEY `savingspaymentsfkmembers` (`memberid`),
  KEY `savingspaymentsfksavings` (`savingsid`),
  KEY `savingspaymentsfkpaymentmodes` (`paymentmodeid`),
  KEY `savingspaymentsfkbanks` (`bankid`),
  KEY `savingspaymentsfkcurrencys` (`currencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sch_academicyear` */

DROP TABLE IF EXISTS `sch_academicyear`;

CREATE TABLE `sch_academicyear` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT 'Academic Year',
  `description` varchar(250) DEFAULT NULL COMMENT 'Description',
  `startdate` date DEFAULT NULL COMMENT 'Expected Start Date',
  `endate` date DEFAULT NULL COMMENT 'Expected End Date',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_academicyears` */

DROP TABLE IF EXISTS `sch_academicyears`;

CREATE TABLE `sch_academicyears` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT 'Academic Year  Name',
  `yearid` int(11) NOT NULL COMMENT 'Calendar Year',
  `description` varchar(250) DEFAULT NULL COMMENT 'Description',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `is_current_year` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'Is the current Year',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `yearid` (`yearid`),
  CONSTRAINT `sch_academicyears_ibfk_1` FOREIGN KEY (`yearid`) REFERENCES `sys_years` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_academicyearterms` */

DROP TABLE IF EXISTS `sch_academicyearterms`;

CREATE TABLE `sch_academicyearterms` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `academicyearid` int(11) unsigned NOT NULL COMMENT 'Academic Year',
  `termid` tinyint(3) unsigned NOT NULL COMMENT 'Term',
  `name` varchar(100) NOT NULL COMMENT 'Academic Term',
  `description` varchar(250) DEFAULT NULL COMMENT 'Description',
  `startdate` date DEFAULT NULL COMMENT 'Start Date',
  `enddate` date DEFAULT NULL COMMENT 'End Date',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `sch_academicyearterms_ibfk_1` (`academicyearid`,`termid`),
  KEY `termid` (`termid`),
  CONSTRAINT `sch_academicyearterms_ibfk_1` FOREIGN KEY (`academicyearid`) REFERENCES `sch_academicyears` (`id`),
  CONSTRAINT `sch_academicyearterms_ibfk_2` FOREIGN KEY (`termid`) REFERENCES `sch_terms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_classdailyrecording` */

DROP TABLE IF EXISTS `sch_classdailyrecording`;

CREATE TABLE `sch_classdailyrecording` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `teacherondutyid` int(11) unsigned NOT NULL COMMENT 'Teacher On Duty',
  `recording_date` date NOT NULL COMMENT 'Date Recorded',
  `general_comment` text COMMENT 'Other Comments',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `teacherondutyid` (`teacherondutyid`),
  CONSTRAINT `sch_classdailyrecording_ibfk_1` FOREIGN KEY (`teacherondutyid`) REFERENCES `sch_teachersonduty` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_classdailyrecordingdetails` */

DROP TABLE IF EXISTS `sch_classdailyrecordingdetails`;

CREATE TABLE `sch_classdailyrecordingdetails` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `daily_recording_id` int(11) unsigned NOT NULL COMMENT 'Daily Recording',
  `classid` int(11) unsigned NOT NULL COMMENT 'Class',
  `present` int(3) NOT NULL COMMENT 'Present',
  `absent` int(3) NOT NULL COMMENT 'Absents',
  `comments` text COMMENT 'Comments',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lastediteby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT NULL COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `classid` (`classid`),
  KEY `daily_recording_id` (`daily_recording_id`),
  CONSTRAINT `sch_classdailyrecordingdetails_ibfk_1` FOREIGN KEY (`classid`) REFERENCES `sch_classes` (`id`),
  CONSTRAINT `sch_classdailyrecordingdetails_ibfk_3` FOREIGN KEY (`daily_recording_id`) REFERENCES `sch_classdailyrecording` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_classes` */

DROP TABLE IF EXISTS `sch_classes`;

CREATE TABLE `sch_classes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT 'Class Name',
  `description` varchar(32) DEFAULT NULL COMMENT 'Description',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_classsubjects` */

DROP TABLE IF EXISTS `sch_classsubjects`;

CREATE TABLE `sch_classsubjects` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `classid` int(11) unsigned NOT NULL COMMENT 'Class',
  `subjectid` tinyint(3) unsigned NOT NULL COMMENT 'Subject Name',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `classid` (`classid`,`subjectid`),
  KEY `subjectid` (`subjectid`),
  CONSTRAINT `sch_classsubjects_ibfk_1` FOREIGN KEY (`classid`) REFERENCES `sch_classes` (`id`),
  CONSTRAINT `sch_classsubjects_ibfk_2` FOREIGN KEY (`subjectid`) REFERENCES `sch_subjects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_classteacherlogs` */

DROP TABLE IF EXISTS `sch_classteacherlogs`;

CREATE TABLE `sch_classteacherlogs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `classid` int(11) unsigned NOT NULL COMMENT 'Class Name',
  `teacherid` int(11) unsigned NOT NULL COMMENT 'Teacher Name',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `classid` (`classid`),
  KEY `teacherid` (`teacherid`),
  CONSTRAINT `sch_classteacherlogs_ibfk_1` FOREIGN KEY (`classid`) REFERENCES `sch_classes` (`id`),
  CONSTRAINT `sch_classteacherlogs_ibfk_2` FOREIGN KEY (`teacherid`) REFERENCES `sch_teachers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sch_classteachers` */

DROP TABLE IF EXISTS `sch_classteachers`;

CREATE TABLE `sch_classteachers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `teacherid` int(11) unsigned NOT NULL COMMENT 'Teacher Name',
  `classid` int(11) unsigned NOT NULL COMMENT 'Class Name',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `teacherid` (`teacherid`,`classid`),
  KEY `classid` (`classid`),
  CONSTRAINT `sch_classteachers_ibfk_1` FOREIGN KEY (`teacherid`) REFERENCES `sch_teachers` (`id`),
  CONSTRAINT `sch_classteachers_ibfk_2` FOREIGN KEY (`classid`) REFERENCES `sch_classes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_deactivatedstudentslog` */

DROP TABLE IF EXISTS `sch_deactivatedstudentslog`;

CREATE TABLE `sch_deactivatedstudentslog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `studentid` int(11) unsigned NOT NULL COMMENT 'Student',
  `deactivatedon` date DEFAULT NULL COMMENT 'Deativated/Activated Date',
  `deactivatedby` int(11) DEFAULT NULL COMMENT 'Deactivated/Activated By',
  `response` varchar(100) DEFAULT NULL COMMENT 'Response',
  `status` enum('0','1') DEFAULT NULL COMMENT 'Status',
  `deactivate_reason` text COMMENT 'Reason To deactivate/Activate',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_enabled` enum('0','1') DEFAULT '1',
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `studentid` (`studentid`),
  CONSTRAINT `sch_deactivatedstudentslog_ibfk_1` FOREIGN KEY (`studentid`) REFERENCES `sch_students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_deletedmemberpayables` */

DROP TABLE IF EXISTS `sch_deletedmemberpayables`;

CREATE TABLE `sch_deletedmemberpayables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paymenttermid` int(11) NOT NULL COMMENT 'Payment Term',
  `memberid` int(11) unsigned NOT NULL COMMENT 'Member',
  `studentclasspromotiontermid` int(11) unsigned DEFAULT NULL COMMENT 'Student Class Promotion',
  `documentno` varchar(32) NOT NULL COMMENT 'Document No',
  `invoicedon` date NOT NULL COMMENT 'Invoiced On',
  `amount` double NOT NULL COMMENT 'Amount',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL COMMENT 'Created By',
  `createdon` datetime DEFAULT NULL COMMENT 'Created On',
  `lasteditedby` int(11) DEFAULT NULL COMMENT 'Last Edited By',
  `lasteditedon` datetime DEFAULT NULL COMMENT 'Last Edited On',
  `ipaddress` varchar(32) DEFAULT NULL COMMENT 'IP Address',
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=503 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_demotedstudents` */

DROP TABLE IF EXISTS `sch_demotedstudents`;

CREATE TABLE `sch_demotedstudents` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `studentclasstermid` int(11) unsigned NOT NULL COMMENT 'Academic Yr Term',
  `datedemoted` date NOT NULL COMMENT 'Date Demoted',
  `current_class_id` int(11) unsigned NOT NULL COMMENT 'Demoted To Class',
  `current_term_id` tinyint(3) unsigned NOT NULL COMMENT 'Term Demoted To',
  `current_year_id` int(11) unsigned NOT NULL COMMENT 'Year Demoted',
  `demotedby` int(11) DEFAULT NULL COMMENT 'Demoted By',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `studentclasstermid` (`studentclasstermid`),
  KEY `current_class_id` (`current_class_id`),
  KEY `current_term_id` (`current_term_id`),
  KEY `current_year_id` (`current_year_id`),
  CONSTRAINT `sch_demotedstudents_ibfk_1` FOREIGN KEY (`studentclasstermid`) REFERENCES `sch_studentclassterms` (`id`),
  CONSTRAINT `sch_demotedstudents_ibfk_2` FOREIGN KEY (`current_class_id`) REFERENCES `sch_classes` (`id`),
  CONSTRAINT `sch_demotedstudents_ibfk_3` FOREIGN KEY (`current_term_id`) REFERENCES `sch_terms` (`id`),
  CONSTRAINT `sch_demotedstudents_ibfk_4` FOREIGN KEY (`current_year_id`) REFERENCES `sch_academicyears` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_elinstallationmodes` */

DROP TABLE IF EXISTS `sch_elinstallationmodes`;

CREATE TABLE `sch_elinstallationmodes` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `mode_name` varchar(150) NOT NULL COMMENT 'Mode Name',
  `description` tinytext COMMENT 'Description',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`mode_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_elpackagesubscribergradeunitrenewals` */

DROP TABLE IF EXISTS `sch_elpackagesubscribergradeunitrenewals`;

CREATE TABLE `sch_elpackagesubscribergradeunitrenewals` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subscriber_grade_unit_id` int(11) unsigned NOT NULL COMMENT 'Subscriber Grade Unit',
  `renewal_date` date DEFAULT NULL COMMENT 'Date Renewed',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscriber_grade_unit_id` (`subscriber_grade_unit_id`,`renewal_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sch_elsubscriberinvoicedetails` */

DROP TABLE IF EXISTS `sch_elsubscriberinvoicedetails`;

CREATE TABLE `sch_elsubscriberinvoicedetails` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subscriber_invoice_id` int(11) unsigned NOT NULL COMMENT 'Subscriber Invoice',
  `subscriber_package_grade_unit_id` int(11) unsigned NOT NULL COMMENT 'Subscriber Subject',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscriber_invoice_id` (`subscriber_invoice_id`,`subscriber_package_grade_unit_id`),
  KEY `subscriber_package_grade_unit_id` (`subscriber_package_grade_unit_id`),
  CONSTRAINT `sch_elsubscriberinvoicedetails_ibfk_1` FOREIGN KEY (`subscriber_invoice_id`) REFERENCES `sch_elsubscriberinvoices` (`id`),
  CONSTRAINT `sch_elsubscriberinvoicedetails_ibfk_2` FOREIGN KEY (`subscriber_package_grade_unit_id`) REFERENCES `sch_elsubscriberpackagesgradeunits` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_elsubscriberinvoices` */

DROP TABLE IF EXISTS `sch_elsubscriberinvoices`;

CREATE TABLE `sch_elsubscriberinvoices` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subscriber_package_id` int(11) unsigned NOT NULL COMMENT 'Subscription Package',
  `total_amount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Invoice Total',
  `invoice_date` date NOT NULL COMMENT 'Invoice Date',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscriber_package_id` (`subscriber_package_id`),
  CONSTRAINT `sch_elsubscriberinvoices_ibfk_1` FOREIGN KEY (`subscriber_package_id`) REFERENCES `sch_elsubscriberpackages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_elsubscriberpackagegradeunitpayment` */

DROP TABLE IF EXISTS `sch_elsubscriberpackagegradeunitpayment`;

CREATE TABLE `sch_elsubscriberpackagegradeunitpayment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subscriber_grade_unit_id` int(11) unsigned NOT NULL,
  `amount_paid` double(10,2) NOT NULL DEFAULT '0.00',
  `balance` double(10,2) NOT NULL DEFAULT '0.00',
  `payment_date` date NOT NULL,
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `subscriber_grade_unit_id` (`subscriber_grade_unit_id`),
  CONSTRAINT `sch_elsubscriberpackagegradeunitpayment_ibfk_1` FOREIGN KEY (`subscriber_grade_unit_id`) REFERENCES `sch_elsubscriberpackagesgradeunits` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_elsubscriberpackages` */

DROP TABLE IF EXISTS `sch_elsubscriberpackages`;

CREATE TABLE `sch_elsubscriberpackages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) unsigned NOT NULL COMMENT 'Package Subscriber',
  `package_id` tinyint(4) unsigned NOT NULL COMMENT 'Package Name',
  `subscribed` enum('0','1') DEFAULT '0' COMMENT 'Package Subscribed',
  `total_fee` double(10,2) DEFAULT '0.00' COMMENT 'Total Fee(Ksh)',
  `view_url` varchar(255) DEFAULT NULL COMMENT 'Link',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscriber_id` (`subscriber_id`,`package_id`),
  KEY `package_id` (`package_id`),
  CONSTRAINT `sch_elsubscriberpackages_ibfk_1` FOREIGN KEY (`subscriber_id`) REFERENCES `sch_elsubscribers` (`id`),
  CONSTRAINT `sch_elsubscriberpackages_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `sch_elsubscriptionpackages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_elsubscriberpackagesgrades` */

DROP TABLE IF EXISTS `sch_elsubscriberpackagesgrades`;

CREATE TABLE `sch_elsubscriberpackagesgrades` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subscriber_package_id` int(11) unsigned NOT NULL COMMENT 'Subscriber Package',
  `subscription_grade_id` int(11) unsigned NOT NULL COMMENT 'Package Grade',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscriber_package_id` (`subscriber_package_id`,`subscription_grade_id`),
  KEY `subscription_grade_id` (`subscription_grade_id`),
  CONSTRAINT `sch_elsubscriberpackagesgrades_ibfk_1` FOREIGN KEY (`subscriber_package_id`) REFERENCES `sch_elsubscriberpackages` (`id`),
  CONSTRAINT `sch_elsubscriberpackagesgrades_ibfk_2` FOREIGN KEY (`subscription_grade_id`) REFERENCES `sch_elsubscriptionpackagegrades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_elsubscriberpackagesgradeunits` */

DROP TABLE IF EXISTS `sch_elsubscriberpackagesgradeunits`;

CREATE TABLE `sch_elsubscriberpackagesgradeunits` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subscriber_grade_id` int(11) unsigned NOT NULL COMMENT 'Subscriber Package Grade',
  `subscription_grade_unit_id` int(11) unsigned NOT NULL COMMENT 'Subscription Grade Unit',
  `subscription_period_id` int(4) unsigned DEFAULT NULL COMMENT 'Subscription Period',
  `subscription_fee` double(10,2) DEFAULT '0.00' COMMENT 'Subscription Fee',
  `duration` int(4) DEFAULT NULL COMMENT 'Duration',
  `no_of_users` int(4) NOT NULL DEFAULT '0' COMMENT 'Number Of Users',
  `start_date` date DEFAULT NULL COMMENT 'Start Date',
  `end_date` date DEFAULT NULL COMMENT 'End Date',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscriber_grade_id` (`subscriber_grade_id`,`subscription_grade_unit_id`),
  KEY `subscription_grade_unit_id` (`subscription_grade_unit_id`),
  KEY `subscription_period_id` (`subscription_period_id`),
  CONSTRAINT `sch_elsubscriberpackagesgradeunits_ibfk_1` FOREIGN KEY (`subscriber_grade_id`) REFERENCES `sch_elsubscriberpackagesgrades` (`id`),
  CONSTRAINT `sch_elsubscriberpackagesgradeunits_ibfk_2` FOREIGN KEY (`subscription_grade_unit_id`) REFERENCES `sch_elsubscriptionpackagegradeunits` (`id`),
  CONSTRAINT `sch_elsubscriberpackagesgradeunits_ibfk_3` FOREIGN KEY (`subscription_period_id`) REFERENCES `sch_elsubscriptionperiod` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_elsubscriberpackagesgradeunitstrack` */

DROP TABLE IF EXISTS `sch_elsubscriberpackagesgradeunitstrack`;

CREATE TABLE `sch_elsubscriberpackagesgradeunitstrack` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subscriber_grade_id` int(11) unsigned NOT NULL COMMENT 'Subscriber Package Grade',
  `subscription_grade_unit_id` int(11) unsigned NOT NULL COMMENT 'Subscription Grade Unit',
  `subscription_fee` double(10,2) DEFAULT '0.00' COMMENT 'Subscription Fee',
  `duration` int(4) DEFAULT NULL COMMENT 'Duration',
  `start_date` date DEFAULT NULL COMMENT 'Start Date',
  `end_date` date DEFAULT NULL COMMENT 'End Date',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `subscription_grade_unit_id` (`subscription_grade_unit_id`),
  KEY `sch_elsubscriberpackagesgradeunitstrack_ibfk_1` (`subscriber_grade_id`),
  CONSTRAINT `sch_elsubscriberpackagesgradeunitstrack_ibfk_1` FOREIGN KEY (`subscriber_grade_id`) REFERENCES `sch_elsubscriberpackagesgrades` (`id`),
  CONSTRAINT `sch_elsubscriberpackagesgradeunitstrack_ibfk_2` FOREIGN KEY (`subscription_grade_unit_id`) REFERENCES `sch_elsubscriptionpackagegradeunits` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sch_elsubscribers` */

DROP TABLE IF EXISTS `sch_elsubscribers`;

CREATE TABLE `sch_elsubscribers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subscriber_name` varchar(255) NOT NULL COMMENT 'Subscriber Name',
  `email` varchar(150) NOT NULL COMMENT 'Email',
  `mobile` varchar(15) NOT NULL COMMENT 'Mobile No',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_elsubscriptionpackagegrades` */

DROP TABLE IF EXISTS `sch_elsubscriptionpackagegrades`;

CREATE TABLE `sch_elsubscriptionpackagegrades` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `grade_name` varchar(150) NOT NULL COMMENT 'Class/Grade Name',
  `description` tinytext COMMENT 'Description',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`grade_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_elsubscriptionpackagegradeunits` */

DROP TABLE IF EXISTS `sch_elsubscriptionpackagegradeunits`;

CREATE TABLE `sch_elsubscriptionpackagegradeunits` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `package_grade_id` int(11) unsigned NOT NULL COMMENT 'Package Grade',
  `package_grade_unit_id` int(11) unsigned NOT NULL COMMENT 'Package Grade Unit',
  `buy_fee` double(10,2) DEFAULT '0.00' COMMENT 'Buy Amount',
  `subscriber_fee` double(10,2) DEFAULT '0.00' COMMENT 'Sell Amount',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `package_grade_id` (`package_grade_id`),
  KEY `sch_elsubscriptionpackagegradeunits_ibfk_2` (`package_grade_unit_id`),
  CONSTRAINT `sch_elsubscriptionpackagegradeunits_ibfk_1` FOREIGN KEY (`package_grade_id`) REFERENCES `sch_elsubscriptionpackagegrades` (`id`),
  CONSTRAINT `sch_elsubscriptionpackagegradeunits_ibfk_2` FOREIGN KEY (`package_grade_unit_id`) REFERENCES `sch_elsubscriptionpackageunits` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_elsubscriptionpackages` */

DROP TABLE IF EXISTS `sch_elsubscriptionpackages`;

CREATE TABLE `sch_elsubscriptionpackages` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `package_name` varchar(150) DEFAULT NULL COMMENT 'Package Name',
  `description` tinytext COMMENT 'Description',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `package_name` (`package_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_elsubscriptionpackageunits` */

DROP TABLE IF EXISTS `sch_elsubscriptionpackageunits`;

CREATE TABLE `sch_elsubscriptionpackageunits` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(150) NOT NULL COMMENT 'Unit Name',
  `description` tinytext NOT NULL COMMENT 'Description',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unit_name` (`unit_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_elsubscriptionperiod` */

DROP TABLE IF EXISTS `sch_elsubscriptionperiod`;

CREATE TABLE `sch_elsubscriptionperiod` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `period_name` varchar(150) NOT NULL COMMENT 'Period Name',
  `description` tinytext COMMENT 'Description',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `period_name` (`period_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_elsubscriptiontypes` */

DROP TABLE IF EXISTS `sch_elsubscriptiontypes`;

CREATE TABLE `sch_elsubscriptiontypes` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(150) NOT NULL COMMENT 'Type Name',
  `description` text COMMENT 'Description',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_examinationitems` */

DROP TABLE IF EXISTS `sch_examinationitems`;

CREATE TABLE `sch_examinationitems` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `class_id` int(11) unsigned NOT NULL,
  `academic_year_term_id` int(11) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` tinytext,
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class_id` (`class_id`,`academic_year_term_id`,`name`),
  KEY `academic_year_term_id` (`academic_year_term_id`),
  CONSTRAINT `sch_examinationitems_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `sch_classes` (`id`),
  CONSTRAINT `sch_examinationitems_ibfk_2` FOREIGN KEY (`academic_year_term_id`) REFERENCES `sch_academicyearterms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_feepayments` */

DROP TABLE IF EXISTS `sch_feepayments`;

CREATE TABLE `sch_feepayments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `studentid` int(11) unsigned NOT NULL COMMENT 'Client Project',
  `studentclasspromotiontermid` int(11) unsigned DEFAULT NULL COMMENT 'Student Class Promotion Term',
  `amountpaid` double(10,2) DEFAULT '0.00' COMMENT 'Paid Amount',
  `paymentdate` date NOT NULL COMMENT 'Payment Date',
  `actual_payment_date` date DEFAULT NULL COMMENT 'Actual Slip payment Date',
  `payidby` varchar(250) DEFAULT NULL COMMENT 'Paid By',
  `paymentmodeid` int(11) NOT NULL COMMENT 'Payment Mode',
  `bankid` int(11) DEFAULT NULL COMMENT 'Bank',
  `description` text COMMENT 'Description',
  `transactionno` varchar(32) DEFAULT NULL COMMENT 'Transaction No',
  `is_reversed` enum('0','1') DEFAULT '0' COMMENT 'Is Reversed',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  `classid` int(11) unsigned DEFAULT NULL COMMENT 'Current Class',
  `termid` tinyint(3) unsigned DEFAULT NULL COMMENT 'Current Term',
  `receiptno` int(11) DEFAULT NULL COMMENT 'Receipt No',
  PRIMARY KEY (`id`),
  KEY `clientprojectid` (`studentid`),
  KEY `paymentmodeid` (`paymentmodeid`),
  KEY `classid` (`classid`),
  KEY `termid` (`termid`),
  KEY `studentclasspromotiontermid` (`studentclasspromotiontermid`),
  CONSTRAINT `sch_feepayments_ibfk_2` FOREIGN KEY (`paymentmodeid`) REFERENCES `paymentmodes` (`id`),
  CONSTRAINT `sch_feepayments_ibfk_3` FOREIGN KEY (`studentid`) REFERENCES `sch_students` (`id`),
  CONSTRAINT `sch_feepayments_ibfk_4` FOREIGN KEY (`classid`) REFERENCES `sch_classes` (`id`),
  CONSTRAINT `sch_feepayments_ibfk_5` FOREIGN KEY (`termid`) REFERENCES `sch_terms` (`id`),
  CONSTRAINT `sch_feepayments_ibfk_6` FOREIGN KEY (`studentclasspromotiontermid`) REFERENCES `sch_studentclassterms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_feepayments_audit` */

DROP TABLE IF EXISTS `sch_feepayments_audit`;

CREATE TABLE `sch_feepayments_audit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pk` int(11) NOT NULL COMMENT 'pk',
  `studentid` int(11) unsigned NOT NULL COMMENT 'Client Project',
  `studentclasspromotiontermid` int(11) unsigned DEFAULT NULL COMMENT 'Student Class Promotion Term',
  `amountpaid` double(10,2) DEFAULT '0.00' COMMENT 'Paid Amount',
  `paymentdate` date NOT NULL COMMENT 'Payment Date',
  `actual_payment_date` date DEFAULT NULL COMMENT 'Actual Slip payment Date',
  `payidby` varchar(250) DEFAULT NULL COMMENT 'Paid By',
  `paymentmodeid` int(11) NOT NULL COMMENT 'Payment Mode',
  `bankid` int(11) DEFAULT NULL COMMENT 'Bank',
  `description` text COMMENT 'Description',
  `transactionno` varchar(32) DEFAULT NULL COMMENT 'Transaction No',
  `is_reversed` enum('0','1') DEFAULT '0' COMMENT 'Is Reversed',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  `classid` int(11) unsigned DEFAULT NULL COMMENT 'Current Class',
  `termid` tinyint(3) unsigned DEFAULT NULL COMMENT 'Current Term',
  `receiptno` int(11) DEFAULT NULL COMMENT 'Receipt No',
  `action` tinyint(2) DEFAULT NULL COMMENT 'Action',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_feestructurevoteheads` */

DROP TABLE IF EXISTS `sch_feestructurevoteheads`;

CREATE TABLE `sch_feestructurevoteheads` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `classid` int(11) unsigned NOT NULL COMMENT 'Class Name',
  `termid` tinyint(3) unsigned NOT NULL COMMENT 'Term Name',
  `voteheadid` int(11) unsigned NOT NULL,
  `amount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Vote Head Amount',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Activate/Deactivate',
  `remarks` varchar(250) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `classid` (`classid`,`termid`,`voteheadid`),
  KEY `termid` (`termid`),
  KEY `voteheadid` (`voteheadid`),
  CONSTRAINT `sch_feestructurevoteheads_ibfk_1` FOREIGN KEY (`classid`) REFERENCES `sch_classes` (`id`),
  CONSTRAINT `sch_feestructurevoteheads_ibfk_2` FOREIGN KEY (`termid`) REFERENCES `sch_terms` (`id`),
  CONSTRAINT `sch_feestructurevoteheads_ibfk_3` FOREIGN KEY (`voteheadid`) REFERENCES `sch_voteheads` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_feestructurevoteheadslog` */

DROP TABLE IF EXISTS `sch_feestructurevoteheadslog`;

CREATE TABLE `sch_feestructurevoteheadslog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `structurevoteheadid` int(11) unsigned NOT NULL COMMENT 'Fee Structure Votehead',
  `actionid` tinyint(3) unsigned NOT NULL COMMENT 'Action',
  `createdon` date DEFAULT NULL,
  `createby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `structurevoteheadid` (`structurevoteheadid`),
  KEY `actionid` (`actionid`),
  CONSTRAINT `sch_feestructurevoteheadslog_ibfk_1` FOREIGN KEY (`structurevoteheadid`) REFERENCES `sch_feestructurevoteheads` (`id`),
  CONSTRAINT `sch_feestructurevoteheadslog_ibfk_2` FOREIGN KEY (`actionid`) REFERENCES `sys_actions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_gardians` */

DROP TABLE IF EXISTS `sch_gardians`;

CREATE TABLE `sch_gardians` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `surname` varchar(32) DEFAULT NULL COMMENT 'Surname',
  `othernames` varchar(32) DEFAULT NULL COMMENT 'Other Names',
  `nationalityid` int(11) unsigned DEFAULT NULL COMMENT 'Nationality',
  `nationalid` int(10) DEFAULT NULL COMMENT 'National ID',
  `homeaddress` text COMMENT 'Home Address',
  `mobile` varchar(15) DEFAULT NULL COMMENT 'Active Mobile Number',
  `countyid` int(11) DEFAULT NULL COMMENT 'County Name',
  `emailaddress` text COMMENT 'Email Address',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `fathername` varchar(250) DEFAULT NULL COMMENT 'Father Name',
  `fathermobileno` varchar(20) DEFAULT NULL COMMENT 'Father Mobile Number',
  `fatheralivestatusid` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Father Alive',
  `mothername` varchar(250) DEFAULT NULL COMMENT 'Mother Name',
  `mothermobileno` varchar(20) DEFAULT NULL COMMENT 'Mother Mobile Number',
  `motheralivestatusid` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Mother Alive',
  PRIMARY KEY (`id`),
  KEY `fksch_gardiansrefsch_nationalities` (`nationalityid`),
  KEY `countyid` (`countyid`),
  KEY `fatheralivestatusid` (`fatheralivestatusid`),
  KEY `motheralivestatusid` (`motheralivestatusid`),
  CONSTRAINT `sch_gardians_ibfk_1` FOREIGN KEY (`countyid`) REFERENCES `sys_countys` (`id`),
  CONSTRAINT `sch_gardians_ibfk_2` FOREIGN KEY (`nationalityid`) REFERENCES `sch_nationalities` (`id`),
  CONSTRAINT `sch_gardians_ibfk_3` FOREIGN KEY (`fatheralivestatusid`) REFERENCES `sch_gurdianstate` (`id`),
  CONSTRAINT `sch_gardians_ibfk_4` FOREIGN KEY (`motheralivestatusid`) REFERENCES `sch_gurdianstate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_graderangemarks` */

DROP TABLE IF EXISTS `sch_graderangemarks`;

CREATE TABLE `sch_graderangemarks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `marksfrom` double(10,1) NOT NULL DEFAULT '0.0' COMMENT 'Lower Range Mark',
  `marksto` double(10,1) NOT NULL DEFAULT '0.0' COMMENT 'Upper Range Mark',
  `gradeid` tinyint(3) unsigned NOT NULL COMMENT 'Grade/Comment',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `marksfrom` (`marksfrom`,`marksto`,`gradeid`),
  KEY `gradeid` (`gradeid`),
  CONSTRAINT `sch_graderangemarks_ibfk_1` FOREIGN KEY (`gradeid`) REFERENCES `sch_grades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_grades` */

DROP TABLE IF EXISTS `sch_grades`;

CREATE TABLE `sch_grades` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT 'Grade Name',
  `description` tinytext COMMENT 'Description',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_invoicepayments` */

DROP TABLE IF EXISTS `sch_invoicepayments`;

CREATE TABLE `sch_invoicepayments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `invoiceid` int(11) unsigned NOT NULL COMMENT 'Invoice',
  `paymentid` int(11) unsigned NOT NULL COMMENT 'Payment Transaction',
  `balance` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Invoice Balance',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `invoiceid` (`invoiceid`),
  KEY `paymentid` (`paymentid`),
  CONSTRAINT `sch_invoicepayments_ibfk_1` FOREIGN KEY (`invoiceid`) REFERENCES `sch_schfeeidnvoices` (`id`),
  CONSTRAINT `sch_invoicepayments_ibfk_2` FOREIGN KEY (`paymentid`) REFERENCES `sch_feepayments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sch_lbbookcategories` */

DROP TABLE IF EXISTS `sch_lbbookcategories`;

CREATE TABLE `sch_lbbookcategories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL COMMENT 'Category Name',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is ACtive',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_lbbookissuance` */

DROP TABLE IF EXISTS `sch_lbbookissuance`;

CREATE TABLE `sch_lbbookissuance` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `studentid` int(11) unsigned NOT NULL COMMENT 'Staff Name',
  `issuedate` date DEFAULT NULL COMMENT 'Date Issued',
  `duedate` date DEFAULT NULL COMMENT 'Due Date',
  `remarks` varchar(250) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `studentid` (`studentid`),
  CONSTRAINT `sch_lbbookissuance_ibfk_1` FOREIGN KEY (`studentid`) REFERENCES `sch_teachers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_lbbookreturns` */

DROP TABLE IF EXISTS `sch_lbbookreturns`;

CREATE TABLE `sch_lbbookreturns` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `studentid` int(11) unsigned NOT NULL COMMENT 'Student Name',
  `returneddate` date NOT NULL COMMENT 'Date Returned',
  `remarks` varchar(250) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is ACtive',
  PRIMARY KEY (`id`),
  KEY `studentid` (`studentid`),
  CONSTRAINT `sch_lbbookreturns_ibfk_1` FOREIGN KEY (`studentid`) REFERENCES `sch_teachers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_lbbookscopiesregistration` */

DROP TABLE IF EXISTS `sch_lbbookscopiesregistration`;

CREATE TABLE `sch_lbbookscopiesregistration` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bookcategoryid` int(11) unsigned NOT NULL COMMENT 'Book Category',
  `booktitleid` int(11) unsigned NOT NULL COMMENT 'Book Title',
  `registrationno` varchar(32) DEFAULT NULL COMMENT 'Registration No',
  `isbncode` varchar(32) DEFAULT NULL COMMENT 'ISBN Code',
  `classid` int(11) DEFAULT NULL COMMENT 'Class',
  `subjectid` int(11) DEFAULT NULL COMMENT 'Subject',
  `is_issued` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'Is Book Issued',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bookcategoryid` (`bookcategoryid`,`booktitleid`,`registrationno`),
  KEY `booktitleid` (`booktitleid`),
  CONSTRAINT `sch_lbbookscopiesregistration_ibfk_1` FOREIGN KEY (`bookcategoryid`) REFERENCES `sch_lbbookcategories` (`id`),
  CONSTRAINT `sch_lbbookscopiesregistration_ibfk_2` FOREIGN KEY (`booktitleid`) REFERENCES `sch_lbbookstitles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_lbbookstitles` */

DROP TABLE IF EXISTS `sch_lbbookstitles`;

CREATE TABLE `sch_lbbookstitles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bookcategoryid` int(11) unsigned NOT NULL COMMENT 'Book Category',
  `bookname` varchar(250) NOT NULL COMMENT 'Book Name',
  `bookouther` varchar(250) DEFAULT NULL COMMENT 'Book Author',
  `publisher` varchar(250) DEFAULT NULL COMMENT 'Publisher',
  `publishingdate` date DEFAULT NULL COMMENT 'Publishing Date',
  `edition` varchar(20) DEFAULT NULL COMMENT 'Edition',
  `lendingfee` double(10,2) DEFAULT '0.00' COMMENT 'Lending Price',
  `buyingprice` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Buying Price',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `bookcategoryid` (`bookcategoryid`),
  CONSTRAINT `sch_lbbookstitles_ibfk_1` FOREIGN KEY (`bookcategoryid`) REFERENCES `sch_lbbookcategories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_lbstudentbookretrned` */

DROP TABLE IF EXISTS `sch_lbstudentbookretrned`;

CREATE TABLE `sch_lbstudentbookretrned` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `returnid` int(11) unsigned NOT NULL COMMENT 'Return',
  `bookid` int(11) unsigned NOT NULL COMMENT 'Book Id',
  `penaltyincoured` double(10,2) DEFAULT '0.00' COMMENT 'Penalyt Incured',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `returnid` (`returnid`),
  KEY `bookid` (`bookid`),
  CONSTRAINT `sch_lbstudentbookretrned_ibfk_1` FOREIGN KEY (`returnid`) REFERENCES `sch_lbbookreturns` (`id`),
  CONSTRAINT `sch_lbstudentbookretrned_ibfk_2` FOREIGN KEY (`bookid`) REFERENCES `sch_lbbookscopiesregistration` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_lbstudentissuedbooks` */

DROP TABLE IF EXISTS `sch_lbstudentissuedbooks`;

CREATE TABLE `sch_lbstudentissuedbooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bookissuanceid` int(11) unsigned NOT NULL COMMENT 'Dook Issuance',
  `bookid` int(11) unsigned NOT NULL COMMENT 'Book',
  `is_returned` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'Is Book Returned',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `bookissuanceid` (`bookissuanceid`),
  KEY `bookid` (`bookid`),
  CONSTRAINT `sch_lbstudentissuedbooks_ibfk_1` FOREIGN KEY (`bookissuanceid`) REFERENCES `sch_lbbookissuance` (`id`),
  CONSTRAINT `sch_lbstudentissuedbooks_ibfk_2` FOREIGN KEY (`bookid`) REFERENCES `sch_lbbookscopiesregistration` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_lbstudentpenalizedbooks` */

DROP TABLE IF EXISTS `sch_lbstudentpenalizedbooks`;

CREATE TABLE `sch_lbstudentpenalizedbooks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bookissuanceid` int(11) unsigned NOT NULL COMMENT 'Book Insuance',
  `bookid` int(11) unsigned NOT NULL COMMENT 'Book',
  `penalty` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Penalty Incured',
  `penalizedon` date NOT NULL COMMENT 'Penalty Date',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `bookissuanceid` (`bookissuanceid`),
  KEY `bookid` (`bookid`),
  CONSTRAINT `sch_lbstudentpenalizedbooks_ibfk_1` FOREIGN KEY (`bookissuanceid`) REFERENCES `sch_lbbookissuance` (`id`),
  CONSTRAINT `sch_lbstudentpenalizedbooks_ibfk_2` FOREIGN KEY (`bookid`) REFERENCES `sch_lbbookscopiesregistration` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_lnlostbooks` */

DROP TABLE IF EXISTS `sch_lnlostbooks`;

CREATE TABLE `sch_lnlostbooks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bookid` int(11) unsigned NOT NULL COMMENT 'Book Registration',
  `bookissuanceid` int(11) unsigned NOT NULL COMMENT 'Book Insuance',
  `datelost` date NOT NULL COMMENT 'Date Marked As Lost',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `bookid` (`bookid`),
  KEY `bookissuanceid` (`bookissuanceid`),
  CONSTRAINT `sch_lnlostbooks_ibfk_1` FOREIGN KEY (`bookid`) REFERENCES `sch_lbbookscopiesregistration` (`id`),
  CONSTRAINT `sch_lnlostbooks_ibfk_2` FOREIGN KEY (`bookissuanceid`) REFERENCES `sch_lbbookissuance` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_logvalidateschfeeidnvoicedetails` */

DROP TABLE IF EXISTS `sch_logvalidateschfeeidnvoicedetails`;

CREATE TABLE `sch_logvalidateschfeeidnvoicedetails` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `logid` int(11) unsigned NOT NULL COMMENT 'Validation Log',
  `feestructurevoteheadsid` int(11) DEFAULT NULL COMMENT 'Fee Charge',
  `amount` double(10,2) DEFAULT '0.00' COMMENT 'Amount',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `logid` (`logid`),
  CONSTRAINT `sch_logvalidateschfeeidnvoicedetails_ibfk_1` FOREIGN KEY (`logid`) REFERENCES `sch_logvalidateschfeeidnvoices` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_logvalidateschfeeidnvoices` */

DROP TABLE IF EXISTS `sch_logvalidateschfeeidnvoices`;

CREATE TABLE `sch_logvalidateschfeeidnvoices` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `studentclasstermsid` int(11) DEFAULT NULL COMMENT 'Student Class Term',
  `invoicedate` date DEFAULT NULL COMMENT 'Invoice Date',
  `invoiceno` varchar(32) DEFAULT NULL COMMENT 'Invoice No',
  `amount` double(10,2) DEFAULT NULL COMMENT 'Amount',
  `balance` double(10,2) DEFAULT NULL COMMENT 'Balance',
  `response` text COMMENT 'Response',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_logvalidatestudentservicesinvoices` */

DROP TABLE IF EXISTS `sch_logvalidatestudentservicesinvoices`;

CREATE TABLE `sch_logvalidatestudentservicesinvoices` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `logid` int(11) unsigned NOT NULL COMMENT 'Validation Log',
  `studentserviceid` int(11) DEFAULT NULL COMMENT 'Student Service',
  `amount` double(10,2) DEFAULT '0.00' COMMENT 'Amount',
  `balance` double(10,2) DEFAULT '0.00' COMMENT 'Balance',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `logid` (`logid`),
  CONSTRAINT `sch_logvalidatestudentservicesinvoices_ibfk_1` FOREIGN KEY (`logid`) REFERENCES `sch_logvalidateschfeeidnvoices` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_paidarrears` */

DROP TABLE IF EXISTS `sch_paidarrears`;

CREATE TABLE `sch_paidarrears` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `paymentid` int(11) unsigned NOT NULL COMMENT 'Payment Transaction',
  `amount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Arrears Amount Paid',
  `paidon` date DEFAULT NULL COMMENT 'Date Paid',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `paymentid` (`paymentid`),
  CONSTRAINT `sch_paidarrears_ibfk_1` FOREIGN KEY (`paymentid`) REFERENCES `sch_feepayments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_payablepayments` */

DROP TABLE IF EXISTS `sch_payablepayments`;

CREATE TABLE `sch_payablepayments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `paymenttermid` int(11) NOT NULL COMMENT 'Payment Term',
  `studentclasspromotionid` int(11) unsigned NOT NULL COMMENT 'Class Promotion',
  `paymentid` int(10) unsigned NOT NULL COMMENT 'Fee Payment',
  `documentno` varchar(32) DEFAULT NULL COMMENT 'Document No',
  `transactionno` varchar(32) DEFAULT NULL COMMENT 'Transaction No',
  `paymentmodeid` int(11) NOT NULL COMMENT 'Payment Mode',
  `bankid` int(11) DEFAULT NULL COMMENT 'Bank',
  `paidon` date DEFAULT NULL COMMENT 'Payment date',
  `amount` double(10,2) DEFAULT '0.00' COMMENT 'Amount Paid',
  `remarks` text COMMENT 'Remarks',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `paymenttermid` (`paymenttermid`),
  KEY `studentclasspromotionid` (`studentclasspromotionid`),
  KEY `paymentmodeid` (`paymentmodeid`),
  KEY `paymentid` (`paymentid`),
  CONSTRAINT `sch_payablepayments_ibfk_1` FOREIGN KEY (`paymenttermid`) REFERENCES `paymentterms` (`id`),
  CONSTRAINT `sch_payablepayments_ibfk_2` FOREIGN KEY (`studentclasspromotionid`) REFERENCES `sch_studentclassterms` (`id`),
  CONSTRAINT `sch_payablepayments_ibfk_3` FOREIGN KEY (`paymentmodeid`) REFERENCES `paymentmodes` (`id`),
  CONSTRAINT `sch_payablepayments_ibfk_4` FOREIGN KEY (`paymentid`) REFERENCES `sch_feepayments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_payablepayments_audit` */

DROP TABLE IF EXISTS `sch_payablepayments_audit`;

CREATE TABLE `sch_payablepayments_audit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pk` int(11) unsigned NOT NULL,
  `paymenttermid` int(11) NOT NULL COMMENT 'Payment Term',
  `studentclasspromotionid` int(11) unsigned NOT NULL COMMENT 'Class Promotion',
  `paymentid` int(10) unsigned NOT NULL COMMENT 'Fee Payment',
  `documentno` varchar(32) DEFAULT NULL COMMENT 'Document No',
  `transactionno` varchar(32) DEFAULT NULL COMMENT 'Transaction No',
  `paymentmodeid` int(11) NOT NULL COMMENT 'Payment Mode',
  `bankid` int(11) DEFAULT NULL COMMENT 'Bank',
  `paidon` date DEFAULT NULL COMMENT 'Payment date',
  `amount` double(10,2) DEFAULT '0.00' COMMENT 'Amount Paid',
  `remarks` text COMMENT 'Remarks',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `action` tinyint(2) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_reversedfeepayments` */

DROP TABLE IF EXISTS `sch_reversedfeepayments`;

CREATE TABLE `sch_reversedfeepayments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `feepaymentid` int(10) unsigned DEFAULT NULL COMMENT 'Fee Payment',
  `studentid` int(11) unsigned NOT NULL COMMENT 'Client Project',
  `amountpaid` double(10,2) DEFAULT '0.00' COMMENT 'Paid Amount',
  `paymentdate` date NOT NULL COMMENT 'Payment Date',
  `payidby` varchar(250) DEFAULT NULL COMMENT 'Paid By',
  `paymentmodeid` int(11) NOT NULL COMMENT 'Payment Mode',
  `bankid` int(11) DEFAULT NULL COMMENT 'Bank',
  `description` text COMMENT 'Description',
  `transactionno` varchar(32) DEFAULT NULL COMMENT 'Transaction No',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  `classid` int(11) unsigned DEFAULT NULL COMMENT 'Current Class',
  `termid` tinyint(3) unsigned DEFAULT NULL COMMENT 'Current Term',
  `reversedon` date NOT NULL COMMENT 'Reversal Date',
  `reversedby` int(11) NOT NULL COMMENT 'Reversed By',
  `comments` varchar(250) DEFAULT NULL COMMENT 'Reversal Comments',
  PRIMARY KEY (`id`),
  KEY `clientprojectid` (`studentid`),
  KEY `paymentmodeid` (`paymentmodeid`),
  KEY `classid` (`classid`),
  KEY `termid` (`termid`),
  KEY `feepaymentid` (`feepaymentid`),
  CONSTRAINT `sch_reversedfeepayments_ibfk_2` FOREIGN KEY (`paymentmodeid`) REFERENCES `paymentmodes` (`id`),
  CONSTRAINT `sch_reversedfeepayments_ibfk_3` FOREIGN KEY (`studentid`) REFERENCES `sch_students` (`id`),
  CONSTRAINT `sch_reversedfeepayments_ibfk_4` FOREIGN KEY (`classid`) REFERENCES `sch_classes` (`id`),
  CONSTRAINT `sch_reversedfeepayments_ibfk_5` FOREIGN KEY (`termid`) REFERENCES `sch_terms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_reversedpaidarrears` */

DROP TABLE IF EXISTS `sch_reversedpaidarrears`;

CREATE TABLE `sch_reversedpaidarrears` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reversedpaymentid` int(11) unsigned NOT NULL COMMENT 'Payment Transaction',
  `amount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Arrears Amount Paid',
  `paidon` date DEFAULT NULL COMMENT 'Date Paid',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `reversedpaymentid` (`reversedpaymentid`),
  CONSTRAINT `sch_reversedpaidarrears_ibfk_1` FOREIGN KEY (`reversedpaymentid`) REFERENCES `sch_reversedfeepayments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_reversedpayablepayments` */

DROP TABLE IF EXISTS `sch_reversedpayablepayments`;

CREATE TABLE `sch_reversedpayablepayments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `paymenttermid` int(11) NOT NULL COMMENT 'Payment Term',
  `studentclasspromotionid` int(11) unsigned NOT NULL COMMENT 'Class Promotion',
  `reversedpaymentid` int(10) unsigned NOT NULL COMMENT 'Fee Payment',
  `documentno` varchar(32) DEFAULT NULL COMMENT 'Document No',
  `transactionno` varchar(32) DEFAULT NULL COMMENT 'Transaction No',
  `paymentmodeid` int(11) NOT NULL COMMENT 'Payment Mode',
  `bankid` int(11) DEFAULT NULL COMMENT 'Bank',
  `paidon` date DEFAULT NULL COMMENT 'Payment date',
  `amount` double(10,2) DEFAULT '0.00' COMMENT 'Amount Paid',
  `remarks` text COMMENT 'Remarks',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `paymenttermid` (`paymenttermid`),
  KEY `studentclasspromotionid` (`studentclasspromotionid`),
  KEY `paymentmodeid` (`paymentmodeid`),
  KEY `reversedpaymentid` (`reversedpaymentid`),
  CONSTRAINT `sch_reversedpayablepayments_ibfk_1` FOREIGN KEY (`paymenttermid`) REFERENCES `paymentterms` (`id`),
  CONSTRAINT `sch_reversedpayablepayments_ibfk_2` FOREIGN KEY (`studentclasspromotionid`) REFERENCES `sch_studentclassterms` (`id`),
  CONSTRAINT `sch_reversedpayablepayments_ibfk_3` FOREIGN KEY (`paymentmodeid`) REFERENCES `paymentmodes` (`id`),
  CONSTRAINT `sch_reversedpayablepayments_ibfk_4` FOREIGN KEY (`reversedpaymentid`) REFERENCES `sch_reversedfeepayments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_reversedschfeeinvoicedetails` */

DROP TABLE IF EXISTS `sch_reversedschfeeinvoicedetails`;

CREATE TABLE `sch_reversedschfeeinvoicedetails` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reversedinvoiceid` int(11) unsigned NOT NULL COMMENT 'Invoice',
  `feestructurevoteheadsid` int(11) unsigned NOT NULL COMMENT 'Feestructure Votehead',
  `amount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Votehead Invoicing Amount',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `reversedinvoiceid` (`reversedinvoiceid`),
  KEY `feestructurevoteheadsid` (`feestructurevoteheadsid`),
  CONSTRAINT `sch_reversedschfeeinvoicedetails_ibfk_1` FOREIGN KEY (`reversedinvoiceid`) REFERENCES `sch_reversedschfeeinvoices` (`id`),
  CONSTRAINT `sch_reversedschfeeinvoicedetails_ibfk_2` FOREIGN KEY (`feestructurevoteheadsid`) REFERENCES `sch_feestructurevoteheads` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=453 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_reversedschfeeinvoices` */

DROP TABLE IF EXISTS `sch_reversedschfeeinvoices`;

CREATE TABLE `sch_reversedschfeeinvoices` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `invoiceid` int(11) unsigned DEFAULT NULL COMMENT 'Invoice Reversed',
  `studentid` int(11) unsigned NOT NULL COMMENT 'Student Name',
  `invoicedate` date NOT NULL COMMENT 'Invoice Date',
  `invoiceno` varchar(32) NOT NULL COMMENT 'Invoice No',
  `amount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Total Invoice Amount',
  `balance` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Balance Due',
  `classid` int(11) unsigned DEFAULT NULL COMMENT 'Current Class',
  `termid` tinyint(3) unsigned DEFAULT NULL COMMENT 'Current Term',
  `studentclasstermsid` int(11) unsigned DEFAULT NULL COMMENT 'Student Class Term',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `reversedon` date NOT NULL COMMENT 'Date Reversed',
  `reversedby` int(11) NOT NULL COMMENT 'Reversed By',
  PRIMARY KEY (`id`),
  KEY `studentid` (`studentid`),
  KEY `classid` (`classid`),
  KEY `termid` (`termid`),
  KEY `studentclasstermsid` (`studentclasstermsid`),
  KEY `invoiceid` (`invoiceid`),
  CONSTRAINT `sch_reversedschfeeinvoices_ibfk_1` FOREIGN KEY (`studentid`) REFERENCES `sch_students` (`id`),
  CONSTRAINT `sch_reversedschfeeinvoices_ibfk_2` FOREIGN KEY (`classid`) REFERENCES `sch_classes` (`id`),
  CONSTRAINT `sch_reversedschfeeinvoices_ibfk_3` FOREIGN KEY (`termid`) REFERENCES `sch_terms` (`id`),
  CONSTRAINT `sch_reversedschfeeinvoices_ibfk_4` FOREIGN KEY (`studentclasstermsid`) REFERENCES `sch_studentclassterms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_reversedschservicespayments` */

DROP TABLE IF EXISTS `sch_reversedschservicespayments`;

CREATE TABLE `sch_reversedschservicespayments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `studentserviceid` int(11) unsigned NOT NULL COMMENT 'Student Service',
  `reversedpaymentid` int(11) unsigned NOT NULL COMMENT 'Payment Transaction',
  `amount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Service Amount Paid',
  `balance` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Balance',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `studentserviceid` (`studentserviceid`),
  KEY `reversedpaymentid` (`reversedpaymentid`),
  CONSTRAINT `sch_reversedschservicespayments_ibfk_1` FOREIGN KEY (`studentserviceid`) REFERENCES `sch_schstudentservices` (`id`),
  CONSTRAINT `sch_reversedschservicespayments_ibfk_2` FOREIGN KEY (`reversedpaymentid`) REFERENCES `sch_reversedfeepayments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_reversedschvoteheadspayments` */

DROP TABLE IF EXISTS `sch_reversedschvoteheadspayments`;

CREATE TABLE `sch_reversedschvoteheadspayments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reversedpaymentid` int(11) unsigned NOT NULL,
  `voteheadid` int(11) unsigned NOT NULL,
  `amount` double(10,2) DEFAULT '0.00',
  `balance` double(10,2) DEFAULT '0.00',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `reversedpaymentid` (`reversedpaymentid`,`voteheadid`),
  KEY `voteheadid` (`voteheadid`),
  CONSTRAINT `sch_reversedschvoteheadspayments_ibfk_1` FOREIGN KEY (`voteheadid`) REFERENCES `sch_voteheads` (`id`),
  CONSTRAINT `sch_reversedschvoteheadspayments_ibfk_2` FOREIGN KEY (`reversedpaymentid`) REFERENCES `sch_reversedfeepayments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_reversedstudentservicesinvoices` */

DROP TABLE IF EXISTS `sch_reversedstudentservicesinvoices`;

CREATE TABLE `sch_reversedstudentservicesinvoices` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reversedinvoiceid` int(11) unsigned NOT NULL COMMENT 'Invoice',
  `studentserviceid` int(11) unsigned NOT NULL COMMENT 'Student Service',
  `amount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Service Value',
  `balance` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Balance Due',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `reversedinvoiceid` (`reversedinvoiceid`),
  KEY `studentserviceid` (`studentserviceid`),
  CONSTRAINT `sch_reversedstudentservicesinvoices_ibfk_1` FOREIGN KEY (`reversedinvoiceid`) REFERENCES `sch_reversedschfeeinvoices` (`id`),
  CONSTRAINT `sch_reversedstudentservicesinvoices_ibfk_2` FOREIGN KEY (`studentserviceid`) REFERENCES `sch_schstudentservices` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_schcalenderevents` */

DROP TABLE IF EXISTS `sch_schcalenderevents`;

CREATE TABLE `sch_schcalenderevents` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT 'Event Name',
  `description` text COMMENT 'Event Description',
  `academicyearid` int(11) unsigned NOT NULL COMMENT 'Academic Year',
  `academicyeartermid` int(11) unsigned NOT NULL COMMENT 'Academic Term',
  `startdate` date NOT NULL COMMENT 'Expected Start Date',
  `enddate` date NOT NULL COMMENT 'Expected End Date',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `academicyearid` (`academicyearid`),
  KEY `academicyeartermid` (`academicyeartermid`),
  CONSTRAINT `sch_schcalenderevents_ibfk_1` FOREIGN KEY (`academicyearid`) REFERENCES `sch_academicyear` (`id`),
  CONSTRAINT `sch_schcalenderevents_ibfk_2` FOREIGN KEY (`academicyeartermid`) REFERENCES `sch_academicyearterms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_schfeeidnvoicedetails` */

DROP TABLE IF EXISTS `sch_schfeeidnvoicedetails`;

CREATE TABLE `sch_schfeeidnvoicedetails` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `invoiceid` int(11) unsigned NOT NULL COMMENT 'Invoice',
  `feestructurevoteheadsid` int(11) unsigned NOT NULL COMMENT 'Feestructure Votehead',
  `amount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Votehead Invoicing Amount',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `invoiceid` (`invoiceid`),
  KEY `feestructurevoteheadsid` (`feestructurevoteheadsid`),
  CONSTRAINT `sch_schfeeidnvoicedetails_ibfk_1` FOREIGN KEY (`invoiceid`) REFERENCES `sch_schfeeidnvoices` (`id`),
  CONSTRAINT `sch_schfeeidnvoicedetails_ibfk_2` FOREIGN KEY (`feestructurevoteheadsid`) REFERENCES `sch_feestructurevoteheads` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=403 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_schfeeidnvoicedetails_audit` */

DROP TABLE IF EXISTS `sch_schfeeidnvoicedetails_audit`;

CREATE TABLE `sch_schfeeidnvoicedetails_audit` (
  `audit_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id` int(11) unsigned DEFAULT NULL,
  `invoiceid` int(11) unsigned DEFAULT NULL COMMENT 'Invoice',
  `feestructurevoteheadsid` int(11) unsigned DEFAULT NULL COMMENT 'Feestructure Votehead',
  `amount` double(10,2) DEFAULT NULL COMMENT 'Votehead Invoicing Amount',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT NULL COMMENT 'Is Active',
  PRIMARY KEY (`audit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=428 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_schfeeidnvoices` */

DROP TABLE IF EXISTS `sch_schfeeidnvoices`;

CREATE TABLE `sch_schfeeidnvoices` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `studentid` int(11) unsigned NOT NULL COMMENT 'Student Name',
  `invoicedate` date NOT NULL COMMENT 'Invoice Date',
  `invoiceno` varchar(32) NOT NULL COMMENT 'Invoice No',
  `amount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Total Invoice Amount',
  `balance` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Balance Due',
  `classid` int(11) unsigned DEFAULT NULL COMMENT 'Current Class',
  `termid` tinyint(3) unsigned DEFAULT NULL COMMENT 'Current Term',
  `studentclasstermsid` int(11) unsigned DEFAULT NULL COMMENT 'Student Class Term',
  `is_reversed` enum('0','1') DEFAULT '0' COMMENT 'Is Reversed',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) NOT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoiceno` (`invoiceno`),
  KEY `studentid` (`studentid`),
  KEY `classid` (`classid`),
  KEY `termid` (`termid`),
  KEY `studentclasstermsid` (`studentclasstermsid`),
  CONSTRAINT `sch_schfeeidnvoices_ibfk_1` FOREIGN KEY (`studentid`) REFERENCES `sch_students` (`id`),
  CONSTRAINT `sch_schfeeidnvoices_ibfk_2` FOREIGN KEY (`classid`) REFERENCES `sch_classes` (`id`),
  CONSTRAINT `sch_schfeeidnvoices_ibfk_3` FOREIGN KEY (`termid`) REFERENCES `sch_terms` (`id`),
  CONSTRAINT `sch_schfeeidnvoices_ibfk_4` FOREIGN KEY (`studentclasstermsid`) REFERENCES `sch_studentclassterms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_schfeeidnvoices_audit` */

DROP TABLE IF EXISTS `sch_schfeeidnvoices_audit`;

CREATE TABLE `sch_schfeeidnvoices_audit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pk` int(11) unsigned NOT NULL COMMENT 'pk',
  `studentid` int(11) unsigned NOT NULL COMMENT 'Student Name',
  `invoicedate` date NOT NULL COMMENT 'Invoice Date',
  `invoiceno` varchar(32) NOT NULL COMMENT 'Invoice No',
  `amount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Total Invoice Amount',
  `balance` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Balance Due',
  `classid` int(11) unsigned DEFAULT NULL COMMENT 'Current Class',
  `termid` tinyint(3) unsigned DEFAULT NULL COMMENT 'Current Term',
  `studentclasstermsid` int(11) unsigned DEFAULT NULL COMMENT 'Student Class Term',
  `is_reversed` enum('0','1') DEFAULT '0' COMMENT 'Is Reversed',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) NOT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `action` tinyint(2) DEFAULT NULL COMMENT 'Action',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_schoolservices` */

DROP TABLE IF EXISTS `sch_schoolservices`;

CREATE TABLE `sch_schoolservices` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `servicedurationid` tinyint(3) unsigned DEFAULT NULL COMMENT 'School Service Duration',
  `paymenttermid` int(11) DEFAULT NULL COMMENT 'Payment Term',
  `name` varchar(100) NOT NULL COMMENT 'Service Name',
  `coast` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Service Coast',
  `is_transport_route` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'Is Transport Route',
  `invoiced_once` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'Invoiced Once?',
  `description` varchar(32) DEFAULT NULL COMMENT 'Description',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `branch_id` int(11) unsigned DEFAULT NULL COMMENT 'Branch Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `paymenttermid` (`paymenttermid`,`branch_id`),
  KEY `name` (`name`),
  KEY `servicedurationid` (`servicedurationid`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `sch_schoolservices_ibfk_1` FOREIGN KEY (`servicedurationid`) REFERENCES `sch_schservicesdurations` (`id`),
  CONSTRAINT `sch_schoolservices_ibfk_2` FOREIGN KEY (`paymenttermid`) REFERENCES `paymentterms` (`id`),
  CONSTRAINT `sch_schoolservices_ibfk_3` FOREIGN KEY (`branch_id`) REFERENCES `auth_branches` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_schservicesdurations` */

DROP TABLE IF EXISTS `sch_schservicesdurations`;

CREATE TABLE `sch_schservicesdurations` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT 'Duration Name',
  `description` text COMMENT 'Descritption',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_schservicespayments` */

DROP TABLE IF EXISTS `sch_schservicespayments`;

CREATE TABLE `sch_schservicespayments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `studentserviceid` int(11) unsigned NOT NULL COMMENT 'Student Service',
  `paymentid` int(11) unsigned NOT NULL COMMENT 'Payment Transaction',
  `amount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Service Amount Paid',
  `balance` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Balance',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `studentserviceid` (`studentserviceid`),
  KEY `paymentid` (`paymentid`),
  CONSTRAINT `sch_schservicespayments_ibfk_1` FOREIGN KEY (`studentserviceid`) REFERENCES `sch_schstudentservices` (`id`),
  CONSTRAINT `sch_schservicespayments_ibfk_2` FOREIGN KEY (`paymentid`) REFERENCES `sch_feepayments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_schservicespayments_audit` */

DROP TABLE IF EXISTS `sch_schservicespayments_audit`;

CREATE TABLE `sch_schservicespayments_audit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pk` int(11) NOT NULL COMMENT 'pk',
  `studentserviceid` int(11) unsigned NOT NULL COMMENT 'Student Service',
  `paymentid` int(11) unsigned NOT NULL COMMENT 'Payment Transaction',
  `amount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Service Amount Paid',
  `balance` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Balance',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `action` tinyint(2) DEFAULT NULL COMMENT 'Action',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sch_schstudentservices` */

DROP TABLE IF EXISTS `sch_schstudentservices`;

CREATE TABLE `sch_schstudentservices` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `studentid` int(11) unsigned NOT NULL COMMENT 'Student Name',
  `studentclasspromotiontermid` int(11) unsigned DEFAULT NULL COMMENT 'Promotion Class Term',
  `serviceid` int(11) unsigned NOT NULL COMMENT 'School Service',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Status',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `studentid` (`studentid`,`serviceid`,`studentclasspromotiontermid`),
  KEY `serviceid` (`serviceid`),
  KEY `studentclasspromotiontermid` (`studentclasspromotiontermid`),
  CONSTRAINT `sch_schstudentservices_ibfk_1` FOREIGN KEY (`studentid`) REFERENCES `sch_students` (`id`),
  CONSTRAINT `sch_schstudentservices_ibfk_3` FOREIGN KEY (`studentclasspromotiontermid`) REFERENCES `sch_studentclassterms` (`id`),
  CONSTRAINT `sch_schstudentservices_ibfk_4` FOREIGN KEY (`serviceid`) REFERENCES `sch_schoolservices` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2922 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_schstudentservices_audit` */

DROP TABLE IF EXISTS `sch_schstudentservices_audit`;

CREATE TABLE `sch_schstudentservices_audit` (
  `audit_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id` int(11) unsigned NOT NULL,
  `studentid` int(11) unsigned NOT NULL COMMENT 'Student Name',
  `studentclasspromotiontermid` int(11) unsigned DEFAULT NULL COMMENT 'Promotion Class Term',
  `serviceid` int(12) unsigned NOT NULL COMMENT 'School Service',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Status',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`audit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2907 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_schstudentserviceslog` */

DROP TABLE IF EXISTS `sch_schstudentserviceslog`;

CREATE TABLE `sch_schstudentserviceslog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `studentserviceid` int(11) unsigned DEFAULT NULL COMMENT 'Student Service',
  `actionid` tinyint(3) unsigned DEFAULT NULL COMMENT 'Action',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `studentserviceid` (`studentserviceid`),
  KEY `actionid` (`actionid`),
  CONSTRAINT `sch_schstudentserviceslog_ibfk_1` FOREIGN KEY (`studentserviceid`) REFERENCES `sch_schstudentservices` (`id`),
  CONSTRAINT `sch_schstudentserviceslog_ibfk_2` FOREIGN KEY (`actionid`) REFERENCES `sys_actions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_schvoteheadspayments` */

DROP TABLE IF EXISTS `sch_schvoteheadspayments`;

CREATE TABLE `sch_schvoteheadspayments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `paymentid` int(11) unsigned NOT NULL,
  `voteheadid` int(11) unsigned NOT NULL,
  `amount` double(10,2) DEFAULT '0.00',
  `balance` double(10,2) DEFAULT '0.00',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `paymentid` (`paymentid`,`voteheadid`),
  KEY `voteheadid` (`voteheadid`),
  CONSTRAINT `sch_schvoteheadspayments_ibfk_1` FOREIGN KEY (`voteheadid`) REFERENCES `sch_voteheads` (`id`),
  CONSTRAINT `sch_schvoteheadspayments_ibfk_2` FOREIGN KEY (`paymentid`) REFERENCES `sch_feepayments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sch_schvoteheadspayments_audit` */

DROP TABLE IF EXISTS `sch_schvoteheadspayments_audit`;

CREATE TABLE `sch_schvoteheadspayments_audit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pk` int(11) NOT NULL COMMENT 'pk',
  `paymentid` int(11) unsigned NOT NULL,
  `voteheadid` int(11) unsigned NOT NULL,
  `amount` double(10,2) DEFAULT '0.00',
  `balance` double(10,2) DEFAULT '0.00',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `action` tinyint(2) DEFAULT NULL COMMENT 'Action',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_studentassessements` */

DROP TABLE IF EXISTS `sch_studentassessements`;

CREATE TABLE `sch_studentassessements` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Assessement Name',
  `marks` double(10,1) DEFAULT '0.0' COMMENT 'Assessement Marks',
  `description` tinytext COMMENT 'Description',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_studentbulkuploadlog` */

DROP TABLE IF EXISTS `sch_studentbulkuploadlog`;

CREATE TABLE `sch_studentbulkuploadlog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uploadid` int(11) unsigned DEFAULT NULL COMMENT 'Upload',
  `uploadstatus` enum('0','1') DEFAULT '0' COMMENT 'Upload Status',
  `message` text COMMENT 'Message',
  `file_name` varchar(100) DEFAULT NULL COMMENT 'Uploaded File Name',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `uploadid` (`uploadid`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_studentbulkuploads` */

DROP TABLE IF EXISTS `sch_studentbulkuploads`;

CREATE TABLE `sch_studentbulkuploads` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uploaddate` date DEFAULT NULL COMMENT 'Upload date',
  `uploaddocument` varchar(100) DEFAULT NULL COMMENT 'Upload Document',
  `uploadedby` int(11) DEFAULT NULL COMMENT 'Uploaded By',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_studentclasspromotion` */

DROP TABLE IF EXISTS `sch_studentclasspromotion`;

CREATE TABLE `sch_studentclasspromotion` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `studentid` int(11) unsigned NOT NULL COMMENT 'Student Name',
  `classid` int(11) unsigned NOT NULL COMMENT 'Class Name',
  `academicyearid` int(11) unsigned NOT NULL COMMENT 'Academic Year Name',
  `promotedon` date DEFAULT NULL COMMENT 'Date Promoted',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `studentid` (`studentid`,`classid`,`academicyearid`),
  KEY `classid` (`classid`),
  KEY `sch_studentclasspromotion_ibfk_3` (`academicyearid`),
  CONSTRAINT `sch_studentclasspromotion_ibfk_2` FOREIGN KEY (`classid`) REFERENCES `sch_classes` (`id`),
  CONSTRAINT `sch_studentclasspromotion_ibfk_3` FOREIGN KEY (`academicyearid`) REFERENCES `sch_academicyears` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1290 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_studentclasspromotion_uadit` */

DROP TABLE IF EXISTS `sch_studentclasspromotion_uadit`;

CREATE TABLE `sch_studentclasspromotion_uadit` (
  `audit_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id` int(11) unsigned NOT NULL,
  `studentid` int(11) unsigned NOT NULL COMMENT 'Student Name',
  `classid` int(11) unsigned NOT NULL COMMENT 'Class Name',
  `academicyearid` int(11) unsigned NOT NULL COMMENT 'Academic Year Name',
  `promotedon` date DEFAULT NULL COMMENT 'Date Promoted',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL COMMENT 'Is Active',
  PRIMARY KEY (`audit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1280 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_studentclasspromotionlog` */

DROP TABLE IF EXISTS `sch_studentclasspromotionlog`;

CREATE TABLE `sch_studentclasspromotionlog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `studentid` int(11) unsigned NOT NULL COMMENT 'Student Name',
  `classid` int(11) unsigned NOT NULL COMMENT 'Class Name',
  `academicyearid` int(11) unsigned NOT NULL COMMENT 'Academic Year Name',
  `promotedon` date NOT NULL COMMENT 'Date Promoted',
  `actionid` tinyint(3) unsigned NOT NULL COMMENT 'Action Name',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `studentid` (`studentid`),
  KEY `classid` (`classid`),
  KEY `actionid` (`actionid`),
  KEY `sch_studentclasspromotionlog_ibfk_4` (`academicyearid`),
  CONSTRAINT `sch_studentclasspromotionlog_ibfk_1` FOREIGN KEY (`studentid`) REFERENCES `sch_students` (`id`),
  CONSTRAINT `sch_studentclasspromotionlog_ibfk_2` FOREIGN KEY (`classid`) REFERENCES `sch_classes` (`id`),
  CONSTRAINT `sch_studentclasspromotionlog_ibfk_3` FOREIGN KEY (`actionid`) REFERENCES `sys_actions` (`id`),
  CONSTRAINT `sch_studentclasspromotionlog_ibfk_4` FOREIGN KEY (`academicyearid`) REFERENCES `sch_academicyears` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1298 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_studentclassterms` */

DROP TABLE IF EXISTS `sch_studentclassterms`;

CREATE TABLE `sch_studentclassterms` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `studentclasspromotionid` int(11) unsigned NOT NULL COMMENT 'Student Class Promotion',
  `termid` tinyint(3) unsigned NOT NULL COMMENT 'Term Name',
  `classtermid` int(11) unsigned DEFAULT NULL COMMENT 'Class Term',
  `reportingdate` date DEFAULT NULL COMMENT 'Reporting Date',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `studentclasspromotionid` (`studentclasspromotionid`,`classtermid`),
  KEY `termid` (`termid`),
  KEY `classtermid` (`classtermid`),
  CONSTRAINT `sch_studentclassterms_ibfk_1` FOREIGN KEY (`studentclasspromotionid`) REFERENCES `sch_studentclasspromotion` (`id`),
  CONSTRAINT `sch_studentclassterms_ibfk_2` FOREIGN KEY (`termid`) REFERENCES `sch_terms` (`id`),
  CONSTRAINT `sch_studentclassterms_ibfk_3` FOREIGN KEY (`classtermid`) REFERENCES `sch_academicyearterms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1289 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_studentclassterms_audit` */

DROP TABLE IF EXISTS `sch_studentclassterms_audit`;

CREATE TABLE `sch_studentclassterms_audit` (
  `udit_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id` int(11) unsigned NOT NULL,
  `studentclasspromotionid` int(11) unsigned NOT NULL COMMENT 'Student Class Promotion',
  `termid` tinyint(3) unsigned NOT NULL COMMENT 'Term Name',
  `classtermid` int(11) unsigned DEFAULT NULL COMMENT 'Class Term',
  `reportingdate` date DEFAULT NULL COMMENT 'Reporting Date',
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`udit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1277 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_studentclasstermslog` */

DROP TABLE IF EXISTS `sch_studentclasstermslog`;

CREATE TABLE `sch_studentclasstermslog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `studentclasspromotionid` int(11) unsigned NOT NULL COMMENT 'Student Class Promotion',
  `termid` tinyint(3) unsigned NOT NULL COMMENT 'Term Name',
  `actionid` tinyint(3) unsigned NOT NULL COMMENT 'Action Name',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `termid` (`termid`),
  KEY `actionid` (`actionid`),
  KEY `sch_studentclasstermslog_ibfk_1` (`studentclasspromotionid`),
  CONSTRAINT `sch_studentclasstermslog_ibfk_1` FOREIGN KEY (`studentclasspromotionid`) REFERENCES `sch_studentclasspromotion` (`id`),
  CONSTRAINT `sch_studentclasstermslog_ibfk_2` FOREIGN KEY (`termid`) REFERENCES `sch_terms` (`id`),
  CONSTRAINT `sch_studentclasstermslog_ibfk_3` FOREIGN KEY (`actionid`) REFERENCES `sys_actions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_studentexpenses` */

DROP TABLE IF EXISTS `sch_studentexpenses`;

CREATE TABLE `sch_studentexpenses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL COMMENT 'Expense Name',
  `description` text COMMENT 'Description',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `branch_id` int(11) unsigned NOT NULL COMMENT 'Branch Name',
  `payment_term_id` int(11) DEFAULT NULL COMMENT 'Payment Term',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`branch_id`),
  KEY `branch_id` (`branch_id`),
  KEY `payment_term_id` (`payment_term_id`),
  CONSTRAINT `sch_studentexpenses_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `auth_branches` (`id`),
  CONSTRAINT `sch_studentexpenses_ibfk_2` FOREIGN KEY (`payment_term_id`) REFERENCES `paymentterms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_studentexpensetransactions` */

DROP TABLE IF EXISTS `sch_studentexpensetransactions`;

CREATE TABLE `sch_studentexpensetransactions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `studentid` int(11) unsigned DEFAULT NULL,
  `expense_id` int(11) unsigned NOT NULL COMMENT 'Expense',
  `studentclasspromotiontermid` int(11) unsigned NOT NULL COMMENT 'Class Term',
  `documentno` varchar(32) NOT NULL COMMENT 'Document No',
  `invoice_no` varchar(32) DEFAULT NULL COMMENT 'Invoice No',
  `quantity` double NOT NULL COMMENT 'Quantity',
  `amount` double NOT NULL COMMENT 'Amount',
  `total` double DEFAULT NULL COMMENT 'Total',
  `vat_class` int(11) DEFAULT NULL,
  `vat_total` double NOT NULL,
  `expensedate` date DEFAULT NULL COMMENT 'Expense Date',
  `paymentmodeid` int(11) DEFAULT NULL COMMENT 'Payment Mode',
  `bankid` int(11) DEFAULT NULL COMMENT 'Bank',
  `authorized_by` int(11) DEFAULT NULL COMMENT 'Expenses Authorized By',
  `description` text COMMENT 'Expense Description',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(64) DEFAULT NULL,
  `branch_id` int(11) unsigned DEFAULT NULL COMMENT 'Branch Name',
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `expense_id` (`expense_id`),
  KEY `studentclasspromotiontermid` (`studentclasspromotiontermid`),
  KEY `studentid` (`studentid`),
  CONSTRAINT `sch_studentexpensetransactions_ibfk_1` FOREIGN KEY (`expense_id`) REFERENCES `sch_studentexpenses` (`id`),
  CONSTRAINT `sch_studentexpensetransactions_ibfk_2` FOREIGN KEY (`studentclasspromotiontermid`) REFERENCES `sch_studentclassterms` (`id`),
  CONSTRAINT `sch_studentexpensetransactions_ibfk_3` FOREIGN KEY (`studentid`) REFERENCES `sch_students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_studentgender` */

DROP TABLE IF EXISTS `sch_studentgender`;

CREATE TABLE `sch_studentgender` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT 'Gender Name',
  `description` varchar(200) DEFAULT NULL COMMENT 'Description',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_studentmarkslog` */

DROP TABLE IF EXISTS `sch_studentmarkslog`;

CREATE TABLE `sch_studentmarkslog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `studentclasstermsid` int(11) unsigned NOT NULL COMMENT 'Class Term',
  `classsubjectid` int(11) unsigned NOT NULL COMMENT 'Class Subject',
  `assessementid` tinyint(2) unsigned NOT NULL COMMENT 'Assessment',
  `marks` double(5,1) NOT NULL DEFAULT '0.0' COMMENT 'Marks',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_studentrublicentries` */

DROP TABLE IF EXISTS `sch_studentrublicentries`;

CREATE TABLE `sch_studentrublicentries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(11) unsigned NOT NULL,
  `examination_item_id` bigint(20) unsigned NOT NULL,
  `grade_id` tinyint(3) unsigned NOT NULL,
  `average` double(10,2) DEFAULT NULL,
  `comment` tinytext,
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id` (`student_id`,`examination_item_id`,`grade_id`),
  KEY `examination_item_id` (`examination_item_id`),
  KEY `grade_id` (`grade_id`),
  CONSTRAINT `sch_studentrublicentries_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `sch_students` (`id`),
  CONSTRAINT `sch_studentrublicentries_ibfk_2` FOREIGN KEY (`examination_item_id`) REFERENCES `sch_examinationitems` (`id`),
  CONSTRAINT `sch_studentrublicentries_ibfk_3` FOREIGN KEY (`grade_id`) REFERENCES `sch_grades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_students` */

DROP TABLE IF EXISTS `sch_students`;

CREATE TABLE `sch_students` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Student Name',
  `admission_no` varchar(32) NOT NULL COMMENT 'Admission No',
  `nemis_number` varchar(32) DEFAULT NULL COMMENT 'Nemis Number',
  `assessment_number` varbinary(32) DEFAULT NULL COMMENT 'Assessment Number',
  `parentname` varchar(32) DEFAULT NULL COMMENT 'Parent Name ',
  `classid` int(11) unsigned NOT NULL COMMENT 'Join Class',
  `academicyearid` int(11) unsigned DEFAULT NULL COMMENT 'Join Academic Year',
  `parent_mobile` varchar(64) DEFAULT NULL COMMENT 'Contact Name',
  `secondary_mobile` varchar(20) DEFAULT NULL COMMENT 'Secondary Mobile Number',
  `dob` varchar(20) DEFAULT NULL COMMENT 'Date Of Birth',
  `city` varbinary(32) DEFAULT NULL COMMENT 'City',
  `town` varchar(32) DEFAULT NULL COMMENT 'Town',
  `streetaddress` text COMMENT 'Street Address',
  `mobile` varchar(20) DEFAULT NULL COMMENT 'Mobile No',
  `email` varchar(64) DEFAULT NULL COMMENT 'Email Adddress',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `current_class_id` int(11) unsigned DEFAULT NULL COMMENT 'Current Class',
  `current_term_id` tinyint(3) unsigned DEFAULT NULL COMMENT 'Current Term',
  `current_academic_year` int(11) unsigned DEFAULT NULL COMMENT 'Current Academic Year',
  `genderid` tinyint(2) unsigned DEFAULT NULL COMMENT 'Gender',
  `teachers_student` enum('0','1') DEFAULT '0' COMMENT 'Teachers Pupil',
  `deactivated` enum('0','1') DEFAULT '0' COMMENT 'Deactivated/Transfered',
  `deactivate_reason` varchar(250) NOT NULL COMMENT 'Reason For Deactivation',
  `branch_id` int(11) unsigned DEFAULT NULL COMMENT 'Branch Name',
  `fathers_name` varchar(255) DEFAULT NULL COMMENT 'Farther''s Name',
  `fathers_phone` varchar(20) DEFAULT NULL COMMENT 'Farther''s Phone',
  `mothers_name` varchar(255) DEFAULT NULL COMMENT 'Mother''s Name',
  `mothers_phone` varchar(20) DEFAULT NULL COMMENT 'Mothers''s Phone',
  `gurdians_name` varchar(255) DEFAULT NULL COMMENT 'Guardian''s Name',
  `guardians_phone` varchar(20) DEFAULT NULL COMMENT 'Guardian''s Phone',
  `last_school_attended` varchar(255) DEFAULT NULL COMMENT 'Last School Attended',
  `birth_cert_no` varchar(32) DEFAULT NULL COMMENT 'Birth Certificate No',
  `upi_no` varchar(32) DEFAULT NULL COMMENT 'Upi No',
  `transfer_term_id` tinyint(3) unsigned DEFAULT NULL COMMENT 'Term Transfered',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admission_no` (`admission_no`,`branch_id`),
  KEY `current_class_id` (`current_class_id`),
  KEY `current_term_id` (`current_term_id`),
  KEY `genderid` (`genderid`),
  KEY `branch_id` (`branch_id`),
  KEY `transfer_term_id` (`transfer_term_id`),
  CONSTRAINT `sch_students_ibfk_1` FOREIGN KEY (`current_class_id`) REFERENCES `sch_classes` (`id`),
  CONSTRAINT `sch_students_ibfk_2` FOREIGN KEY (`current_term_id`) REFERENCES `sch_terms` (`id`),
  CONSTRAINT `sch_students_ibfk_3` FOREIGN KEY (`genderid`) REFERENCES `sch_studentgender` (`id`),
  CONSTRAINT `sch_students_ibfk_4` FOREIGN KEY (`branch_id`) REFERENCES `auth_branches` (`id`),
  CONSTRAINT `sch_students_ibfk_5` FOREIGN KEY (`transfer_term_id`) REFERENCES `sch_terms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1218 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_students_audit` */

DROP TABLE IF EXISTS `sch_students_audit`;

CREATE TABLE `sch_students_audit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(11) unsigned NOT NULL,
  `name` varchar(32) NOT NULL COMMENT 'Student Name',
  `admission_no` varchar(32) NOT NULL COMMENT 'Admission No',
  `nemis_number` varchar(32) DEFAULT NULL COMMENT 'Nemis Number',
  `parentname` varchar(32) DEFAULT NULL COMMENT 'Parent Name ',
  `classid` int(11) unsigned NOT NULL COMMENT 'Join Class',
  `academicyearid` int(11) unsigned DEFAULT NULL COMMENT 'Join Academic Year',
  `parent_mobile` varchar(64) DEFAULT NULL COMMENT 'Contact Name',
  `secondary_mobile` varchar(20) DEFAULT NULL COMMENT 'Secondary Mobile Number',
  `dob` varchar(20) DEFAULT NULL COMMENT 'Date Of Birth',
  `city` varbinary(32) DEFAULT NULL COMMENT 'City',
  `town` varchar(32) DEFAULT NULL COMMENT 'Town',
  `streetaddress` text COMMENT 'Street Address',
  `mobile` varchar(20) DEFAULT NULL COMMENT 'Mobile No',
  `email` varchar(64) DEFAULT NULL COMMENT 'Email Adddress',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `current_class_id` int(11) unsigned DEFAULT NULL COMMENT 'Current Class',
  `current_term_id` tinyint(3) unsigned DEFAULT NULL COMMENT 'Current Term',
  `current_academic_year` int(11) unsigned DEFAULT NULL COMMENT 'Current Academic Year',
  `genderid` tinyint(2) unsigned DEFAULT NULL COMMENT 'Gender',
  `teachers_student` enum('0','1') DEFAULT '0' COMMENT 'Teachers Pupil',
  `deactivated` enum('0','1') DEFAULT '0' COMMENT 'Deactivated/Transfered',
  `deactivate_reason` varchar(250) NOT NULL COMMENT 'Reason For Deactivation',
  `branch_id` int(11) unsigned DEFAULT NULL COMMENT 'Branch Name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1212 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_studentservicesinvoices` */

DROP TABLE IF EXISTS `sch_studentservicesinvoices`;

CREATE TABLE `sch_studentservicesinvoices` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `invoiceid` int(11) unsigned NOT NULL COMMENT 'Invoice',
  `studentserviceid` int(11) unsigned NOT NULL COMMENT 'Student Service',
  `amount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Service Value',
  `balance` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Balance Due',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `invoiceid` (`invoiceid`),
  KEY `studentserviceid` (`studentserviceid`),
  CONSTRAINT `sch_studentservicesinvoices_ibfk_1` FOREIGN KEY (`invoiceid`) REFERENCES `sch_schfeeidnvoices` (`id`),
  CONSTRAINT `sch_studentservicesinvoices_ibfk_2` FOREIGN KEY (`studentserviceid`) REFERENCES `sch_schstudentservices` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_studentservicesinvoices_audit` */

DROP TABLE IF EXISTS `sch_studentservicesinvoices_audit`;

CREATE TABLE `sch_studentservicesinvoices_audit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pk` int(11) unsigned NOT NULL COMMENT 'pk',
  `invoiceid` int(11) unsigned NOT NULL COMMENT 'Invoice',
  `studentserviceid` int(11) unsigned NOT NULL COMMENT 'Student Service',
  `amount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Service Value',
  `balance` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Balance Due',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `action` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_studentsmarks` */

DROP TABLE IF EXISTS `sch_studentsmarks`;

CREATE TABLE `sch_studentsmarks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `studentclasstermsid` int(11) unsigned NOT NULL COMMENT 'Student Class Term',
  `classsubjectid` int(11) unsigned NOT NULL COMMENT 'Class Subject',
  `assessementid` tinyint(2) unsigned NOT NULL COMMENT 'Assessment Name',
  `marks` double(10,1) NOT NULL DEFAULT '0.0' COMMENT 'Mark Scored',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `studentclassterms` (`studentclasstermsid`,`classsubjectid`,`marks`,`assessementid`),
  KEY `classsubjectid` (`classsubjectid`),
  KEY `assessmentid` (`assessementid`),
  CONSTRAINT `sch_studentsmarks_ibfk_1` FOREIGN KEY (`studentclasstermsid`) REFERENCES `sch_studentclassterms` (`id`),
  CONSTRAINT `sch_studentsmarks_ibfk_2` FOREIGN KEY (`classsubjectid`) REFERENCES `sch_classsubjects` (`id`),
  CONSTRAINT `sch_studentsmarks_ibfk_3` FOREIGN KEY (`assessementid`) REFERENCES `sch_studentassessements` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_subjects` */

DROP TABLE IF EXISTS `sch_subjects`;

CREATE TABLE `sch_subjects` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT 'Subject Name',
  `subject_code` varchar(32) DEFAULT NULL COMMENT 'Subject Code',
  `description` text COMMENT 'Description',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_teachers` */

DROP TABLE IF EXISTS `sch_teachers`;

CREATE TABLE `sch_teachers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(300) DEFAULT NULL COMMENT 'Full Name',
  `surname` varchar(100) NOT NULL COMMENT 'Surname',
  `firstname` varchar(100) NOT NULL COMMENT 'First Name',
  `lastname` varchar(100) DEFAULT NULL COMMENT 'Last Name',
  `title` varchar(32) DEFAULT NULL COMMENT 'Title',
  `mobileno` varchar(20) DEFAULT NULL COMMENT 'Active Mobile No',
  `email` varchar(100) DEFAULT NULL COMMENT 'Active Email Address',
  `physicaladdress` text COMMENT 'Physical Address',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_teachersonduty` */

DROP TABLE IF EXISTS `sch_teachersonduty`;

CREATE TABLE `sch_teachersonduty` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `teacherid` int(11) unsigned NOT NULL COMMENT 'Teacher',
  `duty_start` date NOT NULL COMMENT 'Duty Start On',
  `duty_end` date NOT NULL COMMENT 'Duty Ends On',
  `comments` text COMMENT 'Comments',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `teacherid` (`teacherid`),
  CONSTRAINT `sch_teachersonduty_ibfk_1` FOREIGN KEY (`teacherid`) REFERENCES `sch_teachers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_teachersubjectassignmentlog` */

DROP TABLE IF EXISTS `sch_teachersubjectassignmentlog`;

CREATE TABLE `sch_teachersubjectassignmentlog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `teachersubjectsid` int(11) unsigned NOT NULL COMMENT 'Teacher Subject',
  `classid` int(11) unsigned NOT NULL COMMENT 'Class Name',
  `assignedon` date NOT NULL COMMENT 'Assignemet Date',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `teachersubjectsid` (`teachersubjectsid`),
  KEY `classid` (`classid`),
  CONSTRAINT `sch_teachersubjectassignmentlog_ibfk_1` FOREIGN KEY (`teachersubjectsid`) REFERENCES `sch_teachersubjects` (`id`),
  CONSTRAINT `sch_teachersubjectassignmentlog_ibfk_2` FOREIGN KEY (`classid`) REFERENCES `sch_classes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sch_teachersubjectassignments` */

DROP TABLE IF EXISTS `sch_teachersubjectassignments`;

CREATE TABLE `sch_teachersubjectassignments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `teachersubjectsid` int(11) unsigned NOT NULL COMMENT 'Teacher Subject',
  `classid` int(11) unsigned NOT NULL COMMENT 'Class Name',
  `assignedon` date DEFAULT NULL COMMENT 'Assigned Date',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `teachersubjects` (`teachersubjectsid`,`classid`),
  KEY `classid` (`classid`),
  CONSTRAINT `sch_teachersubjectassignments_ibfk_1` FOREIGN KEY (`teachersubjectsid`) REFERENCES `sch_teachersubjects` (`id`),
  CONSTRAINT `sch_teachersubjectassignments_ibfk_2` FOREIGN KEY (`classid`) REFERENCES `sch_classes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_teachersubjectlog` */

DROP TABLE IF EXISTS `sch_teachersubjectlog`;

CREATE TABLE `sch_teachersubjectlog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `teacherid` int(11) unsigned NOT NULL COMMENT 'Teacher Name',
  `subjectid` tinyint(3) unsigned NOT NULL COMMENT 'Subject Name',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `teacherid` (`teacherid`),
  KEY `subjectid` (`subjectid`),
  CONSTRAINT `sch_teachersubjectlog_ibfk_1` FOREIGN KEY (`teacherid`) REFERENCES `sch_teachers` (`id`),
  CONSTRAINT `sch_teachersubjectlog_ibfk_2` FOREIGN KEY (`subjectid`) REFERENCES `sch_subjects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sch_teachersubjects` */

DROP TABLE IF EXISTS `sch_teachersubjects`;

CREATE TABLE `sch_teachersubjects` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `teacherid` int(11) unsigned NOT NULL COMMENT 'Teacher Name',
  `subjectid` tinyint(3) unsigned NOT NULL COMMENT 'Subject Name',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `teacherid` (`teacherid`,`subjectid`),
  KEY `subjectid` (`subjectid`),
  CONSTRAINT `sch_teachersubjects_ibfk_1` FOREIGN KEY (`teacherid`) REFERENCES `sch_teachers` (`id`),
  CONSTRAINT `sch_teachersubjects_ibfk_2` FOREIGN KEY (`subjectid`) REFERENCES `sch_subjects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_terms` */

DROP TABLE IF EXISTS `sch_terms`;

CREATE TABLE `sch_terms` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT 'Term Name',
  `description` varchar(250) DEFAULT NULL COMMENT 'Description',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `active_term` enum('0','1') DEFAULT '0' COMMENT 'Is Active Term',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_visitorregisterdetails` */

DROP TABLE IF EXISTS `sch_visitorregisterdetails`;

CREATE TABLE `sch_visitorregisterdetails` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `visitorid` int(11) unsigned NOT NULL COMMENT 'Visitor',
  `termid` tinyint(3) unsigned NOT NULL COMMENT 'Term Name',
  `charges` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Charges',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `visitorid` (`visitorid`),
  KEY `termid` (`termid`),
  CONSTRAINT `sch_visitorregisterdetails_ibfk_1` FOREIGN KEY (`visitorid`) REFERENCES `sch_visitorsregister` (`id`),
  CONSTRAINT `sch_visitorregisterdetails_ibfk_2` FOREIGN KEY (`termid`) REFERENCES `sch_terms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_visitorsregister` */

DROP TABLE IF EXISTS `sch_visitorsregister`;

CREATE TABLE `sch_visitorsregister` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `visitortypeid` tinyint(2) unsigned NOT NULL COMMENT 'Visitor Type',
  `name` varchar(100) NOT NULL COMMENT 'Visitor Name',
  `mobile` varchar(15) DEFAULT NULL COMMENT 'Mobile No',
  `genderid` tinyint(2) unsigned NOT NULL COMMENT 'Gender',
  `date_visited` date NOT NULL COMMENT 'Date Visited',
  `classid` int(11) unsigned DEFAULT NULL COMMENT 'Class',
  `visiting_reason` text NOT NULL COMMENT 'Reason For Visiting',
  `sms` text COMMENT 'Sms',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `visitortypeid` (`visitortypeid`),
  KEY `genderid` (`genderid`),
  KEY `classid` (`classid`),
  CONSTRAINT `sch_visitorsregister_ibfk_1` FOREIGN KEY (`visitortypeid`) REFERENCES `sch_visitortypes` (`id`),
  CONSTRAINT `sch_visitorsregister_ibfk_2` FOREIGN KEY (`genderid`) REFERENCES `sys_gender` (`id`),
  CONSTRAINT `sch_visitorsregister_ibfk_3` FOREIGN KEY (`classid`) REFERENCES `sch_classes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_visitortypes` */

DROP TABLE IF EXISTS `sch_visitortypes`;

CREATE TABLE `sch_visitortypes` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT 'Visitor Type',
  `description` varchar(250) DEFAULT NULL COMMENT 'Description',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `sch_voteheads` */

DROP TABLE IF EXISTS `sch_voteheads`;

CREATE TABLE `sch_voteheads` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT 'Vote Head',
  `paymenttermid` int(11) DEFAULT NULL COMMENT 'Payment Term',
  `description` varchar(250) DEFAULT NULL COMMENT 'Description',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1',
  `branch_id` int(11) unsigned DEFAULT NULL COMMENT 'Branch Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`branch_id`),
  UNIQUE KEY `paymenttermid` (`paymenttermid`,`branch_id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `sch_voteheads_ibfk_1` FOREIGN KEY (`paymenttermid`) REFERENCES `paymentterms` (`id`),
  CONSTRAINT `sch_voteheads_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `auth_branches` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Table structure for table `schbulkstudentdeactivate` */

DROP TABLE IF EXISTS `schbulkstudentdeactivate`;

CREATE TABLE `schbulkstudentdeactivate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `deactivate_reason` text NOT NULL COMMENT 'Deactivation Reason',
  `branch_id` int(11) unsigned NOT NULL COMMENT 'Branch',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `schbulkstudentdeactivate_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `auth_branches` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `schbulkstudentdeactivatelog` */

DROP TABLE IF EXISTS `schbulkstudentdeactivatelog`;

CREATE TABLE `schbulkstudentdeactivatelog` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `deactivate_id` int(11) unsigned NOT NULL COMMENT 'Deactivate',
  `student_id` int(11) unsigned NOT NULL COMMENT 'Deactivated Student',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `deactivate_id` (`deactivate_id`,`student_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `schbulkstudentdeactivatelog_ibfk_1` FOREIGN KEY (`deactivate_id`) REFERENCES `schbulkstudentdeactivate` (`id`),
  CONSTRAINT `schbulkstudentdeactivatelog_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `sch_students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `shares` */

DROP TABLE IF EXISTS `shares`;

CREATE TABLE `shares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `currencyid` int(11) NOT NULL COMMENT 'Currency',
  `totalshares` double NOT NULL COMMENT 'Total Shares',
  `nominalprice` double NOT NULL COMMENT 'Nominal Price',
  `sharestoissue` double NOT NULL COMMENT 'Shares To Be Issued',
  `minshares` double NOT NULL COMMENT 'Min. Shares Per Client',
  `maxshares` double NOT NULL COMMENT 'Max Shares To Be Issued',
  `status` enum('Active','Inactive') NOT NULL COMMENT 'Status',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL COMMENT 'Created By',
  `createdon` datetime DEFAULT NULL COMMENT 'Created On',
  `lasteditedby` int(11) DEFAULT NULL COMMENT 'Last Edited By',
  `lasteditedon` datetime DEFAULT NULL COMMENT 'Last Edited On',
  `ipaddress` varchar(32) DEFAULT NULL COMMENT 'IP Address',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sharespayments` */

DROP TABLE IF EXISTS `sharespayments`;

CREATE TABLE `sharespayments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documentno` int(11) DEFAULT NULL,
  `memberid` int(11) NOT NULL COMMENT 'Member',
  `sharesid` int(11) NOT NULL COMMENT 'Shares',
  `noofshares` double NOT NULL COMMENT 'No Of Shares',
  `sharesamount` double NOT NULL COMMENT 'Shares Amount',
  `total` double NOT NULL COMMENT 'Total',
  `paymentmodeid` int(11) NOT NULL COMMENT 'Payment Mode',
  `bankid` int(11) DEFAULT NULL COMMENT 'Bank',
  `transactioncode` varchar(32) DEFAULT NULL COMMENT 'Transaction No',
  `paidon` date DEFAULT NULL COMMENT 'Paid On',
  `paidby` varchar(32) DEFAULT NULL,
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL COMMENT 'Created By',
  `createdon` datetime DEFAULT NULL COMMENT 'Created On',
  `lasteditedby` int(11) DEFAULT NULL COMMENT 'Last Edited By',
  `lasteditedon` datetime DEFAULT NULL COMMENT 'Last Edited On',
  `ipaddress` varchar(32) DEFAULT NULL COMMENT 'IP Address',
  PRIMARY KEY (`id`),
  KEY `sharespaymentsfkmembers` (`memberid`),
  KEY `sharespaymentsfkshares` (`sharesid`),
  KEY `sharespaymentsfkpaymentmodes` (`paymentmodeid`),
  KEY `sharespaymentsfkbanks` (`bankid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sms_airtimepurchaseauthtokenlog` */

DROP TABLE IF EXISTS `sms_airtimepurchaseauthtokenlog`;

CREATE TABLE `sms_airtimepurchaseauthtokenlog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `response` text,
  `token` text,
  `receivedon` datetime DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sms_airtimepurchaseresponselogs` */

DROP TABLE IF EXISTS `sms_airtimepurchaseresponselogs`;

CREATE TABLE `sms_airtimepurchaseresponselogs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `response` text,
  `receivedon` datetime DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sms_blacklist` */

DROP TABLE IF EXISTS `sms_blacklist`;

CREATE TABLE `sms_blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contactid` int(11) NOT NULL COMMENT 'Contact ',
  `blacklistedon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  `remarks` text COMMENT 'Remarks',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT '1',
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `branch_id` int(11) unsigned DEFAULT NULL COMMENT 'Branch Name',
  PRIMARY KEY (`id`),
  KEY `sms_blacklist_pef_sms_contacts` (`contactid`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `sms_blacklist_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `auth_branches` (`id`),
  CONSTRAINT `sms_blacklist_pef_sms_contacts` FOREIGN KEY (`contactid`) REFERENCES `sms_contacts` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sms_clientpurchaseslogs` */

DROP TABLE IF EXISTS `sms_clientpurchaseslogs`;

CREATE TABLE `sms_clientpurchaseslogs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL,
  `smsproviderid` int(11) NOT NULL,
  `mobilecarrierid` int(11) NOT NULL,
  `amount` double(10,2) NOT NULL DEFAULT '0.00',
  `purchasedon` date NOT NULL,
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `smsproviderid` (`smsproviderid`),
  CONSTRAINT `sms_clientpurchaseslogs_ibfk_1` FOREIGN KEY (`clientid`) REFERENCES `sms_smsclients` (`id`),
  CONSTRAINT `sms_clientpurchaseslogs_ibfk_2` FOREIGN KEY (`smsproviderid`) REFERENCES `sms_smsproviders` (`id`),
  CONSTRAINT `sms_clientpurchaseslogs_ibfk_3` FOREIGN KEY (`smsproviderid`) REFERENCES `sms_mobilecarrier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

/*Table structure for table `sms_clientsenderidconfigs` */

DROP TABLE IF EXISTS `sms_clientsenderidconfigs`;

CREATE TABLE `sms_clientsenderidconfigs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL COMMENT 'Client Name',
  `apiprojectid` varchar(255) NOT NULL COMMENT 'API SMS Project ID',
  `smsproviderid` int(11) NOT NULL COMMENT 'Sms Provider',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddresss` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `smsproviderid` (`smsproviderid`),
  CONSTRAINT `sms_clientsenderidconfigs_ibfk_1` FOREIGN KEY (`clientid`) REFERENCES `sms_smsclients` (`id`),
  CONSTRAINT `sms_clientsenderidconfigs_ibfk_2` FOREIGN KEY (`smsproviderid`) REFERENCES `sms_smsproviders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `sms_clientsmsbalances` */

DROP TABLE IF EXISTS `sms_clientsmsbalances`;

CREATE TABLE `sms_clientsmsbalances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL COMMENT 'Client Name',
  `smsproviderid` int(11) NOT NULL COMMENT 'Service Provider',
  `mobilecarrierid` int(11) NOT NULL COMMENT 'Mobile Carrier',
  `smsbalance` int(11) NOT NULL DEFAULT '0' COMMENT 'SMS Balance',
  `remarks` text COMMENT 'Remarks',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `smsproviderid` (`smsproviderid`),
  KEY `mobilecarrierid` (`mobilecarrierid`),
  CONSTRAINT `sms_clientsmsbalances_ibfk_1` FOREIGN KEY (`clientid`) REFERENCES `sms_smsclients` (`id`),
  CONSTRAINT `sms_clientsmsbalances_ibfk_2` FOREIGN KEY (`smsproviderid`) REFERENCES `sms_smsproviders` (`id`),
  CONSTRAINT `sms_clientsmsbalances_ibfk_3` FOREIGN KEY (`mobilecarrierid`) REFERENCES `sms_mobilecarrier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Table structure for table `sms_clientsmsconsumption` */

DROP TABLE IF EXISTS `sms_clientsmsconsumption`;

CREATE TABLE `sms_clientsmsconsumption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL COMMENT 'Client Name',
  `mobilecarrierid` int(11) NOT NULL COMMENT 'Mobile Carrier',
  `serviceproviderid` int(11) NOT NULL COMMENT 'Service Provider',
  `smsconsumed` int(11) NOT NULL DEFAULT '0' COMMENT 'SMS Consumed',
  `vat` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'VAT On sent SMS',
  `consumptiondate` date NOT NULL COMMENT 'SMS Consumption Date',
  `remarks` text COMMENT 'Remarks',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `mobilecarrierid` (`mobilecarrierid`),
  KEY `serviceproviderid` (`serviceproviderid`),
  CONSTRAINT `sms_clientsmsconsumption_ibfk_1` FOREIGN KEY (`clientid`) REFERENCES `sms_smsclients` (`id`),
  CONSTRAINT `sms_clientsmsconsumption_ibfk_2` FOREIGN KEY (`mobilecarrierid`) REFERENCES `sms_mobilecarrier` (`id`),
  CONSTRAINT `sms_clientsmsconsumption_ibfk_3` FOREIGN KEY (`serviceproviderid`) REFERENCES `sms_smsproviders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=591 DEFAULT CHARSET=latin1;

/*Table structure for table `sms_clientsmspurchases` */

DROP TABLE IF EXISTS `sms_clientsmspurchases`;

CREATE TABLE `sms_clientsmspurchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL COMMENT 'Client Name',
  `smsproviderid` int(1) NOT NULL COMMENT 'SMS Provider',
  `mobilecarrierid` int(11) NOT NULL COMMENT 'Mobile Carrier',
  `amount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Amount',
  `smsamount` int(11) NOT NULL DEFAULT '0' COMMENT 'SMS Amount',
  `purchasedon` date NOT NULL COMMENT 'Purchase Date',
  `remarks` text COMMENT 'Remarks',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `smsproviderid` (`smsproviderid`),
  KEY `mobilecarrierid` (`mobilecarrierid`),
  CONSTRAINT `sms_clientsmspurchases_ibfk_1` FOREIGN KEY (`clientid`) REFERENCES `sms_smsclients` (`id`),
  CONSTRAINT `sms_clientsmspurchases_ibfk_2` FOREIGN KEY (`smsproviderid`) REFERENCES `sms_smsproviders` (`id`),
  CONSTRAINT `sms_clientsmspurchases_ibfk_3` FOREIGN KEY (`mobilecarrierid`) REFERENCES `sms_mobilecarrier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

/*Table structure for table `sms_contactlist` */

DROP TABLE IF EXISTS `sms_contactlist`;

CREATE TABLE `sms_contactlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'List Name',
  `clientid` int(11) NOT NULL COMMENT 'Client Name',
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `customfields` varchar(32) DEFAULT NULL COMMENT 'Custom Fields',
  `remarks` text NOT NULL COMMENT 'Remarks',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT '1',
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `branch_id` int(11) unsigned DEFAULT NULL COMMENT 'Branch Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`branch_id`),
  KEY `clientid` (`clientid`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `sms_contactlist_ibfk_1` FOREIGN KEY (`clientid`) REFERENCES `sms_smsclients` (`id`),
  CONSTRAINT `sms_contactlist_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `auth_branches` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Table structure for table `sms_contacts` */

DROP TABLE IF EXISTS `sms_contacts`;

CREATE TABLE `sms_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contactlistid` int(11) NOT NULL COMMENT 'Contact List Name',
  `mobile` varchar(32) NOT NULL COMMENT 'Mobile',
  `name` varchar(32) DEFAULT NULL COMMENT 'Name',
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `remarks` text COMMENT 'Remarks',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT '1',
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contactlistid` (`contactlistid`,`mobile`),
  KEY `sms_contacts_pef_sms_contactlist` (`contactlistid`),
  CONSTRAINT `sms_contacts_pef_sms_contactlist` FOREIGN KEY (`contactlistid`) REFERENCES `sms_contactlist` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;

/*Table structure for table `sms_contactsuploadlog` */

DROP TABLE IF EXISTS `sms_contactsuploadlog`;

CREATE TABLE `sms_contactsuploadlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uploadid` int(11) NOT NULL COMMENT 'Upload no',
  `uploadstatus` enum('0','1') DEFAULT '0' COMMENT 'Upload status',
  `message` text COMMENT 'upload comment/error',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `bir_cohortproductionuploadlog_unbr_bir_cohortproductionuploads` (`uploadid`),
  CONSTRAINT `sms_contactsuploadlog_ibfk_1` FOREIGN KEY (`uploadid`) REFERENCES `sms_contactsuploads` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sms_contactsuploads` */

DROP TABLE IF EXISTS `sms_contactsuploads`;

CREATE TABLE `sms_contactsuploads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uploaddate` datetime DEFAULT NULL COMMENT 'Date uploaded',
  `contactlistid` int(11) NOT NULL COMMENT 'Contact List',
  `uploaddocument` varchar(128) DEFAULT NULL COMMENT 'uploaded document name',
  `uploadedby` int(11) NOT NULL COMMENT 'Uploaded by',
  `uploadmessage` text COMMENT 'General Uppload message',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is active',
  PRIMARY KEY (`id`),
  KEY `contactlistid` (`contactlistid`),
  CONSTRAINT `sms_contactsuploads_ibfk_1` FOREIGN KEY (`contactlistid`) REFERENCES `sms_contactlist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sms_custommessageserrorlog` */

DROP TABLE IF EXISTS `sms_custommessageserrorlog`;

CREATE TABLE `sms_custommessageserrorlog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customuploadid` int(11) unsigned NOT NULL COMMENT 'Custom Upload',
  `errorlog` text COMMENT 'Error',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `customuploadid` (`customuploadid`),
  CONSTRAINT `sms_custommessageserrorlog_ibfk_1` FOREIGN KEY (`customuploadid`) REFERENCES `sms_customuploads` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `sms_customsentmessages` */

DROP TABLE IF EXISTS `sms_customsentmessages`;

CREATE TABLE `sms_customsentmessages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customuploadid` int(11) unsigned NOT NULL COMMENT 'Custom Upload',
  `message` text COMMENT 'Sent Message',
  `sentstatus` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Sent Status',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `customuploadid` (`customuploadid`),
  CONSTRAINT `sms_customsentmessages_ibfk_1` FOREIGN KEY (`customuploadid`) REFERENCES `sms_customuploads` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

/*Table structure for table `sms_customuploads` */

DROP TABLE IF EXISTS `sms_customuploads`;

CREATE TABLE `sms_customuploads` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL COMMENT 'Client',
  `templateid` int(11) NOT NULL COMMENT 'Template',
  `uploadedon` date NOT NULL COMMENT 'Date Uploaded',
  `columns` text NOT NULL COMMENT 'Columns',
  `message` text NOT NULL COMMENT 'Message',
  `documentname` varchar(150) NOT NULL COMMENT 'Document Name',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `templateid` (`templateid`),
  CONSTRAINT `sms_customuploads_ibfk_1` FOREIGN KEY (`clientid`) REFERENCES `sms_smsclients` (`id`),
  CONSTRAINT `sms_customuploads_ibfk_2` FOREIGN KEY (`templateid`) REFERENCES `sms_templates` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `sms_keywords` */

DROP TABLE IF EXISTS `sms_keywords`;

CREATE TABLE `sms_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `servicename` varchar(32) NOT NULL COMMENT 'Service Name',
  `clientid` int(11) DEFAULT NULL COMMENT 'Client',
  `smsproviderid` int(11) DEFAULT NULL COMMENT 'Service Provider',
  `startkeyword` varchar(32) NOT NULL COMMENT 'Start Keyword',
  `stopkeyword` varchar(32) NOT NULL COMMENT 'Stop Keyword',
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  `remarks` text COMMENT 'Remarks',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT '1',
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `smsproviderid` (`smsproviderid`),
  KEY `clientid` (`clientid`),
  CONSTRAINT `sms_keywords_ibfk_1` FOREIGN KEY (`smsproviderid`) REFERENCES `sms_smsproviders` (`id`),
  CONSTRAINT `sms_keywords_ibfk_2` FOREIGN KEY (`clientid`) REFERENCES `sms_smsclients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `sms_loginotp` */

DROP TABLE IF EXISTS `sms_loginotp`;

CREATE TABLE `sms_loginotp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL COMMENT 'User',
  `otp` varchar(10) NOT NULL COMMENT 'otp',
  `verified` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'Is Verified',
  `used` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'OTP Used',
  `expired` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'Otp Expired',
  `datecreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  CONSTRAINT `sms_loginotp_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sms_messageresponselogs` */

DROP TABLE IF EXISTS `sms_messageresponselogs`;

CREATE TABLE `sms_messageresponselogs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `response` text,
  `receivedon` datetime DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=latin1;

/*Table structure for table `sms_messages` */

DROP TABLE IF EXISTS `sms_messages`;

CREATE TABLE `sms_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keywordid` int(11) NOT NULL COMMENT 'Keyword Name',
  `templateid` int(11) DEFAULT NULL COMMENT 'Template',
  `contactlistid` int(11) DEFAULT NULL COMMENT 'Contact List',
  `mobilecarrierid` int(11) DEFAULT NULL COMMENT 'Mobile Carrier',
  `message` text NOT NULL COMMENT 'Message',
  `messagestatusid` int(11) NOT NULL COMMENT 'Message Status',
  `save_as_template` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'Save Message As Template',
  `templatetitle` varchar(32) DEFAULT NULL COMMENT 'Template Title',
  `is_scheduled` enum('0','1') NOT NULL DEFAULT '0',
  `service_id` int(11) unsigned DEFAULT NULL COMMENT 'School Service',
  `scheduledate` date DEFAULT NULL,
  `scheduletime` time DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  `remarks` text COMMENT 'Remarks',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT '1',
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `mobileno` varchar(15) DEFAULT NULL COMMENT 'Mobile No',
  `branch_id` int(11) unsigned DEFAULT NULL COMMENT 'Branch',
  PRIMARY KEY (`id`),
  KEY `sms_messages_pef_sms_contactlist` (`contactlistid`),
  KEY `sms_messages_pef_sms_templates` (`templateid`),
  KEY `sms_messages_pef_sms_keywords` (`keywordid`),
  KEY `sms_templates_pef_sms_messagestatus` (`messagestatusid`),
  CONSTRAINT `sms_messages_pef_sms_contactlist` FOREIGN KEY (`contactlistid`) REFERENCES `sms_contactlist` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `sms_messages_pef_sms_keywords` FOREIGN KEY (`keywordid`) REFERENCES `sms_keywords` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `sms_messages_pef_sms_templates` FOREIGN KEY (`templateid`) REFERENCES `sms_templates` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `sms_templates_pef_sms_messagestatus` FOREIGN KEY (`messagestatusid`) REFERENCES `sms_messagestatus` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=962 DEFAULT CHARSET=latin1;

/*Table structure for table `sms_messagestatus` */

DROP TABLE IF EXISTS `sms_messagestatus`;

CREATE TABLE `sms_messagestatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Status',
  `description` text COMMENT 'Remarks',
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Active Status',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `sms_messaginglogs` */

DROP TABLE IF EXISTS `sms_messaginglogs`;

CREATE TABLE `sms_messaginglogs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `messageid` int(11) DEFAULT NULL COMMENT 'Message',
  `sendstatus` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'Message Status',
  `response` text COMMENT 'Message Response',
  `message` text COMMENT 'Message',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `messageid` (`messageid`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=latin1;

/*Table structure for table `sms_mobilecarrier` */

DROP TABLE IF EXISTS `sms_mobilecarrier`;

CREATE TABLE `sms_mobilecarrier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `sms_mobilecarrierprefixes` */

DROP TABLE IF EXISTS `sms_mobilecarrierprefixes`;

CREATE TABLE `sms_mobilecarrierprefixes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobilecarrierid` int(11) NOT NULL COMMENT 'Mobile Carrier',
  `prefix` varchar(10) NOT NULL COMMENT 'Mobile Prefix',
  `remarks` text COMMENT 'Remarks',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mobilecarrierid` (`mobilecarrierid`),
  CONSTRAINT `sms_mobilecarrierprefixes_ibfk_1` FOREIGN KEY (`mobilecarrierid`) REFERENCES `sms_mobilecarrier` (`id`),
  CONSTRAINT `sms_mobilecarrierprefixes_ibfk_2` FOREIGN KEY (`mobilecarrierid`) REFERENCES `sms_mobilecarrier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Table structure for table `sms_modules` */

DROP TABLE IF EXISTS `sms_modules`;

CREATE TABLE `sms_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name ',
  `status` int(11) DEFAULT NULL,
  `icon` varchar(32) DEFAULT NULL,
  `iconcolor` varchar(32) DEFAULT NULL,
  `shortname` varchar(32) DEFAULT NULL,
  `navigation` varchar(32) NOT NULL COMMENT 'Navigation',
  `alternativeicon` varchar(32) DEFAULT NULL,
  `priority` tinyint(3) DEFAULT NULL COMMENT 'Priority',
  `viewlevel` tinyint(2) NOT NULL DEFAULT '1' COMMENT 'View Level, 1 for all, 0 for admins',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Table structure for table `sms_othermessages` */

DROP TABLE IF EXISTS `sms_othermessages`;

CREATE TABLE `sms_othermessages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `messageid` int(11) NOT NULL COMMENT 'Message',
  `contactid` int(11) NOT NULL COMMENT 'Contact/Mobile NO',
  `messagestatusid` int(11) NOT NULL COMMENT 'Message Status',
  `senton` date NOT NULL COMMENT 'Date Sent',
  `smscount` tinyint(2) NOT NULL DEFAULT '1' COMMENT 'SMS Count',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `messageid` (`messageid`),
  KEY `contactid` (`contactid`),
  KEY `messagestatusid` (`messagestatusid`),
  CONSTRAINT `sms_othermessages_ibfk_1` FOREIGN KEY (`messageid`) REFERENCES `sms_messages` (`id`),
  CONSTRAINT `sms_othermessages_ibfk_2` FOREIGN KEY (`contactid`) REFERENCES `sms_contacts` (`id`),
  CONSTRAINT `sms_othermessages_ibfk_3` FOREIGN KEY (`messagestatusid`) REFERENCES `sms_messagestatus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sms_senderids` */

DROP TABLE IF EXISTS `sms_senderids`;

CREATE TABLE `sms_senderids` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) DEFAULT NULL COMMENT 'Sender ID Name',
  `smsproviderid` int(11) DEFAULT NULL COMMENT 'SMS Provider',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `smsproviderid` (`smsproviderid`),
  CONSTRAINT `sms_senderids_ibfk_1` FOREIGN KEY (`smsproviderid`) REFERENCES `sms_smsproviders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `sms_sentmessages` */

DROP TABLE IF EXISTS `sms_sentmessages`;

CREATE TABLE `sms_sentmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messageid` int(11) NOT NULL COMMENT 'Message',
  `contactid` int(11) NOT NULL COMMENT 'Contact',
  `senton` datetime DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Message Send Status',
  `is_active` enum('0','1') DEFAULT '1',
  `remarks` text COMMENT 'Remarks',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT '1',
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sms_sentmessages_pef_sms_messages` (`messageid`),
  KEY `sms_sentmessages_pef_sms_contacts` (`contactid`),
  CONSTRAINT `sms_sentmessages_pef_sms_contacts` FOREIGN KEY (`contactid`) REFERENCES `sms_contacts` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `sms_sentmessages_pef_sms_messages` FOREIGN KEY (`messageid`) REFERENCES `sms_messages` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1419 DEFAULT CHARSET=latin1;

/*Table structure for table `sms_smsapiresponselog` */

DROP TABLE IF EXISTS `sms_smsapiresponselog`;

CREATE TABLE `sms_smsapiresponselog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `feedback` text,
  `clientid` int(11) unsigned DEFAULT NULL,
  `messageid` int(11) unsigned DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=latin1;

/*Table structure for table `sms_smsbuyingprices` */

DROP TABLE IF EXISTS `sms_smsbuyingprices`;

CREATE TABLE `sms_smsbuyingprices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `smsproviderid` int(11) NOT NULL COMMENT 'SMS Provider',
  `mobilecarrierid` int(11) NOT NULL COMMENT 'Mobile Carrier',
  `buyingconst` double(10,2) DEFAULT '0.00' COMMENT 'Buying Price Per SMS',
  `remarks` text COMMENT 'Remarks',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `smsproviderid` (`smsproviderid`),
  KEY `mobilecarrierid` (`mobilecarrierid`),
  CONSTRAINT `sms_smsbuyingprices_ibfk_1` FOREIGN KEY (`smsproviderid`) REFERENCES `sms_smsproviders` (`id`),
  CONSTRAINT `sms_smsbuyingprices_ibfk_2` FOREIGN KEY (`mobilecarrierid`) REFERENCES `sms_mobilecarrier` (`id`),
  CONSTRAINT `sms_smsbuyingprices_ibfk_3` FOREIGN KEY (`smsproviderid`) REFERENCES `sms_smsproviders` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `sms_smsbuyingprices_ibfk_4` FOREIGN KEY (`mobilecarrierid`) REFERENCES `sms_mobilecarrier` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `sms_smsclients` */

DROP TABLE IF EXISTS `sms_smsclients`;

CREATE TABLE `sms_smsclients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL COMMENT 'Client Name',
  `senderid` int(11) unsigned NOT NULL COMMENT 'Sender ID',
  `otponlogin` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'Two Way Auth',
  `email` varchar(64) DEFAULT NULL COMMENT 'Contact Email Address',
  `mobile` varchar(32) DEFAULT NULL COMMENT 'Mobile',
  `address` varchar(64) DEFAULT NULL COMMENT 'Address',
  `remarks` text COMMENT 'Remarks',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `senderid` (`senderid`),
  CONSTRAINT `sms_smsclients_ibfk_1` FOREIGN KEY (`senderid`) REFERENCES `sms_senderids` (`id`),
  CONSTRAINT `sms_smsclients_ibfk_2` FOREIGN KEY (`senderid`) REFERENCES `sms_senderids` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `sms_smsdictionary` */

DROP TABLE IF EXISTS `sms_smsdictionary`;

CREATE TABLE `sms_smsdictionary` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `sms_smserrorlogs` */

DROP TABLE IF EXISTS `sms_smserrorlogs`;

CREATE TABLE `sms_smserrorlogs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `messageid` int(11) DEFAULT NULL,
  `message` text,
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=latin1;

/*Table structure for table `sms_smsexpectedsellingprices` */

DROP TABLE IF EXISTS `sms_smsexpectedsellingprices`;

CREATE TABLE `sms_smsexpectedsellingprices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `smsproviderid` int(11) NOT NULL COMMENT 'SMS Provider',
  `mobilecarrierid` int(11) NOT NULL COMMENT 'Mobile Carrier',
  `sellingprice` double(10,2) DEFAULT '0.00' COMMENT 'Selling Price Per SMS',
  `remarks` text COMMENT 'Remarks',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `smsproviderid` (`smsproviderid`),
  KEY `mobilecarrierid` (`mobilecarrierid`),
  CONSTRAINT `sms_smsexpectedsellingprices_ibfk_1` FOREIGN KEY (`smsproviderid`) REFERENCES `sms_smsproviders` (`id`),
  CONSTRAINT `sms_smsexpectedsellingprices_ibfk_2` FOREIGN KEY (`mobilecarrierid`) REFERENCES `sms_mobilecarrier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `sms_smsproviders` */

DROP TABLE IF EXISTS `sms_smsproviders`;

CREATE TABLE `sms_smsproviders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'SMS Provider',
  `mobile` varchar(32) DEFAULT NULL COMMENT 'Mobile',
  `address` varchar(64) DEFAULT NULL COMMENT 'Address',
  `remarks` text COMMENT 'Remarks',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `sms_smssellingprices` */

DROP TABLE IF EXISTS `sms_smssellingprices`;

CREATE TABLE `sms_smssellingprices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL COMMENT 'Client Name',
  `smsproviderid` int(11) NOT NULL COMMENT 'SMS Provider',
  `mobilecarrierid` int(11) NOT NULL COMMENT 'Mobile Carrier',
  `sellingprice` double(10,2) DEFAULT '0.00' COMMENT 'Selling Price Per SMS',
  `remarks` text COMMENT 'Remarks',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `smsproviderid` (`smsproviderid`),
  KEY `mobilecarrierid` (`mobilecarrierid`),
  CONSTRAINT `sms_smssellingprices_ibfk_1` FOREIGN KEY (`clientid`) REFERENCES `sms_smsclients` (`id`),
  CONSTRAINT `sms_smssellingprices_ibfk_2` FOREIGN KEY (`smsproviderid`) REFERENCES `sms_smsproviders` (`id`),
  CONSTRAINT `sms_smssellingprices_ibfk_3` FOREIGN KEY (`mobilecarrierid`) REFERENCES `sms_mobilecarrier` (`id`),
  CONSTRAINT `sms_smssellingprices_ibfk_4` FOREIGN KEY (`clientid`) REFERENCES `sms_smsclients` (`id`),
  CONSTRAINT `sms_smssellingprices_ibfk_5` FOREIGN KEY (`smsproviderid`) REFERENCES `sms_smsproviders` (`id`),
  CONSTRAINT `sms_smssellingprices_ibfk_6` FOREIGN KEY (`mobilecarrierid`) REFERENCES `sms_mobilecarrier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `sms_smstypes` */

DROP TABLE IF EXISTS `sms_smstypes`;

CREATE TABLE `sms_smstypes` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Table structure for table `sms_submodules` */

DROP TABLE IF EXISTS `sms_submodules`;

CREATE TABLE `sms_submodules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name ',
  `moduleid` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` enum('main','setup','report') DEFAULT NULL,
  `ruleid` int(11) DEFAULT NULL,
  `is_enabled` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `submodulename` varchar(32) DEFAULT NULL,
  `viewlevel` tinyint(2) DEFAULT '1' COMMENT '0 admin only, 1 other groups',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=329 DEFAULT CHARSET=latin1;

/*Table structure for table `sms_templates` */

DROP TABLE IF EXISTS `sms_templates`;

CREATE TABLE `sms_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Template Name',
  `message` text NOT NULL COMMENT 'Message',
  `clientid` int(11) NOT NULL COMMENT 'Client Name',
  `sms_type_id` tinyint(4) unsigned DEFAULT NULL COMMENT 'SMS Type',
  `is_active` enum('0','1') DEFAULT '1',
  `remarks` text COMMENT 'Remarks',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT '1',
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `branch_id` int(11) unsigned DEFAULT NULL COMMENT 'Branch Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sms_type_id` (`sms_type_id`,`branch_id`),
  KEY `clientid` (`clientid`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `sms_templates_ibfk_1` FOREIGN KEY (`clientid`) REFERENCES `sms_smsclients` (`id`),
  CONSTRAINT `sms_templates_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `auth_branches` (`id`),
  CONSTRAINT `sms_templates_ibfk_3` FOREIGN KEY (`sms_type_id`) REFERENCES `sms_smstypes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1250 DEFAULT CHARSET=latin1;

/*Table structure for table `sms_transactionstatus` */

DROP TABLE IF EXISTS `sms_transactionstatus`;

CREATE TABLE `sms_transactionstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Transaction Name',
  `remarks` text COMMENT 'Remarks',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT '1',
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sms_vatrate` */

DROP TABLE IF EXISTS `sms_vatrate`;

CREATE TABLE `sms_vatrate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vatclassid` int(11) unsigned NOT NULL COMMENT 'VAT',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `vatclassid` (`vatclassid`),
  CONSTRAINT `sms_vatrate_ibfk_1` FOREIGN KEY (`vatclassid`) REFERENCES `vat_classes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `status` */

DROP TABLE IF EXISTS `status`;

CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `stock` */

DROP TABLE IF EXISTS `stock`;

CREATE TABLE `stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) DEFAULT NULL,
  `recorddate` date DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `is_active` enum('0','1') COLLATE latin1_general_ci DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

/*Table structure for table `stocks` */

DROP TABLE IF EXISTS `stocks`;

CREATE TABLE `stocks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `itemid` int(11) unsigned NOT NULL COMMENT 'Item Name',
  `quantity` float NOT NULL COMMENT 'Quantity',
  `value` double DEFAULT NULL COMMENT 'Value',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `itemid` (`itemid`),
  CONSTRAINT `stocks_ibfk_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=latin1;

/*Table structure for table `stocktrack` */

DROP TABLE IF EXISTS `stocktrack`;

CREATE TABLE `stocktrack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) NOT NULL,
  `studentid` int(11) unsigned DEFAULT NULL COMMENT 'Student',
  `tid` int(11) DEFAULT NULL,
  `batchno` varchar(32) DEFAULT NULL,
  `quantity` double NOT NULL,
  `costprice` double DEFAULT '0',
  `value` double DEFAULT '0',
  `discount` double DEFAULT '0',
  `tradeprice` double DEFAULT '0',
  `retailprice` double NOT NULL,
  `applicabletax` double DEFAULT '0',
  `expirydate` date NOT NULL DEFAULT '0000-00-00',
  `recorddate` date DEFAULT '0000-00-00',
  `status` int(2) DEFAULT '1' COMMENT 'takes value 1 if not sold, 2 if not all sold, and 3 if all sold',
  `remain` double NOT NULL DEFAULT '0',
  `transaction` varchar(32) DEFAULT NULL,
  `ipaddress` varchar(32) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createdon` datetime NOT NULL,
  `lasteditedby` int(11) NOT NULL,
  `lasteditedon` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `documentno` varchar(20) DEFAULT NULL,
  `cr` int(11) DEFAULT NULL,
  `bonus` int(11) DEFAULT '0',
  `supplierid` int(11) DEFAULT NULL,
  `invoiceno` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=358 DEFAULT CHARSET=latin1;

/*Table structure for table `sub_modules` */

DROP TABLE IF EXISTS `sub_modules`;

CREATE TABLE `sub_modules` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT 'Name ',
  `moduleid` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` enum('main','setup','report') DEFAULT NULL,
  `ruleid` int(11) DEFAULT NULL,
  `is_enabled` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `submodulename` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=589 DEFAULT CHARSET=latin1;

/*Table structure for table `subaccounttypes` */

DROP TABLE IF EXISTS `subaccounttypes`;

CREATE TABLE `subaccounttypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT 'Sub Account',
  `accounttypeid` int(11) NOT NULL COMMENT 'Account Type',
  `priority` int(11) DEFAULT NULL,
  `remarks` text COMMENT 'Remarks',
  `ipaddress` varchar(32) DEFAULT NULL COMMENT 'IP Address',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  KEY `subaccounttypesfkaccounttypes` (`accounttypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Table structure for table `sys_actions` */

DROP TABLE IF EXISTS `sys_actions`;

CREATE TABLE `sys_actions` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT 'Action Name',
  `description` varchar(250) DEFAULT NULL COMMENT 'Description',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `sys_approvalevels` */

DROP TABLE IF EXISTS `sys_approvalevels`;

CREATE TABLE `sys_approvalevels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `levelid` int(11) NOT NULL COMMENT 'User Lever',
  PRIMARY KEY (`id`),
  KEY `sys_approvalevels_jm_levels` (`levelid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `sys_approvallevelsroutes` */

DROP TABLE IF EXISTS `sys_approvallevelsroutes`;

CREATE TABLE `sys_approvallevelsroutes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `approvalevellid` int(11) DEFAULT NULL,
  `follows` int(11) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_approvallevelsroutes_jm_sys_approvalevels` (`approvalevellid`),
  KEY `follows` (`follows`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `sys_audittrail` */

DROP TABLE IF EXISTS `sys_audittrail`;

CREATE TABLE `sys_audittrail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `action` int(11) NOT NULL,
  `actiondescription` text,
  `value` varchar(64) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_audittrail_jm_sys_useractions` (`action`)
) ENGINE=InnoDB AUTO_INCREMENT=2395 DEFAULT CHARSET=latin1;

/*Table structure for table `sys_companyconfigs` */

DROP TABLE IF EXISTS `sys_companyconfigs`;

CREATE TABLE `sys_companyconfigs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) unsigned DEFAULT NULL COMMENT 'Branch Name',
  `companyname` varchar(100) DEFAULT NULL,
  `showlogo` enum('0','1') DEFAULT NULL,
  `emailaddress` text,
  `mobile` varchar(64) DEFAULT NULL,
  `bank_account` varchar(32) DEFAULT NULL,
  `bank_branch` varchar(32) DEFAULT NULL,
  `location` text,
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `website` varchar(64) DEFAULT NULL,
  `facebook` varchar(64) DEFAULT NULL,
  `twitter` varchar(64) DEFAULT NULL,
  `youtube` varchar(64) DEFAULT NULL,
  `motto` text COMMENT 'Motto',
  `paybill_no` varchar(10) DEFAULT NULL COMMENT 'Paybill No',
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `sys_companyconfigs_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `auth_branches` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `sys_configs` */

DROP TABLE IF EXISTS `sys_configs`;

CREATE TABLE `sys_configs` (
  `id` int(11) NOT NULL,
  `systemname` varchar(64) DEFAULT NULL,
  `is_logoenabled` enum('yes','no') DEFAULT 'yes',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_coopapiresponsecomponents` */

DROP TABLE IF EXISTS `sys_coopapiresponsecomponents`;

CREATE TABLE `sys_coopapiresponsecomponents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `MessageReference` varchar(32) DEFAULT NULL,
  `MessageDateTime` varchar(64) DEFAULT NULL,
  `ServiceName` varchar(64) DEFAULT NULL,
  `NotificationCode` varchar(64) DEFAULT NULL,
  `PaymentRef` varchar(64) DEFAULT NULL,
  `AccountNumber` varchar(64) DEFAULT NULL,
  `Amount` double DEFAULT '0',
  `TransactionDate` varchar(64) DEFAULT NULL,
  `EventType` varchar(32) DEFAULT NULL,
  `Currency` varchar(10) DEFAULT NULL,
  `ExchangeRate` double DEFAULT '0',
  `Narration` text,
  `CustMemo` varchar(64) DEFAULT NULL,
  `CustMemoLine1` varchar(64) DEFAULT NULL,
  `CustMemoLine2` varchar(64) DEFAULT NULL,
  `CustMemoLine3` varchar(64) DEFAULT NULL,
  `ValueDate` varchar(64) DEFAULT NULL,
  `EntryDate` varchar(64) DEFAULT NULL,
  `TransactionId` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `sys_coopapiresponselogs` */

DROP TABLE IF EXISTS `sys_coopapiresponselogs`;

CREATE TABLE `sys_coopapiresponselogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `responseBody` text,
  `createdon` date DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `sys_coopapiresponsestatuslogs` */

DROP TABLE IF EXISTS `sys_coopapiresponsestatuslogs`;

CREATE TABLE `sys_coopapiresponsestatuslogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transactionstatus` enum('0','1') DEFAULT NULL COMMENT 'Api status',
  `comment` text COMMENT 'Transaction Comment',
  `createdon` date DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `sys_countries` */

DROP TABLE IF EXISTS `sys_countries`;

CREATE TABLE `sys_countries` (
  `id` int(11) NOT NULL,
  `country_code` varchar(32) NOT NULL COMMENT 'Country Code',
  `name` varchar(32) NOT NULL COMMENT 'Country',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_countys` */

DROP TABLE IF EXISTS `sys_countys`;

CREATE TABLE `sys_countys` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('1','0') DEFAULT '1' COMMENT 'Is Enabled',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_fleetcontribution` */

DROP TABLE IF EXISTS `sys_fleetcontribution`;

CREATE TABLE `sys_fleetcontribution` (
  `id` int(11) NOT NULL,
  `fleetid` int(11) NOT NULL COMMENT 'Fleet Name',
  `amount` decimal(10,0) DEFAULT '0' COMMENT 'Amount Paid',
  `paidon` date DEFAULT NULL COMMENT 'Paid On',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` date DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `paymentmodeid` int(11) NOT NULL COMMENT 'Payment Mode',
  `bankid` int(11) DEFAULT NULL COMMENT 'Bank Name',
  `documentno` varchar(32) DEFAULT NULL COMMENT 'Document No',
  `transactionno` varchar(32) DEFAULT NULL COMMENT 'Transaction NO.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_gender` */

DROP TABLE IF EXISTS `sys_gender`;

CREATE TABLE `sys_gender` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'Gender',
  `remarks` tinytext,
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `sys_interesttypes` */

DROP TABLE IF EXISTS `sys_interesttypes`;

CREATE TABLE `sys_interesttypes` (
  `id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_loancharges` */

DROP TABLE IF EXISTS `sys_loancharges`;

CREATE TABLE `sys_loancharges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chargeid` int(11) NOT NULL,
  `loanproductid` int(11) NOT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `createdby` int(11) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_loancharges_jm_saccoloan_jm` (`loanproductid`),
  KEY `sys_loancharges_jm_charges` (`chargeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_loaninterestconfig` */

DROP TABLE IF EXISTS `sys_loaninterestconfig`;

CREATE TABLE `sys_loaninterestconfig` (
  `id` int(11) NOT NULL,
  `loanproductid` int(11) DEFAULT NULL,
  `interesttypeid` int(11) DEFAULT NULL,
  `interestrate` double DEFAULT '0',
  `paidevery` enum('week','month','year') DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(31) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_loaninterestconfig_jm_sys_interesttypes` (`interesttypeid`),
  KEY `sys_loaninterestconfig_jm_saccoloans` (`loanproductid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_loanprocessingfeeconfig` */

DROP TABLE IF EXISTS `sys_loanprocessingfeeconfig`;

CREATE TABLE `sys_loanprocessingfeeconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loanproductid` int(11) DEFAULT NULL,
  `processingmode` enum('%','fixedvalue') DEFAULT NULL,
  `amount` double DEFAULT '0',
  `percentafeof` enum('principal','interest') DEFAULT NULL,
  `paidon` enum('application','disbursement','firstrepayment') DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(31) DEFAULT NULL,
  `chargetimeid` int(11) DEFAULT NULL,
  `chargeid` int(11) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  PRIMARY KEY (`id`),
  KEY `sys_loanprocessingfeeconfig_jm_saccoloans` (`loanproductid`),
  KEY `sys_loanprocessingfeeconfigs_jm_charges` (`chargetimeid`),
  KEY `sys_loanprocessingfeeconfigs_jm_chargess` (`chargeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_loansecurityconfig` */

DROP TABLE IF EXISTS `sys_loansecurityconfig`;

CREATE TABLE `sys_loansecurityconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paymentmodes` enum('%','fixedvalue') DEFAULT NULL,
  `amount` double DEFAULT '0',
  `percentafeof` enum('principal','interest') DEFAULT 'principal',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `defaultsecurity` double DEFAULT '0',
  `loanproductid` int(11) DEFAULT NULL,
  `chargetimeid` int(11) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  PRIMARY KEY (`id`),
  KEY `sys_loansecurityconfig_jm_saccoloan` (`loanproductid`),
  KEY `chargetime` (`chargetimeid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `sys_module` */

DROP TABLE IF EXISTS `sys_module`;

CREATE TABLE `sys_module` (
  `id` int(11) NOT NULL,
  `module` varchar(64) NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `shortname` varchar(32) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_enabled` enum('YES','NO') DEFAULT 'NO',
  `navigation` varchar(32) DEFAULT NULL,
  `moduleicon` varchar(32) DEFAULT NULL,
  `typeid` int(11) NOT NULL DEFAULT '1',
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_modules` */

DROP TABLE IF EXISTS `sys_modules`;

CREATE TABLE `sys_modules` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL COMMENT 'Name ',
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_modules_audit` */

DROP TABLE IF EXISTS `sys_modules_audit`;

CREATE TABLE `sys_modules_audit` (
  `id` int(11) NOT NULL,
  `action` varchar(32) DEFAULT NULL,
  `actionby` int(11) DEFAULT NULL,
  `rowid` int(11) DEFAULT NULL,
  `name` text COMMENT 'Name ',
  `status` text,
  `actiondate` datetime DEFAULT NULL COMMENT 'Action Date',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_months` */

DROP TABLE IF EXISTS `sys_months`;

CREATE TABLE `sys_months` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month` varchar(32) NOT NULL COMMENT 'Month Name',
  `monthserial` varchar(3) NOT NULL COMMENT 'Month Serial',
  `firstday` varchar(3) NOT NULL COMMENT 'First Day',
  `lastday` varchar(3) NOT NULL COMMENT 'Last Day',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Table structure for table `sys_registrationfee` */

DROP TABLE IF EXISTS `sys_registrationfee`;

CREATE TABLE `sys_registrationfee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) NOT NULL COMMENT 'Fleet Owner Name',
  `amount` decimal(10,0) DEFAULT '0' COMMENT 'Amount Paid',
  `paidon` date DEFAULT NULL COMMENT 'Paid On',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` date DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `paymentmodeid` int(11) NOT NULL COMMENT 'Payment Mode',
  `bankid` int(11) DEFAULT NULL COMMENT 'Bank Name',
  `documentno` varchar(32) DEFAULT NULL COMMENT 'Document No',
  `transactionno` varchar(32) DEFAULT NULL COMMENT 'Transaction NO.',
  PRIMARY KEY (`id`),
  KEY `sys_registrationfee_pef_fleetowners` (`memberid`),
  CONSTRAINT `sys_registrationfee_pef_fleetowners` FOREIGN KEY (`memberid`) REFERENCES `assets_fleetowners` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_schbranchsmssettings` */

DROP TABLE IF EXISTS `sys_schbranchsmssettings`;

CREATE TABLE `sys_schbranchsmssettings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sms_setting_id` tinyint(3) unsigned NOT NULL COMMENT 'Sms Notification Setting',
  `branch_id` int(11) unsigned NOT NULL COMMENT 'Branch Name',
  `status` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'Status',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sms_setting_id` (`sms_setting_id`,`branch_id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `sys_schbranchsmssettings_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `auth_branches` (`id`),
  CONSTRAINT `sys_schbranchsmssettings_ibfk_2` FOREIGN KEY (`sms_setting_id`) REFERENCES `sys_schsettings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `sys_schsettings` */

DROP TABLE IF EXISTS `sys_schsettings`;

CREATE TABLE `sys_schsettings` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `setting` varchar(100) NOT NULL COMMENT 'Setting Name',
  `value` varchar(10) NOT NULL COMMENT 'Setting Value',
  `description` varchar(250) DEFAULT NULL COMMENT 'Description',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting` (`setting`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Table structure for table `sys_settings` */

DROP TABLE IF EXISTS `sys_settings`;

CREATE TABLE `sys_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL COMMENT 'Setting Name',
  `value` varchar(128) NOT NULL COMMENT 'Setting Value',
  `shortname` varchar(32) NOT NULL COMMENT 'Short Name',
  `remarks` text COMMENT 'Remarks',
  `createdon` date DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_enabled` enum('0','1') DEFAULT '1' COMMENT 'Is Enabled',
  `fleetmonthlycontribution` double DEFAULT '0' COMMENT 'Fleet Monthly Contribution',
  `fleetmonthlysavings` double DEFAULT '0' COMMENT 'Fleet Monthly Savings',
  `fleetoperatingexpenses` double DEFAULT '0' COMMENT 'Fleet Operating Expenses',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_submodule` */

DROP TABLE IF EXISTS `sys_submodule`;

CREATE TABLE `sys_submodule` (
  `id` int(11) NOT NULL,
  `moduleid` int(11) NOT NULL,
  `submodulename` varchar(64) DEFAULT NULL,
  `displayname` varchar(64) NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `shortname` varchar(32) DEFAULT NULL,
  `is_enabled` enum('Yes','No') DEFAULT 'Yes',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `acsubmodule` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_submoduleitems` */

DROP TABLE IF EXISTS `sys_submoduleitems`;

CREATE TABLE `sys_submoduleitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submoduleid` int(11) NOT NULL COMMENT 'Submodule',
  `submoduleitemid` int(11) NOT NULL COMMENT 'Module Item',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1' COMMENT 'Enabled',
  `ipaddress` varchar(32) DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `remarks` varchar(64) DEFAULT NULL COMMENT 'Remarks',
  `priority` tinyint(11) DEFAULT NULL COMMENT 'Priority',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=latin1;

/*Table structure for table `sys_submoduletypes` */

DROP TABLE IF EXISTS `sys_submoduletypes`;

CREATE TABLE `sys_submoduletypes` (
  `id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL COMMENT 'Module type',
  `remarks` text COMMENT 'Remarks',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_systemconfigs` */

DROP TABLE IF EXISTS `sys_systemconfigs`;

CREATE TABLE `sys_systemconfigs` (
  `id` int(11) NOT NULL,
  `companyid` int(11) DEFAULT NULL,
  `allowbulkloanupload` enum('0','1') DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_systemvariables` */

DROP TABLE IF EXISTS `sys_systemvariables`;

CREATE TABLE `sys_systemvariables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) DEFAULT NULL,
  `headerfontsize` varchar(10) DEFAULT NULL,
  `headerfontfamily` varchar(128) DEFAULT NULL COMMENT 'Header Font family',
  `datatablerowcolor` varchar(7) DEFAULT NULL COMMENT 'Datatable hover color',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `sys_transactions` */

DROP TABLE IF EXISTS `sys_transactions`;

CREATE TABLE `sys_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` date DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Table structure for table `sys_useractions` */

DROP TABLE IF EXISTS `sys_useractions`;

CREATE TABLE `sys_useractions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actionname` varchar(32) NOT NULL,
  `actionvalue` varchar(32) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `sys_usersessionlogs` */

DROP TABLE IF EXISTS `sys_usersessionlogs`;

CREATE TABLE `sys_usersessionlogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `sessionstarts` datetime DEFAULT NULL,
  `sessionends` datetime DEFAULT NULL,
  `logoutstatus` enum('0','1') DEFAULT '0',
  `createdon` datetime DEFAULT NULL,
  `loginstatus` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=481 DEFAULT CHARSET=latin1;

/*Table structure for table `sys_years` */

DROP TABLE IF EXISTS `sys_years`;

CREATE TABLE `sys_years` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` varchar(32) NOT NULL COMMENT 'Year Name',
  `createdby` int(11) DEFAULT NULL,
  `createdon` date DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Table structure for table `tasks` */

DROP TABLE IF EXISTS `tasks`;

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `subject` varchar(32) NOT NULL COMMENT 'Subject',
  `description` text NOT NULL COMMENT 'Body',
  `routeid` int(11) NOT NULL COMMENT 'Route',
  `routedetailid` int(11) NOT NULL COMMENT 'Route Detail',
  `employeeid` int(11) DEFAULT NULL,
  `ownerid` int(11) NOT NULL COMMENT 'Owner',
  `userid` int(11) DEFAULT NULL,
  `uniqueno` varchar(32) NOT NULL COMMENT 'Unique No',
  `priority` enum('High','Midium','Low') NOT NULL COMMENT 'Priority',
  `taskstatusid` int(11) NOT NULL COMMENT 'Status',
  `email` varchar(32) DEFAULT NULL,
  `remarks` text,
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `taskstatus` */

DROP TABLE IF EXISTS `taskstatus`;

CREATE TABLE `taskstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT 'Name',
  `remarks` text,
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `tasktracks` */

DROP TABLE IF EXISTS `tasktracks`;

CREATE TABLE `tasktracks` (
  `id` int(11) NOT NULL,
  `taskid` int(11) NOT NULL COMMENT 'Task',
  `statusid` int(11) NOT NULL COMMENT 'Status',
  `changedon` datetime NOT NULL COMMENT 'Changed On',
  `remarks` text COMMENT 'Remarks',
  `ipaddress` varchar(32) DEFAULT NULL COMMENT 'IP Address',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `uniqueno` varchar(32) DEFAULT NULL COMMENT 'Uniqueno',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tblevmpesabtccallbacklogs` */

DROP TABLE IF EXISTS `tblevmpesabtccallbacklogs`;

CREATE TABLE `tblevmpesabtccallbacklogs` (
  `mpesabtccallbacklog_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `response` text,
  `type` varchar(3) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`mpesabtccallbacklog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tblevmpesabtcrequest` */

DROP TABLE IF EXISTS `tblevmpesabtcrequest`;

CREATE TABLE `tblevmpesabtcrequest` (
  `mpesabtc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agrodealer_payment_attempt_id` int(10) unsigned NOT NULL,
  `mpesastkpush_id` int(10) unsigned NOT NULL,
  `agrodealer_id` int(10) unsigned NOT NULL,
  `originator_conversation_id` varchar(100) DEFAULT NULL,
  `agrodealer_account_type` tinyint(1) NOT NULL COMMENT '1=phone number, 2= mpesa account',
  `lipanampesa_account_number` varchar(20) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `amount` double(10,2) NOT NULL,
  `accepted_responce` text NOT NULL,
  `accepted_status` tinyint(1) NOT NULL COMMENT '1=success, 0=failed',
  `callback_responce` text,
  `callback_status` tinyint(4) DEFAULT NULL COMMENT '1=success, 0=failed',
  `server` varchar(100) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `confirm_originator_conversation_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`mpesabtc_id`),
  UNIQUE KEY `originator_conversation_id` (`originator_conversation_id`),
  UNIQUE KEY `confirm_originator_conversation_id` (`confirm_originator_conversation_id`),
  KEY `mpesastkpush_id` (`mpesastkpush_id`),
  KEY `agrodealer_payment_attempt_id` (`agrodealer_payment_attempt_id`),
  CONSTRAINT `tblevmpesabtcrequest_ibfk_1` FOREIGN KEY (`mpesastkpush_id`) REFERENCES `tblevmpesastkpushrequests` (`mpesastkpush_id`),
  CONSTRAINT `tblevmpesabtcrequest_ibfk_2` FOREIGN KEY (`agrodealer_payment_attempt_id`) REFERENCES `tblevagrodealerpaymentattemptlog` (`agrodealer_payment_attempt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

/*Table structure for table `tblevmpesastkpushrequests` */

DROP TABLE IF EXISTS `tblevmpesastkpushrequests`;

CREATE TABLE `tblevmpesastkpushrequests` (
  `mpesastkpush_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `redemption_attempt_id` int(10) unsigned NOT NULL,
  `farmer_id` int(10) unsigned NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `responce` text NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1=successful, 2=failed',
  `merchant_request_id` varchar(50) NOT NULL,
  `mpesastkpush_status_id` tinyint(3) unsigned NOT NULL,
  `callback_responce` text,
  `server` varchar(100) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `stk_timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`mpesastkpush_id`),
  KEY `mpesastkpush_status_id` (`mpesastkpush_status_id`),
  KEY `FK_tblevmpesastkpushrequests_redemption_attempt` (`redemption_attempt_id`),
  CONSTRAINT `FK_tblevmpesastkpushrequests_redemption_attempt` FOREIGN KEY (`redemption_attempt_id`) REFERENCES `tblevredemptionattemptlog` (`redemption_attempt_id`),
  CONSTRAINT `tblevmpesastkpushrequests_ibfk_1` FOREIGN KEY (`mpesastkpush_status_id`) REFERENCES `tblevmpesastkpushstatus` (`mpesastkpush_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=latin1;

/*Table structure for table `tblevmpesastkpushstatus` */

DROP TABLE IF EXISTS `tblevmpesastkpushstatus`;

CREATE TABLE `tblevmpesastkpushstatus` (
  `mpesastkpush_status_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`mpesastkpush_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `tblmpesaapitypes` */

DROP TABLE IF EXISTS `tblmpesaapitypes`;

CREATE TABLE `tblmpesaapitypes` (
  `api_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `api_type` varchar(50) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`api_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `tblmpesatransactionlogs` */

DROP TABLE IF EXISTS `tblmpesatransactionlogs`;

CREATE TABLE `tblmpesatransactionlogs` (
  `mpesa_transaction_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mpesa_type_id` int(10) unsigned NOT NULL,
  `callbackinfo` text,
  `createdon` datetime DEFAULT NULL,
  `ipaddress` varchar(32) NOT NULL,
  PRIMARY KEY (`mpesa_transaction_log_id`),
  KEY `mpesa_type_id` (`mpesa_type_id`),
  CONSTRAINT `tblmpesatransactionlogs_ibfk_1` FOREIGN KEY (`mpesa_type_id`) REFERENCES `tblmpesaapitypes` (`api_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=latin1;

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `transactions` */

DROP TABLE IF EXISTS `transactions`;

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT 'Name',
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `lasteditedby` int(11) DEFAULT NULL,
  `lasteditedon` datetime DEFAULT NULL,
  `ipaddress` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) unsigned DEFAULT NULL COMMENT 'Branch Name',
  `view_all` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'View All Branches',
  `ip_address` varchar(45) CHARACTER SET utf8 NOT NULL,
  `username` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `zoneid` int(11) DEFAULT NULL,
  `password_reset_code` text NOT NULL,
  `password_reset_time` date NOT NULL,
  `salt` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 NOT NULL,
  `activation_code` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `forgotten_password_code` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `company` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `levelid` int(11) DEFAULT NULL,
  `employeeid` int(11) DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `auth_branches` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `users_groups` */

DROP TABLE IF EXISTS `users_groups`;

CREATE TABLE `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `vat_classes` */

DROP TABLE IF EXISTS `vat_classes`;

CREATE TABLE `vat_classes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` int(11) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createdon` datetime NOT NULL,
  `lasteditedby` int(11) NOT NULL,
  `lasteditedon` datetime NOT NULL,
  `ipaddress` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `welfare` */

DROP TABLE IF EXISTS `welfare`;

CREATE TABLE `welfare` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL COMMENT 'Name',
  `currencyid` int(11) NOT NULL COMMENT 'Currency',
  `minopeningbalance` double NOT NULL COMMENT 'Min Opening Balance',
  `chargetransferfees` enum('Yes','No') NOT NULL COMMENT 'Charge Transfer Fees',
  `penaltyaccountid` int(11) DEFAULT NULL COMMENT 'Penalty Account',
  `feesaccountid` int(11) DEFAULT NULL COMMENT 'Fees Account',
  `status` enum('Active','Inactive') NOT NULL COMMENT 'Status',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL COMMENT 'Created By',
  `createdon` datetime DEFAULT NULL COMMENT 'Created On',
  `lasteditedby` int(11) DEFAULT NULL COMMENT 'Last Edited By',
  `lasteditedon` datetime DEFAULT NULL COMMENT 'Last Edited On',
  `ipaddress` varchar(32) DEFAULT NULL COMMENT 'IP Address',
  PRIMARY KEY (`id`),
  KEY `welfarefkcurrencys` (`currencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `welfarepayments` */

DROP TABLE IF EXISTS `welfarepayments`;

CREATE TABLE `welfarepayments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) NOT NULL COMMENT 'Member',
  `month` int(11) NOT NULL COMMENT 'Month',
  `year` int(11) NOT NULL COMMENT 'Year',
  `documentno` varchar(32) NOT NULL COMMENT 'Document No',
  `welfareid` int(11) NOT NULL COMMENT 'Savings',
  `amount` double NOT NULL COMMENT 'Amount',
  `paymentmodeid` int(11) NOT NULL COMMENT 'Payment Mode',
  `bankid` int(11) NOT NULL COMMENT 'Bank',
  `transactioncode` varchar(32) NOT NULL COMMENT 'Transaction No',
  `currencyid` int(11) NOT NULL COMMENT 'Currency',
  `paidon` date NOT NULL COMMENT 'Paid On',
  `paidby` varchar(32) DEFAULT NULL COMMENT 'Paid By',
  `remarks` text COMMENT 'Remarks',
  `createdby` int(11) DEFAULT NULL COMMENT 'Created By',
  `createdon` datetime DEFAULT NULL COMMENT 'Created On',
  `lasteditedby` int(11) DEFAULT NULL COMMENT 'Last Edited By',
  `lasteditedon` datetime DEFAULT NULL COMMENT 'Last Edited On',
  `ipaddress` varchar(32) DEFAULT NULL COMMENT 'IP Address',
  PRIMARY KEY (`id`),
  KEY `welfarepaymentsfkmembers` (`memberid`),
  KEY `welfarepaymentsfksavings` (`welfareid`),
  KEY `welfarepaymentsfkpaymentmodes` (`paymentmodeid`),
  KEY `welfarepaymentsfkbanks` (`bankid`),
  KEY `welfarepaymentsfkcurrencys` (`currencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* Trigger structure for table `memberpayables` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `memberpayables_audit` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `memberpayables_audit` AFTER DELETE ON `memberpayables` FOR EACH ROW BEGIN
  INSERT INTO memberpayables_audit(pk,paymenttermid,memberid,studentclasspromotiontermid,documentno,invoicedon,amount,remarks,createdon,createdby,lasteditedon,lasteditedby,ipaddress,is_active,action) 
VALUES (old.id,old.paymenttermid,old.memberid,old.studentclasspromotiontermid,old.documentno,old.invoicedon,old.amount,old.remarks,old.createdon,old.createdby,old.lasteditedon,old.lasteditedby,old.ipaddress,old.is_active,4 );
END */$$


DELIMITER ;

/* Trigger structure for table `sch_feepayments` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `sch_feepayments_audit` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `sch_feepayments_audit` AFTER DELETE ON `sch_feepayments` FOR EACH ROW BEGIN
  INSERT INTO sch_feepayments_audit(pk,studentid,studentclasspromotiontermid,amountpaid,paymentdate,actual_payment_date,payidby,paymentmodeid,bankid,description,transactionno,is_reversed,classid,termid,receiptno,createdon,createdby,lasteditedon,lasteditedby,ipaddress,is_active,action) 
VALUES (old.id,old.studentid,old.studentclasspromotiontermid,old.amountpaid,old.paymentdate,old.actual_payment_date,old.payidby,old.paymentmodeid,old.bankid,old.description,old.transactionno,old.is_reversed,old.classid,old.termid,old.receiptno,old.createdon,old.createdby,old.lasteditedon,old.lasteditedby,old.ipaddress,old.is_active,4 );
END */$$


DELIMITER ;

/* Trigger structure for table `sch_payablepayments` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `sch_payablepayments_audit` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `sch_payablepayments_audit` AFTER DELETE ON `sch_payablepayments` FOR EACH ROW BEGIN
  INSERT INTO sch_payablepayments_audit(pk,paymenttermid,studentclasspromotionid,paymentid,documentno,transactionno,paymentmodeid,bankid,paidon,amount,remarks,createdon,createdby,lasteditedon,lasteditedby,ipaddress,is_active,action) 
VALUES (old.id,old.paymenttermid,old.studentclasspromotionid,old.paymentid,old.documentno,old.transactionno,old.paymentmodeid,old.bankid,old.paidon,old.amount,old.remarks,old.createdon,old.createdby,old.lasteditedon,old.lasteditedby,old.ipaddress,old.is_active,4 );
END */$$


DELIMITER ;

/* Trigger structure for table `sch_schfeeidnvoicedetails` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `sch_schfeeidnvoicedetails_audit` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `sch_schfeeidnvoicedetails_audit` AFTER DELETE ON `sch_schfeeidnvoicedetails` FOR EACH ROW BEGIN
  INSERT INTO sch_schfeeidnvoicedetails_audit(id,invoiceid,feestructurevoteheadsid,amount, createdon,createdby,lasteditedon,lasteditedby,ipaddress,is_active
) VALUES (old.id,old.invoiceid,old.feestructurevoteheadsid,old.amount, old.createdon,old.createdby,old.lasteditedon,old.lasteditedby,old.ipaddress,old.is_active);
END */$$


DELIMITER ;

/* Trigger structure for table `sch_schfeeidnvoices` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `sch_schfeeidnvoices_audit` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `sch_schfeeidnvoices_audit` AFTER DELETE ON `sch_schfeeidnvoices` FOR EACH ROW BEGIN
  INSERT INTO sch_schfeeidnvoices_audit(pk,studentid,invoicedate,invoiceno,amount,balance,classid ,studentclasstermsid,is_reversed,createdon,createdby,lasteditedon,lasteditedby,ipaddress,is_active,action) 
VALUES (old.id,old.studentid,old.invoicedate,old.invoiceno,old.amount,old.balance,old.classid ,old.studentclasstermsid,old.is_reversed,old.createdon,old.createdby,old.lasteditedon,old.lasteditedby,old.ipaddress,old.is_active,4 );
END */$$


DELIMITER ;

/* Trigger structure for table `sch_schservicespayments` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `sch_schservicespayments_audit` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `sch_schservicespayments_audit` AFTER DELETE ON `sch_schservicespayments` FOR EACH ROW BEGIN
  INSERT INTO sch_schservicespayments_audit(pk,studentserviceid,paymentid,amount,balance,createdon,createdby,lasteditedon,lasteditedby,ipaddress,is_active,action) 
VALUES (old.id,old.studentserviceid,old.paymentid,old.amount,old.balance,old.createdon,old.createdby,old.lasteditedon,old.lasteditedby,old.ipaddress,old.is_active,4 );
END */$$


DELIMITER ;

/* Trigger structure for table `sch_schstudentservices` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `sch_schstudentservices_audit` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `sch_schstudentservices_audit` AFTER DELETE ON `sch_schstudentservices` FOR EACH ROW 
BEGIN
  INSERT INTO sch_schstudentservices_audit(`id`, `studentid` ,`studentclasspromotiontermid`, `serviceid`, `status` ,`createdon`, `createdby`,`lasteditedon` ,`lasteditedby`,`ipaddress`,`is_active`
) VALUES (old.id, old.studentid, old.studentclasspromotiontermid, old.serviceid, old.status,old.createdon, old.createdby, old.lasteditedon, old.lasteditedby, old.ipaddress, old.is_active);
END */$$


DELIMITER ;

/* Trigger structure for table `sch_schvoteheadspayments` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `sch_schvoteheadspayments_audit` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `sch_schvoteheadspayments_audit` AFTER DELETE ON `sch_schvoteheadspayments` FOR EACH ROW BEGIN
  INSERT INTO sch_schvoteheadspayments_audit(pk,paymentid,voteheadid,amount,balance,createdon,createdby,lasteditedon,lasteditedby,ipaddress,is_active,action) 
VALUES (old.id,old.paymentid,old.voteheadid,old.amount,old.balance,old.createdon,old.createdby,old.lasteditedon,old.lasteditedby,old.ipaddress,old.is_active,4 );
END */$$


DELIMITER ;

/* Trigger structure for table `sch_studentclasspromotion` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `sch_studentclasspromotion_uadit` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `sch_studentclasspromotion_uadit` AFTER DELETE ON `sch_studentclasspromotion` FOR EACH ROW 
BEGIN
  INSERT INTO sch_studentclasspromotion_uadit(`id`, `studentid` ,`classid`, `academicyearid`, `promotedon` ,`createdon`, `createdby`,`lasteditedon` ,`lasteditedby`,`ipaddress`,`is_active`
) VALUES (old.id, old.studentid, old.classid, old.academicyearid, old.promotedon,old.createdon, old.createdby, old.lasteditedon, old.lasteditedby, old.ipaddress, old.is_active);
END */$$


DELIMITER ;

/* Trigger structure for table `sch_studentclassterms` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `sch_studentclassterms_audit` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `sch_studentclassterms_audit` AFTER DELETE ON `sch_studentclassterms` FOR EACH ROW 
BEGIN
  INSERT INTO sch_studentclassterms_audit(id,studentclasspromotionid,termid,classtermid, reportingdate,is_active
) VALUES (old.id,old.studentclasspromotionid,old.termid,old.classtermid, old.reportingdate,old.is_active);
END */$$


DELIMITER ;

/* Trigger structure for table `sch_students` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `sch_students_audit` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `sch_students_audit` AFTER DELETE ON `sch_students` FOR EACH ROW 
BEGIN
  INSERT INTO sch_students_audit(student_id,name,admission_no,nemis_number, parentname ,classid,academicyearid,parent_mobile,secondary_mobile,dob,city,town ,streetaddress,mobile,email,remarks,createdby,createdon,is_active,ipaddress,lasteditedby,lasteditedon,current_class_id,current_term_id,current_academic_year,genderid,teachers_student,deactivated,deactivate_reason,branch_id
) VALUES (old.id,old.name,old.admission_no,old.nemis_number, old.parentname ,old.classid,old.academicyearid,old.parent_mobile,old.secondary_mobile,old.dob,old.city,old.town ,old.streetaddress,old.mobile,old.email,old.remarks,old.createdby,old.createdon,old.is_active,old.ipaddress,old.lasteditedby,old.lasteditedon,old.current_class_id,old.current_term_id,old.current_academic_year,old.genderid,old.teachers_student,old.deactivated,old.deactivate_reason,old.branch_id
);
END */$$


DELIMITER ;

/* Trigger structure for table `sch_studentservicesinvoices` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `sch_studentservicesinvoices_audit` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `sch_studentservicesinvoices_audit` AFTER DELETE ON `sch_studentservicesinvoices` FOR EACH ROW BEGIN
  INSERT INTO sch_studentservicesinvoices_audit(pk,invoiceid,studentserviceid,amount,balance,createdon,createdby,lasteditedon,lasteditedby,ipaddress,is_active,action) 
VALUES (old.id,old.invoiceid,old.studentserviceid,old.amount,old.balance,old.createdon,old.createdby,old.lasteditedon,old.lasteditedby,old.ipaddress,old.is_active,4 );
END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
