--Creamos la tabla Historico
create table Historico(
Id int IDENTITY(1,1) PRIMARY KEY,
Nombre varchar(100) NOT NULL,
Email varchar(100) NOT NULL,
Telefono varchar(200) NOT NULL,
Direccion varchar(100) NOT NULL,
Cod_postal varchar(100) NOT NULL,
Ciudad varchar(100) NOT NULL,
fecha DATE
)
--creamos el trigger
GO
CREATE TRIGGER Historico
On Clientes  
For UPDATE,Insert
AS
BEGIN
SET NOCOUNT ON;
IF UPDATE(Clientes)
BEGIN
INSERT INTO Historico
Select id,Nombre,Email,Telefono,Direccion,Cod_Postal,Ciudad, GETDATE()
FROM inserted
END
END
