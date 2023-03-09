USE Northwind

------------------------------------------------------------------
-- LÍ THUYẾT	
-- DB ENGINE hỗ trợ 1 loại nhóm làm dùng để thao tác tên 1 nhóm dòng/cột, gom data tính toán
-- trên đám data gom này - AGGREGATE FUNCTIONS, AGGREGATR
-- COUNT() SUM() MIN() AVF()
-- CÚ PHÁP CHUẨN*
-- SELECT CỘT..., HÀM GOM NHÓM(),... FROM <TABLE>

-- CÚ PHÁP MỞ RỘNG*
-- SELECT CỘT..., HÀM GOM NHÓM(),... FROM <TABLE>...GROUP BY (GOM THEO CỤM CỘT NÀO )

--SELECT CỘT..., HÀM GOM NHÓM(),... FROM <TABLE>...GROUP BY (GOM THEO CỤM CỘT NÀO ) HAVING...

--*HÀM COUNT(???) ĐẾM SỐ LẦN XUẤT HIỆN CỦA 1 CÁI GÌ ĐÓ ???
--     COUNT(*) ĐÊM SỐ DÒNG TRONG TABLE, ĐẾM TẤT CẢ KO CARE TIÊU CHUẨN NÀO KHÁC 
--     COUNT(*) FROM...WHERE...
--                   CHỌN RA NHỮNG DÒNG THỎA TIÊU CHÍ WHERE NÀO ĐÓ TRƯỚC ĐÃ, RỒI MỚI ĐẾM 
--                   FILTER RỒI ĐẾM 

--     COUNT(CỘT NÀO ĐÓ):

--1. IN RA DANH SÁCH CÁC NHÂN VIÊN 
SELECT * FROM Employees 

--2. ĐẾM XEM CÓ BAO NHIÊU NHÂN VIÊN 
SELECT COUNT(*) FROM Employees 
SELECT COUNT(*) AS [Number of employ ees] FROM Employees 

--3. CÓ BAO NHIÊU NHÂN VIÊN Ở LONDON
SELECT COUNT(*) AS [Number of emps in London ] FROM Employees WHERE City = 'LONDON'

--4. CÓ BAO NHIÊU LƯỢT THÀNH PHỐ XUẤT HIỆN - CỨ XUẤT HIỆN LÀ ĐẾM, KO CARE LẶP LẠI HAY KHÔNG
SELECT COUNT(City) FROM Employees --9

--5. ĐẾM XEM CÓ BAO NHIÊU Region
SELECT COUNT(Region) FROM Employees
-- PHÁT HIỆN HÀM COUNT(CỘT), NẾU CÁI CELL CỦA CỘT CHỨA NULL, KO TÌNH KO ĐẾM 

--5. ĐẾM XEM CÓ BAO NHIÊU KHU VỰC NULL, CÓ BAO NHIÊU DÒNG Region null
SELECT  COUNT(*)  FROM Employees WHERE Region IS NULL --đếm sự xuất hiện dòng chứa null 

SELECT  COUNT(Region)  FROM Employees WHERE Region IS NULL --0 null không đếm được 

SELECT  *  FROM Employees WHERE Region IS NULL

--6. CÓ BAO NHIÊU THÀNH PHỐ 
SELECT * FROM Employees

SELECT  City FROM Employees --9

SELECT DISTINCT City FROM Employees --5
-- TUI COI KẾT QUẢ NÀY LÀ 1 TABLE, MẤT QUÁ TRỜI CÔNG SỨC LỌC RA 5 THÀNH PHỐ 

-- SUB QUERY MỚI, COI 1 CÂU SLECT LÀ 1 TABLE, BIẾN TABLE NÀY VÀO TRONG MỆNH ĐỀ FROM 
-- NGÁO 

SELECT *  FROM 
			(SELECT DISTINCT City FROM Employees) AS CITIES

SELECT COUNT(*)  FROM 
			(SELECT DISTINCT City FROM Employees) AS CITIES --5

SELECT COUNT(*)  FROM Employees --9
SELECT COUNT(City)  FROM Employees --9
SELECT COUNT(DISTINCT City)  FROM Employees --5

--8. ĐẾM XEM MỖI THÀNH PHỐ CÓ BAO NHIÊU NHÂN VIÊN 
-- KHI CÂU HỎI CÓ TÍNH HOÁN GOM DATA (HÀM AGGREGATE) MÀ LẠI CHỨA TỪ KHÓA MỖI....
-- GẶP CÁI TỪ MỖI, CHÍNH LÀ CHIA ĐỂ ĐẾM, CHIA ĐỂ TRỊ, CHIA CỤM ĐỂ GOM ĐẾM 
SELECT * FROM Employees 

