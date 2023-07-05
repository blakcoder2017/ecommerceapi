-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2023 at 07:01 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerceapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `AddressID` varchar(8) NOT NULL,
  `UserID` varchar(8) NOT NULL,
  `Address_Type` varchar(20) NOT NULL,
  `AddressLine1` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `Province` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  `PostalCode` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buyers`
--

CREATE TABLE `buyers` (
  `BuyerID` varchar(8) NOT NULL,
  `UserID` varchar(8) NOT NULL,
  `USER_TYPE` varchar(1) NOT NULL,
  `MembershipID` varchar(8) DEFAULT NULL,
  `FName` varchar(45) NOT NULL,
  `LName` varchar(100) DEFAULT NULL,
  `Phone` varchar(15) NOT NULL DEFAULT 'xxx-xxx-xxxx',
  `Email` varchar(45) NOT NULL
) ;

--
-- Dumping data for table `buyers`
--

INSERT INTO `buyers` (`BuyerID`, `UserID`, `USER_TYPE`, `MembershipID`, `FName`, `LName`, `Phone`, `Email`) VALUES
('B3656', 'US2098', 'B', NULL, 'Sean', 'Romero', '519-556-9422', 'sean.rom@other.com'),
('B3465', 'US2123', 'B', 'M1458', 'Georges', 'Bienvenu', '555-098-7638', 'gbienvenu@email.com'),
('B3680', 'US2213', 'B', 'M1178', 'Ginette', 'Beauregard', '514-098-8334', 'beauregard.ginette@other.com'),
('B3326', 'US2348', 'B', 'M1318', 'Nancy', 'Book', '555-868-8379', 'booknancy@other.com'),
('B3342', 'US2435', 'B', NULL, 'Daniel', 'Dam', '074-515-5458', 'ddam@email.com'),
('B3432', 'US2456', 'B', 'M1968', 'Elise', 'Fort', '919-887-0965', 'elise.f@email.com'),
('B3442', 'US2498', 'B', NULL, 'Yung', 'Xi', '250-753-0094', 'xi.yung@email.com'),
('B3765', 'US2654', 'B', 'M1867', 'Taylor', 'Swing', '012-3370697', 'swing@email.com'),
('B3998', 'US2784', 'B', 'M1957', 'Red', 'Forman', '972-670-3345', 'redismad@email.com'),
('B3568', 'US2874', 'B', 'M1568', 'Jack', 'Smith', '676-876-0094', 'js@email.com'),
('B3235', 'US2895', 'B', 'M1642', 'Sarah', 'Mansour', '037-146-2742', 'sarahsarah@other.com');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DepartmentID` varchar(8) NOT NULL,
  `DepName` varchar(45) NOT NULL,
  `ContactFName` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DepartmentID`, `DepName`, `ContactFName`) VALUES
('D1145', 'Fashion', 'Corinne Levis'),
('D1173', 'Home', 'Sarah Lola'),
('D1178', 'Electronics', 'John Doe'),
('D1183', 'Beauty', 'France Dupuis'),
('D1567', 'Books', 'Michael Grant');

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `DiscountID` varchar(8) NOT NULL,
  `DiscountPrecent` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`DiscountID`, `DiscountPrecent`) VALUES
('DSCT10', '0.10'),
('DSCT25', '0.25'),
('DSCT50', '0.50');

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `MembershipID` varchar(8) NOT NULL,
  `MembershipType` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`MembershipID`, `MembershipType`) VALUES
('M1178', 'PREMIUM'),
('M1298', 'PREMIUM'),
('M1318', 'STUDENT'),
('M1322', 'STUDENT'),
('M1458', 'STUDENT'),
('M1499', 'PREMIUM'),
('M1568', 'BUSINESS'),
('M1642', 'PREMIUM'),
('M1867', 'STUDENT'),
('M1884', 'PREMIUM'),
('M1957', 'OLD AGE'),
('M1968', 'STUDENT');

-- --------------------------------------------------------

--
-- Table structure for table `offer`
--

CREATE TABLE `offer` (
  `OfferID` varchar(8) NOT NULL,
  `ProductID` varchar(8) DEFAULT NULL,
  `DiscountID` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `offer`
--

INSERT INTO `offer` (`OfferID`, `ProductID`, `DiscountID`) VALUES
('O101', 'PR8796', 'DSCT10'),
('O102', 'PR8765', 'DSCT25'),
('O103', 'PR8786', 'DSCT50');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` varchar(8) NOT NULL,
  `UserID` varchar(8) NOT NULL,
  `ShipperID` varchar(8) NOT NULL,
  `OrderDate` date NOT NULL,
  `RequiredDate` date NOT NULL,
  `Freight` decimal(10,0) NOT NULL,
  `SalesTax` decimal(10,0) NOT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `TransactStatus` varchar(25) NOT NULL,
  `InvoiceAmount` int(11) NOT NULL,
  `PaymentDate` date NOT NULL,
  `ItemQuantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders_has_product`
