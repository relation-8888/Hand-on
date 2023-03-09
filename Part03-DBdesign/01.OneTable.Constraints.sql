-- PHẦN NÀY DÍNH ĐẾN CÁC RÀNG BUỘC - CONSTRAINTS - QUY TẮC GÀI TRÊN DATA

--1. RÀNG BUỘC PRIMYRY KEY 
--  TẠM THỜI CHẤP NHẬN PK LÀ 1 CỘT (TƯƠNG LAI CÓ THỂ NHIỀU CỘT) MÀ GIÁ TRỊ CỦA NÓ 
--TRÊN MỌI DÒNG/MỌI CELL CỦA CỘT NÀY KO TRÙNG LẠI, MỤC ĐÍCH WHERE RA
--1 DÒNG DUY NHẤT 
-- VALUE CỦA KEY CÓ THỂ TẠO RA THEO 2 CACHS 
-- CÁCH 1: TỰ NHẬP BẰNG TAY, DB EN SẼ TỰ KIỂM TRA DÙM MÌNH CÓ TRÙNG KO ??
--          NẾU TRÙNG DB EN TỰ BÁO VI PHẠM PK CONSTRAINT - HỌC RỒI UI/UX 

-- CÁCH 2: ÉO CẦN NHẬP BẰNG TAY CÁI VALUE CỦA PK, MÁY/DB EN TỰ GENERATE 
--		   MÌNH 1 CON SỐ TRÙNG LẠI !!!! CON SỐ TỰ TĂNG, SỐ HEXA....

-- THỰC HÀNH THỬ 
-- THIẾT KẾ TABLE LƯU THÔNG TIN ĐĂNG KÍ ENVENT NÀO ĐÓ (GIỐNG DKY QUA GG FROM)
-- THÔNG TIN CẦN LƯU TRỮ: STT ĐĂNG KÍ, TÊN FULLNAME, EMAIL, NGÀY GIỜ DKY
-- SỐ DI ĐỘNG .....
-- *PHÂN TÍCH:
-- NGÀY GIỜ DKY KO BẮT NHẬP, DEFAULT 
-- SỐ THỨ TỰ: NHẬP VÀO LÀ BẬY RỒI !!! TỰ GÁN !!!
-- EMAIL, PHONE: KO CHO TRÙNG HENG, 1 EMAIL 1 LẦN DKY 
-- ......
USE DBDESGIN_ONETABLE
/*
CREATE TABLE Registration 
(
	SEQ int PRIMARY KEY, -- PHẢI NHẬP SỐ THỨ TỰ, VỚ VẨN 
	FirstName nvarchar(10),
	LastName nvarchar(40),
	Email varchar(50), -- CẤM TRÙNG TÍNH SAU 
	Phone varchar(11),
	RegDate datetime DEFAULT GETDATE() -- CONSTRAINT DEFAULT 

)
*/

CREATE TABLE Registration 
(
	SEQ int PRIMARY KEY IDENTITY, -- PHẢI NHẬP SỐ THỨ TỰ, VỚ VẨN 
								  -- MẶC ĐỊNH ĐI TỪ 1, NHẢY ++ CHO NG SAU 
								  -- GHI RÕ IDENTITY(1, 1)
								  -- (1, 5), TỪ 1, 6, 11,...
	FirstName nvarchar(10),
	LastName nvarchar(40),
	Email varchar(50), -- CẤM TRÙNG TÍNH SAU 
	Phone varchar(11),
	RegDate datetime DEFAULT GETDATE() -- CONSTRAINT DEFAULT 

)

--DKY EVENT
INSERT INTO Registration VALUES(N'AN', N'Nguyễn', 'an@...', '090x') 
--BÁO LỖI MAP ĐƯỢC CÁI CỘT RÕ RÀNG 

INSERT INTO Registration VALUES(N'AN', N'Nguyễn', 'an@...', '090x', NULL) 

SELECT * FROM Registration


INSERT INTO Registration(FirstName, LastName, Email,Phone)
				VALUES(N'Bình', N'Lê', 'binh@...', '091x') 

-- XÓA 1 DÒNG CÓ AUTO GENERATED KEY, THÌ TABLE LỦNG SỐ, DB EN KO LẤP CHỖ ĐỦ 
-- 1 2 3 4 5 6, XÓA 3, CÒN 1 2 4 5 6, DKY TIẾP TÍNH TỪ 7 
-- 