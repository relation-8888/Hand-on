
CREATE DATABASE  DBDESIGN_ONEMN 
USE DBDESGIN_ONEMN 

--TABLE 1 TẠO TRƯỚC, TABLE N TẠO SAO 
CREATE TABLE MajorV1 
(
	MajorID char(2) PRIMARY KEY, --MẶC ĐỊNH DB	EN SẼ TỰ TẠO TÊN RÀNG BUỘC 
	MajorName nvarchar(40) NOT NULL
	--....

)

-- CHÈN DATA - MUA QUẦN ÁO BỎ VÔ CÁI TỦ 
INSERT INTO MajorV1 VALUES('SE', N'Kĩ thuật phần mềm')
INSERT INTO MajorV1 VALUES('IA', N'An toàn thông tin')

DROP TABLE StudentV1
CREATE TABLE StudentV1
(
	StudentID char(8) NOT NULL, 
	LastName nvarchar(40) NOT NULL, 
	FirstName nvarchar(10) NOT NULL, 
	DOB datetime,
	Address nvarchar(50) NULL,

	MajorID char(2)   --tên cột khóa ngoại ko cần trùng bên 1 key 
				  -- bắt buộc phải trùng 100% kiểu dữ liệu, cần tham chiếu data thôi 


	CONSTRAINT PK_STUDENTSV1 PRIMARY KEY (StudentID)
)

--CHÈN DATA SINH VIÊN
SELECT * FROM MajorV1
SELECT * FROM StudentV1
INSERT INTO StudentV1 VALUES('SE1', N'NGUYỄN', N'AN', NULL, NULL, 'SE')

-- THIẾT KẾ TRÊN SAI VÌ KO CÓ THAM CHIẾU GIỮA 2 CỘT MAJORID CỦA STUDENT VS. MAJORID PHÍA TRÊN
INSERT INTO StudentV1 VALUES('SE2', N'LÊ', N'BÌNH', NULL, NULL, 'AH')

CREATE TABLE MajorV2 
(
	MajorID char(2) PRIMARY KEY, --MẶC ĐỊNH DB	EN SẼ TỰ TẠO TÊN RÀNG BUỘC 
	MajorName nvarchar(40) NOT NULL
	--....

)

DROP TABLE MAJORV2 
DROP TABLE StudentV2
CREATE TABLE StudentV2
(
	StudentID char(8) PRIMARY KEY, 
	LastName nvarchar(40) NOT NULL, 
	FirstName nvarchar(10) NOT NULL, 
	DOB datetime,
	Address nvarchar(50) NULL,

	--MajorID char(2)   REFERENCES MajorV2(MajorID)
	MajorID char(2) FOREIGN KEY REFERENCES MajorV2(MajorID)
	--TỚ CHỌN CHUYÊN NGHÀNH Ở TRÊN KIA KÌA, XIN THAM CHIẾU Ở TRÊN KIA 

)
INSERT INTO MajorV2 VALUES('SE', N'Kĩ thuật phần mềm')
INSERT INTO MajorV2 VALUES('IA', N'An toàn thông tin')

INSERT INTO StudentV2 VALUES('SE1', N'NGUYỄN', N'AN', NULL, NULL, 'SE')

-- THIẾT KẾ TRÊN SAI VÌ KO CÓ THAM CHIẾU GIỮA 2 CỘT MAJORID CỦA STUDENT VS. MAJORID PHÍA TRÊN
INSERT INTO StudentV2 VALUES('SE2', N'LÊ', N'BÌNH', NULL, NULL, 'gd')

SELECT * FROM MajorV2
SELECT * FROM StudentV2

--KO ĐC XÓA TABLE 1 NẾU NÓ ĐNAG ĐƯỢC THAM CHIẾU BỞI THẰNG KHÁC 
--NẾU CÓ MỐI QUAN HỆ 1-N, XÓA N TRƯỚC RỒI XÓA 1 SAU 

