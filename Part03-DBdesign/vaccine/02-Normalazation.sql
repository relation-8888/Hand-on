
--THIẾT KẾ GOM TẤT TRONG 1 TABLE 
--ĐẶC ĐIỂM CHÍNH LÀ CỘT, VALUE CHÍNH LÀ CELL 
--THÔNG TIN CHÍCH NGỪA BAO GỒM: TÊN: AN NGUYỄN, CCCD: 123456789...,
CREATE DATABASE DBDESIGN_VACCINATION 
USE DBDESIGN_VACCINATION 
CREATE TABLE VaccinationV1 
(
	ID char(11) PRIMARY KEY,
	LastName nvarchar(30),
	FistName nvarchar(10),  -- sort heng, FullName là sort họ đấy 
	Phone varchar(11) NOT NULL UNIQUE, --CONSTRAINT, CẤM TRÙNG NHƯNG KO PHẢI LÀ PK
									   --KEY ỨNG VIÊN, CANDIDATE KEY 
	InjectionInfo nvarchar(255)

)
--CÁCH THIẾT KẾ NÀY LƯU TRỮ CÁC MŨI TRÍCH CỦA MÌNH ĐƯỢC KO?? -- ĐƯỢC 
SELECT * FROM VaccinationV1

INSERT INTO VaccinationV1
	   VALUES('00000000001', N'NGUYỄN', N'AN', '090X', N'AZ NGÀY 28.9.2021 ĐH FPT | AZ NGÀY 28.10.2021 BV LÊ VĂN THỊNH, Q.TĐ')
-- PHÂN TÍCH:
-- ƯU: DỄ LƯU TRỮ, SELECT, CÓ NGAY, ĐA TRỊ TỐT CHO VỤ NÀY !!!
-- NHƯỢC : THỐNG KÊ KO ĐƯỢC, ÍT NHẤT ĐI CẮT CHUỖI, CĂNG!!! BỊ CĂNG DO ĐA TRỊ 
	   
--SOLUTION: CẦN QUAN TÂM THỐNG KÊ, TÍNH TOÁN SỐ LIỆU (? MŨI, AZ CÓ BAO NHIÊU NGƯỜI...)
--TÁCH CỘT, TÁCH BẢNG 
CREATE TABLE VaccinationV2 
(
	ID char(11) PRIMARY KEY,
	LastName nvarchar(30),
	FistName nvarchar(10),  -- sort heng, FullName là sort họ đấy 
	Phone varchar(11) NOT NULL UNIQUE, --CONSTRAINT, CẤM TRÙNG NHƯNG KO PHẢI LÀ PK
									   --KEY ỨNG VIÊN, CANDIDATE KEY 
	Dose1 nvarchar(100), --AZ, ASTRA 25.9.2021, ĐH FPT -COMPOSITE (PHỨC HỢP)
	Dose2 nvarchar(100)  --AZ, ASTRA 
)
--PHÂN TÍCH:
--***ƯU: GỌN GÀNG, SELECT GỌN GÀNG LUÔN 
--***NHƯỢC: NULL!!! THÊM MŨI NHẮC 3, 4 HÀNG NĂM THÌ SAO ???
--		   CHỈ VÌ VÀI NGƯỜI, MÀ TA PHẢI CHỪA CHỖ NULL
--		   THỐNG KÊ !!! CỘT COMPOSITE CHƯA CHO MÌNH ĐƯỢC THỐNG KÊ 

-- MULTI VALUED: MỘT CELL CHỨA NHIỀU INFO ĐỘC LẬP BÌNH ĐẲNG VỀ NGỮ NGHĨA 
--               VÍ DỤ: ADDRESS: 1/1 LL, Q1, TP.HCM ; 1/1 MAN THIỆN, TP.TĐ
--							    THƯỜNG CHÚ					TẠM CHÚ 
--               GÓI COMPO, NHIỀU ĐỒ TRONG 1 CELL 
--               ĐỌC: CÓ 2 ĐỊA CHỈ 

--COMPOSITE VALUE CELL: MỘT CELL CHỨA 1 VALUE DUY NHẤT, MỖI CÁI VALUE NÀY GOM NHIỀU MIẾNG NHỎ HƠN 
--						NHIỀU MIẾNG NHỎ HƠN, MỖI MIẾNG CÓ 1 VAI TRÒ RIÊNG 
--						GOM CHUNG LẠI THÀNH 1 THỨ KHÁC 
--                      ADDRESS: 1/1 MAN THIỆN, P5, TP HCM 
--						FULLNAME: HOÀNG NGỌC TRINH -> CẢ: TÊN GỌI ĐẦY ĐỦ
--                                FIRST LAST  MID 

