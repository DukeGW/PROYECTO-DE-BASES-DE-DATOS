USE globalmart;

#Que nos muestre los produsctos fuera de stock
SELECT nombreProducto, stock
FROM producto
WHERE stock = 0;

#Mostar los tipos te clientes con su método de pago.
SELECT idCliente, nombreCliente, tipoCliente, preferenciaDePago
FROM cliente;

#Ordenar los productos más caros a los mas baratos.
SELECT idProducto, nombreProducto, precioProducto
FROM producto
ORDER BY precioProducto DESC;

#Ver los pedidos que hay por estado. 
SELECT estadoDePedido, COUNT(*) AS total
FROM detallepedido
GROUP BY estadoDePedido;

#Ver cuando el cliente realizo el pedido y el estado en el que esta. Para poder ver si hay demoras. 
SELECT pedido.idPedido, pedido.fechaDePedido, detallepedido.estadoDePedido, cliente.nombreCliente
FROM pedido
JOIN detallepedido ON pedido.idPedido = detallepedido.idPedido
JOIN cliente ON pedido.idCliente = cliente.idCliente
ORDER BY pedido.fechaDePedido DESC;


#Ver el precio Total de cada pedido
SELECT pedido.idPedido, pedido.fechaDePedido, cliente.nombreCliente, SUM(producto.precioProducto * detallepedido.cantidad) AS totalPedido
FROM pedido
JOIN cliente ON pedido.idCliente = cliente.idCliente
JOIN detallepedido ON pedido.idPedido = detallepedido.idPedido
JOIN producto ON detallepedido.idProducto = producto.idProducto
GROUP BY pedido.idPedido, cliente.nombreCliente, pedido.fechaDePedido
ORDER BY totalPedido DESC;

#Mostrar todos los productos que han sido pedidos
SELECT producto.nombreProducto, SUM(detallepedido.cantidad) AS totalUnidadesPedidas
FROM detallepedido
JOIN producto ON detallepedido.idProducto = producto.idProducto
GROUP BY producto.nombreProducto
ORDER BY totalUnidadesPedidas DESC;

