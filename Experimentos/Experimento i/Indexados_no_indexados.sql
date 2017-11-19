-- consulta sobre campos indexados en tabla ORDEN

--dura 0ms
set statistics time on

SELECT o.id_orden, o.lote, o.id_producto, o.id_linea, o.fecha_creacion, o.fecha_finalizacion, o.status, o.id_copia_flujo
FROM ORDEN o
WHERE o.id_orden = 23190

set statistics time off

--consulta sobre campos no indexados

--dura 3ms
set statistics time on
SELECT o.id_orden, o.lote, o.id_producto, o.id_linea, o.fecha_creacion, o.fecha_finalizacion, o.status, o.id_copia_flujo
FROM ORDEN o
WHERE lote = 'CR17K07001'
set statistics time off


