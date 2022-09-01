-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: aceptacion_byte
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `CategoryID` int NOT NULL,
  `CategoryName` varchar(60) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `Picture` longblob,
  PRIMARY KEY (`CategoryID`),
  UNIQUE KEY `U1` (`CategoryName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Categ1','Main category',NULL),(2,'Categ2','Side categ',NULL),(3,'Categ3','Last categ',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(65) NOT NULL,
  `ContactTitle` varchar(65) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `City` varchar(200) NOT NULL,
  `Region` varchar(200) NOT NULL,
  `PostalCode` varchar(45) NOT NULL,
  `Country` varchar(200) NOT NULL,
  `Phone` varchar(45) NOT NULL,
  `Fax` varchar(45) NOT NULL,
  PRIMARY KEY (`CustomerID`),
  KEY `I1` (`City`),
  KEY `I2` (`CompanyName`),
  KEY `I3` (`PostalCode`),
  KEY `I4` (`Region`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'TestCompany Change','TestContact','Add 1','Cit 1','Reg 1','11111','Cou 1','111 1111','11 11'),(2,'SuccessCo','SuccesfulContract','Add 2','Cit 1','Reg 1','12212','Cou 1','222 2222','22 22'),(3,'Thirdio SA','The Third','Add 3','Cit 2','Reg 2','32313','Cou 1','333 3333','33 33'),(7,'FourFour','Fours','Add 4','Cit 3','Reg 2','443443','Cou 1','444 4444','44 44');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `EmployeeID` int NOT NULL,
  `LastName` varchar(65) NOT NULL,
  `FirstName` varchar(65) NOT NULL,
  `Title` varchar(65) NOT NULL,
  `TitleOfCourtesy` varchar(65) NOT NULL,
  `BirthDate` date NOT NULL,
  `HireDate` date NOT NULL,
  `Adress` varchar(200) NOT NULL,
  `City` varchar(200) NOT NULL,
  `Region` varchar(200) NOT NULL,
  `PostalCode` varchar(45) NOT NULL,
  `Country` varchar(200) NOT NULL,
  `HomePhone` varchar(45) DEFAULT NULL,
  `Extension` varchar(45) DEFAULT NULL,
  `Photo` mediumblob,
  `Notes` varchar(200) DEFAULT NULL,
  `ReportsTo` varchar(65) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `I2` (`PostalCode`),
  KEY `I1` (`LastName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Doe','John','Manager','Salesperson','1984-05-21','2013-09-23','AddEmp 1','Cit 1','Reg 1','111234','Cou 1','111 2333',NULL,NULL,NULL,NULL),(2,'Smith','Jane','Employee','Salesperson','1991-01-05','2015-11-16','AddEmp 2','Cit 1','Reg 1','122345','Cou 1','222 3344',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `OrderID` int NOT NULL,
  `ProductID` int NOT NULL,
  `UnitPrice` decimal(6,2) NOT NULL,
  `Quantity` int NOT NULL,
  `Discount` decimal(6,2) NOT NULL,
  PRIMARY KEY (`OrderID`,`ProductID`),
  KEY `I1` (`OrderID`) /*!80000 INVISIBLE */,
  KEY `I2` (`OrderID`),
  KEY `I3` (`ProductID`) /*!80000 INVISIBLE */,
  KEY `I4` (`ProductID`),
  CONSTRAINT `fk_OrderID` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  CONSTRAINT `fk_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,1,22.50,30,10.00);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL,
  `CustomerID` int NOT NULL,
  `EmployeeID` int NOT NULL,
  `OrderDate` datetime NOT NULL,
  `RequiredDate` datetime NOT NULL,
  `ShippedDate` datetime NOT NULL,
  `ShipVia` int NOT NULL,
  `Freight` varchar(60) NOT NULL,
  `ShipName` varchar(60) NOT NULL,
  `ShipAdress` varchar(200) NOT NULL,
  `ShipCity` varchar(200) NOT NULL,
  `ShipRegion` varchar(200) NOT NULL,
  `ShipPostalCode` varchar(45) NOT NULL,
  `ShipContry` varchar(200) NOT NULL,
  `orderscol` varchar(45) NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `I2` (`CustomerID`),
  KEY `I3` (`EmployeeID`),
  KEY `I4` (`EmployeeID`) /*!80000 INVISIBLE */,
  KEY `I5` (`OrderDate`) /*!80000 INVISIBLE */,
  KEY `I6` (`ShippedDate`) /*!80000 INVISIBLE */,
  KEY `I7` (`ShipVia`) /*!80000 INVISIBLE */,
  KEY `I8` (`ShipPostalCode`),
  CONSTRAINT `fk_CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  CONSTRAINT `fk_EmployeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`),
  CONSTRAINT `fk_ShipVia` FOREIGN KEY (`ShipVia`) REFERENCES `shippers` (`ShipperID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,'2020-06-20 10:14:07','2020-06-22 10:14:07','2020-06-21 10:14:07',1,'Main','MainTransport','AddShip 1','ShipCit 1','ShipReg 1','112233','ShipCou 1','1223');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `ProductID` int NOT NULL,
  `ProductName` varchar(60) NOT NULL,
  `SupplierID` int NOT NULL,
  `CategoryID` int NOT NULL,
  `QuantityPerUnit` int NOT NULL,
  `UnitPrice` decimal(6,2) NOT NULL,
  `UnitsInStock` int NOT NULL,
  `UnitsOnOrder` int NOT NULL,
  `ReorderLevel` int NOT NULL,
  `Discontinued` int NOT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `I2` (`CategoryID`),
  KEY `I3` (`ProductName`),
  KEY `I4` (`SupplierID`),
  KEY `I5` (`SupplierID`),
  CONSTRAINT `fk_CategoryID` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`),
  CONSTRAINT `fk_SupplierID` FOREIGN KEY (`SupplierID`) REFERENCES `suppliers` (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'ProdMain',1,1,4,12.50,50,20,5,10),(2,'ProdSide',2,2,10,8.20,100,10,10,5),(3,'ProdLast',1,3,8,21.80,80,25,20,10);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shippers`
--

DROP TABLE IF EXISTS `shippers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shippers` (
  `ShipperID` int NOT NULL,
  `CompanyName` varchar(60) NOT NULL,
  `Phone` varchar(45) NOT NULL,
  PRIMARY KEY (`ShipperID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shippers`
--

LOCK TABLES `shippers` WRITE;
/*!40000 ALTER TABLE `shippers` DISABLE KEYS */;
INSERT INTO `shippers` VALUES (1,'ShipMain','112 2223'),(2,'ShipSide','123 3456');
/*!40000 ALTER TABLE `shippers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `SupplierID` int NOT NULL,
  `CompanyName` varchar(60) NOT NULL,
  `ContactTitle` varchar(60) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `City` varchar(200) NOT NULL,
  `Region` varchar(200) NOT NULL,
  `PostalCode` varchar(45) NOT NULL,
  `Country` varchar(200) NOT NULL,
  `Phone` varchar(45) NOT NULL,
  `Fax` varchar(45) NOT NULL,
  `Homepage` varchar(200) NOT NULL,
  PRIMARY KEY (`SupplierID`),
  KEY `I1` (`CompanyName`) /*!80000 INVISIBLE */,
  KEY `I2` (`PostalCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Supp1','SuppMainContact','AddSupp1','Cit 1','Reg 1','111211','Cou 1','123 4567','1111','testpage.com'),(2,'Supp2','SuppSideContact','AddSupp2','Cit 2','Reg 2','222122','Cou 2','765 4321','2222','sidepage.com');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-01 10:40:11
