USE Northwind  -- Chọn để chơi với thùng chứa data nào đó
			   -- Tại 1 thời điểm chơi với 1 thùng chứa data 

SELECT * FROM Customers

SELECT * FROM Employees

------------------------------------------------------------------
-- LÍ THUYẾT 
-- 1. DBE cung cấp câu lệnh SELECT dùng để
--    in ra màn hình 1 cái gì đó ~~~ sout()
--    in ra dữ liệu có trong table (hàng và cột) !!!!!!!!!!!!!!!
--    dùng cho mục đích nào thì kết quả hiển thị luôn là 1 table 

-------------------------------------------------------------------

-- 1. Hôm nay ngày bao nhiêu ???
SELECT GETDATE()

SELECT GETDATE() AS [Hôm nay là ngày]

--2. Bây giờ là tháng mấy hỡi em?
SELECT MONTH(GETDATE()) AS [Bây giờ là tháng mấy]

SELECT YEAR(GETDATE())

--3. Trị tuyệt đối của -5 là mấy ?
SELECT ABS(-5) AS[Trị tuyệt đối của -5 là mấy ?]

--4. 5 + 5 là mấy???
SELECT 5 + 5 AS[5 + 5 là...]

--5. In ra tên của mình 
SELECT N'NGUYỄN ĐÌNH NAM' AS [My full name is]
SELECT N'NGUYỄN' + N'ĐÌNH NAM' AS [My full name is]

--6. Tính tuổi
SELECT YEAR(GETDATE()) - 2001

--SELECT N'Hoàng' + N'Ngọc' + N'Trinh' + YEAR(GETDATE()) - 2001 + 'year old ' lỗi vì lộn xộn kiểu data

SELECT N'Hoàng ' + N'Ngọc ' + N'Trinh ' + CONVERT(VARCHAR, YEAR(GETDATE()) - 2001 ) + ' years old ' AS [My proflie ]


SELECT N'Hoàng ' + N'Ngọc ' + N'Trinh ' + CAST(YEAR(GETDATE()) - 2001 AS varchar) + ' years old ' AS MyProfile

--7.Phép nhân 2 số 
SELECT 10 * 10 AS[10 X 10 = ]


