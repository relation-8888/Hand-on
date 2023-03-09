USE Northwind 
-------------------------------------------------------------------------------------
-- LÍ THUYẾT 
-- CÚ PHÁP MỞ RỘNG LỆNH SELECT
-- TRONG THỰC TẾ CÓ NHỮNG LÚC DỮ LIỆU/INFO CHƯA XÁC ĐINH ĐƯỢC NÓ LÀ GÌ??
-- KÍ TÊN DANH SÁCH THI, DANH SÁCH KÍ TÊN CÓ CỘT ĐIỂM, ĐIỂM NGAY LÚC KÍ TÊN CHƯA XÁC ĐỊNH ĐƯỢC 
-- TỪ TỪ SẼ CÓ, SẼ UPDATE SAU 
--HIỆN TƯỢNG CHƯA BIẾT, CHƯA XÁC ĐỊNH TỪ TỪ ĐƯA VÀO SAU, HIỆN NHÌN VÀO CHƯA THẤY CÓ DATA 
--THÌ TA GỌI GIÁ TRỊ CHƯA XÁC ĐỊNH NÀY LÀ NULL 
-- NULL ĐẠI DIỆN CHO THỨ CHƯA XÁC ĐỊNH, CHƯA XĐ TỨC LÀ KO CÓ GIÁ TRỊ, 
--KO THỂ SO SÁNH > >= < <= = != 
-- CẤM TUYỆT ĐỐI XÀI TOÁN TỬ SO SÁNH KÈM VỚI GIÁ TRỊ NULL 
-- TA DÙNG TOÁN TỬ, IS NULL, IS NOT NULL, NOT (IS NULL) ĐỂ FILTER CELL CÓ 
--GIÁ TRỊ NULL
-------------------------------------------------------------------------------------

--THỰC HÀNH: 
--1.IN RA DANH SÁCH NHÂN VIÊN
SELECT * FROM Employees 

--2.AI CHƯA XÁC ĐỊNH KHU VỰC 
SELECT * FROM Employees WHERE Region = 'NULL' --0, VÌ KO CÓ AI TÊN LÀ NULL 
SELECT * FROM Employees WHERE Region IS NULL  --4

--3.NHỮNG AI ĐÃ ĐƯỢC XÁC ĐỊNH KHU VỰC CU TRÚ
SELECT * FROM Employees WHERE Region IS NOT NULL   --5
SELECT * FROM Employees WHERE NOT Region IS NULL  -- NOT PHẢI ĐI KÈM VỚI MỆNH ĐỀ 

--4.NHỮNG NHÂN VIÊN ĐÃ XÁC ĐỊNH ĐỊA DIỆN KINH DOANH VÀ XÁC ĐỊNH ĐƯỢC NƠI CƯ TRÚ
SELECT * FROM Employees WHERE  NOT Region IS NULL AND NOT Title IS NULL 