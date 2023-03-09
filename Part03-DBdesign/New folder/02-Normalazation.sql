
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
SELECT * FROM PersonV4 p RIGHT JOIN VaccinationV4 v
	     ON p.ID = v.PersonID
SELECT * FROM VaccinationV4 v  LEFT JOIN PersonV4 p
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
-----------------------------------------------------------------
-----------------------------------------------------------------
--*PHÂN TÍCH
-- CỘT VACCINE CHO PHÉP GÕ CÁC GIÁ TRỊ TÊN VC 1 CÁCH TỰ DO -> INCONSISTEN 
-- AZ, ASTRA, NGƯỜI SẼ HIỂU LÀ 1 MÁY SẼ HIỂU LÀ NHIỀU 
-- >>> CÓ MÙI CỦA DROPDOWN, MÙI CỦA COMBO BOX, >>>> LOOKUP TABLE 
-- KO CHO GÕ MÀ CHO GỌN TỪ DANH SÁCH CÓ SẴN...
-- THAM CHIẾU TỪ DANH SÁCH CÓ SẴN 
-- VACCINE PHẢI TÁCH THÀNH TABLE CHA, TABLE 1, ĐÁM CON ĐÁM N 
-- PHẢI REFERENCE VỀ 
CREATE TABLE PersonV5
(
	ID char(11) PRIMARY KEY,
	LastName nvarchar(30),
	FistName nvarchar(10),  
	Phone varchar(11) NOT NULL UNIQUE, 
									   
)

INSERT INTO PersonV5 VALUES('0000000001',N'NGUYỄN', N'AN','090X')
INSERT INTO PersonV5 VALUES('0000000002',N'LÊ', N'BINN', '091X')

CREATE TABLE VaccineV5 
(
	VaccineName varchar(50) PRIMARY KEY 
	-- HÃNG SẢN XUẤT
	-- ĐỊA CHỈ 
	-- THÔNG TIN VỀ LÂM SÀN 
)
INSERT INTO VaccineV5 VALUES('AstraZeneca')
INSERT INTO VaccineV5 VALUES('Pfizer')
INSERT INTO VaccineV5 VALUES('Verocell')
INSERT INTO VaccineV5 VALUES('Moderna')

SELECT * FROM VaccineV5
--PRIMARY KEY MÀ LÀ VARCHAR() LÀM CHẠY KO TỐT LÀM GIẢM HIỆU NĂNG CÂU QUERY 
--CHẠY CHẬM. THƯỜNG NGƯỜI TA SẼ CHỌN PK LÀ CON SỐ LÀ TỐT NHẤT, NHÌ LÀ CHAR 
--SẼ GIẢNG RIÊNG 1 BUỔI VỀ PRYMARY KEY (PK,FK,CK,SPK,NK,SRK-AK)
 CREATE TABLE VaccinationV5
(
	SEQ int IDENTITY PRIMARY KEY,  --CỨ TĂNG MÃI MÃI ĐI, 2 TỈ MỐT LẦN TRÍCH 
	Dose int, --LIỀU TRÍCH SỐ 1, 2 có thể lặp lại cho mỗi person, ko thể là PK 
	InjDate datetime, --giờ trích luôn 
	Vaccine varchar(50)  , --tên vaccine KO CHO NHẬP TỰ DO PHẢI THAM CHIẾU 
	Lot nvarchar(20), -- số lô
	[Location] nvarchar(50), --địa điểm LÀ COMPOSITE, TÁCH THÀNH CỘT CITY, QUẬN, HUYỆN 
							 --LẠI LÀ LOOKUP NẾU MUỐN, ĐỂ KO GÕ LẠI LUNG TUNG, THỐNG KÊ QUẬN HUYỆN 
	PersonID char(11) REFERENCES PersonV5(ID),
	FOREIGN KEY (Vaccine) REFERENCES VaccineV5(VaccineName),
	--CONSTRAINT FK_VCN_VC FOREIGN KEY (Vaccine) REFERENCES VaccineV5(VaccineName)
)

INSERT INTO VaccinationV5
	VALUEs(1, GETDATE(), 'AstraZeneca', NULL, NULL,'0000000001') --OK
INSERT INTO VaccinationV5
	VALUEs(2, '2022-12-20', 'AstraZeneca', NULL, NULL,'0000000001') --OK
