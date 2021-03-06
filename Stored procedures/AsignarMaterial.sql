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
/****** Object:  StoredProcedure [dbo].[AsignarProducto]    Script Date: 13/11/2017 20:55:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AsignarMaterial] @id_producto INT, @line_num INT, @id_material INT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRAN
		INSERT INTO LISTA_MATERIAL VALUES (@id_producto, @line_num, @id_material)
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
END
