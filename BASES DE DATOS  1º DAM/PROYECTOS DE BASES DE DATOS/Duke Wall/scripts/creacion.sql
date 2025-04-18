SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `Globalmart` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `Globalmart`.`Proveedor` (
  `idProveedor` INT(11) NOT NULL AUTO_INCREMENT,
  `cif` VARCHAR(10) NOT NULL,
  `correo` VARCHAR(25) NOT NULL,
  `numeroDeContacto` INT(11) NOT NULL,
  `direccionProveedor` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`idProveedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Globalmart`.`Cliente` (
  `idCliente` INT(11) NOT NULL AUTO_INCREMENT,
  `tipoCliente` ENUM('particular', 'empresa') NOT NULL,
  `nombreCliente` VARCHAR(45) NOT NULL,
  `preferenciaDePago` ENUM('MasterCard', 'Visa') NULL DEFAULT NULL,
  `telefonoCliente` INT(11) NULL DEFAULT NULL,
  `correoCliente` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Globalmart`.`Pedido` (
  `idPedido` INT(11) NOT NULL AUTO_INCREMENT,
  `idProducto` INT(11) NOT NULL,
  `fechaDePedido` DATE NOT NULL,
  `direccionEntrega` MEDIUMTEXT NOT NULL,
  `idCliente` INT(11) NOT NULL,
  PRIMARY KEY (`idPedido`),
  INDEX `fk_Pedido_Cliente1_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_Cliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `Globalmart`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Globalmart`.`Producto` (
  `idProducto` INT(11) NOT NULL AUTO_INCREMENT,
  `nombreProducto` VARCHAR(45) NOT NULL,
  `fechaCaducidad` DATE NULL DEFAULT NULL,
  `stock` INT(11) NOT NULL,
  `precioProducto` DECIMAL(10,2) NOT NULL,
  `idProveedor` INT(11) NOT NULL,
  `idPedido` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idProducto`),
  INDEX `fk_Producto_Proveedor_idx` (`idProveedor` ASC) VISIBLE,
  INDEX `fk_Producto_Pedido1_idx` (`idPedido` ASC) VISIBLE,
  CONSTRAINT `fk_Producto_Proveedor`
    FOREIGN KEY (`idProveedor`)
    REFERENCES `Globalmart`.`Proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_Pedido1`
    FOREIGN KEY (`idPedido`)
    REFERENCES `Globalmart`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Globalmart`.`DetallePedido` (
  `idDetallePedido` INT(11) NOT NULL AUTO_INCREMENT,
  `idProducto` INT(11) NOT NULL,
  `cantidad` INT(11) NOT NULL,
  `estadoDePedido` ENUM('preparando', 'reparto', 'entregado') NOT NULL,
  `idPedido` INT(11) NOT NULL,
  INDEX `fk_DetallePedido_Pedido1_idx` (`idPedido` ASC) VISIBLE,
  PRIMARY KEY (`idDetallePedido`),
  CONSTRAINT `fk_DetallePedido_Pedido1`
    FOREIGN KEY (`idPedido`)
    REFERENCES `Globalmart`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
