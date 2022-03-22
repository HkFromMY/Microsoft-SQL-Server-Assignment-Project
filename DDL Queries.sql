CREATE DATABASE eBookstore;
GO

USE eBookstore;
GO

--CREATING TABLES

CREATE TABLE Member
	(memberID VARCHAR(5) PRIMARY KEY,
	 customerName VARCHAR(50) NOT NULL,
	 customerAddress VARCHAR(100) NOT NULL,
	 gender CHAR(1) NOT NULL,
	 phoneNumber VARCHAR(12) NOT NULL);

CREATE TABLE "Shopping Cart"
	(cartID VARCHAR(5) PRIMARY KEY,
	 memberID VARCHAR(5) NOT NULL REFERENCES Member(memberID));

CREATE TABLE "Order"
	(orderID VARCHAR(5) PRIMARY KEY,
	 paymentDate DATE NOT NULL,
	 deliveryDate DATE NULL,
	 statusOfDelivery VARCHAR(15) NOT NULL,
	 memberID VARCHAR(5) NOT NULL REFERENCES Member(memberID),
	 cartID VARCHAR(5) NOT NULL REFERENCES "Shopping Cart");

CREATE TABLE Publisher
	(publisherID VARCHAR(5) PRIMARY KEY,
	 phoneNumber VARCHAR(12) NOT NULL,
	 publisherAddress VARCHAR(100) NOT NULL,
	 publisherName VARCHAR(50) NOT NULL);

CREATE TABLE Book
	(bookID VARCHAR(5) PRIMARY KEY,
	 title VARCHAR(50) NOT NULL,
	 genre VARCHAR(50) NOT NULL,
	 quantityInStock INTEGER NOT NULL,
	 pricePerUnit MONEY NOT NULL,
	 publisherID VARCHAR(5) NOT NULL REFERENCES Publisher(publisherID));

CREATE TABLE Feedback
	(feedbackID VARCHAR(5) PRIMARY KEY,
	 rating INTEGER NOT NULL,
	 remarks VARCHAR(100) NULL,
	 memberID VARCHAR(5) NOT NULL REFERENCES Member(memberID),
	 bookID VARCHAR(5) NOT NULL REFERENCES Book(bookID));

CREATE TABLE Purchase
	(purchaseID VARCHAR(5) PRIMARY KEY,
	 quantityDelivered INTEGER NOT NULL,
	 dateDelivered DATE NULL,
	 publisherID VARCHAR(5) NOT NULL REFERENCES Publisher(publisherID));

CREATE TABLE Book_Purchase
	(bookID VARCHAR(5) NOT NULL REFERENCES Book(bookID),
	 purchaseID VARCHAR(5) NOT NULL REFERENCES Purchase(purchaseID));

CREATE TABLE "Shopping Cart_Book"
	(cartID VARCHAR(5) NOT NULL REFERENCES "Shopping Cart"(cartID),
	 bookID VARCHAR(5) NOT NULL REFERENCES Book(bookID));

CREATE TABLE Order_Book
	(orderID VARCHAR(5) NOT NULL REFERENCES "Order"(orderID),
	 bookID VARCHAR(5) NOT NULL REFERENCES Book(bookID));

CREATE TABLE Author
	(bookID VARCHAR(5) NOT NULL REFERENCES Book(BookID),
	 author VARCHAR(50) NOT NULL);


