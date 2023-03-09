--CREATE DATABASE DBDESIGN_PHONEBOOK
USE DBDESIGN_PHONEBOOK

	CREATE TABLE PhoneBookV3_1
	(
		Nick nvarchar(30),
		Phone char(11), --chỉ 1 số phone thôi 
	
	)
-- MỞ RỘNG TABLE THEO CHIều DỌC, AI CÓ NHIỀU SIM THÌ THÊM DÒNG 



SELECT * FROM PhoneBookV3_1
INSERT INTO PhoneBookV3_1 VALUES(N'hoangnt', '098x') 

INSERT INTO PhoneBookV3_1 VALUES(N'annguyen', '090x')
INSERT INTO PhoneBookV3_1 VALUES(N'annguyen', '091x')

INSERT INTO PhoneBookV3_1 VALUES(N'binhle', '090x')
INSERT INTO PhoneBookV3_1 VALUES(N'binhle',  '091x')
INSERT INTO PhoneBookV3_1 VALUES(N'binhle',  '092x')


-- *****PHÂN TÍCH: 
-- >>>>>>> ƯU ĐIỂM: SELECT PHONE LÀ RA ĐƯỢC TẤT CẢ CÁC SỐ DI ĐỘNG
-- THỐNG KÊ SỐ LƯỢNG SỐ ĐIỆN THOẠI ĐANG CÓ, MẤY SIM ??? TRẢ LỜI ĐƯỢC 
--> ko bị NULL, MUỐN THÊM BAO NHIÊU THÌ THÊM!!!! 
SELECT NICK, COUNT(*) AS [No phone] FROM PhoneBookV3_1 
			GROUP BY Nick


-->>>>> NHƯỢC ĐIỂM 
--1. SQL. CHO TÔI BIẾT CÁC SỐ DI ĐỘNG CỦA MỌI NGƯỜI
--> KO BIẾT SỐ PHONE X NÀO ĐÓ THUỘC LOẠI NÀO?!!!!
-- >>>>>>> CHO TUI BIẾT SỐ ĐỂ BÀN, Ở NHÀ CỦA ANH BÌNH LÊ ??? 

-- VI PHẠM PK, REDUNDANCY, hoangnt lặp lại nhiều lần làm gì mới lưu cái nick thôi 
-- fullName, title, tên cty,...


SELECT * FROM PhoneBookV3_1

--> TRIẾT LÍ THIẾT KẾ: CỐ GẮNG GIỮ NGUYÊN CÁI TỦ, THÊM ĐỒ THÔI, 
--                     KO THÊM CỘT CỦA TABLE, CHỈ CẦN THÊM DÒNG NẾU CÓ BIẾN ĐỘNG SỐ LƯỢNG 
-- TRÁNH BỊ REDUNDANCY, PK, -> TÁCH BẢNG, PHẦN LẶP LẠI RA SỐ KHÁC 

---------------------------------------------------------------------------------------------
--TA CẦN GIẢI QUYẾT PHONE NÀY THUỘC LOẠI NÀO 

CREATE TABLE PhoneBookV3_2
(
	Nick nvarchar(30),
	Phone char(11), --chỉ 1 số phone thôi, CẦN PHẢI GIẢI NGHĨA THÊM SỐ NÀY LÀ SỐ GÌ 
	PhoneType nvarchar(20)  --090x Home, 091x Work
	
)

INSERT INTO PhoneBookV3_2 VALUES(N'hoangnt', '098x', 'CELL') 

INSERT INTO PhoneBookV3_2 VALUES(N'annguyen', '090x', 'CELL')
INSERT INTO PhoneBookV3_2 VALUES(N'annguyen', '091x', 'HOME' )

INSERT INTO PhoneBookV3_2 VALUES(N'binhle', '090x', 'WORK')
INSERT INTO PhoneBookV3_2 VALUES(N'binhle',  '091x', 'CELL')
INSERT INTO PhoneBookV3_2 VALUES(N'binhle',  '092x', 'CELL')

SELECT * FROM PhoneBookV3_2

-- PHÂN TÍCH:
--** ƯU ĐIỂM:
-- COUNT() NGON, GROUP BY THEO NIK, THEO LOẠI PHOEN LUÔN 
-- WHERE THEO LOẠI PHONE NGON 
SELECT * FROM PhoneBookV3_2 WHERE PhoneType = 'CELL'


--* NHƯỢC ĐIỂM 
-- REDENDANCY TRÊN INFO CỦA NICK/FULL/CTY/EMAIL

-- MỘT KHI BỊ TRÙNG LẶP INFO, LẶP LẠI INFO, REDUNDANCY, CHỈ CÓ 1 SOLUTION 
-- KO CHO TRÙNG, TỨC LÀ XUẤT HIỆN 1 LẦ RA BẢNG KHÁC > DECOMPOSITION PHÂN RÃ 
