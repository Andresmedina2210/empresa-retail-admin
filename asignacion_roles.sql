-- 1. Usar la base de datos correcta
USE `empresa-retail-db`;

-- 2. Creación de Usuarios con las contraseñas exactas de la guía (punto 6)
CREATE USER 'ana_crm'@'localhost' IDENTIFIED BY 'Retail2026!Caja';
CREATE USER 'pedro_mkt'@'localhost' IDENTIFIED BY 'Retail2026!Stock';
CREATE USER 'marta_auditoria'@'localhost' IDENTIFIED BY 'Retail2026!Admin';

-- 3. El rol ana: puede gestionar Clientes e Interacciones (Lectura y Escritura)
GRANT SELECT, INSERT, UPDATE, DELETE ON `empresa-retail-db`.cliente TO 'ana_crm'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON `empresa-retail-db`.interaccion TO 'ana_crm'@'localhost';

-- El rol pedro: puede gestionar Canales y Campañas (en este caso tu tabla se llama canal y conversion), pero solo puede ver clientes, pero no editarlos
GRANT SELECT, INSERT, UPDATE, DELETE ON `empresa-retail-db`.canal TO 'pedro_mkt'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON `empresa-retail-db`.conversion TO 'pedro_mkt'@'localhost';
GRANT SELECT ON `empresa-retail-db`.cliente TO 'pedro_mkt'@'localhost';

-- El rol marta: solo puede ver Conversiones (Compra, registro, suscripción) y usar procedimientos almacenados de consulta
GRANT SELECT ON `empresa-retail-db`.conversion TO 'marta_auditoria'@'localhost';
GRANT EXECUTE ON  `empresa-retail-db`.* TO 'marta_auditoria'@'localhost';

-- 4. Aplicar los cambios de privilegios
FLUSH PRIVILEGES;