-- 1. Tüm ürünlerin adlarını ve birim fiyatlarını listeleyin.

-- SELECT
-- p.ProductName AS [Ürünlerin İsimleri],
-- p.UnitPrice AS [Ürünlerin Birim Fiyatı]
-- FROM Products p

-- 2. Müşterilerin şirket adlarını ve bulundukları şehirleri alfabetik sırayla listeleyin.
-- SELECT
-- c.CompanyName AS [Şirket Adları],
-- c.City AS [Şehirleri]
-- FROM Customers c
-- ORDER BY 
-- CompanyName ASC,
-- City ASC;

-- 3. Çalışanların ad ve soyadlarını birleştirerek tam isimlerini listeleyin.
--  SELECT 
-- FirstName + ' '+LastName AS [FULLNAME]
--  FROM Employees; 

-- 4. Stok miktarı 10'dan az olan ürünleri listeleyin.

-- SELECT
-- p.ProductID AS [ID],
-- p.ProductName AS [Ürünlerin Adı],
-- p.UnitsInStock AS [Ürün Stok]

-- FROM Products p
-- WHERE p.UnitsInStock<10 
-- ORDER BY p.UnitsInStock DESC;

-- 5. 1998 yılında yapılan siparişleri listeleyin.

-- SELECT *
-- FROM Orders o
-- WHERE YEAR(o.OrderDATE)=1998;

-- 6. Her bir kategorideki ürün sayısını bulun.

--  SELECT
--    p.CategoryID AS [Kategori ID],
--  COUNT(p.ProductID) AS [Ürün Sayısı] ,
--  COUNT(p.CategoryID) AS [Kategori Sayısı]
--  FROM Categories c JOIN Products p ON c.CategoryID=p.CategoryID
--  GROUP BY 
--   p.CategoryID ;

-- 7. En pahalı 5 ürünü fiyatlarıyla birlikte listeleyin.
-- SELECT TOP 5
-- p.ProductID AS [ID],
-- p.ProductName AS [Ürün İsimleri],
-- p.UnitPrice AS [Birim Fiyatı]
 
-- FROM Products p
-- ORDER BY p.UnitPrice DESC;



-- 8. Her bir ülkedeki müşteri sayısını bulun ve müşteri sayısına göre azalan sırayla listeleyin.
-- SELECT
-- c.Country AS [ÜLKE],
-- COUNT(c.CustomerID) AS [Müşteri Sayısı]
-- FROM Customers c
-- GROUP BY Country 
-- ORDER BY COUNT(c.CustomerID) DESC;

-- 9. Nakliye ücreti 50'den fazla olan siparişleri listeleyin.

-- SELECT
-- o.OrderID AS [OrderID],
-- o.Freight AS [Nakliye Ücreti]
-- FROM Orders o 
-- WHERE o.Freight>50;

-- 10. Her bir çalışanın toplam sipariş sayısını bulun.

-- SELECT 
--     EmployeeID AS [Çalışan ID],
--     COUNT(OrderID) AS [Toplam Sipariş Sayısı]
-- FROM 
--     Orders
-- GROUP BY 
--     EmployeeID; 

-- 11. Ürünleri kategorileriyle birlikte listeleyin.
-- SELECT
-- p.ProductName AS [Ürünlerin İsimleri],
-- p.CategoryID AS [Kategori ID],
-- c.CategoryName AS [Kategori İsimleri]

-- FROM Products p JOIN Categories c ON c.CategoryID=p.CategoryID

-- 12. Her bir siparişin toplam tutarını hesaplayın.
-- SELECT
-- o.OrderID AS [ID],
-- SUM(Quantity*UnitPrice) AS [Toplam Tutar]

-- FROM OrderDetails od JOIN Orders o ON o.OrderID=od.OrderID
-- GROUP BY o.OrderID; 

