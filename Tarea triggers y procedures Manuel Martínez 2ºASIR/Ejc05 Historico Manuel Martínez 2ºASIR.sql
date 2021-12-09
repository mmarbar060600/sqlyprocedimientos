--primero creamos la tabla
CREATE TABLE ingredientes_hc2 (
    Id int IDENTITY(1,1) PRIMARY KEY,
    idIngrediente int null,
    Nombre VARCHAR(100) null,
    PrecioKg DECIMAL(18,2) null,
    fecha DateTime NOT NULL
);
--Creamos el trigger
CREATE TRIGGER kilos
ON Ingredientes
FOR UPDATE,INSERT
AS
BEGIN
IF UPDATE(PrecioKg)
BEGIN
    INSERT INTO ingredientes_hc2
    SELECT Id,Nombre,PrecioKg,getdate()
    FROM inserted
END
END

