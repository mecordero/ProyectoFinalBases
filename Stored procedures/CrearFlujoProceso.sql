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
CREATE PROCEDURE CrearFlujoProceso
	-- Add the parameters for the stored procedure here
	@id_flujo int, 
	@id_actividad int,
	@id_flujo_proceso int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @table table (id int)

    INSERT INTO FLUJO_PROCESO
	(id_actividad, id_flujo)
	OUTPUT inserted.id_flujo_proceso INTO @table
	VALUES(@id_actividad, @id_flujo)

	SELECT @id_flujo_proceso = id from @table
	RETURN
END
GO
