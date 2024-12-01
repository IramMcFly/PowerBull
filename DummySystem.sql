-- Crear usuarios
CREATE USER 'DummySystem'@'localhost' IDENTIFIED BY 'DummySystem';
CREATE USER 'Ventas'@'localhost' IDENTIFIED BY 'DummySystem_Ventas_EntryPlug01';
CREATE USER 'Gerencia'@'localhost' IDENTIFIED BY 'DummySystem_Gerencia_EntryPlug00';
CREATE USER 'Developer'@'localhost' IDENTIFIED BY 'DummySystem_DevOps_EntryPlug02';

-- Crear roles
CREATE ROLE 'DummySystem';
CREATE ROLE 'Gerencia';
CREATE ROLE 'Ventas';
CREATE ROLE 'Developer';

-- Conceder privilegios a roles
GRANT SELECT ON powerbull.empleados TO 'DummySystem';
GRANT SELECT ON powerbull.puestos TO 'DummySystem';
GRANT SELECT ON powerbull.contrasenas TO 'DummySystem';

GRANT SELECT, INSERT, UPDATE ON powerbull.* TO 'Gerencia';


GRANT ALL PRIVILEGES ON powerbull.* TO 'Developer';

-- Asignar roles a usuarios
GRANT 'DummySystem' TO 'DummySystem'@'localhost';
GRANT 'Gerencia' TO 'Gerencia'@'localhost';
GRANT 'Ventas' TO 'Ventas'@'localhost';
GRANT 'Developer' TO 'Developer'@'localhost';


-- Asignar permisos de funciones ventas
GRANT SELECT ON powerbull.* TO 'Ventas';
GRANT SELECT on powerbull.productos to Ventas@Localhost;
GRANT INSERT on powerbull.clientes_comerciales to Ventas@localhost;
GRANT EXECUTE ON PROCEDURE powerbull.actualizar_stock to Ventas@localhost;
GRANT EXECUTE ON PROCEDURE powerbull.buscar_clientes to Ventas@localhost;
GRANT INSERT ON powerbull.detalle_facturas TO 'Ventas';
GRANT INSERT ON powerbull.detalle_ventas TO 'Ventas';
GRANT INSERT ON powerbull.ventas TO 'Ventas';
GRANT INSERT ON powerbull.facturas TO 'Ventas';
GRANT UPDATE ON powerbull.clientes_comerciales TO 'Ventas';


-- Asignar permisos de funciones gerencia
GRANT EXECUTE ON FUNCTION powerbull.GenerarNumeroParte to Gerencia@localhost;
GRANT EXECUTE ON PROCEDURE powerbull.actualizar_stock to Gerencia@localhost;
GRANT EXECUTE ON PROCEDURE powerbull.buscar_clientes to Gerencia@localhost;
GRANT EXECUTE ON PROCEDURE powerbull.ObtenerDetallesEmpleado to Gerencia@localhost;
GRANT EXECUTE ON PROCEDURE powerbull.ActualizarEmpleado to Gerencia@localhost;
GRANT EXECUTE ON PROCEDURE powerbull.ObtenerVentasPorDia to Gerencia@localhost;
GRANT EXECUTE ON PROCEDURE powerbull.ObtenerDetallesVenta to Gerencia@localhost;
GRANT EXECUTE ON PROCEDURE powerbull.ObtenerFacturasPorDia to Gerencia@localhost;

