#En el script de ampliacion poder ayadir tablas o columnas que creemos que nos hace falta

USE globalmart;

#Añadiremos una fecha de registro en la tabla de cliente
ALTER TABLE cliente
  ADD COLUMN fechaRegistro DATE NOT NULL;
  
  #Tambien añadiremos el estado del pago en la tabla de pedido
  ALTER TABLE pedido
  ADD COLUMN estadoPago ENUM('pendiente', 'pagado', 'cancelado') NOT NULL;
  
  
  # Luego es super importante añadir una feacha de estimación de la entrega, que lo añadiremos en la tabla de detallepedido
  ALTER TABLE detallepedido
  ADD COLUMN fechaEstimadaEntrega DATE NULL;
  
  
#Vamos a crear una tabla de Pago, donde pondremos la fecha de pago
CREATE TABLE IF NOT EXISTS `Globalmart`.`Pago` (
  `idPago` INT NOT NULL AUTO_INCREMENT,
  `idPedido` INT NOT NULL,
  `fechaPago` DATE NOT NULL,
  `metodoPago` ENUM('MasterCard', 'Visa') NOT NULL,
  PRIMARY KEY (`idPago`),
  INDEX `fk_Pago_Pedido_idx` (`idPedido` ASC),
  CONSTRAINT `fk_Pago_Pedido`
    FOREIGN KEY (`idPedido`)
    REFERENCES `Pedido` (`idPedido`)
    );
    