--INSERTING VALUES
-- MEMBER DATA
INSERT INTO Member (
	memberID, 
	customerName, 
	customerAddress, 
	gender, 
	phoneNumber
) VALUES
    --DX DATA
    ('M0001','Lim Hon Heng','14, Jalan Makmur, Taman Makmur, 56100 Cheras, KL','F','011-23458765'),
    ('M0002','Chow Yin Xin','E-08-09, Jalan Teknologi 5, Teknologi Park Malaysia, 56000 Bukit Jalil, KL','M','013-25749255'),
    ('M0003','Tan Wing Yee','56, Jalan Prima, Taman Prima, 43200 Cheras, Selangor','F','014-8388608'),
    ('M0004','Lai Yue Kit','34, Jalan Pintar 3, Taman Pintar, 28300 Triang, Pahang','M','011-3141592'),
    ('M0005','Lee Kai Yee','9, Jalan Inovasi, Taman Inovasi, 68000 Ampang, Selangor','F','012-4194304'),
    ('M0006','Kok Sheng Jie','49, Jalan Ketumbar, Taman Yulek, 56100 Cheras, KL','M','018-42487427'),
    ('M0007','Shim Wye Yong','31, Jalan Orkid 5, Taman Orkid, 43200 Cheras, Selangor','M','018-01912192'),
    ('M0008','Tam Jia Zhen','4, Jalan Setia, Taman Setia, 25000 Sitiawan, Perak','F','017-88327317'),
    ('M0009','Ooi Hui Wen','73, Jalan Bersatu 3, Taman Bersatu, 23000 Taiping, Perak','M','018-09719845'),
    ('M0010','Chong Wei Chee','44, Jalan Jesselton, Taman Bukit Kuching, 98400 Kota Kinabalu, Sabah','F','014-7144234'),
    --HK DATA
    ('M0011', 'Rafeah Koh', '22 Jalan SS 5C/8 Kelana Jaya, Petaling Jaya, Selangor', 'F', '016-3122222'),
    ('M0012', 'Affendi Foon', '3 Blok 154 Kompleks Maluri 154 3 6 Jln Jejaka Taman Maluri, Kuala Lumpur', 'M', '012-3320976'),
    ('M0013', 'Preeta Singh a/l Sothinathan Karathu', '6, Jln 8, Seri Maluri, 87013 Rancha-Rancha, Labuan', 'F', '010-7189314'),
    ('M0014', 'Muhammet Fithri bin Hazaril', 'No. 9-7, Jln 7/2, Laman Tun Perak, 23892 Teluk Kalung, Terengganu Darul Iman', 'M', '015-4354172'),
    ('M0015', 'Woo Cham Choon', '2, Jalan Chan Sow Lin 8S, Kondominium Dato Harun, 70204 Sungai Gadut, Negeri Sembilan', 'M', '015-1231643'),
    ('M0016', 'Nor Dalili binti Wan Al', '551, Jalan Prangin 96F, Batu Pertama, 85560 Pagoh, Johor Darul Tazim', 'F', '011-10877563'),
    ('M0017', 'Kiran Sachithanandan a/l Renuga', 'H-16-47, Lorong 1/2V, Kondominium Seputeh, 09160 Lunas, Kedah Darul Aman', 'F', '015-2293976'),
    ('M0018', 'Hj Chailan Saad bin Ramly', '75, Jalan Zaaba 5/96, Kota Damai, 63909 Subang, Selangor Darul Ehsan', 'M', '084-480956'),
    --YY DATA
    ('M0019', 'Gozilla Kong', 'Lebuh Batu Nilam 1, Bandar Bukit Tinggi, 41200', 'F', '03-5122-7218'),
    ('M0020', 'Nokisa Tang ', '2 25 Lrg 20 Taman Petani Jaya Sungai Petani Sungai', 'F', '012-4210093'),
    ('M0021', 'Hey Joker ', 'Pasar 5 Jln Raja Bot', 'M', '019-2698294'),
    ('M0022', 'John K Smock ', '285 -287, Jalan Tuanku Abdul Rahman', 'M', '03-2948589'),
    ('M0023', 'Kingsley Wong', 'A 279 Jln Bandar 2 Taman Melawati Hulu', 'M', '016-9869155'),
    ('M0024', 'Raymond Yong ', 'No. 3377, Jln Rj6/2, Seremban', 'M', '017-6310227'),
    ('M0025', 'Susan Ong ', 'No. 5 Jalan SS 21/39, Damansara Uptown', 'F', '014-7727862'),
    ('M0026', 'Carmen Woo', 'Suite 19.01, Level 19, The Gardens South Tower', 'F', N'016-7789352'),
    ('M0027', 'Manad Lise', 'Lot 318, Jahlan Muhibbah, 93400, Kuching', 'M', '018-478-5855'),
    ('M0028', 'Findy Sow', '2300  Tanglewood Road', 'F', '014-2388954');
GO

