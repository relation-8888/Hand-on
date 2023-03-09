USE Northwind

-------------------------------------------------
-- LÍ THUYẾT
-- Cú pháp chuẩn của SELECT 
-- SELECT * FROM <TABLE> WHERE....

-- WHERE CỘT = VALUE NÀO ĐÓ
-- WHERE IN 1 TẬP HỢP NÀO ĐÓ 
-- ví dụ: City In ('London', 'Berlin') -- thay bằng OR OR OR 
--										  City = 'London' OR City = 'Berlin'....
-- NẾU CÓ 1 CÂU SQL MÀ TRẢ VỀ ĐƯỢC 1 CỘT, NHIỀU DÒNG 
-- MỘT CỘT MÀ NHIỀU DÒNG TA CÓ THỂ XEM NÓ TƯƠNG TƯƠNG 1 TẬP HỢP 
-- SELECT CITY FROM EMPLOYEES, BẠN SẼ ĐƯỢC 1 LOẠT CÁC THÀNH PHỐ 
-- TA CÓ THỂ NHÉT LỒNG CÂU 1 CỘT NHIỀU DÒNG VÀO TRONG MỆNH ĐỀ IN CỦA CÂU SQL BÊN NGOÀI 
-- * CÚ PHÁP 
-- WHERE CỘT IN (MỘT CÂU SELECT TRẢ VỀ 1 CỘT NHIỀU DÒNG/VALUE) - TẬP HỢP 

--------------------------------------------------

-- THỰC HÀNH 
--1. LIỆT KÊ CÁC NHÓM HÀNG 
SELECT * FROM Categories
--2. IN RA CÁC MÓN HÀNG THUỘC NHÓM SP  1, 6, 8
SELECT * FROM Products WHERE CategoryID IN (1,6,8) --30
SELECT * FROM Products WHERE CategoryID = 1 OR CategoryID = 6 OR CategoryID = 8 --30

SELECT * FROM Products WHERE CategoryID BETWEEN 1 AND 8  -- GÃY NÓ LẤY TẤT 

--3. IN RA CÁC NHÓM HÀNG THUỘC NHÓM BIA RIỆU THỊT VÀ HẢI SẢN 
SELECT * FROM Products WHERE CategoryID IN (
											SELECT CategoryID FROM Categories WHERE CategoryName IN ('Seafood','Beverages','Meat/Poultry')
											)

--4. NHÂN VIÊN QUÊ LONDON PHỤ TRÁCH NHỮNG ĐƠN HÀNG NÀO 
SELECT * FROM Employees 
SELECT * FROM Orders

SELECT * FROM Orders WHERE EmployeeID IN (
										SELECT EmployeeID FROM Employees WHERE CITY = 'London'
										) --224
--BTVN
--1. CÁC NHÀ CÙNG CẤP ĐẾN TỪ MĨ CUNG CẤP NHỮNG MẶT HÀNG NÀO 
--2. CÁC NHÀ CÙNG CẤP ĐẾN TỪ MĨ CUNG CẤP NHỮNG NHÓM HÀNG NÀO 
--3. CÁC ĐƠN HÀNG VẬN CHUYỂN TỚI THÀNH PHỐ Sao Paulo được vẩn chuyển bởi những hãng vận chuyển nào 
--   Các công ty nào đã vận chuyển tới Sao Paulo
--4. KHÁCH HÀNG ĐẾN TỪ THÀNH PHỐ Berlin, London, Madrid có những đơn hàng nào 
--   Liệt kê các đơn hàng của khách hàng đến từ Berlin, London, Madrid 

--BL
--1
SELECT * FROM Products WHERE SupplierID IN (
										SELECT SupplierID FROM Suppliers WHERE Country = 'USA'
										)
--2
SELECT * FROM Suppliers
SELECT * FROM Suppliers WHERE Country = 'USA'
SELECT * FROM Suppliers WHERE Country = 'USA'
SELECT * FROM Categories WHERE CategoryID IN (
											SELECT SupplierID FROM Suppliers WHERE Country = 'USA'
									)

--3
SELECT * FROM Orders
SELECT * FROM Customers WHERE City = 'Sao Paulo'
SELECT * FROM Customers WHERE CompanyName IN (
  
									SELECT DISTINCT ShipName FROM Orders WHERE ShipCity = 'Sao Paulo' 
									)

SELECT DISTINCT  ShipName FROM  Orders WHERE ShipCity = 'Sao Paulo'
--4
SELECT * FROM Orders
SELECT * FROM Customers WHERE CustomerID  IN (
									SELECT CustomerID FROM Orders  WHERE ShipCity IN  ('London', 'Berlin', 'Madrid')
											)


