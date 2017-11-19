
USE [BD_COMPANIA]
GO
/****** Object:  StoredProcedure [dbo].[PruebaTransaction]    Script Date: 19/11/2017 05:08:22 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Cree un stored procedure transaccional que genere y registre el flujo de un producto
ALTER PROCEDURE [dbo].[PruebaTransaction]
	@Producto int,
	@Actividad int
AS
BEGIN
    SET NOCOUNT ON;
	BEGIN TRANSACTION
	BEGIN TRY 
	
	declare @id_flujo int
	declare @id_flujo_proceso int
	declare @id_predecesora int
	declare @id_prede int

	
	IF (SELECT COALESCE(COUNT(p.id_producto),0) FROM PRODUCTO p JOIN FLUJO f ON f.id_flujo =p.id_flujo WHERE
	P.id_producto =@Producto GROUP BY p.id_producto)>0
	BEGIN
		SET @id_flujo=(SELECT p.id_flujo FROM PRODUCTO p JOIN FLUJO f ON f.id_flujo =p.id_flujo WHERE
		P.id_producto = @Producto)

		INSERT INTO FLUJO_PROCESO(id_actividad,id_flujo)
		values(@Actividad,@id_flujo)
	
   END 
   ELSE
   BEGIN
		INSERT INTO FLUJO
		DEFAULT VALUES
		
		INSERT INTO FLUJO_PROCESO(id_actividad,id_flujo)
		values(@Actividad,@id_flujo)
	END

		COMMIT
		END TRY

		BEGIN CATCH
			ROLLBACK
		END CATCH
END
