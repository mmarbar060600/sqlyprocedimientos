--primero añadimos los campos
ALTER TABLE Clientes ADD Fecha_Nacimiento DATE, Edad INT;
--añadimos los datos a la tabla
UPDATE Clientes
SET Fecha_Nacimiento = '2000/12/02'
--creamos el procedimiento
CREATE OR ALTER PROCEDURE edad
AS
UPDATE CLIENTES SET EDAD=YEAR(GETDATE())-YEAR(Fecha_Nacimiento)
--comprobacion del procedure
exec edad


