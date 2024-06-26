-- MySQL Script generated by MySQL Workbench
-- Sun Jun  9 22:00:19 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema miru_1.1.1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema miru_1.1.1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `miru_1.1.1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `miru_1.1.1` ;

-- -----------------------------------------------------
-- Table `miru_1.1.1`.`contenido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miru_1.1.1`.`contenido` (
  `id_contenido` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(255) NOT NULL,
  `anio_lanzamiento` YEAR NOT NULL,
  PRIMARY KEY (`id_contenido`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `miru_1.1.1`.`estudioanimacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miru_1.1.1`.`estudioanimacion` (
  `id_estudio` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_estudio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `miru_1.1.1`.`anime`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miru_1.1.1`.`anime` (
  `id_anime` INT NOT NULL AUTO_INCREMENT,
  `id_contenido` INT NULL DEFAULT NULL,
  `capitulos` INT NULL DEFAULT NULL,
  `id_estudio` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_anime`),
  INDEX `id_contenido` (`id_contenido` ASC) VISIBLE,
  INDEX `id_estudio` (`id_estudio` ASC) VISIBLE,
  CONSTRAINT `anime_ibfk_1`
    FOREIGN KEY (`id_contenido`)
    REFERENCES `miru_1.1.1`.`contenido` (`id_contenido`),
  CONSTRAINT `anime_ibfk_2`
    FOREIGN KEY (`id_estudio`)
    REFERENCES `miru_1.1.1`.`estudioanimacion` (`id_estudio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `miru_1.1.1`.`videojuego`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miru_1.1.1`.`videojuego` (
  `id_videojuego` INT NOT NULL AUTO_INCREMENT,
  `id_contenido` INT NULL DEFAULT NULL,
  `plataforma` VARCHAR(255) NULL DEFAULT NULL,
  `id_desarrollador` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_videojuego`),
  INDEX `id_contenido` (`id_contenido` ASC) VISIBLE,
  INDEX `id_desarrollador` (`id_desarrollador` ASC) VISIBLE,
  CONSTRAINT `videojuego_ibfk_1`
    FOREIGN KEY (`id_contenido`)
    REFERENCES `miru_1.1.1`.`contenido` (`id_contenido`),
  CONSTRAINT `videojuego_ibfk_2`
    FOREIGN KEY (`id_desarrollador`)
    REFERENCES `miru_1.1.1`.`desarrollador` (`id_desarrollador`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `miru_1.1.1`.`desarrollador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miru_1.1.1`.`desarrollador` (
  `id_desarrollador` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NULL DEFAULT NULL,
  `id_videojuego` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_desarrollador`),
  INDEX `id_videojuego` (`id_videojuego` ASC) VISIBLE,
  CONSTRAINT `desarrollador_ibfk_1`
    FOREIGN KEY (`id_videojuego`)
    REFERENCES `miru_1.1.1`.`videojuego` (`id_videojuego`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `miru_1.1.1`.`director`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miru_1.1.1`.`director` (
  `id_director` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_director`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `miru_1.1.1`.`genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miru_1.1.1`.`genero` (
  `id_genero` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id_genero`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `miru_1.1.1`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miru_1.1.1`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `contrasena` VARCHAR(45) NOT NULL,
  `año_nacimiento` DATE NOT NULL,
  `edad` INT NOT NULL,
  `genero_de_interes` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


-- -----------------------------------------------------
-- Table `miru_1.1.1`.`lista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miru_1.1.1`.`lista` (
  `id_lista` INT NOT NULL AUTO_INCREMENT,
  `fecha_creacion` DATE NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_lista`),
  INDEX `id_usuario` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `lista_ibfk_1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `miru_1.1.1`.`usuario` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `miru_1.1.1`.`pelicula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miru_1.1.1`.`pelicula` (
  `id_pelicula` INT NOT NULL AUTO_INCREMENT,
  `id_contenido` INT NULL DEFAULT NULL,
  `duracion` INT NULL DEFAULT NULL,
  `id_director` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_pelicula`),
  INDEX `id_contenido` (`id_contenido` ASC) VISIBLE,
  INDEX `id_director` (`id_director` ASC) VISIBLE,
  CONSTRAINT `pelicula_ibfk_1`
    FOREIGN KEY (`id_contenido`)
    REFERENCES `miru_1.1.1`.`contenido` (`id_contenido`),
  CONSTRAINT `pelicula_ibfk_2`
    FOREIGN KEY (`id_director`)
    REFERENCES `miru_1.1.1`.`director` (`id_director`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `miru_1.1.1`.`productora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miru_1.1.1`.`productora` (
  `id_productora` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_productora`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `miru_1.1.1`.`registro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miru_1.1.1`.`registro` (
  `id_registro` INT NOT NULL AUTO_INCREMENT,
  `puntuacion` INT NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `id_usuario` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_registro`),
  INDEX `id_usuario` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `id_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `miru_1.1.1`.`usuario` (`id_usuario`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


-- -----------------------------------------------------
-- Table `miru_1.1.1`.`reseña`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miru_1.1.1`.`reseña` (
  `id_reseña` INT NOT NULL,
  `fecha` INT NOT NULL,
  `texto` VARCHAR(45) NOT NULL,
  `id_usuario` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_reseña`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `miru_1.1.1`.`serie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miru_1.1.1`.`serie` (
  `id_serie` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(255) NULL DEFAULT NULL,
  `id_contenido` INT NULL DEFAULT NULL,
  `temporadas` INT NULL DEFAULT NULL,
  `id_director` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_serie`),
  INDEX `id_contenido` (`id_contenido` ASC) VISIBLE,
  INDEX `id_director` (`id_director` ASC) VISIBLE,
  CONSTRAINT `serie_ibfk_1`
    FOREIGN KEY (`id_contenido`)
    REFERENCES `miru_1.1.1`.`contenido` (`id_contenido`),
  CONSTRAINT `serie_ibfk_2`
    FOREIGN KEY (`id_director`)
    REFERENCES `miru_1.1.1`.`director` (`id_director`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