--

CREATE TABLE `orders_has_product` (
  `OrderProductID` varchar(8) NOT NULL,
  `Orders_OrderID` varchar(8) NOT NULL,
  `Product_ProductID` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentID` varchar(8) NOT NULL,
  `OrderID` varchar(8) NOT NULL,
  `Payment_Type` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_creditcard`
--

CREATE TABLE `payment_creditcard` (
  `CreditCardID` varchar(8) NOT NULL,
  `PaymentID` varchar(8) NOT NULL,
  `CreditCardNum` varchar(20) NOT NULL,
  `CardExpM` int(11) NOT NULL,
  `CardExpY` int(11) NOT NULL,
  `CardSecurityNumber` varchar(45) NOT NULL,
  `CardAddress` varchar(45) NOT NULL,
  `CardCity` varchar(45) NOT NULL,
  `CardPostalCode` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_giftcard`
--

CREATE TABLE `payment_giftcard` (
  `GiftcardID` varchar(8) NOT NULL,
  `PaymentID` varchar(8) NOT NULL,
  `GiftCardNumber` char(16) NOT NULL,
  `GiftcardExpMM` char(2) NOT NULL,
  `GiftcardExpYYYY` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductID` varchar(20) NOT NULL,
  `DepartmentID` varchar(8) NOT NULL,
  `Category` varchar(45) NOT NULL,
  `IDSKU` varchar(8) NOT NULL,
  `ProductName` varchar(45) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `UnitPrice` decimal(10,0) NOT NULL,
  `Ranking` int(11) DEFAULT NULL,
  `ProductDesc` text DEFAULT NULL,
  `UnitsInStock` int(11) DEFAULT NULL,
  `UnitsInOrder` int(11) DEFAULT NULL,
  `Picture` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductID`, `DepartmentID`, `Category`, `IDSKU`, `ProductName`, `Quantity`, `UnitPrice`, `Ranking`, `ProductDesc`, `UnitsInStock`, `UnitsInOrder`, `Picture`) VALUES
('PR4192', 'D1183', 'Makeup', 'SKU9763', 'Maybelline New York Super Stay', 1, '10', 88, 'Matte ink lip color', 438, 300, 'https://images-static.nykaa.com/media/catalog/product/9/2/929b5cd6902395682806_1.jpg'),
('PR4298', 'D1183', 'Beauty appliances', 'SKU76G2', 'T3 Featherweight', 1, '247', 5, 'Hair dryer with 2 speed settings, 3 heat settings and a 2-year warranty', 87, 20, 'https://di2ponv0v5otw.cloudfront.net/posts/2022/03/07/6225cb25fdd4cd65c0bcdfd1/m_6225cde4bb5937ca94a822a6.jpeg'),
('PR4394', 'D1145', 'Sneakers', 'SKU8723', 'Under Armour Micro G running shoes', 1, '67', 12, 'Black running shoes with rubber sole & breathable mesh', 566, 66, 'https://m.media-amazon.com/images/I/41GBtNRILoL._AC_.jpg'),
('PR4467', 'D1178', 'Adaptor', 'SKUGNXW', 'Poweradd power converter', 1, '30', 701, '2-outlet universal travel adapter', 5000, 20, 'https://ae01.alicdn.com/kf/Hb95d5010db7a4dd198b98953d5cba4eaL.jpg_640x640Q90.jpg_.webp'),
('PR4689', 'D1145', 'Jewelery', 'SKU7263', '10k Rose Gold plated white Gold Diamond ring', 1, '538', 83766, '0.75cttw, I-J Color, I2-I3 Clarity', 30, 4, 'diamondring.png'),
('PR4769', 'D1178', 'Tablet', 'SKU6789', 'Kindle Paperwhite', 1, '140', 767, 'Tablet with 6\" high-resolution display with builtin light', 3987, 200, 'kindle.jpg'),
('PR4789', 'D1178', 'Laptop', 'SKUB00V', 'ASUS Chromebook C201', 1, '270', 18, '11.6 inch latop, navy blue', 4534, 445, 'asuschromebook.png'),
('PR7698', 'D1183', 'Makeup', 'SKU97644', 'Maybelline New York Super StayJust Added', 56, '14', 2, 'Matte ink lip colorJust added', 438, 304, 'https://pixabaycom/photos/trip-outdoor-summer-vehicle-3351825/');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `ReviewID` varchar(8) NOT NULL,
  `ProductID` varchar(8) NOT NULL,
  `CustomerReview` varchar(45) DEFAULT NULL,
  `Rating` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`ReviewID`, `ProductID`, `CustomerReview`, `Rating`) VALUES
('R419', 'PR4192', 'Great opacity. Very matte.', 4),
('R429', 'PR4467', 'hated it. went to get reimursed', 2),
('R439', 'PR4394', 'Glad this shoe fit as well as it does.', 4),
('R468', 'PR4689', 'I love the engagement ring!', 5),
('R517', 'PR4769', 'Great product.', 3);

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `SellerID` varchar(8) NOT NULL,
  `UserID` varchar(8) NOT NULL,
  `USER_TYPE` varchar(1) NOT NULL,
  `CompanyName` varchar(45) NOT NULL,
  `ContactFName` varchar(45) NOT NULL,
  `ContactLName` varchar(45) NOT NULL,
  `ContactPosition` varchar(45) NOT NULL,
  `Phone` varchar(15) NOT NULL DEFAULT 'xxx-xxx-xxxx',
  `Email` varchar(45) NOT NULL,
  `Logo` blob DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `shipper`
--

CREATE TABLE `shipper` (
  `ShipperID` varchar(8) NOT NULL,
  `ShipperName` varchar(45) DEFAULT NULL,
  `ContactName` varchar(45) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shopping cart`
--

CREATE TABLE `shopping cart` (
  `ShoppingCartID` varchar(8) NOT NULL,
  `ProductID` varchar(8) NOT NULL,
  `OrderStatus` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `shopping cart`
--

INSERT INTO `shopping cart` (`ShoppingCartID`, `ProductID`, `OrderStatus`) VALUES
('SC7099', 'PR7786', 'CONFIRMED'),
('SC7100', 'PR4769', 'SAVED'),
('SC7656', 'PR7786', 'PENDING'),
('SC7680', 'PR4769', 'PENDING'),
('SC7786', 'PR7680', 'CONFIRMED');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` varchar(8) NOT NULL,
  `UserFName` varchar(45) NOT NULL,
  `UserLName` varchar(45) NOT NULL,
  `USER_TYPE` varchar(1) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `DateCreated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `UserFName`, `UserLName`, `USER_TYPE`, `Password`, `DateCreated`) VALUES
('US2098', 'Sean', 'Romero', 'B', 'OUVO8V', '2003-02-16'),
('US2123', 'Georges', 'Bienvenu', 'B', 'LKGCKF', '2016-03-21'),
('US2124', 'Georges', 'Bienvenu', 'B', 'YVUOT7D', '2009-11-28'),
('US2193', 'Sell', 'Junk', 'S', 'pyg8p7', '2013-02-18'),
('US2213', 'Ginette', 'Beauregard', 'B', 'KGHCY', '2012-03-02'),
('US2348', 'Nancy', 'Book', 'B', 'LHSBDJ', '2000-12-12'),
('US2435', 'Daniel', 'Dam', 'B', '8IVYIGV', '2016-12-13'),
('US2456', 'Elise', 'Fort', 'B', 'QOWUDHC', '2004-02-24'),
('US2498', 'Yung', 'Xi', 'B', 'Y8VP8VY', '2010-10-10'),
('US2654', 'Taylor', 'Swing', 'B', '8YVIKV', '2017-01-26'),
('US2784', 'Red', 'Forman', 'B', '97VIYGV', '2003-12-30'),
('US2874', 'Jack', 'Smith', 'B', 'LKEHDJK', '2011-08-02'),
('US2895', 'Sarah', 'Mansour', 'B', 'P8YVUUG', '2017-07-02'),
('US6283', 'Fun', 'Shop', 'S', 'LWIEYFG', '2003-03-24'),
('US6381', 'Shop', 'Drop', 'S', 'P8EUBW', '2015-09-15');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `WishlistID` varchar(8) NOT NULL,
  `ProductID` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`WishlistID`, `ProductID`) VALUES
('W832', 'PR4467'),
('W602', 'PR4769'),
('W652', 'PR4789');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`AddressID`);