INSERT INTO VaccinationV5
	VALUEs(3, '2022-12-20', 'Ast', NULL, NULL,'0000000001') --THÂT BẠI
	--KO CÓ LOẠI VACCINE GÕ TAY AST 
	--SEQ TĂNG MẸ NÓ THÀNH SỐ 3 VÀ BỊ THẤT BẠI!!!
INSERT INTO VaccinationV5
	VALUEs(1, '2022-12-20', 'Verocell', NULL, NULL,'0000000002')


SELECT * FROM VaccineV5
SELECT * FROM PersonV5
SELECT * FROM VaccinationV5
--THỐNG KÊ THOẢI MÁI LUÔN 
--1. CÓ BAO NHIÊU MŨI VACCINE AZ ĐÃ ĐƯỢC TRÍCH 
SELECT COUNT(*) FROM VaccinationV5
		WHERE Vaccine = 'AstraZeneca'
--2.NGÀY X CÓ BAO NHIÊU MŨI ĐƯỢC TRÍCH 
--OUTPUT: NGÀY, TỔNG SỐ MŨI ĐÃ TRÍCH 
SELECT COUNT(Dose) FROM VaccinationV5 
				WHERE InjDate = '2023-03-08 17:50:01.250'
		
--3. THỐNG KÊ MŨI TRÍCH CỦA MỖI CÁ NHÂN
--OUTPUT: CCCD, TÊN(FULLNAME), DI ĐỘNG, SỐ MŨI ĐÃ TRÍCH(0,1,2)
SELECT p.ID,(p.FistName + p.LastName)AS [FULLNAME],p.Phone,
		COUNT(Dose)  FROM PersonV5 p JOIN VaccinationV5 v
		ON p.ID = v.PersonID
		GROUP BY p.ID,(p.FistName + p.LastName),p.Phone

--4. IN RA THÔNG TIN TRÍCH CỦA MỖI CÁ NHÂN 
--OUTPUT: CCCD, TÊN(FULLNAME), DI ĐỘNG, SỐ MŨI ĐÃ TRÍCH(0,1,2), MÀU SẮC 
SELECT p.ID,(p.FistName + p.LastName) AS [FULLNAME],p.Phone,
		IIF(COUNT(Dose) = 0, 'NOOP',
		IIF(COUNT(DOSE) = 1, 'YELOW','BLUE'))
		AS STATUS
		FROM PersonV5 p LEFT JOIN VaccinationV5 v
		ON p.ID = v.PersonID
		GROUP BY p.ID,(p.FistName + p.LastName),p.Phone


--5. CÓ BAO NHIÊU MŨI ĐÃ TRÍCH ÍT NHẤT 1 VACCINE 
SELECT COUNT(Dose) FROM PersonV5 p JOIN VaccinationV5 v
		 ON p.ID = v.PersonID
		 WHERE Dose >= 1
--6.NHỮNG CÔNG DÂN CHƯA TRÍCH VACCINE MŨI NÀO CẢ
--OUTPUT: CCCD, TÊN

--7.CCCD X ĐÃ TRÍCH NHỮNG MŨI NÀO 
--OUTPUT:CCCD, TÊN, THÔNG TIN TRÍCH (IN GỘP + CHUỖI, TÁI NHẬP COMPOSITE)

--8.THỐNG KÊ SỐ MŨI VACCINE ĐÃ TRÍCH CỦA MỖI LOẠI VACCINE 
SELECT * FROM VaccinationV5 --AZ,VERCEL THIẾU MẤT....
SELECT * FROM VaccineV5 v INNER JOIN --chả khác câu trên , join = 
			  VaccinationV5 vc
			  ON v.VaccineName = vc.Vaccine
SELECT * FROM VaccineV5 v LEFT JOIN 
			  VaccinationV5 vc
			  ON v.VaccineName = vc.Vaccine
SELECT * FROM VaccineV5 v RIGHT JOIN 
			  VaccinationV5 vc
			  ON v.VaccineName = vc.Vaccine

SELECT v.VaccineName,COUNT(vc.Vaccine) FROM VaccineV5 v LEFT JOIN 
			  VaccinationV5 vc
			   ON v.VaccineName = vc.Vaccine
			   GROUP BY v.VaccineName

-- CHÔT HẠ: TÁCH ĐA TRỊ HAY COMPOSITE DỰA TRÊN NHU CẦU THỐNG KÊ 
--          NẾU CÓ CỦA DỮ LIỆU TA LƯU TRỮ!!!
--          GOM BẢNG -> TÌM ĐA TRỊ, COMPOSITE, TÌM LOOKUP TÁCH THEO 
--                     NHU CẦU !!!


