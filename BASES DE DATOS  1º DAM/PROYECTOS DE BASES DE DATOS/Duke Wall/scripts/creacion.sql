-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema globalmart
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema globalmart
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `globalmart` DEFAULT CHARACTER SET utf8 ;
USE `globalmart` ;

-- -----------------------------------------------------
-- Table `globalmart`.`proveedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `globalmart`.`proveedor` ;

CREATE TABLE IF NOT EXISTS `globalmart`.`proveedor` (
  `idProveedor` INT NOT NULL AUTO_INCREMENT,
  `cif` VARCHAR(10) NOT NULL,
  `correo` VARCHAR(25) NOT NULL,
  `numeroDeContacto` INT NOT NULL,
  `direccionProveedor` TEXT NOT NULL,
  PRIMARY KEY (`idProveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `globalmart`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `globalmart`.`cliente` ;

CREATE TABLE IF NOT EXISTS `globalmart`.`cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `tipoCliente` ENUM('particular', 'empresa') NOT NULL,
  `nombreCliente` VARCHAR(50) NOT NULL,
  `identificadorCliente` INT NOT NULL,
  `preferenciaDePago` ENUM('MasterCard', 'Visa') NULL,
  `telefonoCliente` INT NULL,
  `correoCliente` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `globalmart`.`detallePedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `globalmart`.`detallePedido` ;

CREATE TABLE IF NOT EXISTS `globalmart`.`detallePedido` (
  `idDetallePedido` INT NOT NULL AUTO_INCREMENT,
  `idPedido` INT NOT NULL,
  `idProducto` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `direccionEntrega` TEXT NULL,
  PRIMARY KEY (`idDetallePedido`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `globalmart`.`pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `globalmart`.`pedido` ;

CREATE TABLE IF NOT EXISTS `globalmart`.`pedido` (
  `idPedido` INT NOT NULL AUTO_INCREMENT,
  `idProducto` INT NOT NULL,
  `idCliente` INT NOT NULL,
  `fechaDePedido` DATE NOT NULL,
  `estadoDePedido` ENUM('preparando', 'reparto', 'entregado') NOT NULL,
  `cliente_idCliente` INT NOT NULL,
  `detallePedido_idDetallePedido` INT NOT NULL,
  PRIMARY KEY (`idPedido`),
  CONSTRAINT `fk_pedido_cliente1`
    FOREIGN KEY (`cliente_idCliente`)
    REFERENCES `globalmart`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_detallePedido1`
    FOREIGN KEY (`detallePedido_idDetallePedido`)
    REFERENCES `globalmart`.`detallePedido` (`idDetallePedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_pedido_cliente1_idx` ON `globalmart`.`pedido` (`cliente_idCliente` ASC) VISIBLE;

CREATE INDEX `fk_pedido_detallePedido1_idx` ON `globalmart`.`pedido` (`detallePedido_idDetallePedido` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `globalmart`.`productos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `globalmart`.`productos` ;

CREATE TABLE IF NOT EXISTS `globalmart`.`productos` (
  `idProducto` INT NOT NULL AUTO_INCREMENT,
  `idProveedor` INT NOT NULL,
  `nombreProducto` VARCHAR(45) NOT NULL,
  `envase` ENUM('fragil', 'noFragil') NOT NULL,
  `codigoDeBarra` INT NOT NULL,
  `fechaCaducidad` DATE NULL,
  `stock` INT NOT NULL,
  `precioProducto` DECIMAL NOT NULL,
  `proveedor_idProveedor` INT NOT NULL,
  `pedido_idPedido` INT NOT NULL,
  PRIMARY KEY (`idProducto`),
  CONSTRAINT `fk_productos_proveedor`
    FOREIGN KEY (`proveedor_idProveedor`)
    REFERENCES `globalmart`.`proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_pedido1`
    FOREIGN KEY (`pedido_idPedido`)
    REFERENCES `globalmart`.`pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_productos_proveedor_idx` ON `globalmart`.`productos` (`proveedor_idProveedor` ASC) VISIBLE;

CREATE INDEX `fk_productos_pedido1_idx` ON `globalmart`.`productos` (`pedido_idPedido` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
