
-- Dias con más de n ordenes en un periodo de tiempo

--parametros
DECLARE @minimo int
SET @minimo = 800

DECLARE @fechaInicio date
SET @fechaInicio = '2017-11-09'

DECLARE @fechaFin date
SET @fechaFin = '2017-11-18'


--codigo
SELECT o.fecha_creacion, count(*)
FROM ORDEN o
WHERE o.fecha_creacion between @fechaInicio and @fechaFin
GROUP BY o.fecha_creacion
HAVING count(*) >= @minimo