--VÌ SỐ LẦN TRÍCH CÒN CÓ THỂ GIA TĂNG CHO TỪNG NGƯỜI MŨI 2, MŨI NHẮC, MŨI THƯỜNG NIÊN 
--AI TRÍCH NHIỀU THÌ NHIỀU DÒNG, HAY HƠN HẲN 

CREATE TABLE PersonV3
(
	ID char(11) PRIMARY KEY,
	LastName nvarchar(30),
	FistName nvarchar(10),  -- sort heng, FullName là sort họ đấy 
	Phone varchar(11) NOT NULL UNIQUE, --CONSTRAINT, CẤM TRÙNG NHƯNG KO PHẢI LÀ PK
									   --KEY ỨNG VIÊN, CANDIDATE KEY 
)
--COMPOSION GỘP N THÔNG TIN VÀO TRONG 1 CELL, DỄ, NHANH, NHẬP 1 CHUỖI DÀI LÀ XONG
--				 NHƯỢC ĐIỂM: ÉO THỐNG KÊ TỐT, ÉO SORT ĐƯỢC 
--							 FULLNAME SORT LÀM SAO, 
--COMPOSION SẼ TÁCH CỘT, VÌ MÌNH ĐÃ CỐ TRƯỚC ĐÓ GOM N THỨ KHÁC NHAU ĐỂ LÀM RA 1 THỨ KHÁC 
--					TÁCH CỘT TRẢ LẠI ĐÚNG NGỮ NGHĨA CHO TỪNG THẰNG 
 CREATE TABLE VaccinationV3
(
	Dose nvarchar(100),
	PersonID char(11) REFERENCES PersonV3(ID)

)
--PHÂN TÍCH: 
--**ƯU: CHÍCH THÊM NHẤT NÀO THÌ THÊM DÒNG NHÁT ĐÓ, CHẤP 10 MŨI LUÔN ĐỦ CHỖ LƯU, KO ẢNH HƯỞNG NG CHƯA TRÍCH 
--NHƯỢC: THỐNG KÊ ÉO ĐƯỢC
--COMPOSITE TÁCH TIẾP THÀNH CỘT CỘT CỘT CỘT CỘT CỘT, TRRA LẠI ĐÚNG Ý NGHĨA CHO TỪNG MIẾNG 
--INFO NHỎ

CREATE TABLE PersonV4
(
	ID char(11) PRIMARY KEY,
	LastName nvarchar(30),
	FistName nvarchar(10),  -- sort heng, FullName là sort họ đấy 
	Phone varchar(11) NOT NULL UNIQUE, --CONSTRAINT, CẤM TRÙNG NHƯNG KO PHẢI LÀ PK
									   --KEY ỨNG VIÊN, CANDIDATE KEY 
)

 CREATE TABLE VaccinationV4
(
	--Dose nvarchar(100),
	-- TÁCH CỘT THÔI 
	Dose int, --LIỀU TRÍCH SỐ 1 
	InjDate datetime, --giờ trích luôn 
	Vaccine nvarchar(50), --tên vaccine 
	Lot nvarchar(20), -- số lô
	[Location] nvarchar(50), --địa điểm 
	PersonID char(11) REFERENCES PersonV4(ID)
)
INSERT INTO PersonV4 VALUES('0000000001',N'NGUYỄN', N'AN','090X')
INSERT INTO PersonV4 VALUES('0000000002',N'LÊ', N'BINN', '091X')
SELECT * FROM PersonV4

INSERT INTO VaccinationV4
	VALUEs(1, GETDATE(), 'AZ', NULL, NULL,'0000000001')

SELECT * FROM VaccinationV4

--IN RA XANH VÀNG CHO MỖI NGƯỜI 
SELECT * FROM PersonV4 p LEFT JOIN VaccinationV4 v
	     ON p.ID = v.PersonID

SELECT p.ID,p.FistName,COUNT(Dose) AS 'No Doses' 
		 FROM PersonV4 p LEFT JOIN VaccinationV4 v
	     ON p.ID = v.PersonID
		 GROUP BY p.ID,p.FistName

-- ĂN TIỀN XANH ĐỎ 
SELECT p.ID,p.FistName, IIF(COUNT(v.Dose) = 0, 'NOOP', 
						IIF(COUNT(v.Dose)= 1 ,'YELLOW', 'GREEN'))
						AS STATUS 

		 FROM PersonV4 p LEFT JOIN VaccinationV4 v
	     ON p.ID = v.PersonID
		 GROUP BY p.ID,p.FistName


INSERT INTO VaccinationV4
	VALUEs(2, GETDATE(), 'AZ', NULL, NULL,'0000000001')		 

