USE [BD_COMPANIA]
GO
/****** Object:  StoredProcedure [dbo].[SeleccionarProducto]    Script Date: 13/11/2017 03:00:38 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SeleccionarProducto]
AS
BEGIN
	
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT p.id_producto, p.descripcion
	FROM PRODUCTO p
END