--
-- Indexes for table `buyers`
--
ALTER TABLE `buyers`
  ADD PRIMARY KEY (`UserID`,`USER_TYPE`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DepartmentID`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`DiscountID`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`MembershipID`);

--
-- Indexes for table `offer`
--
ALTER TABLE `offer`
  ADD PRIMARY KEY (`OfferID`),
  ADD KEY `fk_Product_has_Discount_Discount1_idx` (`DiscountID`),
  ADD KEY `fk_Product_has_Discount_Product1_idx` (`ProductID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `UserID_idx` (`UserID`),
  ADD KEY `ShipperID_idx` (`ShipperID`);

--
-- Indexes for table `orders_has_product`
--
ALTER TABLE `orders_has_product`
  ADD PRIMARY KEY (`OrderProductID`),
  ADD KEY `fk_Orders_has_Product_Product1_idx` (`Product_ProductID`),
  ADD KEY `fk_Orders_has_Product_Orders1_idx` (`Orders_OrderID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `OrderID_idx` (`OrderID`);

--
-- Indexes for table `payment_creditcard`
--
ALTER TABLE `payment_creditcard`
  ADD PRIMARY KEY (`CreditCardID`),
  ADD KEY `PaymentID_idx` (`PaymentID`);

--
-- Indexes for table `payment_giftcard`
--
ALTER TABLE `payment_giftcard`
  ADD PRIMARY KEY (`GiftcardID`),
  ADD KEY `PaymentID_idx` (`PaymentID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`ReviewID`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`UserID`,`USER_TYPE`),
  ADD KEY `UserID_idx` (`UserID`);

--
-- Indexes for table `shipper`
--
ALTER TABLE `shipper`
  ADD PRIMARY KEY (`ShipperID`),
  ADD UNIQUE KEY `ShipperID_UNIQUE` (`ShipperID`);

--
-- Indexes for table `shopping cart`
--
ALTER TABLE `shopping cart`
  ADD PRIMARY KEY (`ShoppingCartID`),
  ADD KEY `ProductID_idx` (`ProductID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`WishlistID`),
  ADD KEY `ProductID_idx` (`ProductID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
