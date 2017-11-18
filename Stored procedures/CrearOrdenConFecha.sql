USE [BD_COMPANIA]
GO
/****** Object:  StoredProcedure [dbo].[CrearOrden]    Script Date: 15/11/2017 15:28:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[CrearOrdenConFecha]
	-- Add the parameters for the stored procedure here
	@id_empleado int,
	@id_producto int,
	@id_linea int,
	@pais nchar(2), 
	@fecha date, 
	@id_orden int OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @anho char(2)
	SET @anho = Right(YEAR(@fecha),2)
	DECLARE @mes char(1)
	SET @mes = CHAR(MONTH(@fecha)+64)
	DECLARE @dia char(2)
	SET @dia = RIGHT(CONCAT('00',RTRIM(CONVERT(char(2),DAY(@fecha)))),2)
	DECLARE @consecutivo char(3)
	
	EXECUTE [dbo].[SiguienteConsecutivoConFecha] @pais, @fecha,@consecutivo OUTPUT

	DECLARE @lote nchar(10)
	set @lote = CONCAT(@pais, @anho, @mes, @dia, @consecutivo)


	DECLARE @tabla1 TABLE 
		(id_actividad int, codigo nchar(20))

	DECLARE @tabla2 TABLE
		(id_flujo_proceso int)

	BEGIN TRY
		BEGIN TRAN
		
			DECLARE @id_flujo int
			set @id_flujo = 
			(SELECT p.id_flujo
			FROM PRODUCTO p
			WHERE p.id_producto = @id_producto)

			DECLARE @id_copia_flujo int

			--inserta la copia del flujo
			INSERT INTO COPIA_FLUJO
			DEFAULT VALUES
			
			SET @id_copia_flujo = SCOPE_IDENTITY()

			--inserta la copia de las actividades
			INSERT INTO COPIA_ACTIVIDAD
			OUTPUT inserted.id_actividad, inserted.codigo INTO @tabla1
			SELECT a.codigo, a.nombre, a.descripcion, a.id_pantalla, a.tipo_firma, a.rol_seguridad, a.tipo_seguridad,
			a.requerido, a.tiempo_minutos, a.periodica
			FROM ACTIVIDAD a
			WHERE a.codigo in (SELECT a.codigo
								FROM FLUJO_PROCESO fp
								INNER JOIN ACTIVIDAD a
								on a.id_actividad = fp.id_actividad
								WHERE fp.id_flujo = @id_flujo)

			

			--inserta la copia de los flujo proceso
			
			INSERT INTO COPIA_FLUJO_PROCESO
			(id_actividad, id_flujo)
			OUTPUT inserted.id_flujo_proceso INTO @tabla2
			select t.id_actividad, @id_copia_flujo
			FROM FLUJO_PROCESO fp
			INNER JOIN ACTIVIDAD a
			on fp.id_actividad = a.id_actividad
			INNER JOIN @tabla1 t
			ON t.codigo = a.codigo
			where fp.id_flujo = @id_flujo

			
			--inserta la copia de las predecesoras
			INSERT INTO 
			COPIA_PREDECESORA
			SELECT tActual.nueva, tAnterior.nueva
			FROM PREDECESORA p
			inner join 
			(SELECT t.id_flujo_proceso as nueva, flujoNum.id_flujo_proceso as anterior
			FROM (SELECT ROW_NUMBER() OVER (ORDER BY t1.id_flujo_proceso) as rn, t1.id_flujo_proceso
				  FROM @tabla2 t1) as t
			INNER JOIN
			(SELECT ROW_NUMBER() OVER (ORDER BY fp.id_flujo_proceso ASC) as rn,
			fp.id_flujo_proceso
			FROM FLUJO_PROCESO fp
			WHERE fp.id_flujo = @id_flujo) as flujoNum
			on flujoNum.rn = t.rn)as tAnterior
			on p.id_anterior = tAnterior.anterior
			inner join
			(SELECT t.id_flujo_proceso as nueva, flujoNum.id_flujo_proceso as anterior
			FROM (SELECT ROW_NUMBER() OVER (ORDER BY t1.id_flujo_proceso) as rn, t1.id_flujo_proceso
				  FROM @tabla2 t1) as t
			INNER JOIN
			(SELECT ROW_NUMBER() OVER (ORDER BY fp.id_flujo_proceso ASC) as rn,
			fp.id_flujo_proceso
			FROM FLUJO_PROCESO fp
			WHERE fp.id_flujo = @id_flujo) as flujoNum
			on flujoNum.rn = t.rn) as tActual
			on p.id_actual = tActual.anterior


			--inserta la orden
			INSERT INTO ORDEN
			(lote, id_producto, id_linea, fecha_creacion, status, id_copia_flujo)
			VALUES(@lote, @id_producto, @id_linea, @fecha, 1, @id_copia_flujo)

			SET @id_orden = SCOPE_IDENTITY()


			--"ejecuta" la orden
			-- (no hace nada)

			-- la pasa a for quality



		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH

    
END