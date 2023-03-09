USE Northwind

-------------------------------------------------
-- LÍ THUYẾT
-- Cú pháp chuẩn của SELECT 
-- SELECT * FROM <TABLE> WHERE....
-- WHERE CỘT TOÁN TỬ SO SÁNH VỚI VALUE CẦN LỌC 
--       CỘT > >= < <= != VALUE
--                        DÙNG CÂU SUB-QUERY TÙY NGỮ CẢNH 
--       CỘT            = (SUB CHỈ CÓ 1 VALUE)
--       CỘT            IN (SUB CHỈ CÓ 1 CỘT NHƯNG NHIỀU VALUE)
--
--       CỘT            > >= < <= ALL (1 CÂU SUB 1 CỘT NHIỀU VALUE )
--                                ANY (1 CÂU SUB 1 CỘT NHIỀU VALUE )
-------------------------------------------------------------------------
-- THỰC HÀNH 
-- tạo 1 table có 1 cột tên là Numbr, chỉ chứa 1 đống dòng các số nguyên 
CREATE TABLE Num
(
	Numbr int 


)
SELECT * FROM Num
INSERT INTO Num values (1)
INSERT INTO Num values (1)
INSERT INTO Num values (2)
INSERT INTO Num values (9)
INSERT INTO Num values (5)
INSERT INTO Num values (100)
INSERT INTO Num values (101)

--1.IN RA NHỮNG SỐ LỚN HƠN 5
SELECT * FROM Num WHERE Numbr > 5

--2.IN RA SỐ LỚN NHẤT TRONG CÁC SỐ ĐÃ NHẬP 
--SỐ LỚN NHẤT TRONG 1 ĐÁM ĐƯỢC ĐỊNH NGHĨA LÀ: MÀY LỚN HƠN HẾT CẢ ĐÁM ĐÓ, VÀ MÀY BẰNG CHÍNH NÓ
-- LỚN HƠN TẤT CẢ, NGOẠI TRỪ CHÍNH MÌNH -> MÌNH LÀ MAX CỦA ĐÁM 
--SELECT * FROM Num WHERE Numbr = 101 -- LẦY LỘI 
SELECT * FROM Num WHERE Numbr >= ALL (SELECT * FROM Num)

--3. SỐ NÀO LÀ SỐ BÉ NHẤT TRONG TẤT CẢ 
SELECT * FROM Num WHERE Numbr <= ALL (SELECT * FROM Num)
--4 NHÂN VIÊN NÀO LỚN TUỔI NHẤT
SELECT * FROM Employees WHERE BirthDate <= ALL (SELECT BirthDate FROM Employees)

--5 ĐƠN HÀNG NÀO CÓ TRỌNG LƯỢNG NẶNG NHẤT 
SELECT * FROM Orders WHERE Freight >= ALL (SELECT Freight FROM Orders)