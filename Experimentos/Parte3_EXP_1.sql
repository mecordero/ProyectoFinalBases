
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--modifica las tablas de material y producto 

CREATE PROCEDURE SP_EXP_3
	@id_producto int,
	@descripcion nchar(50),
	@id_material int,
	@nombre nchar(20)

AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY 
	SET NOCOUNT ON;
	IF EXISTS (SELECT p.id_producto FROM PRODUCTO p WHERE p.id_producto= @id_producto)
	BEGIN
		UPDATE PRODUCTO 
		SET descripcion = @descripcion
	END
	IF NOT EXISTS (SELECT m.id_material FROM MATERIAL m WHERE m.id_material= @id_material)
	BEGIN
		INSERT INTO MATERIAL(nombre) 
		VALUES(@nombre)
	END
	END TRY 
	BEGIN CATCH
	 print 'ya existe'
	END CATCH

END
GO