-----------------------------------------------------------------
CREATE TABLE MajorV3 
(
	MajorID char(2) PRIMARY KEY, --MẶC ĐỊNH DB	EN SẼ TỰ TẠO TÊN RÀNG BUỘC 
	MajorName nvarchar(40) NOT NULL
	--....

)
DROP TABLE StudentV3 
/*
CREATE TABLE StudentV3
(
	StudentID char(8) PRIMARY KEY, 
	LastName nvarchar(40) NOT NULL, 
	FirstName nvarchar(10) NOT NULL, 
	DOB datetime,
	Address nvarchar(50) NULL,

	MajorID char(2),
	CONSTRAINT FK_StudentV3_MajorV3  
	FOREIGN KEY(MajorID) REFERENCES MajorV3(MajorID)
	--TỚ CHỌN CHUYÊN NGHÀNH Ở TRÊN KIA KÌA, XIN THAM CHIẾU Ở TRÊN KIA 
)
*/

CREATE TABLE StudentV3
(
	StudentID char(8) PRIMARY KEY, 
	LastName nvarchar(40) NOT NULL, 
	FirstName nvarchar(10) NOT NULL, 
	DOB datetime,
	Address nvarchar(50) NULL,

	MajorID char(2) DEFAULT 'SE',
	CONSTRAINT FK_StudentV3_MajorV3  
				FOREIGN KEY(MajorID) REFERENCES MajorV3(MajorID)
				ON DELETE SET DEFAULT
				ON UPDATE CASCADE 
)
--CHO SV KO CHỌN CHUYÊN NGHÀNH HẮN HỌC GÌ???
INSERT INTO StudentV3(StudentID,LastName,FirstName)
				VALUES('SE2', N'PHẠM', N'BÌNH')

--ALTER TABLE STUDENTV3 ADD CONSTRAINT...Ở TRÊN 

--TA CÓ QUYỀN GỠ 1 RÀNG BUỘC ĐÃ THIẾT LẬP !!!

ALTER TABLE StudentV3 DROP CONSTRAINT FK_StudentV3_MajorV3

--BỔ SUNG LẠI 1 RÀNG BUỘC KHÁC 
ALTER TABLE StudentV3 ADD CONSTRAINT FK_StudentV3_MajorV3 
			FOREIGN KEY(MajorID) REFERENCES MajorV3(MajorID)

SELECT * FROM MajorV3 --rỗng
SELECT * FROM StudentV3 --rỗng

--INSERT LÀ CHẾT, DO THAM CHIẾU KO TỒN TẠI 
INSERT INTO StudentV3 VALUES('SE1', N'NGUYỄN', N'AN', NULL, NULL, 'SE')

INSERT INTO MajorV3 VALUES('SE', N'Kĩ thuật phần mềm')

INSERT INTO MajorV3 VALUES('AH', N'Ahihi Đồ Ngok')

INSERT INTO StudentV3 VALUES('AH1', N'LÊ', N'VUI VẺ', NULL, NULL, 'AH')

-- THAO TÁC MẠNH TAY TRÊN DATA/MÓN ĐỒ QUẦN ÁO TRONG TỦ -DML (UPDATE & DELETE)
DELETE FROM StudentV3 -- CỰC KÌ NGUYEN HIỂM KHI THIẾU WHERE, XÓA HẾT DATA !!!

DELETE FROM StudentV3 WHERE StudentID = 'AH1'

DELETE FROM MajorV3 WHERE MajorID = 'AH'

SELECT * FROM MajorV3 
SELECT * FROM StudentV3 

-- GÀI THÊM HÀNH XỬ KHI XÓA, SỬA DATA Ở RÀNG BUỘC KHÓA NGOẠI/DÍNH ĐẾN KHÓA CHÍNH 
-- HIỆU ỨNG DOMINO, SỤP ĐỔ DAY TRUYỀN, 1 XÓA, N ĐI SẠCH >>> CASCADE DELETE, 
--                                     1 SỬA , N BỊ SỬA THEO >>>>CASCADE UPDATE

