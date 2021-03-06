USE [BD_COMPANIA]
GO
/****** Object:  StoredProcedure [dbo].[EliminarPrede]    Script Date: 16/11/2017 05:27:57 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE  [dbo].[EliminarPrede]
	@Id_Producto int,--tengo el producto
	@Id_actual_fp int--tengo el actual , que no deberia ser prede de ninguno (se elimina de los predecesores)
AS
BEGIN
	SET NOCOUNT ON;
	declare @id_flujo int
	Set @id_flujo= (SELECT id_flujo
	FROM PRODUCTO p
	WHERE p.id_producto= @Id_Producto)

	if(SELECT COUNT(pd.id_anterior)
	FROM PREDECESORA pd 
	WHERE @Id_actual_fp = pd.id_anterior
	GROUP BY pd.id_anterior)>0
		DELETE FROM PREDECESORA 
		WHERE @Id_actual_fp  = id_anterior  

	DELETE FROM FLUJO_PROCESO
	WHERE @Id_actual_fp = id_flujo_proceso and @id_flujo = id_flujo

END

SELECT * FROM PREDECESORA