--SHOPPING CART DATA
INSERT INTO "Shopping Cart" (
	cartID,
	memberID
) VALUES
    --DX DATA
    ('C0001','M0001'),
    ('C0002','M0002'),
    ('C0003','M0003'),
    ('C0004','M0004'),
    ('C0005','M0005'),
    ('C0006','M0006'),
    ('C0007','M0007'),
    ('C0008','M0008'),
    ('C0009','M0009'),
    ('C0010','M0010'),
	--HK DATA
    ('C0011', 'M0011'),
    ('C0012', 'M0012'),
    ('C0013', 'M0013'),
    ('C0014', 'M0014'),
    ('C0015', 'M0015'),
    ('C0016', 'M0016'),
    ('C0017', 'M0017'),
    ('C0018', 'M0018'),
    --YY DATA
    ('C0019', 'M0019'),
    ('C0020', 'M0020'),
    ('C0021', 'M0021'),
    ('C0022', 'M0022'),
    ('C0023', 'M0023'),
    ('C0024', 'M0024'),
    ('C0025', 'M0025'),
    ('C0026', 'M0026'),
    ('C0027', 'M0027'),
    ('C0028', 'M0028');
GO

--ORDER DATA
INSERT INTO "Order" (
    orderID,
    paymentDate,
    deliveryDate,
    statusOfDelivery,
    memberID,
    cartID
) VALUES
    --DX DATA
    ('O0001','2021-04-01','2021-04-05','Delivered','M0001','C0001'),
    ('O0002','2021-04-03','2021-04-07','Delivered','M0002','C0002'),
    ('O0003','2021-04-06','2021-04-10','Delivered','M0003','C0003'),
    ('O0004','2021-04-08','2021-04-12','Delivered','M0004','C0004'),
    ('O0005','2021-04-10','2021-04-13','Delivered','M0005','C0005'),
    ('O0006','2021-04-15','2021-04-20','Delivered','M0006','C0006'),
    ('O0007','2021-04-27','2021-04-30','Delivered','M0007','C0007'),
    ('O0008','2021-05-02','2021-05-07','Delivered','M0008','C0008'),
    ('O0009','2021-05-08','2021-05-14','Delivered','M0009','C0009'),
    ('O0010','2021-05-17',NULL,'Not Delivered','M0010','C0010'),
    --HK DATA
    ('O0011', '2021-05-20', NULL, 'Not Delivered', 'M0013', 'C0013'),
    ('O0012', '2021-05-10', '2021-05-13', 'Delivered', 'M0014', 'C0014'),
    ('O0013', '2021-04-27', '2021-04-29', 'Delivered', 'M0011', 'C0011'),
    ('O0014', '2021-03-20', '2021-03-24', 'Delivered', 'M0015', 'C0015'),
    ('O0015', '2021-05-23', NULL, 'Not Delivered', 'M0017',  'C0017'),
    ('O0016', '2021-02-14', '2021-02-17', 'Delivered', 'M0014', 'C0014'),
    ('O0017', '2021-05-21', NULL, 'Not Delivered', 'M0018', 'C0018'),
    ('O0018', '2021-05-24', NULL, 'Not Delivered', 'M0012', 'C0012'),
    ('O0019', '2021-03-23', '2021-03-26', 'Delivered', 'M0016', 'C0016'),
    ('O0020', '2021-05-25', NULL, 'Not Delivered', 'M0016', 'C0016'),
    --YY DATA
    ('O0021', '2021-05-23', NULL,'Not Delivered', 'M0019', 'C0019'),
    ('O0022', '2021-05-24', NULL,'Not Delivered', 'M0019', 'C0019'),
    ('O0023', '2021-01-07', '2021-01-13', 'Delivered', 'M0027', 'C0027'),
    ('O0024', '2021-05-30', NULL,'Not Delivered', 'M0025', 'C0025'),
    ('O0025', '2021-03-13' , '2021-03-20','Delivered', 'M0026', 'C0026'),
    ('O0026', '2021-03-19', '2021-03-21','Delivered', 'M0024', 'C0024'),
    ('O0027', '2021-04-04', '2021-04-08','Delivered', 'M0022', 'C0022');
GO