--NGAY LÚC DESGIN TABLE/CREATE TABLE ĐÃ PHẢI TÍNH VỤ NÀY RỒI 
-- VẪN CÓ THỂ SỬA SAU NÀY KHI ĐÃ CÓ DATA, CÓ THỂ CÓ TROBLE 
-- CỤM LỆNH: CREATE / ALTER / DROP 
ALTER TABLE StudentV3 DROP CONSTRAINT FK_StudentV3_MajorV3  --XÓA RB KHÓA NGOẠI BỊ
--THIẾU VIỆC GÀI THÊM RULE NHỎ, LIÊN QUAN ĐẾN XÓA SỬA DATA 

ALTER TABLE StudentV3 ADD CONSTRAINT FK_StudentV3_MajorV3 
			FOREIGN KEY(MajorID) REFERENCES MajorV3(MajorID)
			ON DELETE CASCADE 
			ON UPDATE CASCADE 

-- UPDATE DML, MẠNH MẼ SỬA DATA ĐANG CÓ 
UPDATE MajorV3 SET MajorID = 'AK' --CẨN THẬN NẾU KO CÓ WHERE, TOÀN BỘ TABLE ẢNH HƯỞNG 
								  --TRỪ UPDATE CỘT KEY 
UPDATE MajorV3 SET MajorID = 'AK' WHERE MajorID = 'AH'

SELECT * FROM MajorV3 
SELECT * FROM StudentV3 

--SỤP ĐỔ, XÓA 1, N ĐI SẠCH SẼ 
--XÓA CHUYÊN NGHÀNH AHIHI, XEM SAO CÒN CHUYÊN NGHÀNH NÀO KO 
DELETE FROM MajorV3 WHERE MajorID = 'AK' --SV AH1 LÊN ĐƯỜNG LUÔN 

--CÒN 2 CÁI GÀI NỮA LIÊN QUAN ĐẾN KHÓA NGOẠI TÍNH ĐỒNG BỘ NHẤT QUÁN DATA/CONSISTENCY 
-- SET NULL VÀ DEFAULT
-- KHI 1 BỊ XÓA, N VỀ NULL 
-- KHI 1 XÓA, N VỀ DEFAULT 

--***XÓA BÊN 1 TỨC LÀ MÁT BÊN 1, KO LẼ SỤP ĐỔ CẢ ĐÁM N, KO HAY, NÊN CHỌN ĐƯA N VỀ NULL
-- UPDATE BÊN 1, BÊN 1 VẪN CÒN GIỮ DÒNG/ROW, BÊN N NÊN ĐỒNG BỘ THEO, ĂN THEO, CASCADE 

ALTER TABLE StudentV3 DROP CONSTRAINT FK_StudentV3_MajorV3

--BỔ SUNG LẠI 1 RÀNG BUỘC KHÁC 
ALTER TABLE StudentV3 ADD CONSTRAINT FK_StudentV3_MajorV3 
			FOREIGN KEY(MajorID) REFERENCES MajorV3(MajorID)
			ON DELETE SET NULL	-- XÓA CHO VỀ NULL 
			ON UPDATE SET NULL  --SỬA BỊ ẢNH HƯỞNG DÂY TRUYỀN

--CHO SV BƠ VƠ CHUYÊN NGHÀNH VỀ HỌC SE
UPDATE StudentV3 SET MajorID = 'SE' -- TOÀN TRƯỜNG HỌC SE ĐẤY TOANG
UPDATE StudentV3 SET MajorID = 'SE' 
				 WHERE StudentID = 'AH1' --ĐÚNG

UPDATE StudentV3 SET MajorID = 'SE' 
				 WHERE MajorID IS NULL 