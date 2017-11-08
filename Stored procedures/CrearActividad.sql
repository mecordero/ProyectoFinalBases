USE[BD_COMPANIA]

-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE CrearActividad
	-- Add the parameters for the stored procedure here 
	@nombre nchar(20),
	@descripcion nchar(60),
	@id_pantalla int = NULL,
	@tipo_firma char(1),
	@rol_seguridad char(1),
	@tipo_seguridad char(1),
	@requerido char(1),
	@tiempo_minutos int,
	@periodica char(1)
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
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
	
END
GO

select * from actividad

EXEC CrearActividad @nombre ='Nombre', @descripcion = 'Desc', @tipo_firma = 'S', @rol_seguridad = 'S',@tipo_seguridad = 'S', @requerido = 'Y', @tiempo_minutos = 120, @periodica = 'Y'