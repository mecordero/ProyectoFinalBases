/*    ==Scripting Parameters==
    Source Server Version : SQL Server 2016 (13.0.4001)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server
    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/

USE [BD_COMPANIA]
GO
/****** Object:  StoredProcedure [dbo].[CrearProducto]    Script Date: 13/11/2017 21:17:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CrearProducto]
	-- Add the parameters for the stored procedure here
	@descripcion nchar(50),
	@id_flujo int OUTPUT,
	@id_producto int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN

			EXEC CrearFlujo @id_flujo = @id_flujo OUTPUT

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