-- SEATLE 2 | TACOMA 1 | KIRKLAND 1 | REDMOND 1 | LONDON 4|
-- SỰ XUẤT HIỆN CỦA NHÓM
-- ĐẾM THEO SỰ XUẤT HIỆN CỦA NHÓM, COUNT++ TRONG NHÓM THÔI, SAU ĐÓ RESET Ở NHÓM MỚI 
SELECT COUNT(City) FROM Employees GROUP BY City -- ĐẾM VALUE CỦA CITY, NHƯNG ĐẾM THEO NHÓM 
												-- CHIA CITY THÀNH NHÓM, RỒI ĐẾM TRONG NHÓM 
SELECT City, COUNT(City) AS [No employess] FROM Employees GROUP BY City

SELECT EmployeeID, City,  COUNT(City) AS [No employess] FROM Employees GROUP BY City, EmployeeID
-- VÔ NGHĨA, CHIA NHÓM THEO KEY, MSSV VÔ NGHĨA 

--CHỐT HẠ: KHI SÀI HÀM HOM NHÓM BẠN CÓ QUYỀN LIỆT KÊ TÊN CÔTJ LẺ Ở SELECT 
--       : NHƯNG CỘT LẺ ĐÓ BẮT BUỘC PHẢI XUẤT HIỆN TRONG MỆNH ĐỀ GROUP BY
--       : ĐỂ ĐẢM BẢO LOGIC: CỘT HIỆN THỊ | SỐ LƯỢNG ĐI KÈM, ĐẾM GOM THEO CỘT HIỂN THỊ MỚI LOGIC
-- CỨ THEO CỘT CITY MÀ GOM, CỘT CITY NẰM Ở SELECT HƠP LÍ 
-- MUÔN HIỂN THỊ SỐ LƯỢNG CỦA AI ĐÓ, GÌ ĐÓ GOM NHÓM THEO CÁI GÌ ĐÓ 

-- NẾU BẠN GOM THEO KEY/PK, VÔ NGHĨA NHA, VÌ KEY KO CHÙNG MỖI THẰNG 1 NHÓM , ĐẾM CÁI GÌ ???

-- MÃ SỐ SV, ----ĐẾM CÁI GÌ ??? VÔ NGHĨA 
-- MÃ CHUYÊN NGHÀNH -- ĐẾM SỐ SV CỦA CHUYÊN NGHÀNH !!! HỢP LÍ
-- MÃ QUỐC GIA -- ĐẾM SỐ ĐƠN HÀNG 
-- ĐIỂM THI -- ĐẾM SỐ LƯỢNG ĐẠT ĐƯUOCJ ĐIỂM ĐÓ 
-- CÓ CỘT ĐỂ GOM NHÓM, CỘT ĐÓ SẼ DÙNG ĐỂ HIỂN THỊ KẾT QUẢ SỐ LƯỢNG 

--IN MÃ NV
--1 LONDON
--2 SEATLE
--3 
--4

SELECT City, COUNT(City) AS [No employess] FROM Employees GROUP BY City

--9 HÃY CHO TÔI BIẾT THÀNH PHỐ NÀO CÓ TỪ 2 NHÂN VIÊN TRỞ LÊN 
-- 2 CHẶNG LÀM
--9.1 CÁC THÀNH PHỐ CÓ BAO NHIÊU NHÂN VIÊN 
--9.2 ĐẾM XONG MỖI THÀNH PHỐ TA BẮT ĐẦU LỌC LẠI KQ SAU ĐẾM 
-- FILTER SAU ĐẾM, WHERE SAU KHI ĐÃ GOM NHÓM, ARRGEATE THÌ GỌI LÀ HAVING 


SELECT City, COUNT(City) AS [No employess] FROM Employees GROUP BY City
SELECT City, COUNT(*) AS [No employess] FROM Employees GROUP BY City

SELECT City, COUNT(*) AS [No employess] FROM Employees GROUP BY City HAVING COUNT(*) >= 2

--10. ĐẾM SỐ NHÂN VIÊN CỦA 2 THÀNH PHỐ Seatle và London

SELECT  COUNT(City) FROM Employees WHERE City IN('London', 'Seattle') --6 đứa, sai rồi 

SELECT  COUNT(City) FROM Employees WHERE City IN('London', 'Seattle') GROUP BY City --6 đứa, sai rồi 
SELECT City, COUNT(City) FROM Employees WHERE   City In ('London', 'Seattle' ) GROUP BY City -- 6 đứa

--11. Trong 2 thành phố London , Seattle nào có nhiều hơn 3 sinh viên 
SELECT City, COUNT(City) FROM Employees WHERE   City In ('London', 'Seattle' ) GROUP BY City HAVING COUNT(City) >= 3

--12. ĐẾM XEM CÓ BAO NHIÊU ĐƠN HÀNG ĐÃ BÁN RA 

SELECT  COUNT(*) FROM Orders --830
SELECT   COUNT(OrderID) AS SoLuong  FROM Orders --830
--830 mã đơn hàng khác nhau, dến mã đơn, hay đếm cả cái đơn là như nhau 
-- nếu cột có value Null anh hành!!!

