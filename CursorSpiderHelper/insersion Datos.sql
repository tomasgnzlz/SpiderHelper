use proyectoBD;
INSERT INTO Usuarios (nomUsuario, correoElectronico, tipoAdmin) VALUES
('JohnDoe', 'johndoe@example.com', 1),
('JaneSmith', 'janesmith@example.com', 0),
('MikeJohnson', 'mikejohnson@example.com', 0),
('EmilyDavis', 'emilydavis@example.com', 0),
('AlexBrown', 'alexbrown@example.com', 1),
('LuisGarcia', 'luis@example,com', 0),
('MariaGarcia', 'maria@example.com', 0),
('CarlosGarcia', 'carlos@example.com', 0);

INSERT INTO Comprador (nomComprador, ape1Comprador, ape2Comprador, codUsuario) VALUES
('John', 'Doe', 'Smith', 1),
('Jane', 'Smith', 'Doe', 2),
('Mike', 'Johnson', 'Smith', 3),
('Emily', 'Davis', 'Johnson', 4),
('Alex', 'Brown', 'Davis', 5);

INSERT INTO Vendedor (nomVendedor, ape1Vendedor, ape2Vendedor, codUsuario) VALUES
('Luis', 'Garcia', 'Brown', 6),
('Maria', 'Garcia', 'Garcia', 7),
('Carlos', 'Garcia', 'Garcia', 8);

INSERT INTO Busqueda (busqueda, fechaBusqueda, cantHuellaCarbono, codComprador) VALUES
('Product A', '2023-05-01', 10.5, 1),
('Product B', '2023-05-02', 15.2, 2),
('Product C', '2023-05-03', 8.7, 3),
('Product D', '2023-05-04', 12.3, 4),
('Product E', '2023-05-05', 9.8, 5);

INSERT INTO Productos (descripcion, nomProducto) VALUES
('Product A', 'Product A'),
('Product B', 'Product B'),
('Product C', 'Product C'),
('Product D', 'Product D'),
('Product E', 'Product E');

-- insertame datos a la tabla tienda
INSERT INTO Tienda (dirTienda, numTienda, codVendedor) VALUES
('Calle 1', 1, 1),
('Calle 2', 2, 2),
('Calle 3', 3, 3),
('Calle 4', 4, 1),
('Calle 5', 5, 2),
('Calle 6', 6, 3),
('Calle 7', 7, 1),
('Calle 8', 8, 2),
('Calle 9', 9, 3),
('Calle 10', 10, 1);


-- Busqueda
INSERT INTO Busqueda (busqueda, fechaBusqueda, cantHuellaCarbono, codComprador)
VALUES ('Bicicleta', '2023-05-28', 2.5, 1);

INSERT INTO Busqueda (busqueda, fechaBusqueda, cantHuellaCarbono, codComprador)
VALUES ('Zapatos deportivos', '2023-05-29', 1.8, 2);


-- Tienda
INSERT INTO Tienda (dirTienda, numTienda, codVendedor)
VALUES ('Calle Principal 123', 1, 1);

INSERT INTO Tienda (dirTienda, numTienda, codVendedor)
VALUES ('Avenida Central 456', 2, 2);


-- Productos 
INSERT INTO Productos (descripcion, nomProducto)
VALUES ('Bicicleta de montaña', 'Bicicleta MTB');

INSERT INTO Productos (descripcion, nomProducto)
VALUES ('Zapatillas para correr', 'Zapatillas running');


-- Resultado Tienda
INSERT INTO ResultadoTienda (codProductos, codTienda, stock, cantHuellaCarbono)
VALUES (1, 1, 10, 2.3);

INSERT INTO ResultadoTienda (codProductos, codTienda, stock, cantHuellaCarbono)
VALUES (2, 2, 5, 1.5);


-- Resultado Busqueda
INSERT INTO ResultadoBusqueda (codBusqueda, codTienda, codProductos, listaTiendas)
VALUES (1, 1, 1, 'Tienda A, Tienda B');

INSERT INTO ResultadoBusqueda (codBusqueda, codTienda, codProductos, listaTiendas)
VALUES (2, 2, 2, 'Tienda C');


-- Más datos de resultado tienda para el trigger. 
INSERT INTO ResultadoTienda (codProductos, codTienda, stock, cantHuellaCarbono)
VALUES (4, 5, 17, 4.3);

INSERT INTO ResultadoTienda (codProductos, codTienda, stock, cantHuellaCarbono)
VALUES (6, 4, 25, 7.5);




-- Agrego una tabla para guardar el resultado del cursor. 
USE proyectoBD;

-- Crear tabla 'ranking' si no existe
CREATE TABLE IF NOT EXISTS ranking (
    TiendaVerde INT
);