-- PUBLISHER DATA
INSERT INTO Publisher (
    publisherID, 
    phoneNumber,
    publisherAddress,
    publisherName 
) VALUES
    --DX DATA
    ('P0001','013-2341233','13, Jalan Shinji, Taman Shinji, 43200 Cheras, Selangor','Shinji Publishing'),
    ('P0002','014-4958212','23, Jalan Karisma 4, Taman Berkarisma, 43200 Cheras, Selangor','Akari Publishing'),
    ('P0003','015-6421356','2, Jalan Kembangan, Taman Kembangan, 43300 Seri Kembangan, Selangor','DX Bookstore'),
    ('P0004','012-1234542','1, Jalan Pelangi, Taman Pelangi, 46300 Petaling Jaya, Selangor','Pelangi Publishing'),
    ('P0005','011-58027191','25, Jalan Motivasi, Taman Motivasi, 56100 Cheras, Kuala Lumpur','3M Publishing'),
    ('P0006','011-6797246','9, Jalan Loke Yew, Taman Loke Yew, 56000 Taman Maluri, Kuala Lumpur','Tsun Jin Publishing'),
    ('P0007','017-7774682','43, Jalan Aman 4, Taman Bukit Aman, 56100 Cheras, Kuala Lumpur','Kuen Cheng Publishing'),
    ('P0008','016-9805896','27, Jalan Taynton View, Taman Taynton View, 56000 Cheras, Kuala Lumpur','Western Bookshop'),
    ('P0009','014-2106974','10, Jalan Ahliman, Taman Connaught, 56000 Cheras, Kuala Lumpur','Success Publishing'),
    ('P0010', '013-2058234', '13, Jalan Teknologi 13, Taman Teknologi Malaysia, 56000 Bukit Jalil, Kuala Lumpur','Asia Pacific Publishing'),
    --HK DATA
    ('P0011', '016-0972213', 'Blok Kedai Area B Seksyen 1 Wangsa Maju 53300 Wilayah Persekutuan Kuala Lumpur, Malaysia', 'Prentice Hall'),
    ('P0012', '010-0283111', 'Lot 5713, Bgn Tabung Haji, 45300', 'Kurt Wolff'),
    ('P0013', '011-0203826', '2nd Floor, Jalan 19/3, 46300', 'Pearson Schools'),
    ('P0014', '010-3213445', 'sp-5 the Street Mall Persiaran Multimedia 63000 Cyberjaya', 'Blackwood'),
    ('P0015', '016-0913281', 'Ground Floor Blok 2 Jln 18/118B Desa Tun Razak 56000 Wilayah Persekutuan, Malaysia', 'Secker and Warburg'),
    ('P0016', '011-5133222', '1St Floor, Desa Bunga Raya, 43000', 'Simon & Schuster'),
    ('P0017', '012-3248976', 'Kelana Centre Point 3, Jalan Ss7/19, 47301', 'Heinnemann'),
    ('P0018', '016-3929877', 'Lot 3452, Taman Bangi Jaya, 43500', 'Changbi'),
    ('P0019', '011-0903333', 'Off Jalan Banting, Landpac Industrial Park, Port 42000', 'Kiepenheuer & Witsh'),
    ('P0020', '013-2231412', 'Tingkat 2, Medan MARA, Jalan Raja Laut', 'Doubleday'),
    ('P0021', '011-3224411', '1 Jalan Ngee Heng 80000 Johor Malaysia', 'Harper Collins.'),
    --YY DATA
    ('P0022', '03-22844837', '20-2F, Bangsar Village 2, 59100 Kuala Lumpur', 'Sliverfish Books Sdn Bhd'),
    ('P0023', '03-79318998', 'No 2. Jalan SS2, Subang Jaya', 'University Book Store'),
    ('P0024', '03-78805840', ' No. 7-6, Dataran Prima, 47301 Petaling Jaya', 'Malaysian Book Publishers Association'),
    ('P0025', '03-89416172', 'UPM Press, 43400 Serdang, Selangor', 'UPM Press'),
    ('P0026', '03-56371090', '17-2, Jalan PJS 11/28b, Sunway, 47500 Subang Jaya', 'Snappars'),
    ('P0027', '03-62634884', 'No. 31-2, Jalan 11/62a, 52200 Kuala Lumpur', 'Kanyin Publication ');
GO

