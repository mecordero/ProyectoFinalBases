CREATE PROCEDURE [dbo].[AgregarFlujoProceso]
	@id_Producto int,
	@id_actividad int
AS
BEGIN
	SET NOCOUNT ON;

	declare @id_flujo int
	Set @id_flujo= (SELECT id_flujo
	FROM PRODUCTO p
	WHERE p.id_producto= @Id_Producto)
	DECLARE @table table (id int)

    INSERT INTO FLUJO_PROCESO
	(id_actividad, id_flujo)
	VALUES(@id_actividad, @id_flujo)

	RETURN
END