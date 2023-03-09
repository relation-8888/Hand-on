USE Cartesian

--1. LIỆT KÊ CHO TÔI CÁC CẶP TỪ ĐIỂN TIẾNG ANH - VIỆT 
SELECT * FROM EnDict e, VnDict v
		 WHERE e.Nmbr = v.Nmbr
		-- Có bằng CELL THÌ MỚI GÉP 
SELECT * FROM EnDict e JOIN VnDict v
		 ON e.Nmbr = v.Nmbr
		 --HÃY GÉP ĐI, TRÊN CỘT NÀY CÓ CELL/VALUE BẰNG CELL KIA 
SELECT * FROM EnDict e INNER JOIN VnDict v
		 ON e.Nmbr = v.Nmbr
--3 CÂU TƯƠNG ĐƯƠNG 

--2. HỤT MẤT CỦA TÔI 4 -FOUR VÀ 5 NĂM KO THẤY XUẤT HIỆN !!!
-- MUỐN XUÁT HIỆN 4FOUR VÀ 5NĂM THÌ TÍCH ĐỀ CÁC 
SELECT * FROM EnDict e, VnDict v

SELECT * FROM EnDict 
SELECT * FROM VnDict 

--3. TÔI MUỐN XUẤT HIỆN LẤY TIẾNG ANH LÀM CHUẨN, TÌM CÁC NGHĨA TIẾNG VIỆT TƯƠNG ĐƯƠNG 
-- NẾU KO CÓ TƯƠNG ĐƯƠNG VẪN PHẢI HIỆN RA 

SELECT * FROM EnDict e LEFT JOIN VnDict v
		 ON e.Nmbr = v.Nmbr

SELECT * FROM EnDict e LEFT OUTER JOIN VnDict v
		 ON e.Nmbr = v.Nmbr

--4 TÔI MUỐN LẤY TIẾNG VIỆT LÀM ĐẦU !!!
SELECT * FROM VnDict v LEFT OUTER JOIN EnDict e
		 ON e.Nmbr = v.Nmbr

-- vẫn lấy tiếng việt làm đầu nhưng lại để tv bên tay phải kìa
SELECT * FROM EnDict e RIGHT OUTER JOIN VnDict v
		 ON e.Nmbr = v.Nmbr

--5. DÙ CHUNG VÀ RIÊNG CỦA MỖI BÊN LẤY TẤT CHẤP NHẬN NULL FA Ở 1 VẾ 
SELECT * FROM EnDict e FULL JOIN VnDict v
		 ON e.Nmbr = v.Nmbr
--FULL OUTER JOIN, THỨ TỰ TABLE KO QUAN TRỌNG, VIẾT TRƯỚC SAU KO QUAN TRỌNG 
-- LEFT , RIGHT JOIN THỨ TỰ TABLE LÀ CÓ CHUYỆN 
SELECT * FROM EnDict e LEFT OUTER JOIN VnDict v
		 ON e.Nmbr = v.Nmbr  --SHOW 4NULL

 SELECT * FROM VnDict v  LEFT OUTER JOIN EnDict e
		 ON e.Nmbr = v.Nmbr	 --SHOW 5 NĂM LÀM MỐC 
--OUTER JOIN SINH RA ĐỂ ĐẢM BẢO VIỆC KẾT NỐI DỮ LIỆU GHÉP BẢNG 
--KO BỊ MẤT DATA !!!
-- DO INNER JOIN, JOIN = CHỈ TÌM GIÁ TRỊ CHUNG CỦA 2 VẾ 

--SAU KHI TÌM RA ĐƯỢC DATA CHUNG VÀ RIÊNG, TA VẪN CÓ QUYỀN FILTER TRÊN LOẠI 
--CELL NÀO ĐÓ, WHERE NHƯ BTHG 

--6. IN RA BỘ TỪ ĐIỂN ANH-VIỆT (ANH LÀM MỐC ) CỦA NHỮNG CON SỐ 
--TỪ 3 TRỞ LÊN
SELECT * FROM EnDict e LEFT JOIN VnDict v 
		 ON e.Nmbr = v.Nmbr 
		 WHERE e.Nmbr >= 3

SELECT * FROM EnDict e LEFT JOIN VnDict v 
		 ON e.Nmbr = v.Nmbr 
		 WHERE v.Nmbr >= 3

--7. IN RA BỘ TỪ ĐIỂN ANH-VIỆT VIỆT-ANH  CỦA NHỮNG CON SỐ 
--TỪ 3 TRỞ LÊN

SELECT * FROM EnDict e FULL JOIN VnDict v 
		 ON e.Nmbr = v.Nmbr 
		 WHERE e.Nmbr  >= 3   --TOANG, MẤT MẸ NÓ SỐ 5 CỦA VN 

SELECT * FROM EnDict e FULL JOIN VnDict v 
		 ON e.Nmbr = v.Nmbr 
		 WHERE v.Nmbr  >= 3  -- có 5 mất 4 

SELECT * FROM EnDict e FULL JOIN VnDict v 
		 ON e.Nmbr = v.Nmbr 
		 WHERE e.Nmbr  >= 3 OR v.Nmbr >= 3