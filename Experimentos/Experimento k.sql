
--todas las tablas van a ser con la de tabla de ordenes

--cursor sobre tabla real
DECLARE @tiempo datetime
SET @tiempo = GETDATE()

DECLARE @id_orden int
DECLARE @lote nchar(10)
DECLARE @id_producto int
DECLARE @id_linea int
DECLARE @fecha_creacion datetime
DECLARE @fecha_finalizacion datetime
DECLARE @status int
DECLARE @id_copia_flujo int

DECLARE cursorReal CURSOR FOR
	SELECT o.id_orden, o.lote, o.id_producto, o.id_linea, o.fecha_creacion, 
	o.fecha_finalizacion, o.status, o.id_copia_flujo FROM ORDEN o

OPEN cursorReal

FETCH NEXT FROM cursorReal INTO @id_orden, @lote, @id_producto, @id_linea,
	@fecha_creacion, @fecha_finalizacion, @status, @id_copia_flujo

WHILE @@FETCH_STATUS = 0
BEGIN
	
	FETCH NEXT FROM cursorReal INTO @id_orden, @lote, @id_producto, @id_linea,
	@fecha_creacion, @fecha_finalizacion, @status, @id_copia_flujo
	
END

CLOSE cursorReal
DEALLOCATE cursorReal

SELECT DATEDIFF(millisecond, @tiempo, getdate())

--cursor sobre tabla temporal

DECLARE @tiempoT datetime
SET @tiempoT = GETDATE()

DECLARE @id_ordenT int
DECLARE @loteT nchar(10)
DECLARE @id_productoT int
DECLARE @id_lineaT int
DECLARE @fecha_creacionT datetime
DECLARE @fecha_finalizacionT datetime
DECLARE @statusT int
DECLARE @id_copia_flujoT int

CREATE TABLE #TemporalOrden
(id_orden int, 
lote nchar(10), 
id_producto int, 
id_linea int, 
fecha_creacion datetime, 
fecha_finalizacion datetime,
status int, 
id_copia_flujo int)

INSERT INTO #TemporalOrden
SELECT *
FROM ORDEN

DECLARE cursorTemporal CURSOR FOR
	SELECT o.id_orden, o.lote, o.id_producto, o.id_linea, o.fecha_creacion, 
	o.fecha_finalizacion, o.status, o.id_copia_flujo FROM #TemporalOrden o

OPEN cursorTemporal

FETCH NEXT FROM cursorTemporal INTO @id_ordenT, @loteT, @id_productoT, @id_lineaT,
	@fecha_creacionT, @fecha_finalizacionT, @statusT, @id_copia_flujoT

WHILE @@FETCH_STATUS = 0
BEGIN
	
	FETCH NEXT FROM cursorTemporal INTO  @id_ordenT, @loteT, @id_productoT, @id_lineaT,
	@fecha_creacionT, @fecha_finalizacionT, @statusT, @id_copia_flujoT
	
END

CLOSE cursorTemporal
DEALLOCATE cursorTemporal

SELECT DATEDIFF(millisecond, @tiempoT, getdate())


DROP TABLE #TemporalOrden

--cursor sobre variable tabla

DECLARE @tiempoV datetime
SET @tiempoV = GETDATE()

DECLARE @id_ordenV int
DECLARE @loteV nchar(10)
DECLARE @id_productoV int
DECLARE @id_lineaV int
DECLARE @fecha_creacionV datetime
DECLARE @fecha_finalizacionV datetime
DECLARE @statusV int
DECLARE @id_copia_flujoV int

DECLARE @VariableOrden table
(id_orden int, 
lote nchar(10), 
id_producto int, 
id_linea int, 
fecha_creacion datetime, 
fecha_finalizacion datetime,
status int, 
id_copia_flujo int)

INSERT INTO @VariableOrden
SELECT *
FROM ORDEN

DECLARE cursorVariable CURSOR FOR
	SELECT o.id_orden, o.lote, o.id_producto, o.id_linea, o.fecha_creacion, 
	o.fecha_finalizacion, o.status, o.id_copia_flujo FROM @VariableOrden o

OPEN cursorVariable

FETCH NEXT FROM cursorVariable INTO @id_ordenV, @loteV, @id_productoV, @id_lineaV,
	@fecha_creacionV, @fecha_finalizacionV, @statusV, @id_copia_flujoV

WHILE @@FETCH_STATUS = 0
BEGIN
	
	FETCH NEXT FROM cursorVariable INTO @id_ordenV, @loteV, @id_productoV, @id_lineaV,
	@fecha_creacionV, @fecha_finalizacionV, @statusV, @id_copia_flujoV
	
END

CLOSE cursorVariable
DEALLOCATE cursorVariable

SELECT DATEDIFF(millisecond, @tiempoV, getdate())