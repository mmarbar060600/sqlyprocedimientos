CREATE or alter TRIGGER pedido
ON Pedidos
FOR UPDATE,INSERT
AS
BEGIN
DECLARE @num1 AS int
SELECT @num1 = id FROM inserted
BEGIN
EXEC envio @num1
END
END
--COMPROBACION
UPDATE pedidos
SET Cod_Postal = '500'
WHERE Id = 1



