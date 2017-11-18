
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER TRIGGER BorrarDePredecesoras
   ON  FLUJO_PROCESO
   INSTEAD OF DELETE
AS 
BEGIN
	SET NOCOUNT ON;

    DECLARE @borrado int
	SET @borrado = 
	(SELECT d.id_flujo_proceso
	FROM deleted d)
	
	DELETE 
	FROM PREDECESORA
	WHERE id_actual = @borrado or id_anterior = @borrado	 

	DELETE 
	FROM FLUJO_PROCESO
	WHERE id_flujo_proceso = @borrado

END
GO
