CREATE PROCEDURE [dbo].[crearListaChequeo]
	@idActividad int, @line_num int, @texto nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRAN
			INSERT INTO LISTA_CHEQUEO
				(id_actividad,line_num,texto)
			VALUES (@idActividad,@line_num,@texto)
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
END
GO


