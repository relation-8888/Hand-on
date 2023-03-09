USE Cartesian

SELECT * FROM VnDict, EnDict --tích đề các 

SELECT * FROM VnDict CROSS JOIN  EnDict --tích đề các

SELECT * FROM VnDict , EnDict			--TÍCH ĐỀ CÁC XONG, FILTER LẠI 
		 WHERE vn.Nmbr = en.Nmbr 

SELECT * FROM VnDict vn, EnDict en
		 WHERE Nmbr = Nmbr  --BỐI RỐI TÊN 

SELECT * FROM VnDict , EnDict 
		 WHERE VnDict.Nmbr = EnDict.Nmbr  --Nên đặt ALIAS THÌ DỄ ĐỌC HƠN NGẮN GỌN LỆNH

--CHUẨN THẾ GIỚI 
SELECT * FROM VnDict INNER JOIN EnDict    --NHÌN SÂU TABLE GHÉP, KO GHÉP BỪA BÃI 
					ON VnDict.Nmbr = EnDict.Nmbr  -- GHÉP CÓ TƯƠNG QUAN BÊN TRONG, THEO ĐIỂM TRONG 

SELECT * FROM VnDict JOIN EnDict    --NHÌN SÂU TABLE GHÉP, KO GHÉP BỪA BÃI 
					ON VnDict.Nmbr = EnDict.Nmbr

-- CÓ THỂ DÙNG THÊM WHERE ĐƯỢC HAY KHÔNG ?? KHI XÀI INNER, JOIN 
-- JOIN CHỈ LÀ THÊM DATA ĐỂ TÍNH TOÁN, GỘP DATA LẠI NHIỀU HƠN, SAU ĐÓ ÁP DỤNG 
-- KIẾN THỨC SELECT ĐÃ HỌC

--THÍ NGHIÊM THÊM INNER JOIN, GHÉP NGANG CÓ XEM XÉT MÔN ĐĂNG HẬU ĐỐI HAY KO
SELECT * FROM EnDict
SELECT * FROM VnDict

SELECT * FROM EnDict e, VnDict v
		 WHERE e.Nmbr = v.Nmbr

SELECT * FROM EnDict e, VnDict v
		 WHERE e.Nmbr > v.Nmbr     -- GHÉP CÓ TRỌN LỌC, KO XÀI DẤU =
								   -- MÀ DÙNG DẤU > >= < <= != 
								   -- NON-EQUI JOIN 
								   -- VẪN KO LÀ GHÉP BỪA BÃI 

--2Two 1Mot
--3Three 1Mot
--3Three 2Hai 

SELECT * FROM EnDict e, VnDict v   -- thực dụng 
		 WHERE e.Nmbr != v.Nmbr 

SELECT * FROM EnDict e JOIN  VnDict v   -- chuẩn mực 
		 ON e.Nmbr != v.Nmbr
		 