-- BOOK DATA
INSERT INTO Book (
    bookID,
    title,
    genre,
    quantityInStock,
    pricePerUnit,
    publisherID
) VALUES
    --DX DATA
    ('B0001','The Hare','Fiction',3,25,'P0001'),
    ('B0002','Success Additional Mathematics SPM','Non-fiction',4,30,'P0002'),
    ('B0003','Encyclopedia of Expedia','Non-fiction',5,23,'P0003'),
    ('B0004','Eye','Fiction',2,27,'P0004'),
    ('B0005','Your Nose','Fiction',3,24,'P0005'),
    ('B0006','Her Lips','Fiction',4,20,'P0006'),
    ('B0007','Pillow Talk','Fiction',5,21,'P0007'),
    ('B0008','The Jungle Book','Fiction',2,21,'P0008'),
    ('B0009','Python Programming Handbook','Non-fiction',5,20,'P0009'),
    ('B0010','Littering Awareness','Non-fiction',1,22,'P0010'),
    --HK DATA
    ('B0011', 'For whom the Bell Tolls', 'Historical Fiction', 3, 78.99, 'P0011'),
    ('B0012', 'The Castle', 'Political Fiction', 2, 60.00, 'P0012'),
    ('B0013', 'Apple Cart', 'Satire', 3, 160.99, 'P0013'),
    ('B0014', 'Silas Marner', 'Domestic Fiction', 5, 32.00, 'P0014'),
    ('B0015', 'Animal Farm', 'Satire', 3, 20.00, 'P0015'),
    ('B0016', 'Faust', 'Tragedy', 2, 120.00, 'P0016'),
    ('B0017', 'Time Machine', 'Science Fiction', 5, 30.00, 'P0017'),
    ('B0018', 'The Vegetarian', 'Psychological Fiction', 2, 50.00, 'P0018'),
    ('B0019', 'The Clown', 'Historical Fiction', 3, 50.00, 'P0019'),
    ('B0020', 'A Little Life', 'Domestic Fiction', 2, 75.00, 'P0020'),
    ('B0021', 'To Kill a Mockingbird', 'Southern Gothic', 4, 120.00, 'P0021'),
    ('B0022', 'The Alchemist', 'Fantasy Fiction', 4, 60.00, 'P0021'),
	--YY DATA
    ('B0023', 'Hey my mama', 'Fiction', 4, 20.00, 'P0026'),
    ('B0024', 'The Sun also rises ', 'Fiction', 3, 50.00, 'P0023'),
    ('B0025', 'Debt-Free', 'non-fiction', 10, 23.00, 'P0025'),
    ('B0026', 'Their Eyes were watching God', 'Non-Fiction', 7, 33.00, 'P0022'),
    ('B0027', 'How to be healthy', 'Healh and Fitness', 1, 12.00, 'P0022'),
    ('B0028', 'English for life', 'Dictionary', 6, 30.00, 'P0027'),
    ('B0029', 'To kill a mockingbird', 'Fiction', 4, 42.00, 'P0027'),
    ('B0030', 'Why Sun is on the sky', 'Science fiction', 2, 26.00, 'P0023'),
    ('B0031', 'The Adventure of Huckleberry Finn','Fiction', 5, 32.70, 'P0026'),
    ('B0032', 'A Step To a New Venture', 'Non-Fiction', 4, 40.10, 'P0026');
GO

