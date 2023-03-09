USE Northwind

-------------------------------------------------------------
--LÍ THUYẾT
--CÚ PHÁP MỞ RỘNG CỦA SELECT 
--Trong thực tế có những lúc ta muốn tìm dữ liệu/filter theo kiểu gần đúng 
-- gần đúng trên kiểu chuỗi. ví dụu như liệt kê ai đó tên là An, khác câu 
-- liệt kê ai đó tên bắt đầu bằng chữ  A 
-- Tìm đúng, Toán Tử = 'An'
-- Tìm gần đúng, tìm có sự xuất hiện, KO dùng =, dùng toán tử like
--                    LIKE 'A...'....
-- ĐỂ SỬ DỤNG TOÁN TỬ LIKE TA CÂN FPHAIR THÊM 2 THỨ TRỢ GIÚP, DẤU % VÀ DẤU _
-- % ĐẠI DIỆN CHO 1 CHUỖI BẤT KÌ NÀO ĐÓ 
-- _ đại diện cho 1 kí tự bất kì nào đó 
-- VÍ DỤ: Name LIKE 'A%', bất kì ai có tên xuất hiện bằng chữ A, phần còn lại là gì ko care
--        Name LIKE 'A_', bất kì ai có tên là 2 kí tự, trong đó kí tự đầu phải là A

--1.In ra danh sách nhân viên 
SELECT * FROM Employees

--2. Nhân viên nào có tên bắt đầu chữ A
SELECT * FROM Employees WHERE FirstName LIKE 'A%'

--2.1 Nhân viên nào có tên bắt đầu chữ A, in ra tất cả fullname được ghép đầy đủ 
SELECT EmployeeID,FirstName + ' ' + LastName AS FullName , Title   FROM Employees WHERE FirstName LIKE 'A%'
SELECT EmployeeID, CONCAT(FirstName, ' ' , LastName ) AS FullName , Title   FROM Employees WHERE FirstName LIKE 'A%'

--3. Nhân viên nào có tên cõ chữ A cuối cùng 
SELECT * FROM Employees WHERE FirstName LIKE '%A' --1


--4. Nhân viên nào có tên có 4 kí tự 
-- Dùng hàm kiểm tra độ dài của tên = 4 hay không ??

SELECT * FROM Employees WHERE FirstName LIKE '____' --1

--5.Xem danh sách các sản phẩm món đồ đang có - Product
SELECT * FROM Products  --77

--6.Những sản phầm nào tên bắt đầu bằng CH 
SELECT * FROM Products WHERE ProductName LIKE 'CH%' --6

SELECT * FROM Products WHERE ProductName LIKE '%CH%' --14
--Trong tên có chữ CH, ko quan tâm vị trí xuất hiện 

--7. Những sản phầm mà tên có 5 kí tự 
SELECT * FROM Products WHERE ProductName LIKE '_____' --3 

--8 Những san phầm trong tên sp mà có từ cuối cùng là 5 kí tự 
SELECT * FROM Products WHERE ProductName LIKE '%_____' -- tên có từ 5 kí tự trở lên
SELECT * FROM Products WHERE ProductName LIKE '% _____' -- tên có ít nhất 2 từ, từ cuối cùng 5 kí tự 
												        -- Vô tình loại đi tên chỉ có 5 kí tự thôi 
														-- 11
SELECT * FROM Products WHERE ProductName LIKE '% _____' OR ProductName LIKE '_____' --14

