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
CREATE PROCEDURE IniciarOrden
	-- Add the parameters for the stored procedure here
	@id_orden int,
	@respuesta int OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE ORDEN
	SET ORDEN.status = 2
	WHERE
	(SELECT count(*)
	from
	OrdenesQueIniciar oi
	WHERE oi.id_orden = @id_orden) > 0 AND ORDEN.id_orden = @id_orden
	SELECT @respuesta = @@ROWCOUNT

END
GO