--FEEDBACK DATA
INSERT INTO Feedback (
	feedbackID,
	rating,
	remarks,
	memberID,
	bookID
) VALUES
    --DX DATA
    ('F0001',7,'Nice to read','M0001','B0001'),
    ('F0002',8,'Clear Explanation','M0002','B0002'),
    ('F0003',6,'Very informative','M0003','B0003'),
    ('F0004',7,NULL,'M0004','B0004'),
    ('F0005',9,NULL,'M0005','B0005'),
    ('F0006',8,NULL,'M0006','B0006'),
    ('F0007',9,NULL,'M0007','B0007'),
    ('F0008',7,NULL,'M0008','B0008'),
    ('F0009',8,NULL,'M0009','B0009'),
    ('F0010',8,NULL,'M0010','B0010'),
    --HK DATA
    ('F0011', 8, NULL, 'M0012', 'B0011'),
    ('F0012', 9, 'The physicis principles and laws are well explained.', 'M0018', 'B0017'),
    ('F0013', 5, 'The storyline is quite confusing.', 'M0014', 'B0015'),
    ('F0014', 6, NULL, 'M0012', 'B0019'),
    ('F0015', 8, 'The story is realistic and relatable', 'M0017', 'B0017'),
    ('F0016', 4, 'The story is boring', 'M0011', 'B0018'),
    ('F0017', 7, 'This book is worth the reading time', 'M0015', 'B0021'),
    ('F0018', 9, 'The story is creative and interesting', 'M0011', 'B0022'),
    --YY DATA
    ('F0019', 10 , 'Absoloutly intresting to read', 'M0019', 'B0023'),
    ('F0020', 8 , 'Stil have alot place need to be improve ', 'M0019', 'B0024'),
    ('F0021', 9 , NULL, 'M0021', 'B0029'),
    ('F0022', 0 , 'not recommended. storyline too terrible ', 'M0027', 'B0030'),
    ('F0023', 5 , NULL, 'M0026', 'B0029'),
    ('F0024', 10 , 'I had learn many things in this book', 'M0027', 'B0027'),
    ('F0025', 3 , NULL, 'M0019', 'B0025'),
    ('F0026', 9 , 'good', 'M0028', 'B0026');
GO

-- PURCHASE DATA
INSERT INTO Purchase (
    purchaseID,
    quantityDelivered,
    dateDelivered,
    publisherID
) VALUES
    --DX DATA
    ('S0001',1,'2020-04-03','P0001'),
    ('S0002',1,'2020-04-05','P0002'),
    ('S0003',2,'2020-04-08','P0003'),
    ('S0004',1,'2020-04-10','P0004'),
    ('S0005',1,'2020-04-11','P0005'),
    ('S0006',2,'2020-04-17','P0006'),
    ('S0007',1,'2020-04-28','P0007'),
    ('S0008',2,'2020-05-04','P0008'),
    ('S0009',1,'2020-05-11','P0009'),
    ('S0010',2,NULL,'P0010'),
    --HK DATA
    ('S0011', 3, '2021-03-21', 'P0010'),
    ('S0012', 2, '2021-03-22', 'P0012'),
    ('S0013', 3, '2021-04-04', 'P0013'),
    ('S0014', 5, '2021-04-05', 'P0014'),
    ('S0015', 3, '2021-04-10', 'P0015'),
    ('S0016', 2, '2021-04-14', 'P0016'),
    ('S0017', 5, '2021-04-16', 'P0017'),
    ('S0018', 2, '2021-04-17', 'P0018'),
    ('S0019', 3, '2021-04-23', 'P0019'),
    ('S0020', 2, '2021-04-24', 'P0020'),
    ('S0021', 6, '2021-04-25', 'P0021'),
    ('S0022', 2, '2021-04-28', 'P0021'),
    --YY DATA
    ('S0023', 4, '2020-12-12', 'P0026'),
    ('S0024', 6, '2021-1-13', 'P0022'),
    ('S0025', 2, '2021-3-5', 'P0023'),
    ('S0026', 5, '2021-1-31', 'P0025'),
    ('S0027', 5, '2021-2-19','P0027');
GO


