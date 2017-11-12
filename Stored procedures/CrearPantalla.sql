
CREATE PROCEDURE [dbo].[crearPantalla]
	@nombre nvarchar(15), @tipo int
AS
BEGIN
	SET NOCOUNT ON;
	Declare @codigo nchar(20)
	Declare @num nchar(10)
	Declare @posibleid int
	set @posibleid = (SELECT MAX(id_actividad) FROM ACTIVIDAD)
	set @codigo = 'CH'
	set @num = '00000'
	set @num = CONCAT(RTRIM(@num), CAST(@posibleid AS nchar))
	set @num = RIGHT(RTRIM(@num),5)
	set @codigo = CONCAT(RTRIM(@codigo), RTRIM(@num))
	BEGIN TRY
		BEGIN TRAN
			INSERT INTO PANTALLA
			(codigo,nombre,tipo)
			VALUES (@codigo, @nombre, @tipo)
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
END
GO


