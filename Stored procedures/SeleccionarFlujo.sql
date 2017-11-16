USE [BD_COMPANIA]
GO
/****** Object:  StoredProcedure [dbo].[SeleccionarPred]    Script Date: 13/11/2017 03:00:23 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SeleccionarFlujo]
	@Flujo int
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT t1.id_actividad , COALESCE(pd.id_actual,-1),COALESCE(pd.id_anterior,-1),t1.descripcion, t1.id_flujo_proceso, t1.periodica
	FROM
	(SELECT distinct a.id_actividad,fp.id_flujo_proceso, f.id_flujo, a.descripcion, a.periodica
	FROM ACTIVIDAD a
	JOIN FLUJO_PROCESO fp on a.id_actividad = fp.id_actividad
	JOIN FLUJO f on fp.id_flujo = f.id_flujo
	JOIN PRODUCTO p on p.id_flujo = f.id_flujo
	WHERE p.id_flujo = @Flujo and fp.id_flujo = @Flujo and f.id_flujo = @Flujo)[t1]
	LEFT JOIN 
	PREDECESORA pd on pd.id_actual = t1.id_flujo_proceso
	
	

	
	
	


END