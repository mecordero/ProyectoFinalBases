USE [BD_COMPANIA]
GO
/****** Object:  StoredProcedure [dbo].[SeleccionarLinea]    Script Date: 13/11/2017 02:59:44 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SeleccionarLinea]


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	SELECT  l.id_linea,l.descripcion
	FROM LINEA l
	
END