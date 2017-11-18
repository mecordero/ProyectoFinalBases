SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE PonerOrdenForProduction
	-- Add the parameters for the stored procedure here
	@id_orden int,
	@respuesta int OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE ORDEN
	SET ORDEN.status = 3
	WHERE
	(SELECT count(*)
	from
	OrdenesForProduction o
	WHERE o.id_orden = @id_orden) > 0 AND ORDEN.id_orden = @id_orden
	SELECT @respuesta = @@ROWCOUNT

END
GO