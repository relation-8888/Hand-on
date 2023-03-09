USE Northwind 

-- LÍ THUYẾT 
-- CÚ PHÁP MỞ RỘNG LỆNH SELECT 
-- MỆNH ĐỀ WHERE: DÙNG LÀM BỘ LỌC/FILTER NHẶT RA NHŨNG DỮ LIỆU TA CẦN THEO TIÊU CHÍ NÀO ĐÓ 
-- VÍ DỤ: Lọc ra những sv có quê ở Bình Dương 
--        Lọc ra những sv có quê ở Tiền Giang và điểm tb >= 8

-- CÚ PHÁP DÙNG BỘ LỌC 
-- SELECT * (CỘT BẠN MUỐN IN RA ) FROM <TÊN TABLE> WHERE <ĐIỀU KIỆN LỌC> 
-- * ĐIỀU KIỆN LỌC : TÌM TỪNG DÒNG, VỚI CÁC CỘT CÓ GIÁ TRỊ CẦN LỌC 
--                   LỌC THEO TÊN CỘT VỚI VALUE THẾ NÀO, LẤY TÊN CỘT ĐI XEM VALUE TRONG CELL
--                   CÓ THỎA ĐIỀU KIỆN LỌC HAY KHÔNG ?
-- ĐỂ VIẾT ĐƯỢC ĐIỀU KIỆN LỌC TA CẦN 
--    > TÊN CỘT 
--    VALUE CỦA CỘT (CELL)
--    TOÁN TỬ (OPERATOR) > >= < <= = (một dấu = thôi, ko giống C Java ==), !=, <> (!= hoặc <> cùng ý nghĩa) 
--    NHIỀU ĐIỀU KIỆN LỌC ĐI KÈM NHAU, DÙNG THÊM TOÁN TỬ LOGIC OPERATORS, AND, OR, NOT (~~~J, C: &&, ||, !)
-- VÍ DỤ: WHERE City = N'Bình Dương'
--        WHERE City = N'Tiền Giang' AND Gpa >= 8 

-- LỌC LIÊN QUAN ĐẾN GIÁ TRỊ/VALUE/CELL CHỨA GÌ, TA PHẢI QUAN TÂM ĐẾN DATA TYPES
-- SỐ: Nguyên/thực, ghi số ra như truyền thống 5, 10, 3.14, 9.8 
-- Chuỗi/kí tự: 'A', 'AHIHI' 
-- Ngày/tháng :  '2003-01-01...'


-- THỰC HÀNH 
-- 1. In ra danh sách các kháh hàng 
SELECT * FROM Customers -- 92 

--2. In ra danh sách khách hàng đến từ Ý 
SELECT * FROM Customers WHERE Country = 'Italy' -- 3

--3. In ra danh sách khách hàng đến từ Mỹ 
SELECT * FROM Customers WHERE Country = 'USA' -- 13

--4. In ra những khách hàng đến từ Mĩ và Ý
-- đời thường có thể nói: những k/h đến từ Mĩ và Ý, Y hoặc Mĩ 	
-- SELECT * FROM Customers WHERE Country = 'Italy' AND  'USA' -- ERROR thiếu toán tử so sánh 

SELECT * FROM Customers WHERE Country = 'Italy' AND Country = 'USA' -- 0


SELECT * FROM Customers WHERE Country = 'Italy' OR Country = 'USA'  -- HIỂU NGHĨA LOGIC, HƠN LÀ TƯ DUY TV

--sort theo Ý, Mĩ, để gom cùng cụm cho dễ theo dõi 


SELECT * FROM Customers WHERE Country = 'Italy' OR Country = 'USA' ORDER BY Country

--5. In ra khách hàng đến từ thủ đô nước Đức 
SELECT * FROM Customers WHERE Country = 'Germany' AND City = 'Berlin' -- 1

--6. In ra các thông tin của nhân viên 
SELECT * FROM Employees

--7. In ra thông tin nhân viên có năm sinh 1960 trở lại gần đây/ đổ lại
SELECT * FROM Employees WHERE YEAR(BirthDate) >= 1960
SELECT * , YEAR(BirthDate) year FROM Employees WHERE YEAR(BirthDate) >= 1960 -- 4/9

--8. In ra thông tin nhân viên có tuổi từ 60 đổ lên 
SELECT  (YEAR(GETDATE())) - YEAR(BirthDate) AS Age, * 
		FROM Employees WHERE (YEAR(GETDATE())) - YEAR(BirthDate) >= 60 --8/9

--9. Những nhân viên nào ở Luân Đôn 
SELECT * FROM Employees WHERE City = 'London' -- 4/9

