--1. List the book(s) which has the highest rating. Show book id, book name, and the rating.
SELECT F.bookID, B.title, F.rating
FROM Feedback F INNER JOIN Book B ON F.bookID = B.bookID
WHERE F.rating = (SELECT MAX(rating) FROM Feedback);

--2. Find the total number of feedback per member. Show member id, member name, and total number of feedback per member.
SELECT M.memberID, M.customerName, COUNT(F.memberID) AS 'Total Number of Feedback'
FROM FEEDBACK F RIGHT JOIN MEMBER M ON F.memberID = M.memberID
GROUP BY M.memberID, M.customerName;

--3. Find the total number of book published by each publisher. Show publisher id, publisher name, and number of book published.
SELECT P.publisherID, P.publisherName, COUNT(DISTINCT BP.bookID) AS 'Number of Book Published'
FROM PUBLISHER P FULL JOIN PURCHASE P1 ON P.publisherID = P1.publisherID 
FULL JOIN BOOK_PURCHASE BP ON P1.purchaseID = BP.purchaseID
GROUP BY P.publisherID, P.publisherName;

--4. Find the total number of books ordered by store manager from each publisher. 
SELECT SUM(P.quantityDelivered) AS 'Total Number of Books Ordered', P.publisherID, U.publisherName
FROM Purchase P INNER JOIN Publisher U ON P.publisherID = U.publisherID
GROUP BY P.PublisherID, U.publisherName;
 
--5.    Find the total number of books ordered by each member.
SELECT O.memberID, M.customerName, COUNT(OB.bookID) AS 'Total Number of Books ordered'
FROM Order_Book OB INNER JOIN "Order" O ON OB.orderID = O.orderID 
INNER JOIN Member M ON O.memberID = M.MemberID 
GROUP BY O.memberID, M.customerName;
 
--6.    Find the bestselling book(s).
SELECT TOP 1 WITH TIES O.bookID, B.title, COUNT(O.bookID) AS 'Number of book sold'
FROM Order_Book O INNER JOIN Book B ON O.BookID = B.BookID
GROUP BY O.bookID, B.title
ORDER BY COUNT(O.bookID) DESC;

--7. Show list of total customers based on gender who are registered as members in APU E-Bookstore. 
--The list should show total number of registered members and total number of gender (male and female).
SELECT DISTINCT (SELECT COUNT(memberID) FROM MEMBER) AS 'Total Number of Registered Customers',
(SELECT COUNT(memberID) FROM MEMBER WHERE gender = 'M') AS 'Male Registered Customers',
(SELECT COUNT(memberID) FROM MEMBER WHERE gender = 'F') AS 'Female Registered Customers'
FROM MEMBER;

--8. Show a list of purchased books that have not been delivered to members. 
--The list should show member identification number, address, 
--contact number, book serial number, book title, quantity, date and status of delivery.
SELECT M.memberID,M.customerAddress,M.phoneNumber,OB.BookID,B.title,O.paymentDate,O.deliveryDate,COUNT(B.bookID) 
AS 'Number of books that have not been delivered to member',O.statusOfDelivery
FROM Member M INNER JOIN "Order" O ON M.memberID=O.memberID 
INNER JOIN Order_Book OB ON O.orderID=OB.orderID INNER JOIN Book B ON OB.bookID=B.bookID
WHERE O.DeliveryDate IS NULL
GROUP BY M.memberID,M.customerAddress,M.phoneNumber,OB.BookID,B.title,O.paymentDate,O.deliveryDate,O.statusOfDelivery

--9. Show the member who spent most on buying books. 
--Show member id, member name and total expenditure.
SELECT TOP 1 WITH TIES
M.memberID, M.customerName, SUM(B.pricePerUnit) AS 'Total Expenditure'
FROM Member M INNER JOIN "Order" O ON M.memberID=O.memberID 
INNER JOIN Order_Book OB ON O.orderID=OB.orderID INNER JOIN Book B ON OB.bookID=B.bookID
GROUP BY M.memberID, M.customerName
ORDER BY SUM(B.pricePerUnit) DESC

--10. Show a list of total books as added by each members in the shopping cart.
SELECT SC.memberID, SC.cartID, COUNT(SCB.bookID) AS 'Number of books added by each member in the shopping cart'
FROM "Shopping Cart" SC INNER JOIN "Shopping Cart_Book" SCB ON SC.cartID=SCB.cartID
GROUP BY SC.memberID, SC.cartID;

SELECT customerName
FROM BOOK B INNER JOIN FEEDBACK F ON B.bookID = F.bookID
INNER JOIN MEMBER M ON F.memberID = M.memberID
WHERE genre IN ('Fiction', 'Non-Fiction') AND (remarks IS NOT NULL);

SELECT title
FROM MEMBER M INNER JOIN "ORDER" O ON M.memberID = O.memberID
INNER JOIN ORDER_BOOK OB ON O.orderID = OB.orderID
INNER JOIN BOOK B ON OB.bookID = B.bookID
WHERE customerName = 'Lim Hon Heng';