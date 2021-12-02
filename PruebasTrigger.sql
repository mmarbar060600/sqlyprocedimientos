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
--comprobacion del trigger con tequeño
UPDATE Menu
SET Nombre = 'Pequeños'
where lower(Nombre)='tequeños'
--prohibimos borrar tablas con trigger
GO
CREATE TRIGGER 
SeguridadBorrarTabla
on DATABASE
FOR DROP_TABLE
AS
PRINT 'Para borrar esta tabla debes deshabilitar el tigger SeguridadBorrarTabla'
ROLLBACK
--comprobacion de drop table
DROP TABLE Menu_HCO