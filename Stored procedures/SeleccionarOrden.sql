USE [BD_COMPANIA]
GO
/****** Object:  StoredProcedure [dbo].[SeleccionarOrden]    Script Date: 13/11/2017 03:00:14 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SeleccionarOrden]
AS
BEGIN
	
	SET NOCOUNT ON;
	SELECT o.id_linea,o.lote,o.fecha_creacion,o.fecha_finalizacion,o.status
	FROM ORDEN o 
	
END
