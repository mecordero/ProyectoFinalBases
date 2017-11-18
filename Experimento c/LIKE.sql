
--Ordenes con cierta fecha y cierto país

--parametros
DECLARE @pais char(2)
DECLARE @fecha date

SET @pais = 'CR'
SET @fecha = '2017-10-10'


--codigo
DECLARE @anho char(2)
SET @anho = Right(YEAR(@fecha),2)

DECLARE @mes char(1)
SET @mes = CHAR(MONTH(@fecha)+64)

DECLARE @dia char(2)
SET @dia = RIGHT(CONCAT('0',CONVERT(char(2),DAY(@fecha))),2)

DECLARE @lote nchar(10)
set @lote = CONCAT(@pais, @anho, @mes, @dia)

select *
from orden o
where o.lote like CONCAT(RTRIM(@lote) ,'%')