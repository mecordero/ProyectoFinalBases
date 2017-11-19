
DECLARE @tiempo datetime
SET @tiempo = GETDATE()



SELECT o.id_orden, o.lote, o.id_producto, o.id_linea, o.fecha_creacion, 
	o.fecha_finalizacion, o.status, o.id_copia_flujo
FROM ORDEN o
WHERE lote = 'CR17K07003'



SELECT DATEDIFF(millisecond, @tiempo, getdate())


--create index i1 on ORDEN (lote)

--drop index i1 on orden
