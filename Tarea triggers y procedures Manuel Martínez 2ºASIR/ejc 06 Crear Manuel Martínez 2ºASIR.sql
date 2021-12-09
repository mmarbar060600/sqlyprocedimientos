CREATE TRIGGER Seguridadcrear
ON DATABASE
FOR CREATE_TABLE
AS
PRINT 'Para crear una tabla necesitas deshabilitar este trigger'
ROLLBACK
--comprobacion
CREATE TABLE tupadre(
    BIBI INT PRIMARY KEY,
    aro VARCHAR(20)
)