-- BOOK_PURCHASE DATA
INSERT INTO Book_Purchase (
    bookID,
    purchaseID
) VALUES
    --DX DATA
    ('B0001','S0001'),
    ('B0002','S0002'),
    ('B0003','S0003'),
    ('B0003','S0003'),
    ('B0004','S0004'),
    ('B0005','S0005'),
    ('B0006','S0006'),
    ('B0006','S0006'),
    ('B0007','S0007'),
    ('B0008','S0008'),
    ('B0008','S0008'),
    ('B0009','S0009'),
    ('B0010','S0010'),
    ('B0010','S0010'),
    --HK DATA
    ('B0011', 'S0011'),
    ('B0011', 'S0011'),
    ('B0011', 'S0011'),
    ('B0012', 'S0012'),
    ('B0012', 'S0012'),
    ('B0013', 'S0013'),
    ('B0013', 'S0013'),
    ('B0013', 'S0013'),
    ('B0014', 'S0014'),
    ('B0014', 'S0014'),
    ('B0014', 'S0014'),
    ('B0014', 'S0014'),
    ('B0014', 'S0014'),
    ('B0015', 'S0015'),
    ('B0015', 'S0015'),
    ('B0015', 'S0015'),
    ('B0016', 'S0016'),
    ('B0016', 'S0016'),
    ('B0017', 'S0017'),
    ('B0017', 'S0017'),
    ('B0017', 'S0017'),
    ('B0017', 'S0017'),
    ('B0017', 'S0017'),
    ('B0018', 'S0018'),
    ('B0018', 'S0018'),
    ('B0019', 'S0019'),
    ('B0019', 'S0019'),
    ('B0019', 'S0019'),
    ('B0020', 'S0020'),
    ('B0020', 'S0020'),
    ('B0021', 'S0021'),
    ('B0021', 'S0021'),
    ('B0021', 'S0021'),
    ('B0022', 'S0021'),
    ('B0022', 'S0021'),
    ('B0022', 'S0021'),
    ('B0021', 'S0022'),
    ('B0022', 'S0022'),
    --YY DATA
    ('B0023', 'S0023'),
    ('B0031', 'S0023'),
    ('B0032', 'S0023'),
    ('B0032', 'S0023'),
    ('B0026', 'S0024'),
    ('B0026', 'S0024'),
    ('B0026', 'S0024'),
    ('B0027', 'S0024'),
    ('B0027', 'S0024'),
    ('B0027', 'S0024'),
    ('B0024', 'S0025'),
    ('B0030', 'S0025'),
    ('B0025', 'S0026'),
    ('B0025', 'S0026'),
    ('B0025', 'S0026'),
    ('B0025', 'S0026'),
    ('B0025', 'S0026'),
    ('B0028', 'S0027'),
    ('B0028', 'S0027'),
    ('B0029', 'S0027'),
    ('B0029', 'S0027'),
    ('B0029', 'S0027');
GO

--SHOPPING_CART_BOOK
INSERT INTO "Shopping Cart_Book" (
    cartID,
    bookID
) VALUES
    --DX DATA
    ('C0001','B0001'),
    ('C0002','B0002'),
    ('C0003','B0003'),
    ('C0003','B0003'),
    ('C0004','B0004'),
    ('C0005','B0005'),
    ('C0006','B0006'),
    ('C0006','B0006'),
    ('C0007','B0007'),
    ('C0008','B0008'),
    ('C0008','B0008'),
    ('C0009','B0009'),
    ('C0010','B0010'),
    ('C0010','B0010'),
    --HK DATA
    ('C0011', 'B0011'),
    ('C0011', 'B0012'),
    ('C0011', 'B0021'),
    ('C0012', 'B0018'),
    ('C0012', 'B0018'),
    ('C0015', 'B0017'),
    ('C0016', 'B0014'),
    ('C0017', 'B0013'),
    ('C0017', 'B0013'),
    ('C0017', 'B0020'),
    ('C0014', 'B0011'),
    ('C0018', 'B0015'),
    ('C0018', 'B0016'),
    --YY DATA
    ('C0019', 'B0023'),
    ('C0019', 'B0023'),
    ('C0019', 'B0025'),
    ('C0019', 'B0025'),
    ('C0019', 'B0032'),
    ('C0019', 'B0031'),
    ('C0019', 'B0031'),
    ('C0020', 'B0026'),
    ('C0020', 'B0027'),
    ('C0021', 'B0025'),
    ('C0021', 'B0031'),
    ('C0021', 'B0030'),
    ('C0021', 'B0028'),
    ('C0021', 'B0024'),
    ('C0023', 'B0024'),
    ('C0023', 'B0032'),
    ('C0023', 'B0026'),
    ('C0024', 'B0028'),
    ('C0024', 'B0028'),
    ('C0024', 'B0028'),
    ('C0024', 'B0031'),
    ('C0024', 'B0031'),
    ('C0024', 'B0031'),
    ('C0024', 'B0025'),
    ('C0024', 'B0025'),
    ('C0024', 'B0025'),
    ('C0024', 'B0029'),
    ('C0024', 'B0029'),
    ('C0026', 'B0027'),
    ('C0027', 'B0023'),
    ('C0027', 'B0032'),
    ('C0027', 'B0025'),
    ('C0027', 'B0030'),
    ('C0028', 'B0026'),
    ('C0028', 'B0027'),
    ('C0028', 'B0032');
GO