-- 13. En çok satılan 5 ürünü ve satış miktarlarını listeleyin.
-- SELECT TOP 5
-- p.ProductID AS [Ürün ID],
-- p.ProductName AS [Ürün İsmi],
-- SUM (OD.Quantity) AS [ÜRÜN SATIŞ MİKTARI]
-- FROM Products p  JOIN OrderDetails od ON od.ProductID=p.ProductID
-- GROUP BY p.ProductID, p.ProductName;

-- 14. Her bir müşterinin verdiği sipariş sayısını bulun.

-- SELECT
-- c.CustomerID AS [Müşteri ID],
--     SUM(od.Quantity) AS [Sipariş Sayısı]
-- FROM Orders o 
-- JOIN Customers c ON o.CustomerID=c.CustomerID
-- JOIN OrderDetails od ON od.OrderID=o.OrderID
-- GROUP BY c.CustomerID
-- ORDER BY [Sipariş Sayısı] DESC;

-- 15. Hangi kargo şirketinin kaç sipariş taşıdığını listeleyin.
-- SELECT
--     o.ShipName AS [Kargo Şirketi],  
--     COUNT(o.OrderID) AS [Sipariş Sayısı]  
-- FROM Orders o
-- GROUP BY o.ShipName 
-- ORDER BY [Sipariş Sayısı] DESC;

-- 16. Her bir çalışanın toplam satış tutarını hesaplayın.
-- SELECT 
-- e.FirstName+' '+e.LastName AS [Çalışan Full Name],
-- SUM(od.Quantity*od.UnitPrice) AS [Satış Tutarı]
-- FROM Employees e 
-- JOIN Orders o ON e.EmployeeID=o.EmployeeID
-- JOIN OrderDetails od ON o.OrderID=od.OrderID
-- GROUP BY e.FirstName+' '+e.LastName
-- ORDER BY [Satış Tutarı] DESC;

-- 17. Her bir kategorideki ürünlerin ortalama fiyatını bulun.
-- SELECT
-- c.CategoryID as [KATEGORİ ID],
-- c.CategoryName AS [Kategori İsmi],
-- AVG(p.UnitPrice) AS [Ortalama Fiyatı]

-- FROM Products p 
-- JOIN Categories c ON p.CategoryID =c.CategoryID
-- GROUP BY c.CategoryName,c.CategoryID;

-- 18. En az 5 sipariş veren müşterileri ve sipariş sayılarını listeleyin.
--  SELECT
 
--  c.CustomerID AS [Müşteri ID],
--      SUM(od.Quantity) AS [Sipariş Sayısı]

--  FROM Orders o 
--  JOIN OrderDetails od ON o.OrderID=od.OrderID
--  JOIN Customers c ON c.CustomerID =o.CustomerID
--  WHERE od.Quantity>5
--  GROUP BY c.CustomerID
--  ORDER BY  SUM(od.Quantity) DESC;


-- 19. Her bir ülke için toplam satış tutarını hesaplayın.
-- SELECT 
-- c.Country AS [ÜLKE],
-- SUM(od.UnitPrice*od.Quantity) AS [Satış Tutarı]
-- FROM Orders o 
-- JOIN OrderDetails od ON o.OrderID =od.OrderID
-- JOIN Customers c ON c.CustomerID=o.CustomerID
-- GROUP BY c.Country 
-- ORDER BY c.Country ASC;

-- 20. Siparişleri, sipariş tarihine göre yıllar ve aylar bazında gruplayarak toplam satış tutarlarını listeleyin.
-- SELECT
-- YEAR(o.OrderDate)  AS [Sipariş YILI],
-- MONTH(o.OrderDate) AS [Sipariş AYI],
-- SUM(od.UnitPrice*od.Quantity) AS [Satış tutarı]
-- FROM Orders o 
-- JOIN OrderDetails od ON od.OrderID=o.OrderID
-- GROUP BY YEAR(o.OrderDate),MONTH(o.OrderDate)
-- ORDER BY SUM(od.UnitPrice*od.Quantity) DESC;

