USE [BD_COMPANIA]
GO
/****** Object:  StoredProcedure [dbo].[Modificar_Linea]    Script Date: 14/11/2017 04:09:04 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Modificar_Linea]
	@id int ,
	@descripcion nvarchar(10),
	@num int
	
AS
BEGIN
	
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRAN
			if(@num = 1)
			
				UPDATE LINEA  
				SET descripcion=  @descripcion  
				WHERE id_linea = @id
			
			ELSE
			
				DELETE FROM LINEA	
				WHERE id_linea =@id;	
			
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
	END