--12.1 Nước Mĩ có bao nhiêu đơn hàng 
-- ĐI TÌM MĨ MÀ ĐẾM, LỌC MĨ RỒI TÍNH TIẾP, WHERE MĨ 
-- KP PHẢI LÀ CÂU GOM CHIA NHÓM, VÌ KO CÓ CHỮ MỖI 
-- MỖI QUỐC GIA CÓ BAO NHIÊU DƠN, COUNT THEO QUỐC GIA, GROUP BY THEO QUỐC GIA 
SELECT COUNT(ShipCountry) FROM Orders WHERE ShipCountry = 'USA'

--12.2 MĨ, ANH, PHÁP MỖI QUỐC GIA CÓ BAO NHIÊU ĐƠN HÀNG 
SELECT ShipCountry, COUNT(ShipCity) AS [NO ORDER] FROM Orders WHERE
			ShipCountry IN ('USA','France', 'UK' ) GROUP BY  ShipCountry

--12.3 MĨ ANH PHÁP CHIẾM TỔNG CỘNG BAO NHIÊU ĐƠN HÀNG 
SELECT * FROM Orders
SELECT COUNT(*) AS [3 NƯỚC]  FROM Orders WHERE ShipCountry IN ('USA','France', 'UK' ) --255

--12.4 TRONG 3 QUỐC GIA A, P, M QUỐC GIA NÀO CÓ TRÊN 100 ĐƠN HÀNG 
SELECT ShipCountry, COUNT(ShipCity) AS [NO ORDER] FROM Orders WHERE
			ShipCountry IN ('USA','France', 'UK' ) GROUP BY  ShipCountry
			HAVING COUNT(ShipCity) >= 100

--14. ĐẾM XEM CÓ BAO NHIÊU LƯỢT QUỐC GIA ĐÃ MUA HÀNG 
SELECT COUNT(ShipCity) FROM Orders --830
--15. ĐẾM XEM CÓ BAO NHIÊU QUỐC RA ĐÃ MUA HÀNG 
SELECT  COUNT(DISTINCT ShipCity) AS SOLUONG FROM Orders  -- 70
--16. ĐẾM SÔ LƯỢNG ĐƠN HÀNG CỦA MỖI QUỐC GIA 
SELECT ShipCity, COUNT(CustomerID) AS SOLUONGDONHANG FROM Orders GROUP BY ShipCity

--17. QUỐC GIA NÀO CÓ TỪ 10 ĐƠN HÀNG TRỞ LÊN 
SELECT ShipCountry, COUNT(CustomerID) AS SOLUONGDONHANG FROM Orders GROUP BY ShipCountry
		HAVING COUNT(CustomerID) >= 100


--BTVN
--13. ĐẾM XEM CÓ BAO NHIÊU MẶT HÀNG CÓ TRONG KHO
--12.4 TRONG 3 QUỐC GIA ANH, PHÁP, MĨ QUỐC GIA NÀO CÓ NHIÊU ĐƠN HÀNG NHẤT 
SELECT ShipCountry, COUNT(OrderID) AS DEMO
					FROM Orders WHERE ShipCountry IN ('USA', 'France', 'UK')
					GROUP BY ShipCountry
					HAVING COUNT(ShipCountry) >= ALL (SELECT COUNT(OrderID) FROM Orders GROUP BY ShipCountry)
--17. QUỐC GIA NÀO CÓ NHIỀU ĐƠN HÀNG NHẤT 
SELECT * FROM Orders
SELECT ShipCountry, COUNT(OrderID) AS DEMO 
					FROM Orders GROUP BY ShipCountry
					HAVING COUNT(ShipCountry) >= ALL (SELECT COUNT(OrderID)
					FROM Orders GROUP BY ShipCountry)


--10 THÀNH PHỐ NÀO CÓ NHIỀU NHÂN VIÊN NHẤT ???
SELECT * FROM Employees
SELECT City, COUNT(EmployeeID) AS NOCITY 
                  FROM  Employees GROUP BY City 
				  HAVING COUNT(City) >= ALL (SELECT COUNT(EmployeeID)
				  FROM Employees GROUP BY City)
						

--18. ĐẾM XEM MỖI CHỦNG LOẠI CÓ BAO NHIÊU MÓN HÀNG (BIA RIỆU CÓ 5SP, THỦY SẢN 10 SP)
SELECT * FROM Products
SELECT * FROM Categories
SELECT CategoryID,COUNT(ProductName) AS SOMON
					FROM Products GROUP BY CategoryID

--19. CHỦNG LOẠI NÀO NHIỀU MÓN NHẤT 
SELECT CategoryID,COUNT(ProductName) AS DEMO 
				FROM Products GROUP BY CategoryID
				HAVING COUNT(CategoryID) >= ALL (SELECT COUNT(ProductName) 
				FROM Products GROUP BY CategoryID)
	
