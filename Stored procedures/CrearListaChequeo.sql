CREATE PROCEDURE [dbo].[crearListaChequeo]
	@idActividad int, @texto nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRAN
			INSERT INTO LISTA_CHEQUEO
				(id_actividad,texto)
			VALUES (@idActividad,@texto)
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
END
GO


