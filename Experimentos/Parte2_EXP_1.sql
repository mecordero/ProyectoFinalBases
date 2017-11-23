SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Modifica las tabas  ROL Y MATERIAL

ALTER PROCEDURE SP_EXP_2
	@rol int,
	@nombre nchar(20),
	@empleado int,
	@id_producto  int,
	@descripcion  nchar(50),
	@id_material  int,
	@nombre2      nchar(20)
AS
BEGIN
	BEGIN TRY 
	SET NOCOUNT ON;
	IF NOT EXISTS (SELECT r.id_rol FROM ROL r WHERE r.id_rol = @rol)
	BEGIN
		INSERT INTO ROL(nombre) 
		VALUES(@nombre)

	END
	IF EXISTS (SELECT e.id_empleado FROM EMPLEADO e WHERE e.id_empleado= @empleado)
	BEGIN
			UPDATE EMPLEADO 
			SET id_rol = @rol
			WHERE id_empleado = @empleado
	END	

	EXEC SP_EXP_3 @id_producto ,@descripcion,@id_material,@nombre
	COMMIT
	END TRY 
	BEGIN CATCH
	 print 'ya existe'
	END CATCH
END
GO

