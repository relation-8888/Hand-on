--CREATE DATABASE DBDESIGN_PHONEBOOK
USE DBDESIGN_PHONEBOOK

CREATE TABLE PhoneBookV2_
(
	Nick nvarchar(30),
	--Phone nvarchar(50)  --cấm đa trị, cấm gộp nhiều số phone trong 1cell
	Phone1 char(11), --chỉ 1 số phone thôi 
	Phone2 char(11),
	Phone3 char(11),     --éo biết cột nào là noại nào, 1 2 3 là vô hồn 
)
-- MỞ RỘNG TABLE THEO CHIỀU NGANG - THÊM CỘT 


CREATE TABLE PhoneBookV2
(
	Nick nvarchar(30),
	--Phone nvarchar(50)  --cấm đa trị, cấm gộp nhiều số phone trong 1cell
	HomePhone char(11), --chỉ 1 số phone thôi 
	WorkPhone char(11),
	CellPhone char(11),     --éo biết cột nào là noại nào, 1 2 3 là vô hồn 
)
SELECT * FROM PhoneBookV2
INSERT INTO PhoneBookV2 VALUES(N'hoangnt', NULL, NULL, '098x') 

INSERT INTO PhoneBookV2 VALUES(N'annguyen', '090x', '091x', NULL)

INSERT INTO PhoneBookV2 VALUES(N'binhle', '090x', '091x', '092x')

-- *****PHÂN TÍCH: 
-- >>>>>>> ƯU ĐIỂM: SELECT PHONE LÀ RA ĐƯỢC TẤT CẢ CÁC SỐ DI ĐỘNG 
--1. SQL. CHO TÔI BIẾT CÁC SỐ DI ĐỘNG CỦA MỌI NGƯỜI
SELECT CellPhone, NICK FROM PhoneBookV2
SELECT p.CellPhone, p.Nick FROM PhoneBookV2 p
-- >>>>>>> CHO TUI BIẾT SỐ ĐỂ BÀN, Ở NHÀ CỦA ANH BÌNH LÊ ??? 
SELECT p.HomePhone, p.Nick FROM PhoneBookV2 p
		WHERE p.Nick = 'binhle'


-->>>>> NHƯỢC ĐIỂM 
-- THỐNG KÊ SỐ LƯỢNG SỐ ĐIỆN THOẠI ĐANG CÓ, MẤY SIM ??? KO TRẢ LỜI ĐƯỢC 
--> DATA BỊ NULL, PHÍ KO GIAN LƯU TRỮ 
--> NGƯỜI CÓ 4 SỐ PHONE, 5 PHONE THÌ SAO ???
--> SOLUTION: THÊM CỘT, CÀNG THÊM CỘT TRỪ HAO VỀ NGƯỜI CÓ NHIỀU PHONE 
-->           NHỮNG NGƯỜI CÒN LẠI BỊ NULL CÀNG NHIỀU 
--> PHÍ VÌ CHỈ 1 VÀI NGƯỜI ĐẶC BIỆT NHIỀU PHONE MÀ TẤT CẢ ANH EM KHÁC ĐỀU ĐƯỢC
--> XEM CHUNG LÀ NHIỀU SỐ PHONE, PHI KO GIAN LƯU TRỮ 
-->	GIẢ SỬ VẪN QUYẾT TÂM THEO CỘT, NỞ CỘT RA, THÌ GIÁ PHẢI TRẢ SỬA CODE LẬP TRÌNH 
--> SAU NÀY, VÌ TÊN CỘT MỚI ĐƯỢC THÊM VÔ KHI NÂNG CẤP APP, SỬA THÊM CÁI CÂU QUERY 

--> TRIẾT LÍ THIẾT KẾ: CỐ GẮNG GIỮ NGUYÊN CÁI TỦ, THÊM ĐỒ THÔI, 
--                     KO THÊM CỘT CỦA TABLE, CHỈ CẦN THÊM DÒNG NẾU CÓ BIẾN ĐỘNG SỐ LƯỢNG 

--> PHIÊN BẢN 3 - PHIÊN BẢN NGON, AI NHIỀU PHONE THÌ NHIỀU DÒNG, 
--> NHIỀU CELL THEO CHIỀU DỌC THÊM DÒNG 
--> COUNT() NGON LÀNH CÀNH ĐÀO, TRẢ LỜI NGAY ĐƯỢC CÂU BAO NHIÊU SIM BAO NHIÊU SÓNG 




INSERT INTO PhoneBookV1 VALUES(N'BINHLE', '098x | 091X | 092X') 
INSERT INTO PhoneBookV1 VALUES(N'CUONGVO', '090x , 091x , 092X')
INSERT INTO PhoneBookV1 VALUES(N'DUNGPHAM', '090x - 091x - 092x')
-- >>>>> TIÊU CHÍ CẮT CHUỖI - DELIMITER DẤU PHÂN CÁCH KO NHẤT QUÁN 
-- >>>>> QUY ƯỚC NGẦM VỀ NHẬP DẤU PHÂN CÁCH 

-- ĐẾM XEM MỖI NGƯỜI CÓ BAO NHIÊU SỐ PHONE !!! COUNT() QUÁ QUEN 
-- DẤU PHÂN CÁCH KHÓ KHĂN CHO CẮT ĐỂ COUNT!!! 

-- KHÓ KHĂN SẢY RA KHI TA GOM NHIỀU VALUES CÙNG KIỂU NHIỀU NGỮ NGHĨA VÀO 
-- TRONG 1 COLUM (CỘT PHONE, LƯU NHIỀU SỐ PHONE CÁCH NHAU BẰNG DẤU CÁCH)
-- GÂY KHÓ KHĂN CHO NHẬP DỮ LIỆU (KO NHẤT QUÁN DẤU CAÁCH), KHI SELECT 
-- COUNT() THỐNG KÊ THEO 1 TIÊU CHÍ (IN SỐ PHONE Ở NHÀ )
-- UPDATE THÊM PHONE MỚI, XÓA SỐ CŨ 

-- MỘT CELL MÀ CHỨA NHIỀU VALUES CÙNG KIỂU ĐƯỢC GỌI LÀ ĐA TRỊ
-- MULTI-VALUED COLUMN -> TIỀM ẨN NHIỀU KHÓ KHĂN CHO VIỆC SỬ LÍ DATA 

-- NẾU 1 TABLE CÓ CỘT ĐA TRỊ NGƯỜI TA NÓI RẰNG NÓ ÉO ĐẠT CHUẨN 1
-- LEVEL THIẾT KẾ CHÁN QUÁ - 1ST NORMALIZATION

-- CHUẨN 1, CHẤT LƯỢNG THIẾT KẾ TÍNH TỪ 1, 2, 3, ...

-- THIẾT KẾ KÉM THÌ PHẢI NÂNG CẤP, KO CHƠI ĐA TRỊ  NỮA !!!
-- KO CHƠI GOM VALUES TRONG 1 CELL
-- 2 CHIẾN LƯỢC FIX
-- CHIỀU NGANG(thêm cột), CHIỀU DỌC(thêm dòng!!!)***** 