--ORDER_BOOK
INSERT INTO Order_Book (
    orderID,
    bookID
) VALUES
    --DX DATA
    ('O0001','B0001'),
    ('O0002','B0002'),
    ('O0003','B0003'),
    ('O0003','B0003'),
    ('O0004','B0004'),
    ('O0005','B0005'),
    ('O0006','B0006'),
    ('O0006','B0006'),
    ('O0007','B0007'),
    ('O0008','B0008'),
    ('O0008','B0008'),
    ('O0009','B0009'),
    ('O0010','B0010'),
    ('O0010','B0010'),
    --HK DATA
    ('O0018', 'B0011'),
    ('O0018', 'B0019'),
    ('O0017', 'B0017'),
    ('O0017', 'B0017'),
    ('O0017', 'B0017'),
    ('O0012', 'B0015'),
    ('O0016', 'B0020'),
    ('O0015', 'B0017'),
    ('O0013', 'B0018'),
    ('O0013', 'B0022'),
    ('O0014', 'B0021'),
    ('O0011', 'B0016'),
    ('O0011', 'B0016'),
    ('O0011', 'B0021'),
    --YY DATA
    ('O0021', 'B0023'),
    ('O0021', 'B0023'),
    ('O0021', 'B0025'),
    ('O0021', 'B0025'),
    ('O0022', 'B0032'),
    ('O0022', 'B0031'),
    ('O0022', 'B0031'),
    ('O0023', 'B0028'),
    ('O0023', 'B0028'),
    ('O0023', 'B0028'),
    ('O0023', 'B0031'),
    ('O0023', 'B0031'),
    ('O0023', 'B0031'),
    ('O0023', 'B0025'),
    ('O0023', 'B0025'),
    ('O0023', 'B0025'),
    ('O0023', 'B0029'),
    ('O0023', 'B0029'),
    ('O0024', 'B0026'),
    ('O0024', 'B0032'),
    ('O0025', 'B0026'),
    ('O0024', 'B0027'),
    ('O0026', 'B0023'),
    ('O0026', 'B0032'),
    ('O0026', 'B0025'),
    ('O0026', 'B0030'),
    ('O0027', 'B0025'),
    ('O0027', 'B0031'),
    ('O0027', 'B0030'),
    ('O0027', 'B0028'),
    ('O0027', 'B0024');
GO

--AUTHOR
INSERT INTO Author (
    bookID,
    author
) VALUES
    --DX DATA
    ('B0001','Melanie Finn'),
    ('B0002','Mustafa Shah'),
    ('B0003','Tan Heng Yu'),
    ('B0004','Ismail bin Zahid'),
    ('B0005','Sivaguru a/l Khoghilan'),
    ('B0006','Xian Gan Jun'),
    ('B0007','Jian Ching Guo'),
    ('B0008','Kok Lit Kei'),
    ('B0009','Najib bin Mustafa'),
    ('B0010','Daisy Lim'),
    --HK DATA
    ('B0011', 'Ernest Hemingway'),
    ('B0012', 'Franz Kalka'),
    ('B0013', 'G.B.Shaw'),
    ('B0014', 'George Eliot'),
    ('B0015', 'George Orwell'),
    ('B0016', 'Goethe'),
    ('B0017', 'H.G. Wells'),
    ('B0018', 'Han Kang'),
    ('B0019', 'Heinrich Boll'),
    ('B0020', 'Hanya Yanagihara'),
    ('B0021', 'Harper Lee'),
    ('B0022', 'Paulo Coelho'),
    --YY DATA
    ('B0023', 'Tomnson Helith'),
    ('B0023', 'Chales Stephen'),
    ('B0024', 'Chan Yue Gng'),
    ('B0025', 'William Blake'),
    ('B0025', 'Mahatma Gandhi'),
    ('B0026', 'Theodor Herzl'),
    ('B0026', 'Barack Obama'),
    ('B0026', 'Jack London'),
    ('B0027', 'O. Henry'),
    ('B0028', 'William Wordsworth'),
    ('B0029', 'John Milton'),
    ('B0030', 'Nikola Tesla'),
    ('B0031', 'John Masefield'),
    ('B0031', 'Rudyard Kipling'),
    ('B0032', 'Ernest Hemingway');
GO
