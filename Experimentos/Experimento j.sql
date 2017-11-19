DECLARE @tiempo datetime
SET @tiempo = GETDATE()

SELECT *
FROM Producto p
INNER JOIN ORDEN o
on o.id_producto = p.id_producto
INNER JOIN LINEA l
on l.id_linea = o.id_linea


SELECT DATEDIFF(millisecond, @tiempo, getdate())

--create index i1 on ORDEN (id_producto)
--create index i2 on ORDEN (id_linea)

--drop index i1 on orden
--drop index i2 on orden