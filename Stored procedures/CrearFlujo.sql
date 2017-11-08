-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE CrearFlujo
	-- Add the parameters for the stored procedure here
	@id_flujo int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @table table (id int)


	BEGIN TRY
		BEGIN TRAN
			INSERT
			INTO FLUJO
			OUTPUT inserted.id_flujo INTO @table
			DEFAULT VALUES

			SELECT @id_flujo = id from @table
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH

	

	RETURN
END
GO
