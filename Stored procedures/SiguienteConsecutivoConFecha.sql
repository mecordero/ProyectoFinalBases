ALTER PROCEDURE SiguienteConsecutivoConFecha
	@pais char(2),@fecha date, @ultimo char(3) OUTPUT
AS 
BEGIN
	DECLARE @anho char(2)
	SET @anho = Right(YEAR(@fecha),2)
	DECLARE @mes char(1)
	SET @mes = CHAR(MONTH(@fecha)+64)
	DECLARE @dia char(2)
	SET @dia = RIGHT(CONCAT('00',RTRIM(CONVERT(char(2),DAY(@fecha)))),2)

	DECLARE @lote nchar(10)
	set @lote = CONCAT(@pais, @anho, @mes, @dia)

	SET @ultimo = 
	(select max(RIGHT(o.lote,3))
	from orden o
	where o.lote like CONCAT(RTRIM(@lote) ,'%'))

	DECLARE @consecutivo int
	SET @consecutivo = (select cast(@ultimo as int))
	SET @consecutivo = @consecutivo + 1

	SET @ultimo = RIGHT(CONCAT('000', @consecutivo),3)
	
	IF(@ultimo) = '000'
	BEGIN
		SET @ultimo = '001'
	END

	PRINT(@ultimo)

END



