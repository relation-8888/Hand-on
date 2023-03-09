USE Northwind

-------------------------------------------------
-- LÍ THUYẾT
-- Cú pháp chuẩn của SELECT 
-- SELECT * FROM <TABLE> WHERE....
-- WHERE CỘT = VALUE NÀO ĐÓ
-- WHERE CỘT LIKE PATTERN NÀO ĐÓ e.g. '_____'
-- WHERE CỘT BETWEEN  RANGE
-- WHERE CỘT IN (TẬP HỢP CÁC GIÁ TRỊ DƯỢC LIỆT KÊ)

-- MỘT CÂU SELECT TÙY CÁCH VIẾT CÓ THỂ TRẢ VỀ ĐÚNG 1 VALUE/CELL
-- MỘT CÂU SELECT TÙY CÁCH VIẾT CÓ THỂ TRẢ VỀ  1 TẬP VALUE/CELL
-- TẬP KẾT QUẢ NÀY ĐỒNG NHẤT (CÁC GIÁ TRỊ KHÁC NHAU CỦA 1 BIẾN) 

--*****
-- WHERE CỘT = VALUE NÀO ĐÓ - ĐÃ HỌC , e.g YEAR(DOB) = 20001;
--           = THAY VALUE NÀY = 1 CÂU SQL KHÁC MIỄN TRẢ VỀ 1 CELL 
-- KĨ THUẬT VIẾT SQL THEO KIỂU HỎI DÁN TIẾP, LỒNG NHAU , TRONG CÂU SQL CHỨA 
-- CÂU SQL KHÁC 

-------------------------------------------------
--THỰC HÀNH 
--1. Ỉna danh sách nhân viên 
SELECT * FROM Employees
SELECT FirstName FROM Employees WHERE EmployeeID = 1 -- RETURN 1 VALUE/CELL
SELECT FirstName FROM Employees -- 1 tập giá trị 1 cột/ phép chiếu 

--2. Liệt kê các nhân viên quê LuanDon
SELECT * FROM Employees WHERE City = 'London'    --4

--3. Liệt kê các nhân viên cùng quê với King Robert
SELECT * FROM Employees WHERE FirstName = 'Robert'

SELECT City FROM Employees WHERE FirstName = 'Robert' -- 1value LONDON

-- đáp án cho câu 3 bắt đầu
SELECT * FROM Employees WHERE City = City quê của Robert

SELECT * FROM Employees WHERE City = 'London' -- thay London = Robert

SELECT * FROM Employees WHERE City = (

									SELECT City FROM Employees WHERE FirstName = 'Robert'
									)
-- Câu này cho 9.9 điểm, trong kết quả còn Robert bị dư, tìm cùng quê R 
-- ko cần nói lại Robert 
SELECT * FROM Employees WHERE City = (

									SELECT City FROM Employees WHERE FirstName = 'Robert'
									) AND FirstName <> 'Robert'
--4. Liệt kê các đơn hàng 
SELECT * FROM Orders ORDER BY Freight DESC 

--4.1 Liệt kê tất cả các đơn hàng trọng lượng lớn hơn 252kg
SELECT * FROM Orders WHERE Freight >= 252 ORDER BY Freight DESC 

--4.1 Liệt kê tất cả các đơn hàng trọng lượng lớn hơn hay bằng  trọng lượng 
-- Đơn hàng 10555
SELECT * FROM Orders WHERE Freight >= ?? CỦA ĐƠN HÀNG 10555
SELECT * FROM Orders WHERE Freight >= (
										SELECT Freight FROM Orders
										WHERE OrderID = 10555
									) --47 -- xuất hiện cả 10555

SELECT * FROM Orders WHERE Freight >= (
										SELECT Freight FROM Orders
										WHERE OrderID = 10555
									) AND OrderID != 10555 --46

--BAI TẬP 
--1. LIỆT KÊ DANH SÁCH CÁC CÔNG TY VẬN CHUYỂN HÀNG 
--2. LIỆT KÊ CÁC DANH SÁCH CÁC ĐƠN HÀNG ĐƯỢC GIAO VẬN BỞI CÔNG TY GIA VẬN 
-- CÓ MÃ SỐ LÀ 1 
--3.LIỆT KÊ DANH SÁCH CÁC ĐƠN HÀNG ĐƯỢC VẬN CHUYỂN BỞI CÔNG TY GIAO VẬN 
-- CÓ TÊN Speedy Express
--4.LIỆT KÊ DANH SÁCH CÁC ĐƠN HÀNG ĐƯỢC VẬN CHUYỂN BỞI CÔNG TY GIAO VẬN 
-- CÓ TÊN Speedy Express và trọng lượng từ 50-100
--5. LIỆT KÊ CÁC MẶT HÀNG CÙNG CHỦNG LOẠI VỚI MẶT HÀNG Filo Mix 
--6. LIỆT KÊ CÁC NHÂN VIÊN TRẺ TUỔI HƠN NHÂN VIÊN Janet 

--------------------------------------------------------------------
--1
SELECT * FROM Shippers
--2
SELECT * FROM Orders WHERE ShipVia = 1
--3
SELECT * FROM Shippers WHERE ShipperID = 1
SELECT * FROM Orders WHERE ShipVia = (
									SELECT * FROM Shippers WHERE CompanyName = 'Speedy Express'
							) -- VIẾT KIỂU NÀY LÀ SO SÁNH NGUYÊN MỘT DÒNG KO THỂ SS CỘT ĐƯỢC 


SELECT * FROM Orders WHERE ShipVia = (
										SELECT ShipperID FROM Shippers WHERE CompanyName = 'Speedy Express'
					) --10D
--4
SELECT * FROM Orders WHERE ShipVia = (
										SELECT ShipperID FROM Shippers WHERE CompanyName = 'Speedy Express'
					) AND  Freight BETWEEN 50 AND 100 ORDER BY Freight --50

SELECT * FROM Orders WHERE ShipVia = (
										SELECT ShipperID FROM Shippers WHERE CompanyName = 'Speedy Express'
					) AND  Freight IN(50,100) --SAI, IN LÀ SO SÁNH =, THAY CHO 1 ĐỐNG OR
--5 Chủng loại của Filo Mix
--  Filo Mix là sp/mặt hàng, thuộc nhóm gì mình chưa biết 
--  hỏi tếp \:
SELECT * FROM Categories
SELECT * FROM Products
SELECT * FROM Products WHERE CategoryID = 
											(
											SELECT CategoryID FROM Products WHERE ProductName = 'Filo Mix'
											)
--6 LIỆT KÊ NV TRẺ HƠN Janet
--TRẺ HƠN NGHĨA LÀ NĂM SINH LỚN HƠN Janet 
SELECT * FROM Employees 
SELECT * FROM Employees WHERE BirthDate > (
										SELECT BirthDate FROM Employees WHERE FirstName = 'Janet'
											) --1
