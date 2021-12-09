CREATE OR ALTER TRIGGER subtotal
on Pedidos
FOR UPDATE
AS
BEGIN
IF UPDATE(subtotal) or UPDATE(Gastosenvio)
BEGIN
    DECLARE @num1 AS int
    SELECT @num1 = id FROM inserted
    UPDATE Pedidos
    SET Total = SubTotal + GastosEnvio
    WHERE id = @num1
END
END