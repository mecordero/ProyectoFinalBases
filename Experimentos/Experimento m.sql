
--llamar la vista
DECLARE @tiempoV datetime
SET @tiempoV = GETDATE()
SELECT *
FROM OrdenesForProduction 
SELECT DATEDIFF(MILLISECOND, @tiempoV, GETDATE())


--codigo de la vista
DECLARE @tiempo datetime
SET @tiempo = GETDATE()

SELECT  o.id_orden
FROM            dbo.ORDEN AS o INNER JOIN
                         dbo.ESTADO AS e1 ON o.status = e1.id_estado INNER JOIN
                         dbo.CAMBIOS AS c ON c.id_estado = e1.id_estado INNER JOIN
                         dbo.ESTADO AS e2 ON c.id_cambio = e2.id_estado
WHERE        (e2.id_estado = 4)

SELECT DATEDIFF(MILLISECOND, @tiempo, GETDATE())