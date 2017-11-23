SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Cree un stored procedure transaccional que llame dentro de la
-- transacción a otro SP transaccional y este a otro SP transaccional.
--Cada stored procedure debe actualizar los datos de dos tablas. Muestre 
--en el SP principal el funcionamiento del commit y el rollback tanto para 
--el caso de éxito como el de fallo

--Modifica la tabla de actividades y TIPO

ALTER PROCEDURE SP_EXP_1
	@id_Actividad int,
	@id_Tipo	  int,
	@nombre		  nchar(20),
	@rol          int,
	@nombre3      nchar(20),
	@empleado     int
AS
BEGIN

	SET NOCOUNT ON;

	BEGIN TRANSACTION
	BEGIN TRY 

	IF NOT EXISTS (SELECT t.id_tipo FROM TIPO t WHERE t.id_tipo = @id_Tipo)
	BEGIN
		INSERT INTO TIPO(nombre) 
		VALUES(@nombre)

	END
	IF EXISTS (SELECT a.id_actividad FROM ACTIVIDAD a WHERE a.id_actividad = @id_Actividad)
	BEGIN
			UPDATE ACTIVIDAD 
			SET tipo_seguridad = @id_Tipo
			WHERE tipo_seguridad = @id_Tipo
	END		
	EXEC SP_EXP_2 @rol,@nombre3,@empleado

	COMMIT
	END TRY

	BEGIN CATCH
		ROLLBACK
	END CATCH
	
END
GO

--EXEC SP_EXP_1 1,1, 'nose'
