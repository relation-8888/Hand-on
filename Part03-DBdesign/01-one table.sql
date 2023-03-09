CREATE DATABASE DBDESGIN_ONETABLE 
--CREATE DÙNG ĐỂ TẠO CẤU TRÚC LƯU TRỮ/DÀN KHUNG/THÙNG LƯU TRỮ DATA/INFO
--TƯƠNG ĐƯƠNG VIỆC XÂY PHÒNG CHỨA ĐỒ - DATABASE
----          MUA TỦ ĐỂ TRONG PHÒNG  - TABLE 
--1 DB CHỨA NHIỀU TABLE - 1 PHÒNG CÓ NHIỀU CÁI TỦ 
--						- 1 NHÀ CÓ NHIỀU PHÒNG 
-- TẠO RA CẤU TRÚC LỮU TRỮ - CHƯA NÓI DATA BỎ VÀO - DDL (PHÂN NHÁNH CỦA SQL)

USE DBDESGIN_ONETABLE 

--TẠO TABLE LƯU TRỮ HỒ SƠ SV: MÃ SỐ (PHÂN BIỆT SV VỚI NHAU ), TÊN, DOB, ĐỊA CHỈ....
--1 SV ~~ OBJECT ~~~1  ENTITY 
--1 TABLE SẼ DÙNG ĐỂ LƯU TRỮ NHIỀU ENTITY 
CREATE TABLE StudentV1
(
	StudentID char(8),
	LastName nvarchar(40), --tại sao ko gộp full name cho rồi??
	FirstName nvarchar(10), --n: lưu kí tự Uncode tiếng việt 
	DOB datetime,
	Address nvarchar(50)
)

-- THAO TÁC TRÊN DATA/MÓN ĐỒ TRONG TỦ/TRONG TABLE - DML/DQL(DÀNH CHO SELECT)
SELECT * FROM StudentV1

--ĐƯA DATA VÀO TABLE/MUA ĐỒ QUẦN ÁO BỎ VÀO TỦ 
INSERT INTO StudentV1 VALUES('SE123456', N'Nguyễn', N'An', '2003-1-1', N'...TP.Hồ Chí Minh') --ĐƯA HẾT VÀO CÁC CỘT, SV FULL KO CHE THÔNG TIN 

-- MỘT SỐ CỘT CHƯA THÈM NHẬP INFO, ĐƯỢC QUYỀN BỎ TRỐNG NẾU CỘT CHO PHÉP TRỐNG VALUE 
-- DEFAULT KHI ĐÓNG CÁI TỦ/MUA CÁI TỦ/THIẾT KẾ MẶC ĐỊNH LÀ NULL 
INSERT INTO StudentV1 VALUES('SE123457', N'Lê', N'Bình', '2003-2-1', NULL)
-- TÊN THÀNH PHỐ LÀ NULL, WHERE = 'NULL' OKE VÌ NÓ LÀ DATA
-- NULL Ở CÂU TRÊN WHERE ADDRESS IS NULL
INSERT INTO StudentV1 VALUES('SE123458', N'Võ', N'Cường', '2003-3-1', N'NULL')

-- YUI CHỈ MUỐN LƯU VÀI INFO THÔI, KO ĐỦ SỐ CỘT, MIỄN CỘT CÒN LẠI CHO PHÉP BỎ TRỐNG 
INSERT INTO StudentV1(StudentID, LastName, FirstName)
		VALUES('SE123459', N'Trần', N'Dũng')	

INSERT INTO StudentV1 (LastName, FirstName,StudentID)
		VALUES( N'Phạm', N'Em','SE123460')
		
INSERT INTO StudentV1 (LastName, FirstName,StudentID)
		VALUES(NULL, NULL, NULL )

INSERT INTO StudentV1 (LastName, FirstName,StudentID)
		VALUES(NULL, NULL, NULL ) --SIÊU NGUY HIỂM, SV TOÀN INFO BỎ TRỐNG 
								  --GÀI CÁCH ĐƯA DATA VÀO CỘT SAO CHO HỢP LÍ 
								  --CONSTRAINT TRÊN DATA/CELL/COLUMN

SELECT * FROM StudentV1

