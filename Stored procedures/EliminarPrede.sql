USE [BD_COMPANIA]
GO
/****** Object:  StoredProcedure [dbo].[EliminarPrede]    Script Date: 16/11/2017 02:37:33 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE  [dbo].[EliminarPrede]
	@Id_Producto int ,
	@Id_actual_fp int 
AS
BEGIN
	declare @id_flujo int
	SET NOCOUNT ON;
	Set @id_flujo= (SELECT id_flujo
	FROM PRODUCTO p
	WHERE p.id_producto= @Id_Producto)

	
	if(SELECT COUNT(pd.id_actual) FROM FLUJO_PROCESO fp 
	JOIN PREDECESORA pd on fp.id_actividad = pd.id_actual
	WHERE 11 = pd.id_anterior
	GROUP BY pd.id_actual)>0
		DELETE FROM PREDECESORA 
		WHERE @Id_actual_fp  = id_anterior  

	DELETE FROM FLUJO_PROCESO
	WHERE @Id_actual_fp = id_flujo_proceso and @id_flujo = id_flujo

END