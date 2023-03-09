USE Northwind

------------------------------------------------------------------
-- LÍ THUYẾT 
-- 1 DATABASE là nơi chứa data (bán hàng, thư viện, qlsv...)
-- DATA được lưu dưới dạng TABLE, tách thành nhiều TABLE (nghệ thuật design db, NF)
-- Dùng lệnh SELECT để xem/in dữ liệu từ TABLE, cũng hiển thị dưới dạng table
-- CÚ PHÁP CHUẨN: SELECT * FROM <Tên -Table>
--                       * đại diện cho việc tui mún lấy all of clomus (cột)
-- CÚ PHÁP MỞ RỘNG
--                 SELECT TÊN CÁC CỘT MUỐN LẤY, CÁCH NHAU BẰNG DẤU PHẨY FROM<TÊN-TABLE>
--                 SELECT COS THỂ DÙNG CÁC HÀM XỬ LÍ CÁC CỘT ĐỂ ĐỘ LẠI THÔNG TIN HIỂN THỊ 
--                 FROM <Tên Table>


--DATA trả về có cell/ô có NULL, hiểu rằng chưa xác định value/giá trị, chưa có, chưa biết 
--từ từ cập nhật sau. Ví dụ sv kí tên vào danh sách thi, cột điểm ngay lúc kí tên 
--gọi là NULL, mang trạng thái chưa xác định 
-------------------------------------------------------------------------------


--1. Xem thông tin của tất khách hàng đang giao dịch với mình
SELECT * FROM Customers
INSERT INTO Customers(CustomerID, CompanyName, ContactName) 
               VALUES('ALFKI', 'FPT University', 'Thanh Nguyen Khac')
			   -- bị chửi vì trùng PK

INSERT INTO Customers(CustomerID, CompanyName, ContactName) 
               VALUES('FTU', 'FPT University', 'Thanh Nguyen Khac')
			   -- ngon lành cành đào	

--2. Xem thông tin thông viên, xem hết cột luôn 
SELECT * FROM Employees

--3. Xem các sản phẩm có trong kho
SELECT * FROM Products

--4.Mua hàng, thì thông tin sẽ nằm ở table Order và OrderDetails 
SELECT * FROM Orders  --830 bill 

--5.Xem thông tin công ty giao hàng 
SELECT * FROM Shippers
INSERT INTO Shippers(CompanyName, Phone) VALUES ('Fedex Vietnam', '(084)90...')


--6.Xem chi tiết mua hàng 
SELECT * FROM Orders          -- PHẦN TRÊN CỦA BILL SIÊU THỊ
SELECT * FROM [Order Details] -- PHẦN TABLE KẺ GIÓNG LỀ NHỨNG MÓN ĐỒ ĐÃ MUA 
--7.In ra thông tin khách hàng, chỉ gồm các cột id, ComName, ContactName, Country
SELECT CustomerID, CompanyName,ContactName, Country FROM Customers

--8.In ra thông tin nhân viên, chỉ cần id , Last, Frist, Title, DOB 
-- Tên người tách thành Last & First: dành cho mục tiêu sort theo tiêu chí tên, họ. In ra
-- tên theo quy ước mỗi quốc gia 
SELECT * FROM Employees
SELECT EmployeeID , LastName, FirstName, Title, BirthDate FROM Employees 

--9.In ra thông tin nhân viên, ghép tên cho đẹp/ghép cột, tính luôn tuổi giùm tui
SELECT EmployeeID , LastName + ' ' + FirstName AS [Full Name], Title, BirthDate FROM Employees 

SELECT EmployeeID , LastName + ' ' + FirstName AS [Full Name], Title, BirthDate, YEAR(BirthDate) FROM Employees 

SELECT EmployeeID , LastName + ' ' + FirstName AS [Full Name], Title, BirthDate, 
                          YEAR(GETDATE()) - YEAR(BirthDate) AS Age FROM Employees 

--10. In ra thông tin chi tiết mua hàng 
SELECT * FROM [Order Details]
SELECT *, UnitPrice * Quantity  FROM [Order Details]
--CÔNG THỨC TÍNH TỔNG TIÊN PHẢI TRẢ TỪNG MÓN, CÓ TRỪ ĐI GIẢM GIÁ, PHẦN TRĂM 
--SL * DG - TIỀN GIẢM GIÁ ===> PHẢI TRẢ 
--SL * DG - SL * DG * DISCOUNT (%) == PHẢI TRẢ 
--SL * DG (1 - DISCOUNT %) ===> TIỀN PHẢI TRẢ 

SELECT *, UnitPrice * Quantity * (1 -Discount) AS SubTotal  FROM [Order Details]
