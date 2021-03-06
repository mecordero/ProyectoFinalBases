USE [BD_COMPANIA]
GO
/****** Object:  StoredProcedure [dbo].[SeleccionarActiv_Posibles]    Script Date: 16/11/2017 06:24:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SeleccionarActiv_Posibles]
	@id_Actividad int,
	@id_Producto int
AS
BEGIN

	SET NOCOUNT ON;
	
	
	SELECT distinct a.id_actividad,fp.id_flujo_proceso, f.id_flujo, a.descripcion
	FROM ACTIVIDAD a
	JOIN FLUJO_PROCESO fp on a.id_actividad = fp.id_actividad
	JOIN FLUJO f on fp.id_flujo = f.id_flujo
	JOIN PRODUCTO p on p.id_flujo = f.id_flujo
	WHERE p.id_producto = @id_Producto and p.id_flujo = f.id_flujo and fp.id_flujo = f.id_flujo and 
	fp.id_flujo_proceso != @id_Actividad

END

