﻿-- CAU 1
CREATE DATABASE QLHANG
GO
USE QLHANG
GO

CREATE TABLE VATTU(
    MAVT varchar(10) PRIMARY KEY, 
    TENVT nvarchar(50),
    DVTINH nvarchar(50),
    SLCON INT
);

CREATE TABLE HDBAN(
    MAHD varchar(10) PRIMARY KEY, 
    NGAYXUAT DATE,
    HOTENKHACH nvarchar(50)
);

CREATE TABLE HANGXUAT(
    MAHD varchar(10),
    MAVT varchar(10),
    DONGIA INT,
    SLBAN INT,
    CONSTRAINT HANGXUAT_PK PRIMARY KEY (MAHD, MAVT)
);

ALTER TABLE HANGXUAT ADD CONSTRAINT FK_HANGXUAT_HDBAN
FOREIGN KEY (MAHD) REFERENCES HDBAN (MAHD);
ALTER TABLE HANGXUAT ADD CONSTRAINT FK_HANGXUAT_VATTU
FOREIGN KEY (MAVT) REFERENCES VATTU (MAVT);

INSERT INTO VATTU VALUES
('VT01', 'GACH', 'VIEN', 100000),
('VT02', 'XI-MANG', 'BAO', 3000);

INSERT INTO HDBAN VALUES
('HD01', '2023-10-6', 'adu vjpp'),
('HD02', '2020-17-15', 'allahu akabar');

INSERT INTO HANGXUAT VALUES
('HD01', 'VT01', 7000, 500),
('HD01', 'VT02', 35000, 30),
('HD02', 'VT01', 7200, 100),
('HD02', 'VT02', 38000, 40);


-- CAU 2
SELECT TOP 1
MAHD, SUM(SLBAN * DONGIA) AS N'Tổng Tiền'
FROM HANGXUAT
GROUP BY MAHD
ORDER BY SUM(SLBAN * DONGIA) Desc;

-- CAU 3
CREATE FUNCTION  (
    @MAHD varchar(10)
)
RETURNS TABLE
AS
RETURN
    SELECT 
        HX.MAHD,
        HD.NGAYXUAT,
        HD.MAVT,
        HX.DONGIA,
        HX.SLBAN,  
        CASE
            WHEN WEEKDAY(HD.NGAYXUAT) = 0 THEN N'Thứ hai'            
            WHEN WEEKDAY(HD.NGAYXUAT) = 1 THEN N'Thứ ba'
            WHEN WEEKDAY(HD.NGAYXUAT) = 2 THEN N'Thứ tư'
            WHEN WEEKDAY(HD.NGAYXUAT) = 3 THEN N'Thứ năm'
            WHEN WEEKDAY(HD.NGAYXUAT) = 4 THEN N'Thứ sáu'
            WHEN WEEKDAY(HD.NGAYXUAT) = 5 THEN N'Thứ bảy'
            ELSE N'Chủ nhật'
        END AS NGAYTHU
    FROM HANGXUAT HX
    INNER JOIN HDBAN HD ON HX.MAHD = HD.MAHD
    WHERE HX.MAHD = @MAHD;

-- CAU 4
CREATE PROCEDURE 
@thang int, @nam int 
AS
SELECT 
SUM(SLBAN * DONGIA)
FROM HANGXUAT HX
INNER JOIN HDBAN HD ON HX.MAHD = HD.MAHD
where MONTH(HD.NGAYXUAT) = @THANG AND YEAR(HD.NGAYXUAT) = @NAM;
