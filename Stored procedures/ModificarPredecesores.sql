
USE [BD_COMPANIA]
GO
/****** Object:  StoredProcedure [dbo].[ModificarPredecesores]    Script Date: 16/11/2017 03:32:07 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ModificarPredecesores]
	@Id_Producto int ,
	@Id_anterior int ,
	@Id_actual int 
AS
BEGIN
	declare @id_flujo int
	SET NOCOUNT ON;
	Set @id_flujo= (SELECT id_flujo
	FROM PRODUCTO p
	WHERE p.id_producto= @Id_Producto)

	declare @id_actividad int 
	SET @id_actividad= (SELECT fp.id_actividad
	FROM FLUJO_PROCESO fp
	WHERE fp.id_flujo = @id_flujo and fp.id_actividad = @Id_actual)

	declare @ult_id int
	SET @ult_id=COALESCE((SELECT TOP 1 id_predecesora FROM PREDECESORA 
	ORDER BY id_predecesora DESC),0)

	--IF(SELECT COUNT(pd.id_actual)
	--FROM PREDECESORA pd
	--JOIN FLUJO_PROCESO fp on pd.id_actual = fp.id_actividad
	--JOIN FLUJO f on fp.id_flujo = f.id_flujo
	--WHERE fp.id_actividad = @id_actividad and f.id_flujo=@id_flujo
	--GROUP BY pd.id_actual) != 0
		--UPDATE PREDECESORA
		--SET id_anterior = @Id_anterior
		--WHERE id_actual = @Id_actual
	--ELSE 
		SET IDENTITY_INSERT PREDECESORA ON
		INSERT INTO PREDECESORA(id_predecesora,id_actual,id_anterior) VALUES (@ult_id+1,@Id_actual,@Id_anterior)	
		SET IDENTITY_INSERT PREDECESORA OFF
END



