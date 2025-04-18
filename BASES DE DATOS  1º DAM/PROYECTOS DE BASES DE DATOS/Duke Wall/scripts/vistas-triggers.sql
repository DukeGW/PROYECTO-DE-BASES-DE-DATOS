USE globalmart;

#Actualiza el estado el estadoPago en la tabla Pedido y lo pone en 'pagado' cuando se creas un registro en la tabla Pago. 

DELIMITER //
CREATE TRIGGER trg_actualizar_estado_pago
AFTER INSERT ON pago
FOR EACH ROW
BEGIN
  UPDATE pedido
  SET estadoPago = 'pagado'
  WHERE idPedido = NEW.idPedido;
END;
//
DELIMITER ;

SELECT estadoPago FROM pedido WHERE idPedido = 1;

INSERT INTO pago (idPedido, fechaPago, monto, metodoPago)
VALUES (1, CURDATE(), 100.00, 'Visa');

SELECT estadoPago FROM pedido WHERE idPedido = 1;



#Previene que se inserte un detallepedido si el stock disponible del producto es menor que la cantidad solicitada
DELIMITER //
CREATE TRIGGER trg_verificar_stock BEFORE INSERT ON detallepedido
FOR EACH ROW
BEGIN
  DECLARE stock_actual INT;
  SELECT stock INTO stock_actual
  FROM producto
  WHERE idProducto = NEW.idProducto;

  IF stock_actual < NEW.cantidad THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Stock insuficiente para procesar el pedido';
  END IF;
END;
//
DELIMITER ;

SELECT idProducto, stock FROM producto WHERE idProducto = 11;

INSERT INTO detallepedido (idProducto, cantidad, estadoDePedido, idPedido)
VALUES (11, 10, 'preparando', 1);


#Actualiza el estado de pedido cuando se entrega y aparece 'completado' 

ALTER TABLE Pedido
ADD COLUMN estadoGeneral ENUM('pendiente', 'en proceso', 'completado') DEFAULT 'pendiente';

DELIMITER //

CREATE TRIGGER trg_actualizar_estado_pedido
AFTER UPDATE ON DetallePedido
FOR EACH ROW
BEGIN
  DECLARE detalles_total INT;
  DECLARE detalles_entregados INT;

  -- Solo ejecuta si el estado pasó a 'entregado'
  IF NEW.estadoDePedido = 'entregado' THEN

    -- Contar cuántos detalles tiene ese pedido
    SELECT COUNT(*) INTO detalles_total
    FROM DetallePedido
    WHERE idPedido = NEW.idPedido;

    SELECT COUNT(*) INTO detalles_entregados
    FROM DetallePedido
    WHERE idPedido = NEW.idPedido AND estadoDePedido = 'entregado';

   
    IF detalles_total = detalles_entregados THEN
      UPDATE Pedido
      SET estadoGeneral = 'completado'
      WHERE idPedido = NEW.idPedido;
    END IF;

  END IF;
END;
//

DELIMITER ;


SELECT * FROM DetallePedido WHERE idPedido = 5;
UPDATE DetallePedido
SET estadoDePedido = 'entregado'
WHERE idPedido = 5;
SELECT estadoGeneral FROM Pedido WHERE idPedido = 5;



SHOW TRIGGERS FROM Globalmart;




