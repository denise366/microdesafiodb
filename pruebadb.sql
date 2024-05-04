-- MySQL Script generated by MySQL Workbench
-- Mon Apr 29 23:22:00 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Entregable
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Entregable
-- -----------------------------------------------------
DROP database if exists entregable;
CREATE SCHEMA IF NOT EXISTS `Entregable` DEFAULT CHARACTER SET utf8mb4 ;
USE `Entregable` ;

-- -----------------------------------------------------
-- Table `Entregable`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Entregable`.`categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Entregable`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Entregable`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(45) NULL,
  `categoria_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuarios_categoria1_idx` (`categoria_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_categoria1`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `Entregable`.`categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Entregable`.`cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Entregable`.`cursos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(250) NOT NULL,
  `descripcion` VARCHAR(250) NOT NULL,
  `imagen` BLOB NULL,
  `fecha_inicio` VARCHAR(45) NOT NULL,
  `fecha_finalizacion` VARCHAR(45) NOT NULL,
  `cupo_maximo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Entregable`.`unidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Entregable`.`unidades` (
  `id` INT NOT NULL,
  `titulo` VARCHAR(250) NOT NULL,
  `descripcion` VARCHAR(250) NOT NULL,
  `fecha__inicio` VARCHAR(45) NOT NULL,
  `cursos_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_unidades_cursos1_idx` (`cursos_id` ASC) VISIBLE,
  CONSTRAINT `fk_unidades_cursos1`
    FOREIGN KEY (`cursos_id`)
    REFERENCES `Entregable`.`cursos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Entregable`.`usuarios_cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Entregable`.`usuarios_cursos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuarios_id` INT NOT NULL,
  `cursos_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuarios_has_cursos_cursos1_idx` (`cursos_id` ASC) VISIBLE,
  INDEX `fk_usuarios_has_cursos_usuarios_idx` (`usuarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_has_cursos_usuarios`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `Entregable`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_has_cursos_cursos1`
    FOREIGN KEY (`cursos_id`)
    REFERENCES `Entregable`.`cursos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Entregable`.`clases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Entregable`.`clases` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(250) NOT NULL,
  `descripcion` VARCHAR(250) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `marca_visibilidad` BOOLEAN NOT NULL,
  `unidades_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_clases_unidades1_idx` (`unidades_id` ASC) VISIBLE,
  CONSTRAINT `fk_clases_unidades1`
    FOREIGN KEY (`unidades_id`)
    REFERENCES `Entregable`.`unidades` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Entregable`.`bloques`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Entregable`.`bloques` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `contenido` VARCHAR(45) NOT NULL,
  `clases_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_bloques_clases1_idx` (`clases_id` ASC) VISIBLE,
  CONSTRAINT `fk_bloques_clases1`
    FOREIGN KEY (`clases_id`)
    REFERENCES `Entregable`.`clases` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;