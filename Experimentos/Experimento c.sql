
--HAVING
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

--LIKE
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

--TRIGGER
-- Borrar Flujo_Proceso de Predecesoras si se borra de Flujo_Proceso

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER BorrarDePredecesoras
   ON  FLUJO_PROCESO
   INSTEAD OF DELETE
AS 
BEGIN
	SET NOCOUNT ON;

    DECLARE @borrado int
	SET @borrado = 
	(SELECT d.id_flujo_proceso
	FROM deleted d)
	
	DELETE 
	FROM PREDECESORA
	WHERE id_actual = @borrado or id_anterior = @borrado	 

	DELETE 
	FROM FLUJO_PROCESO
	WHERE id_flujo_proceso = @borrado

END
GO

--UNION
--Union de actividades y ad hoc

SELECT 'Actividad' as Tipo,a.nombre, a.codigo, a.descripcion, a.tipo_firma, a.rol_seguridad
FROM ACTIVIDAD a
UNION
SELECT 'Adhoc',ah.nombre, ah.codigo, ah.descripcion, ah.tipo_firma, ah.rol_seguridad
FROM AD_HOC ah