CREATE PROCEDURE [dbo].[CrearActividad]
	-- Add the parameters for the stored procedure here 
	@nombre nchar(20),
	@descripcion nchar(60),
	@id_pantalla int = NULL,
	@tipo_firma char(1),
	@rol_seguridad char(1),
	@tipo_seguridad char(1),
	@requerido char(1),
	@tiempo_minutos int,
	@periodica char(1),
	@id_actividad int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--hay que generar el codigo automáticamente
	Declare @codigo nchar(20)
	SET @codigo = 'codigo'

    -- Insert statements for procedure here

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO ACTIVIDAD
				(codigo, nombre, descripcion, id_pantalla, tipo_firma, rol_seguridad, tipo_seguridad, 
					requerido, tiempo_minutos, periodica)
			VALUES (@codigo, @nombre, @descripcion, @id_pantalla, @tipo_firma, @rol_seguridad, @tipo_seguridad, 
					@requerido, @tiempo_minutos, @periodica)
			SET @id_actividad = (select MAX(id_actividad) FROM ACTIVIDAD)
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
	
END
GO


