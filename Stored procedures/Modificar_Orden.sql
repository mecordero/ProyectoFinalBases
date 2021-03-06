USE [BD_COMPANIA]
GO
/****** Object:  StoredProcedure [dbo].[Modificar_Orden]    Script Date: 14/11/2017 04:08:39 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Modificar_Orden]
	@id int ,
	@lote nvarchar(10),
	@creacion Date ,
	@fin Date ,
	@status nvarchar(10) ,
	@num int
AS
BEGIN
	
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRAN
			
			if(@num = 1)
				UPDATE ORDEN  
				SET lote = @lote, 
				fecha_creacion = @creacion, 
				fecha_finalizacion = @fin,
				Orden.status = @status 
				WHERE id_orden = @id

			ELSE 
				DELETE FROM ORDEN	
				WHERE id_orden =@id;	
			
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
	END
