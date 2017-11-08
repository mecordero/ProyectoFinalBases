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
	@id_pantalla int,
	@tipo_firma char(1),
	@rol_seguridad char(1),
	@tipo_seguridad char(1),
	@requerido char(1),
	@tiempo_minutos int,
	@tipo_empleado char(1),
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
	INSERT INTO ACTIVIDAD
	(codigo, nombre, descripcion, id_pantalla, tipo_firma, rol_seguridad, tipo_seguridad, requerido, tiempo_minutos, tipo_empleado, periodica)
	VALUES (@codigo, @nombre, @descripcion, @id_pantalla, @tipo_firma, @rol_seguridad, @tipo_seguridad, @requerido, @tiempo_minutos, @tipo_empleado, @periodica)

END
GO

