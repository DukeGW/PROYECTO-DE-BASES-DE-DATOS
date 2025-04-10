
###INSERTADO DE DATOS
# Aqui añadiremos los datos y tambien podremos ver si esta funcionando correctamente el "SELECT"

#PROVEEDOR
INSERT INTO proveedor (cif, correo, numeroDeContacto, direccionProveedor)
VALUES 
('B98742356', 'dwall@globalmart.com', 697654291, 'C. Aguere, 17, 38005 Santa Cruz de Tenerife');

SELECT * FROM proveedor;

# CLIENTE 
INSERT INTO cliente (tipoCliente, nombreCliente, preferenciaDePago, telefonoCliente, correoCliente)
VALUES
('particular', 'Juan Pérez', 'Visa', 600123456, 'juan@mail.com'),
('empresa', 'TechCorp S.L.', 'MasterCard', 911223344, 'contacto@techcorp.com'),
('particular', 'Cristina Afonso', 'Visa', 679504325, null),
('particular', 'Elen Chufe', 'Visa', null, 'echufe@gmail.com'),
('empresa', 'HelmetCleaner', 'Visa', 922654378, 'helms@criscleansit.com'), 
('particular', 'Jose Manuel', 'MasterCard', 675439889, null);

SELECT * FROM cliente;

# Luego el PRODUCTOS
INSERT INTO producto(idProducto, idProveedor, nombreProducto, fechaCaducidad, stock, precioProducto,idPedido)
VALUES
(DEFAULT, 1, "Mochila de viaje", null, 32, 49.99, null),
(DEFAULT, 1, "Fertilizante plantas aromáticas", "12-09-2027", 123, 6.65, null),
(DEFAULT, 1, "Tabla de surf", null, 5, 120, null),
(DEFAULT, 1, "Llavero de StarWars", null, 0, 5, null),
(DEFAULT, 1, "Stannley Cup", null, 436, 33.79),
(DEFAULT, 1, "Vela aroma Oakwood", "04-12-2030", 12, 12.50, null),
(DEFAULT, 1, "Tira de luces LED", null, 178, 9.98, null),
(DEFAULT, 1, "Juego de mesa CATAN", null, 2, 80, null);

SELECT * FROM producto;
