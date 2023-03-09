--CREATE DATABASE DBDESIGN_PHONEBOOK
USE DBDESIGN_PHONEBOOK


CREATE TABLE PhoneBookV3_2
(
	Nick nvarchar(30), --NGOÀI CỘT NÀY BỊ LẶP LẠI , MÌNH CÒN THÊM CỘT,
					   -- FULLNAME, TÊN CTY, TÊN CHỨC VỤ, 
	--....CombanyName,...
	Phone char(11), --chỉ 1 số phone thôi, CẦN PHẢI GIẢI NGHĨA THÊM SỐ NÀY LÀ SỐ GÌ 
	PhoneType nvarchar(20)  --090x Home, 091x Work
	
)

CREATE TABLE PersionV4_1
(
	Nick nvarchar(30),
	Title nvarchar(30),
	Company nvarchar(40)

)


-----------------------------------------------------------------------------------
-- TÁCH BẢNG
-- KHỐN NẠN, INFO BỊ PHÂN MẢNH, NẰM NHIỀU NƠI, PHẢI JOIN RỒI 
-- NHẬP DATA COI TRỪNG BỊ VÊNH, XÓA DATA COI TRỪNG LẠC TRÔI 
-- PHÂN MẢNH THÌ PHẢI CÓ LÚC TÁI NHẬP (JOIN) JOIN TRÊN CỘT MẸ NÀO ???
-- FK XUÁT HIỆN!!!
-- ko thích fk được ko? ĐƯỢC VÀ KO ĐƯỢC
-- NẾU CHỈ CẦN JOIN ÉO CẦN FK, CỘT = VALUE, KHỚP LÀ JOIN, NỐI BẢNG GHÉP NGANG 
-- NẾU KÈM THÊM XÓA, SỬA, THÊM LỘN XỘN K NHẤT QUÁN 
CREATE TABLE PhoneBookV4_1
(
	--....CombanyName,...
	Phone char(11), 
	PhoneType nvarchar(20),  
	Nik nvarchar(30) --ÉO CẦN FK, CHỈ CẦN JOIN LÀ OKIE 
	
)
SELECT * FROM PersionV4_1
SELECT * FROM PhoneBookV4_1

INSERT INTO PersionV4_1 VALUES(N'hoangnt', 'Lecturer', 'FPTU HCMC')	
INSERT INTO PersionV4_1 VALUES(N'annguyen', 'Stuent', 'FPTU HCMC')	
INSERT INTO PersionV4_1 VALUES(N'binhle', 'Student', 'FPTU HLL')	


INSERT INTO PhoneBookV4_1 VALUES( '098x', 'CELL',N'hoangnt') 

INSERT INTO PhoneBookV4_1 VALUES( '090x', 'CELL',N'annguyen')
INSERT INTO PhoneBookV4_1 VALUES( '091x', 'HOME',N'annguyen' )

INSERT INTO PhoneBookV4_1 VALUES( '090x', 'WORK', N'binhle')
INSERT INTO PhoneBookV4_1 VALUES(  '091x', 'CELL',N'binhle')
INSERT INTO PhoneBookV4_1 VALUES(  '092x', 'CELL',N'binhle')

-- PHÂN TÍCH:
--** ƯU ĐIỂM:
-- COUNT() NGON, GROUP BY THEO NIK, THEO LOẠI PHOEN LUÔN 
-- WHERE THEO LOẠI PHONE NGON 
-- REDUNDANCY TRÊN INFO CỦA NICK/FULL/CTY/NAME/EMAIL/NĂM SINH....GIẢI QUYẾT Ở BẰNG PERSON 


--* NHƯỢC ĐIỂM 
-- TÍNH KO NHẤT QUÁN (INCONSISTENCY) CỦA LOẠI PHONE : CÓ NGƯỜI GÕ: CELL, cell, éo sợ vì cùng là 1 kiểu 
--                                                             GÕ THÊM: DI ĐỘNG, DD -> CẢ ĐÁM NÀY LÀ 1 LOGIC CON NG HIỂU
--                                                             MÁY HIỂU LÀ KHÁC NHAU 
-- QUERY LIỆT KÊ CÁC SỐ DI ĐỘNG CỦA TẤT CẢ MỌI NGƯỜI, TONAG KHI WHERE 
-- VÌ ÉO BIẾT ĐƯỢC CÓ BAO NHIÊU LOẠI CHỮ BIỂU DIỄN CHUNG DI ĐỘNG 

INSERT INTO PhoneBookV4_1 VALUES(  '093x', 'MOBILE',N'binhle')
INSERT INTO PhoneBookV4_1 VALUES(  '094x', 'Sugar Daddy',N'binhle')

--SQL. LIỆT KÊ CÁC SỐ DI ĐỘNG CỦA BẠN BÌNH
SELECT * FROM PhoneBookV4_1
		 WHERE PhoneType IN ('CELL')
		 --MÀY TÍNH IN CÁI TẬP HỢP NÀY ĐẾN BAO GIỜ KHI NGTA CÒN GÕ TỪ KHÁC 
		 -- CŨNG BIỂU DIỄN CHO KHAI NIỆM DI ĐỘNG 

-- QUY TẮC THÊM CÓ NHỮNG LOẠI DATA BIẾT TRƯỚC LÀ NHIỀU NHỮNG HỮU HẠN CÁI VALUE ĐỂ NHẬP 
--TỈNH THÀNH NHIỀU, CHỈ CÓ 63, QUỐC GIA 230, CHÂU LỤC 56, TRƯỜNG THPT 500 TRƯỜNG,
-- CÓ NÊN CHO NGƯỜI TA GÕ TAY HAY KHÔNG, KO VÌ NÓ SẼ GÂY NÊN K NHẤT QUÁN BẤT ĐỒNG BỘ 
-- TỐT NHẤT CHO CHỌN, CHỌN TỪ CÁI CÓ SẴN TỨC LÀ TỪ TABLE KHÁC 

--KO CHO GÕ LUNG TUNG, GÕ TRONG CÁI ĐÃ CÓ  - DÍNH 2 THỨ, TABLE KHÁC (ĐÃ NÓI TRÊN)
--				       FK ĐỂ ĐẢM BẢO CHỌN ĐÚNG TRONG ĐÓ THÔI 