--CÚ NGUYÊN HIỂM NÀY CÒN LỚN HƠN !!!!!!!!!!!!!!!!!!!!
--TRÙNG MÃ SỐ KO CHẤP NHẬN ĐƯỢC, KO XD ĐƯỢC SV --GÀI RÀNG BUỘC DỮ LIỆU QUAN TRỌNG 
											   --CỘT MÀ VALE CẤM TRÙNG TRÊN MỌI CELL CÙNG CỘT 
											   --DÙNG LÀM CHÌA KHÓA/KEY TÌM RA MỞ RA XD
											   --DUY NHẤT 1 INFO. DÒNG, SV, ENTITY, OBJECT 
--                                             ĐƯỢC GỌI LÀ PRIMARY KEY 
INSERT INTO StudentV1 (LastName, FirstName,StudentID)
		VALUES( N'Đỗ', N'Giang','SE123460')

SELECT * FROM StudentV1 WHERE StudentID = 'SE123460'

--GÀI CÁCH ĐƯA DATA VÀO TABLE ĐỂ KO CÓ HIỆN TƯỢNG BẤT THƯỜNG, 1 DÒNG TRỐNG TRƠN, KEY TRÙNG 
--KEY NULL - DEFAULT THIẾT KẾ NULL TẤT CẢ 
--GÀI - CONSTRAINTS 
CREATE TABLE StudentV2
(
	StudentID char(8) PRIMARY KEY, -- BAO HÀM LUÔN CÁI NOT NULL-BẮT BUỘC PHẢI ĐƯA DATA,CẤM TRÙNG 
	LastName nvarchar(40) NOT NULL, --tại sao ko gộp full name cho rồi??
	FirstName nvarchar(10) NOT NULL, --n: lưu kí tự Uncode tiếng việt (* ĐỎ SIGN - UP)
	DOB datetime,
	Address nvarchar(50)
)
INSERT INTO StudentV2 VALUES('SE123456', N'Nguyễn', N'An', '2003-1-1', N'...TP.Hồ Chí Minh')

SELECT * FROM StudentV2

--THỬ COI QUA MẶT ĐƯỢC KO??
INSERT INTO StudentV2 (LastName, FirstName,StudentID)
		VALUES(NULL, NULL, NULL ) --GẪY

INSERT INTO StudentV2 (LastName, FirstName,StudentID)
		VALUES('AHIHI', NULL, NULL ) --GẪY

--COI CÓ ĐC TRÙNG MÃ SỐ SV HAY KO??? --gẫy 
INSERT INTO StudentV2 VALUES('SE123456', N'Nguyễn', N'An', '2003-1-1', N'...TP.Hồ Chí Minh')
--THỬ TIẾP PK 
INSERT INTO StudentV2 VALUES('GD123456', N'Nguyễn', N'An', '2003-1-1', N'...TP.Hồ Chí Minh')
SELECT * FROM StudentV2

INSERT INTO StudentV2 VALUES('SE123457', N'Lê', N'Bình', '2003-2-1', NULL) --OKIE

INSERT INTO StudentV1 VALUES('SE123458', N'Võ', N'Cường',NULL, NULL) --OKIE

INSERT INTO StudentV2(StudentID, LastName, FirstName)
		VALUES('SE123459', N'Trần', N'Dũng')	

INSERT INTO StudentV2
		VALUES(NULL,NULL,NULL,NULL,NULL)	-- GẪY 3 CHỖ NULL

CREATE TABLE StudentV3
(
	StudentID char(8) NOT NULL PRIMARY KEY, -- BAO HÀM LUÔN CÁI NOT NULL-BẮT BUỘC PHẢI ĐƯA DATA,CẤM TRÙNG 
	LastName nvarchar(40) NOT NULL, --tại sao ko gộp full name cho rồi??
	FirstName nvarchar(10) NOT NULL, --n: lưu kí tự Uncode tiếng việt (* ĐỎ SIGN - UP)
	DOB datetime,
	Address nvarchar(50)NULL -- THỪA NULL, DO DEFAULT 
)

CREATE TABLE StudentV4
(
	StudentID char(8) NOT NULL, 
	LastName nvarchar(40) NOT NULL, 
	FirstName nvarchar(10) NOT NULL, 
	DOB datetime,
	Address nvarchar(50) NULL,
    PRIMARY KEY(StudentID) 
)

--GENERATED TỪ ERD TRONG TOOL THIẾT KẾ 
CREATE TABLE StudentV5 (
  StudentID char(8) NOT NULL, 
  LastName  varchar(50) NOT NULL, 
  FirstName varchar(10) NOT NULL, 
  PRIMARY KEY (StudentID));

