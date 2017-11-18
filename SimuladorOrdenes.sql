

--simulador de ordenes

--tiene que crear las ordenes con estado completed


ALTER PROCEDURE SimuladorOrdenes 
	@NumeroOrdenes int

AS 
BEGIN
	SET NOCOUNT ON;

	WHILE @NumeroOrdenes > 0
	BEGIN
		--escoge un empleado random para la orden
		DECLARE @id_empleado int
		SET @id_empleado = 
		(SELECT TOP 1 e.id_empleado 
		FROM EMPLEADO e
		ORDER BY NEWID())

		--escoge un producto random para la orden
		DECLARE @id_producto int
		SET @id_producto = 
		(SELECT TOP 1 p.id_producto
		FROM PRODUCTO p
		ORDER BY NEWID())

		--escoge una linea random para la orden
		DECLARE @id_linea int
		SET @id_linea = 
		(SELECT TOP 1 l.id_linea
		FROM LINEA l
		ORDER BY NEWID())

		DECLARE @pais nchar(2)
		SET @pais = 'CR'

		--escoge una fecha random
		DECLARE @fecha date
		DECLARE @days_rand int

		SET @days_rand  = (SELECT floor(RAND()*(63)))

		SET @fecha = DATEADD(DAY, -@days_rand, GETDATE())

		--crea la orden

		DECLARE @id_orden int

		EXEC CrearOrdenConFecha @id_empleado, @id_producto, @id_linea, @pais, @fecha, @id_orden OUTPUT

		--inicia la orden

		DECLARE @respuesta int

		EXEC IniciarOrden @id_orden, @respuesta OUTPUT

		--pone la orden for quality

		EXEC PonerOrdenForQuality @id_orden, @respuesta OUTPUT

		--pone la orden for production

		EXEC PonerOrdenForProduction @id_orden, @respuesta OUTPUT

		--cierra la orden

		EXEC CerrarOrden @id_orden, @respuesta


		SET @NumeroOrdenes = @NumeroOrdenes -1
	END
END