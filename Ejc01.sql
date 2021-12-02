--PRIMERO HACEMOS EL SELECT
SELECT SUM(PrecioVentaUnitario * Cantidad) as subtotal
FROM PedidosLinea
WHERE Idpedido='1'
--Metemos el select en una variable
DECLARE @precionuevo as decimal(18,2) =(SELECT SUM(PrecioVentaUnitario * Cantidad) as subtotal
FROM PedidosLinea
WHERE Idpedido='1')
UPDATE Pedidos
SET SubTotal=@precionuevo 
Where id=1
--creamos el trigger
GO
create trigger calculadorasubtotal
on PedidosLinea
for insert,update
AS
BEGIN
declare @id as int = (select top 1 idpedido from inserted)
declare @precionuevo as decimal(18,2) =
(SELECT SUM(PrecioVentaUnitario * Cantidad) as subtotal
FROM PedidosLinea
WHERE Idpedido=@id)
UPDATE pedidos set SubTotal=@precionuevo
where id=@id
END
--comprobaciones
update PedidosLinea
SET PrecioVentaUnitario = 5
WHERE Id=1