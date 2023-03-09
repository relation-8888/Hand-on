--CREATE DATABASE DBDESIGN_PHONEBOOK
USE DBDESIGN_PHONEBOOK



CREATE TABLE PersionV5_1_
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
CREATE TABLE PhoneBookV5_1_
(
	--....CombanyName,...
	Phone char(11), 
	PhoneType nvarchar(20),  --CHO NGTA GÕ TRỰC TIẾP LOẠI PHONE, GÂY NÊN LỘN XỘN VỀ LOẠI PHONE, CELL, DI ĐỘNG, DĐ, MOBILE
							 --THỐNG KÊ KHÓ KHĂN, OR, VÀ CÒN TIẾP SỬA OR NỮA DO CHO GÕ TỰ DO 
							 --HẠN CHẾ KO CHO GÕ LỘN XỘN, TỨC LÀ PHẢI GÕ CHỌN THEO AI ĐÓ, FK 
	Nik nvarchar(30) --ÉO CẦN FK, CHỈ CẦN JOIN LÀ OKIE 
	
)

CREATE TABLE PersionV5_1
(
	Nick nvarchar(30),
	Title nvarchar(30),
	Company nvarchar(40)

)




--TABLE MỚI XUẤT HIỆN LƯU LOẠI PHONE KO CHO GÕ LUNG TUNG ~~~~ TABLE PROVINCE, CITY, COUNTRY, SEMESTER 
CREATE TABLE PhoneTypeV5_1
(

	TypeName nvarchar(20)

)

--ko muốn xóa table mà muốn thêm khóa chính 
ALTER TABLE PhoneTypeV5_1 ALTER COLUMN TypeName nvarchar(20) NOT NULL

ALTER TABLE PhoneTypeV5_1
		ADD CONSTRAINT PK_PHONETYPEV51 PRIMARY KEY(TypeName)

ALTER TABLE PhoneTypeV5_1
		ADD  PRIMARY KEY(TypeName)



CREATE TABLE PhoneBookV5_1
(
	--....CombanyName,...
	Phone char(11), 
	TypeName nvarchar(20) REFERENCES PhoneTypeV5_1(TypeName),
	Nik nvarchar(30) 
	
)
SELECT * FROM PersionV5_1
SELECT * FROM PhoneTypeV5_1
SELECT * FROM PhoneBookV5_1

INSERT INTO PhoneTypeV5_1 VALUES(N'DI ĐỘNG')
INSERT INTO PhoneTypeV5_1 VALUES(N'NHÀ/ĐỂ BÀN')
INSERT INTO PhoneTypeV5_1 VALUES(N'CÔNG TY')
INSERT INTO PhoneTypeV5_1 VALUES(N'CHA DƯỢNG NGỌT NGÀO')

INSERT INTO PersionV5_1 VALUES(N'hoangnt', 'Lecturer', 'FPTU HCMC')	
INSERT INTO PersionV5_1 VALUES(N'annguyen', 'Stuent', 'FPTU HCMC')	
INSERT INTO PersionV5_1 VALUES(N'binhle', 'Student', 'FPTU HLL')	








INSERT INTO PhoneBookV5_1 VALUES( '098x', N'DI ĐỘNG',N'hoangnt') 

INSERT INTO PhoneBookV5_1 VALUES( '090x', N'DI ĐỘNG',N'annguyen')
INSERT INTO PhoneBookV5_1 VALUES( '091x', N'NHÀ/ĐỂ BÀN',N'annguyen' )

INSERT INTO PhoneBookV5_1 VALUES( '090x', N'CHA DƯỢNG NGỌT NGÀO', N'binhle')
INSERT INTO PhoneBookV5_1 VALUES(  '091x', N'DI ĐỘNG',N'binhle')
INSERT INTO PhoneBookV5_1 VALUES(  '092x', N'DI ĐỘNG',N'binhle')

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

---------------------------------------------------------------------------------------------

CREATE TABLE PersonV5
(
	Nick nvarchar(30) PRIMARY KEY , --CÒN CẦN BÀN THÊM VỀ PK HERE/PERFORMANCE
	Title nvarchar(30),
	Company nvarchar(40)

)

CREATE TABLE PhoneTypeV5
(

	TypeName nvarchar(20) NOT NULL, --CÒN CẦN BÀN THÊM VỀ PK HERE/PERFORMANCE
	PRIMARY KEY(TypeName)

)

CREATE TABLE PhoneBookV5
(
	
	Phone char(11) NOT NULL,  -- sdt là số mấy 
	TypeName nvarchar(20) REFERENCES PhoneTypeV5(TypeName), --nó thuộc loại mẹ gì 
	Nick nvarchar(30) REFERENCES PersonV5(Nick),
	-- của cu nào !!!
	CONSTRAINT PK_PHONEBOOKV5 PRIMARY KEY(Phone)
) --loại gì avf của ai ko gõ lung tung 

