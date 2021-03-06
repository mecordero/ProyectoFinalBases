
CREATE PROCEDURE [dbo].[Consulta_Orden] 
	@id_orden INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT o.lote, p.id_producto, p.descripcion, l.descripcion FROM ORDEN o
	INNER JOIN PRODUCTO p ON p.id_producto = o.id_producto 
	INNER JOIN LINEA l ON l.id_linea = o.id_linea WHERE o.id_orden = @id_orden
END
