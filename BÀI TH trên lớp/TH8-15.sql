----//I//B�i 8///----
SELECT KHACHHANG.MAKH ,HOTEN 
FROM KHACHHANG,HOADON 
WHERE KHACHHANG.MAKH=HOADON.MAKH AND HOADON.NGHD ='2011/1/1'
-----//I//B�i 9 //----
SELECT SOHD,TRIGIA 
FROM HOADON,NHANVIEN 
WHERE NHANVIEN.MANV=HOADON.MANV  AND NHANVIEN.HOTEN='LE VAN LUYEN ' AND HOADON.NGHD='2012/7/18'
----//I//B�i 10///----
SELECT SP.MASP,SP.TENSP 
FROM SANPHAM SP,HOADON HD,CTHD CT,KHACHHANG KH 
WHERE SP.MASP=CT.MASP AND CT.SOHD=HD.SOHD AND HD.MAKH=KH.MAKH AND KH.HOTEN='lE QUANG MINH ' AND YEAR(HD.NGHD)=2010 AND MONTH(HD.NGHD)=10
----//I//B�i 11////----
SELECT SOHD 
FROM CTHD WHERE MASP IN ('BB01', 'BB02')
---////I//B�i 12///----
SELECT SOHD FROM CTHD 
WHERE (MASP ='BB01' or MASP= 'BB02') and SL between 20  and 30
--//I//B�i 13///----
SELECT SOHD FROM CTHD 
WHERE (MASP ='BB01' AND MASP= 'BB02') and SL between 20 and 30
--//I//B�i 15////-----
SELECT SANPHAM.MASP,SANPHAM.TENSP 
FROM SANPHAM,HOADON,CTHD 
WHERE SANPHAM.NUOCSX='TRUNG QUOC' AND CTHD.SOHD=HOADON.SOHD OR HOADON.NGHD='2013/1/4'
--//I//B�i 15///----
SELECT SANPHAM.MASP,SANPHAM.TENSP
FROM SANPHAM 
WHERE SANPHAM.MASP  NOT IN (SELECT CTHD.MASP FROM CTHD)