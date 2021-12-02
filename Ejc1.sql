--creamos la tabla para hacer el triger
create table Menu_HCO(
Id int IDENTITY(1,1) PRIMARY KEY,
IdMenu int NOT NULL,
Nombre varchar(100) NOT NULL,
PrecioVenta varchar(100) NOT NULL,
Fecha DateTime NOT NULL
)
--Ahora el trigger
GO
CREATE TRIGGER HistoricoPrecio
On Menu
For UPDATE,Insert
AS
BEGIN
SET NOCOUNT ON;
IF UPDATE(PrecioVenta)
BEGIN
INSERT INTO Menu_HCO
Select id,nombre,PrecioVenta, GETDATE()
FROM inserted
END
END
--comprobacion del trigger
UPDATE Menu
SET PrecioVenta = 4.00
where Nombre='Albina'