SELECT * FROM StudentV5



INSERT INTO StudentV4 VALUES('SE123456', N'Nguyễn', N'An', '2003-1-1', N'...TP.Hồ Chí Minh')
SELECT * FROM StudentV4

--------------------------------------------------------------------------------------------
-- HỌC THÊM VỀ CÁI CONSTRAINTS - TRONG ĐÓ PK CONSTRAINTS
-- RÀNG BUỘC LÀ CÁCH TA/DB DESIGNER ÉP CELL/CỘT NÀO ĐÓ VALUE PHẢI NHƯ THẾ NÀO 
-- ĐẶT RA QUY TẮC/RULE CHO VIỆC NHẬP DATA 
-- VÌ CÓ NHIỀU QUY TẮC, NÊN TRÁNH NHẦM LẪN. DỄ KIỂM SOÁT, TA SẼ CÓ QUYỀN
-- ĐẶT TÊN CHO CÁC QUY TẮC, CONSTRAINTS 
-- VÍ DỤ: MÁ Ở NHÀ ĐẶT QUY TẮC/NỘI DUNG CHO MÌNH
-- RULE #1: VÀO SÀI GON HỌC THẬT TỐT NHA CON. TỐT: ĐIỂM TB >= 8 && KO RỚT MÔN NÀO 
--          && 9 HỌC KÌ RA TRƯỜNG && KO ĐỔI CHUYÊN NGHÀNH 
-- RULE #2: TỐI ĐI CHƠI VỀ NHÀ SỚM. SỚM: ĐƯỢC ĐỊNH NGHĨA TRONG TỐI CÙNG NGÀY, TRƯỚC 10H
-- RULE #3: ???????
-- TÊN RB/QUY TẮC                    NỘI DUNG/CÁI DATA ĐƯỢC GÀI VÀO 
--  PK_????                                  PRIMARY KEY 
-- MẶC ĐỊNH DB ENGINE NÓ TỰ ĐẶT TÊN CHO CÁC RB MÀ NÓ THẤY KHI BẠN 
-- GÕ LỆNH DDL 
-- DB EN CHO MÌNH CƠ CHẾ TỰ ĐẶT TÊN RÀNG BUỘC 

CREATE TABLE StudentV6
(
	StudentID char(8) NOT NULL, 
	LastName nvarchar(40) NOT NULL, 
	FirstName nvarchar(10) NOT NULL, 
	DOB datetime,
	Address nvarchar(50) NULL,
    --PRIMARY KEY(StudentID)   -- TỰ DB EN ĐẶT TÊN CHO RB 
	CONSTRAINT PK_STUDENTSV6 PRIMARY KEY (StudentID)
)

-- DÂN PRO ĐÔI KHI CON LÀM CÁCH SAU. NGTA TÁCH HẲN VIỆC TẠO RB CHÍNH, KHÓA NGOẠI 
-- RA HẲN CẤU TRÚC TABLE, TỨC LÀ CREATE TABLE CHỈ CHỨA TÊN CẤU TRÚC - CỘT - DOMAIN 
-- TẠO TABLE XONG RỒI CHỈNH SỬA TABLE - SỬA CÁI TỦ CHỨ KO PHẢI DATA TRONG TỦ 


DROP TABLE StudentV7 
CREATE TABLE StudentV7
(
	StudentID char(8) NOT NULL, 
	LastName nvarchar(40) NOT NULL, 
	FirstName nvarchar(10) NOT NULL, 
	DOB datetime,
	Address nvarchar(50) NULL,
    --PRIMARY KEY(StudentID)   -- TỰ DB EN ĐẶT TÊN CHO RB 
	--CONSTRAINT PK_STUDENTSV7 PRIMARY KEY (StudentID)
)
ALTER TABLE StudentV7 ADD CONSTRAINT PK_STUDENTSV7 PRIMARY KEY (StudentID)

-- xóa 1 ràng buộc được không, được, được cho add thì cho drop 
ALTER TABLE StudentV7 DROP CONSTRAINT PK_STUDENTSV7 

ALTER TABLE StudentV2 ADD CONSTRAINT PK__StudentV__32C52A79A30971C8 PRIMARY KEY (StudentID)
