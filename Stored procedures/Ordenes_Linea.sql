ALTER PROCEDURE Ordenes_Linea
	@id_linea int
AS
BEGIN
	SET NOCOUNT ON;
	SELECT o.id_orden FROM ORDEN o WHERE o.id_linea = @id_linea and o.status = 2
END
GO
