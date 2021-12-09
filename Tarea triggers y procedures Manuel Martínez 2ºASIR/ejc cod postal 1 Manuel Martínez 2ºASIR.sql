GO
CREATE or alter PROCEDURE envio @num1 INT
AS
begin
declare @postal as varchar(3)
SELECT @postal=LEFT(Cod_Postal, 3) 
FROM pedidos where id=@num1
IF @postal = 410
BEGIN
  UPDATE pedidos
  SET GastosEnvio = 3.99
  WHERE Id = @num1
END
ELSE
    BEGIN
    if (left(@postal,2)=41)
    BEGIN
    UPDATE pedidos
    SET GastosEnvio = 5.99
    WHERE Id = @num1
    end
    ELSE
    BEGIN
        UPDATE pedidos
        SET GastosEnvio = 9.99
        WHERE Id = @num1
    END
END
END
--comprobacion
exec envio 11