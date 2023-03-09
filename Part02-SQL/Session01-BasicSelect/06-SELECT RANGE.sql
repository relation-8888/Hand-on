USE Northwind 
-------------------------------------------------------------------------------------
-- LÍ THUYẾT 
-- CÚ PHÁP MỞ RỘNG LỆNH SELECT
-- KHI CẦN LỌC DỮ LIỆU TRONG 1 ĐOẠN CHO TRƯỚC, THAY VÌ DÙNG >= ... AND <= ...., TA CÓ THỂ THAY THẾ 
-- BẰNG MỆNH ĐỀ BETWEEN, IN 
-- * CÚ PHÁP: CỘT BETWEEN VALUE - 1, AND VALUE -2 
--                                  >>>>>>>>>>>>> BETWEEN THAY THẾ CHO 2 MỆNH ĐỀ >= <= AND

-- * CÚ PHÁP: IN....(MỘT TẬP CÁC GIÁ TRỊ ĐƯỢC LIỆT KÊ CÁCH NHAU BẰNG DẤU PHẨY )
--                        >>>>>>>>>>>>>>>> IN THAY THẾ CHO 1 LOẠT OR
-------------------------------------------------------------------------------------
-- 1.LIỆT KÊ DS NHÂN VIÊN SINH TRONG NĂM 1960 ĐẾN 1970
SELECT YEAR(GETDATE()) - YEAR(BirthDate) AS Age, * FROM Employees WHERE YEAR(BirthDate) >= 1960 
                         AND YEAR(BirthDate) <= 1970 ORDER BY BirthDate DESC --4

SELECT YEAR(GETDATE()) - YEAR(BirthDate) AS Age, * FROM Employees WHERE YEAR(BirthDate) BETWEEN 1960 AND  1970 
                         ORDER BY BirthDate DESC --4

-- 2.LIỆT KÊ CÁCH ĐƠN HÀNG CÓ TRỌNG LƯỢNG TỪ 100 ĐẾN 500
SELECT * FROM Orders WHERE Freight BETWEEN 100 AND 500 ORDER BY Freight DESC -- 174

--3.LIỆT KÊ CÁC ĐƠN HÀNG GỬI TỚI ANH, PHÁP, MĨ
SELECT * FROM Orders WHERE ShipCountry = 'USA' OR ShipCountry = 'France' 
											   OR ShipCountry = 'UK' --255

SELECT * FROM Orders WHERE ShipCountry IN ('USA', 'France', 'UK') --255

--4.LIỆT KÊ CÁC ĐƠN HÀNG KHÔNG GỬI TỚI ANH, PHÁP, MĨ
SELECT * FROM Orders WHERE  ShipCountry NOT IN ('USA', 'France', 'UK') --575

--5.LIỆT KÊ CÁC ĐƠN HÀNG TRONG NĂM 1996 NGOẠI TRỪ THÁNG 6 7 8 9
SELECT * FROM Orders WHERE YEAR(OrderDate) = 1996 
						AND MONTH(OrderDate) NOT IN (6, 7, 8 ,9)

-- LƯU Ý:CHỈ KHI TA LIỆT KÊ ĐƯỢC TẬP GIÁ TRỊ THÌ MỚI CHƠI IN
-- KHOẢNG SỐ THỰC THÌ KO LÀM ĐƯỢC
--6. LIỆT KÊ CÁC ĐƠN HÀNG CÓ TRỌNG LƯỢNG TỪ 100...110
SELECT * FROM Orders WHERE Freight >= 100 AND Freight <= 110  ORDER BY Freight DESC

SELECT * FROM Orders WHERE Freight IN ()  --100...110 VÔ SỐ GIÁ TRỊ THỰC 

											    





