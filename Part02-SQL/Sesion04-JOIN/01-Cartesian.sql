USE Cartesian
CREATE DATABASE Cartesian 
--DB ~~ KHO ~~ TỦ ~~ THÙNG CHỨA DATA BÊN TRONG 
-- DATA BÊN TRONG CẤT DƯỚI DẠNG KỆ CÓ NGĂN - TABLE 

CREATE TABLE EnDict				--DDL (một nhánh của SQL)
(								--Data Defintion Language -- ngôn ngữ giúp mk định nhĩa da cấu trúc dl
	Nmbr int,
	EnDesc varchar(30)

)

--DROP TABLE EnDict					--DDL
--Từ điển tiếng Anh số đếm 
--1 One 
--2 Two 
-- Chèn data
SELECT * FROM EnDict				--DML Data Manipulation Language 

INSERT INTO EnDict VALUES(1, 'One')		--DML
INSERT INTO EnDict VALUES(2, 'Two')
INSERT INTO EnDict VALUES(3, 'Three')

-- PHẦN NÀY CHO THÊM OUTER JOIN 
INSERT INTO EnDict VALUES(4, 'Four')


CREATE TABLE VnDict				--DDL (một nhánh của SQL)
(								--Data Defintion Language -- ngôn ngữ giúp mk định nhĩa da cấu trúc dl
	Nmbr int,
	VnDesc Nvarchar(30)			-- Nvarchar() String lưu tiếng Việt 
								-- varchar() String lưu tiếng Anh 
)
--DROP TABLE VnDict

INSERT INTO VnDict VALUES(1, N'Một')		--DML
INSERT INTO VnDict VALUES(2, N'Hai')
INSERT INTO VnDict VALUES(3, N'Ba')
INSERT INTO VnDict VALUES(5, N'Năm')

SELECT * FROM EnDict
SELECT * FROM VnDict
--BÔI ĐEN CẢ 2 LỆNH NÀY CHẠY, THÌ NÓ KO PHẢI LÀ JOIN, NÓ LÀ 2 CÂU RIÊNG BIỆT CHẠY CÙNG LÚC 
-- CHO 2 TẬP KẾT QUẢ RIÊNG BIỆT !!!
-- JOIH LÀ GỘP CHUNG 1 THÀNH 1 BẢNG TẠM TRONG RAM, KO ẢNH HƯỞNG DỮ LIỆU GỐC CỦA MỖI TABLE 
-- JOIH LÀ SELECT CÙNG LÚC NHIỀU TABLE 

SELECT * FROM VnDict, EnDict  -- sinh TABLE MỚI, TẠM THỜI LÚC CHẠY THÔI 
							  -- SỐ CỘT = TỔNG 2 BÊN
							  -- SỐ DÒNG = TÍCH 2 BÊN 
SELECT * FROM VnDict, EnDict  ORDER BY  EnDesc  --KO ĐỤNG TÊN, DÙNG TRỰC TIẾP LUÔN 
SELECT * FROM VnDict, EnDict  ORDER BY	Nmbr	--BỐI RỐI TRÙNG TÊN 
--GHÉP TABLE, JOIH BỊ TRÙNG TÊN CỘT, DÙNG ALIAS (AS), ĐẶT TÊN GIẢ ĐỂ THAM CHIẾU 
--                                   CHỈ ĐỊNH CỘT THUỘC TABLE TRÁNH NHẦM 

SELECT * FROM VnDict, EnDict  ORDER BY	VnDict.Nmbr -- tham chiếu cột qua tên table 
SELECT * FROM VnDict vn, EnDict en  ORDER BY en.Nmbr  --đặt tên giả cho table ngắn table
														 --dùng để tham chiếu cho các cột 

SELECT vn.Nmbr, vn.VnDesc, en.EnDesc FROM VnDict vn, EnDict en  ORDER BY en.Nmbr

SELECT vn.*, en.EnDesc FROM VnDict vn, EnDict en  ORDER BY en.Nmbr
SELECT vn.*, en.* FROM VnDict vn, EnDict en  ORDER BY en.Nmbr

--CÚ PHÁP VIẾT THỨ 2 -- CHUẨN 
SELECT vn.*, en.* FROM VnDict vn CROSS JOIN EnDict  en ORDER BY en.Nmbr

--TUI BIẾT RẰNG CÓ CẶP GHÉP SÀI ĐƯỢC, VÌ CÓ SỰU TƯƠNG HỢP TRONG CELL NÀO ĐÓ, HERE NMBR  

SELECT * FROM VnDict vn , EnDict  en 
		WHERE vn.Nmbr = en.Nmbr      -- rút từ 3x3 = 9, xuống còn 3 
		--GHÉP CÓ CHỌN LỌC KHI TÌM TƯƠNG QUAN CỘT CELL ĐỂ GHÉP 
		-- -> INNER JOIN/OUTER, EQUI JOIM
		-- ĐA PHẦN TƯƠNG GHÉP THEO TOÁN TỬ =
		-- CÒN CÓ THỂ GHÉP THEO > >= < <= != 