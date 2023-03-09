USE Northwind
-- LÍ THUYẾT 
-- 1 DATABASE là nơi chứa data (bán hàng, thư viện, qlsv...)
-- DATA được lưu dưới dạng TABLE, tách thành nhiều TABLE (nghệ thuật design db, NF)
-- Dùng lệnh SELECT để xem/in dữ liệu từ TABLE, cũng hiển thị dưới dạng table
-- CÚ PHÁP CHUẨN: SELECT * FROM <Tên -Table>
--                       * đại diện cho việc tui mún lấy all of clomus (cột)
-- CÚ PHÁP MỞ RỘNG
--                 SELECT TÊN CÁC CỘT MUỐN LẤY, CÁCH NHAU BẰNG DẤU PHẨY FROM<TÊN-TABLE>
--                 SELECT COS THỂ DÙNG CÁC HÀM XỬ LÍ CÁC CỘT ĐỂ ĐỘ LẠI THÔNG TIN HIỂN THỊ 
--                 FROM <Tên Table>
--KHI TA SELECT ít cột từ table gốc thì có nguy cơ dữ liệu sẽ bị trùng lại 
--Ko phải ta bị sai, ko phải người thiết kế table và người nhập liệu bị sai 
--Do chúng ta có nhiều info trùng nhau/đặc điểm trùng nhau, nên nếu chỉ tập trùng vào data này 
--trùng nhau chắc chắn sảy ra 
-- 100 triệu dân Việt Nam được quản lí info bao gồm: ID, Tên, DOB, ... Tỉnh thành sinh sống 
--                                                   <>                     63 tỉnh 
--													 <>						63 tỉnh 
-- LỆNH SELCET HỖ TRỢ LOẠI TRỪ TRÙNG NHAU/TRÙNG 100% 
-- SELECT DISTINCT TÊN-CÁC CỘT FROM <Tên-TABLE> 
-------------------------------------------------------

--1.Liệt kê danh sách nhân viên 
SELECT * FROM Employees 
--Phân tích 9 người nhưng chỉ có 4 title. ~~~ 100 triệu dân VN chỉ có 93 tỉnh  
SELECT TitleOfCourtesy FROM Employees  -- 9 danh xưng 
SELECT DISTINCT TitleOfCourtesy FROM Employees  -- Chỉ là 4 danh xưng 

SELECT DISTINCT EmployeeID, TitleOfCourtesy FROM Employees 
--Nếu DISTINCT ĐI KÈM VỚI ID/KEY, NÓ VÔ DỤNG, KEY SAO TRÙNG MÀ LOẠI TRỪ 

--2.In ra thông tin khách hàng 
SELECT * FROM  Customers -- 92 rows 

--3.Có bao nhiêu quốc gia xuất hiện trong thông tin k/h, in ra
SELECT Country FROM Customers --92 rows

SELECT DISTINCT Country FROM Customers -- 22 rows 

