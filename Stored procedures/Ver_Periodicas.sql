CREATE PROCEDURE Ver_Periodicas
	@id_orden INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT ca.nombre, ca.tiempo_minutos FROM ORDEN o
	JOIN COPIA_FLUJO cf on o.id_copia_flujo = cf.id_flujo
	JOIN COPIA_FLUJO_PROCESO cfp ON cfp.id_flujo = cf.id_flujo
	JOIN COPIA_ACTIVIDAD ca ON ca.id_actividad = cfp.id_actividad
	WHERE o.id_orden = @id_orden and ca.periodica = 'Y'
END
GO
