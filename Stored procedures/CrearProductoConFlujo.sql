USE [BD_COMPANIA]
GO

/****** Object:  StoredProcedure [dbo].[CrearProductoConFlujo]    Script Date: 11/15/2017 1:52:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CrearProductoConFlujo]
	-- Add the parameters for the stored procedure here
	@descripcion nchar(50),
	@id_flujo int,
	@id_producto int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

			INSERT INTO PRODUCTO
			(id_flujo, descripcion)
			VALUES (@id_flujo ,@descripcion)

			SET @id_producto = (SELECT MAX(id_producto) FROM PRODUCTO)
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
END
GO


