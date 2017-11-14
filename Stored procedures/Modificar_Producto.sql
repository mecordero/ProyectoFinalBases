
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Modificar_Producto]
	@id int ,
	@descripcion nvarchar(10),
	@num int
	
AS
BEGIN
	
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRAN
			if(@num = 1)
			
				UPDATE PRODUCTO  
				SET descripcion=  @descripcion  
				WHERE id_producto = @id
			
			ELSE
			
				DELETE FROM PRODUCTO	
				WHERE id_producto =@id;	
			
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
	END
GO
