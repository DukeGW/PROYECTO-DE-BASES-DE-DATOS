
###INSERTADO DE DATOS
# Aqui añadiremos los datos y tambien podremos ver si esta funcionando correctamente el "SELECT"

#PROVEEDOR
INSERT INTO globalmart.proveedor (cif, correo, numeroDeContacto, direccionProveedor) 
VALUE
('B98742356', 'dwall@meandplants.com', 697654291, 'C. Aguere, 17, 38005 Santa Cruz de Tenerife'),
('B12569878','med@surfsup.com', 679505439, 'Av. de San Sebastián, 152, 38005 Santa Cruz de Tenerife'),
('B94756357', 'geeks@general.com', 679452863, 'C. Nava y Grimon, 18, 38201 La Laguna, Santa Cruz de Tenerife'),
('B47986542', 'stanley@operations.com', 988745712, 'Polígono Industrial Granadilla, PARCELA, 62, A, 38619, Santa Cruz de Tenerife'),
('B7856+635', 'ikea@canariastnf.com', 634687821, 'Parque Comercial, C. Aceviño, 9, 38205 La Laguna, Santa Cruz de Tenerife');

 

SELECT * FROM globalmart.proveedor;

# CLIENTE 
INSERT INTO globalmart.cliente (tipoCliente, nombreCliente, preferenciaDePago, telefonoCliente, correoCliente)
VALUES
('particular', 'Juan Pérez', 'Visa', 600123456, 'juan@mail.com'),
('empresa', 'TechCorp S.L.', 'MasterCard', 911223344, 'contacto@techcorp.com'),
('particular', 'Cristina Afonso', 'Visa', 679504325, null),
('particular', 'Elen Chufe', 'Visa', null, 'echufe@gmail.com'),
('empresa', 'HelmetCleaner', 'Visa', 922654378, 'helms@criscleansit.com'), 
('particular', 'Jose Manuel', 'MasterCard', 675439889, null);


SELECT * FROM globalmart.cliente;


# Luego el PRODUCTOS
INSERT INTO globalmart.producto(idProveedor,nombreProducto, fechaCaducidad, stock, precioProducto)
VALUES
( 5, 'Mochila de viaje', null, 32, 49.99),
( 1, 'Fertilizante plantas aromáticas', '2027-09-17', 123, 6.65),
( 2, 'Tabla de surf', null, 5, 120),
( 3, 'Llavero de StarWars', null, 0, 5),
( 4, 'Stannley Cup', null, 436, 33.79),
( 5, 'Vela aroma Oakwood', '2030-12-04', 12, 12.50),
( 5, 'Tira de luces LED', null, 178, 9.98),
( 3, 'Juego de mesa CATAN', null, 2, 80);

SELECT * FROM globalmart.producto;


# El PEDIDO

INSERT INTO globalmart.pedido (fechaDePedido, direccionEntrega, idCliente)
VALUE
('2025-02-04', 'Calle Adan Martin, 13, 38005', 3),
('2025-01-05', 'Calle del Agua, 5, planta 2, puerta h', 1),
('2025-04-01', 'Avenda Mencey, 2, planta 1, puetra 3', 6),
('2024-12-29', 'Calle del Agua, 5, planta 2, puerta h', 1),
('2025-04-15', 'Avd. Los Majuelos, 4', 2),
('2025-03-21', 'Avenida Castellon, planta 6, puerta 15', 4);


SELECT * FROM globalmart.pedido;

INSERT INTO globalmart.detallepedido(idProducto, cantidad, estadoDePedido, idPedido)
VALUE 
(1, 1, 'preparando', 1),
(3, 1, 'entregado', 4),
(2, 10,'preparando', 5),
(6, 3, 'reparto', 3),
(8, 1, 'entregado', 2),
(7, 6, 'entregado', 6);

SELECT * FROM globalmart.detallepedido;
 