--10. Những ai không ở Luân Đôn 
SELECT * FROM Employees WHERE NOT City = 'London' -- 5/9
SELECT * FROM Employees WHERE     City <> 'London' 
--vi diệu 
-- ĐẢO MỆNH ĐỀ !!!
SELECT * FROM Employees WHERE NOT (City = 'London') 
--SELECT * FROM Employees WHERE  !(City = 'London')  --SAI CÚ PHÁP, ĐẢO MỆNH ĐỀ, PHÉP SS THÌ DÙNG NOT 

--11. In ra hồ sơ nhân viên có ãm số là 1 
-- đi vào ngân hàng để giao dịch, hoặc đưa stk , kèm cmnd, filter theo cmnd 
SELECT * FROM Employees WHERE EmployeeID = 1 --kiểu số , ko có ' ', chơi nmhuw lập trình
--WHERE TRÊN KEY CHỈ RA 1 MÀ THÔI 
--SELECT MÀ CÓ WHERE KEY CHỈ 1 DÒNG CHẢ VỀ, DISTIN LÀ VÔ NGHĨA 
SELECT DISTINCT  EmployeeID,City FROM Employees WHERE EmployeeID = 1 ORDER BY EmployeeID

-- CÔNG THỨC FULL KO CHE CỦA SELECT 
-- SELECT ...         FROM ... WHERE ... GROUP BY ... HAVING ... ORDER BY 
--         DISTINCT       1, N TABLE 
--	            HÀM()
--             NESTED QUERY/SUB QUERY 

--12. Xem thông tin đơn hàng 
SELECT * FROM Orders --830

--13. Xem thông tin đơn hàng sắp xếp giảm dần theo trọng lượng  
SELECT * FROM Orders ORDER BY Freight DESC

--14. In ra thông tin đơn hàng sắp xếp giảm dần theo trọng lượng, trọng lượng >= 500kg
SELECT * FROM Orders WHERE Freight >= 500 ORDER BY Freight DESC -- 13

--15. In ra thông tin đơn hàng sắp xếp giảm dần theo trọng lượng, trọng lượng 
-- 100 đến 500
SELECT * FROM Orders WHERE Freight >= 100 AND Freight <= 500  ORDER BY ShipVia -- 174

--16. In ra thông tin đơn hàng sắp xếp giảm dần theo trọng lượng, trọng lượng nằm trong 
-- khoảng 100 - 500 và ship bởi công ty giao vận số 1 
SELECT * FROM Orders WHERE Freight >= 100 AND Freight <= 500  AND ShipVia = 1 -- 52/174/830

--17. Và ko ship tới Luân Đôn 
SELECT * FROM Orders WHERE (Freight >= 100) AND (Freight <= 500)  AND (ShipVia = 1) AND (ShipCity <> 'London')
SELECT * FROM Orders WHERE (Freight >= 100) AND (Freight <= 500)  AND (ShipVia = 1) AND NOT(ShipCity = 'London') -- 50
--RẤT CẨN THẬN KHI TRONG MỆNH ĐỀ WHERE LẠI CÓ AND VÀ OR TRỘN VỚI NHAU, XÀI THÊM ()
-- ĐỂ PHÂN CÁCH THỨ TỰ FILTER... (SS AND OR KHÁC NỮA ) AND (SS KHÁC) 

--18. Liệt kê danh sách k/h đến từ Mĩ hoặc Mexico
SELECT * FROM Customers	WHERE Country = 'USA' OR Country = 'Mexico' --18/92

--19. Liệt kê k/h ko đến từ Mĩ hoặc Mexico
SELECT * FROM Customers WHERE NOT(Country = 'USA') AND NOT(Country = 'Mexico') --73

SELECT * FROM Customers WHERE (Country <> 'USA') AND (Country <> 'Mexico')     --73

--20. Liệt kê các nhân viên sinh ra trong đoạn 1960 - 1970
SELECT YEAR(GETDATE()) - YEAR(BirthDate) AS Age, * FROM Employees WHERE YEAR(BirthDate) >= 1960 AND YEAR(BirthDate) <= 1970 ORDER BY BirthDate DESC -- 4
SELECT * FROM Employees WHERE YEAR(BirthDate) >= 1960 AND YEAR(BirthDate) <= 1970 -- 4

SELECT * FROM Orders  WHERE YEAR(ShippedDate) = 1997 AND ShipVia = 1 AND ShipRegion = 'SP'
SELECT *,YEAR(GETDATE()) - YEAR(ShippedDate) AS Age  FROM Orders  WHERE YEAR(ShippedDate) = 1998 AND ShipVia = 1 AND ShipRegion = 'SP'
SELECT YEAR(GETDATE()) - YEAR(ShippedDate) AS Age, * FROM Orders  WHERE YEAR(ShippedDate) = 1998  AND ShipVia = 1 AND ShipRegion = 'SP'
SELECT  YEAR(GETDATE()) - YEAR(ShippedDate) AS Age, * FROM Orders WHERE YEAR(GETDATE()) - YEAR(ShippedDate) = 27

--

