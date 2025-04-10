-- MySQL Workbench Synchronization
-- Generated: 2025-04-10 18:18
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Usuario

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `GlobalMart` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `GlobalMart`.`proveedor` (
  `idProveedor` INT(11) NOT NULL AUTO_INCREMENT,
  `cif` VARCHAR(10) NOT NULL,
  `correo` VARCHAR(25) NOT NULL,
  `numeroDeContacto` INT(11) NOT NULL,
  `direccionProveedor` TEXT NOT NULL,
  PRIMARY KEY (`idProveedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `GlobalMart`.`productos` (
  `idProducto` INT(11) NOT NULL AUTO_INCREMENT,
  `nombreProducto` VARCHAR(45) NOT NULL,
  `fechaCaducidad` DATE NULL DEFAULT NULL,
  `stock` INT(11) NOT NULL,
  `precioProducto` DECIMAL NOT NULL,
  `proveedor_idProveedor` INT(11) NOT NULL,
  `pedido_idPedido` INT(11) NOT NULL,
  PRIMARY KEY (`idProducto`),
  INDEX `fk_productos_proveedor_idx` (`proveedor_idProveedor` ASC) VISIBLE,
  INDEX `fk_productos_pedido1_idx` (`pedido_idPedido` ASC) VISIBLE,
  CONSTRAINT `fk_productos_proveedor`
    FOREIGN KEY (`proveedor_idProveedor`)
    REFERENCES `GlobalMart`.`proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_pedido1`
    FOREIGN KEY (`pedido_idPedido`)
    REFERENCES `GlobalMart`.`pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `GlobalMart`.`pedido` (
  `idPedido` INT(11) NOT NULL AUTO_INCREMENT,
  `idProducto` INT(11) NOT NULL,
  `fechaDePedido` DATE NOT NULL,
  `estadoDePedido` ENUM('preparando', 'reparto', 'entregado') NOT NULL,
  `cliente_idCliente` INT(11) NOT NULL,
  `detallePedido_idDetallePedido` INT(11) NOT NULL,
  PRIMARY KEY (`idPedido`),
  INDEX `fk_pedido_cliente1_idx` (`cliente_idCliente` ASC) VISIBLE,
  INDEX `fk_pedido_detallePedido1_idx` (`detallePedido_idDetallePedido` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_cliente1`
    FOREIGN KEY (`cliente_idCliente`)
    REFERENCES `GlobalMart`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_detallePedido1`
    FOREIGN KEY (`detallePedido_idDetallePedido`)
    REFERENCES `GlobalMart`.`detallePedido` (`idDetallePedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `GlobalMart`.`cliente` (
  `idCliente` INT(11) NOT NULL AUTO_INCREMENT,
  `tipoCliente` ENUM('particular', 'empresa') NOT NULL,
  `nombreCliente` VARCHAR(50) NOT NULL,
  `preferenciaDePago` ENUM('MasterCard', 'Visa') NULL DEFAULT NULL,
  `telefonoCliente` INT(11) NULL DEFAULT NULL,
  `correoCliente` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `GlobalMart`.`detallePedido` (
  `idDetallePedido` INT(11) NOT NULL AUTO_INCREMENT,
  `idPedido` INT(11) NOT NULL,
  `idProducto` INT(11) NOT NULL,
  `cantidad` INT(11) NOT NULL,
  `direccionEntrega` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`idDetallePedido`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

