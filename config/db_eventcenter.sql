-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema db_eventcenter
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_eventcenter
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_eventcenter` DEFAULT CHARACTER SET utf8 ;
USE `db_eventcenter` ;

-- -----------------------------------------------------
-- Table `db_eventcenter`.`locais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_eventcenter`.`locais` (
  `id` BIGINT(20) UNSIGNED NOT NULL,
  `nome` VARCHAR(100) NULL,
  `municipio` VARCHAR(100) NULL,
  `bairro` VARCHAR(100) NULL,
  `endereco` VARCHAR(100) NULL,
  `latitude` DOUBLE NULL,
  `longitude` DOUBLE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_eventcenter`.`setores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_eventcenter`.`setores` (
  `id` BIGINT(20) UNSIGNED NOT NULL,
  `local_id` BIGINT(20) UNSIGNED NOT NULL,
  `nome` VARCHAR(50) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_setores_locais_idx` (`local_id` ASC),
  CONSTRAINT `fk_setores_locais`
    FOREIGN KEY (`local_id`)
    REFERENCES `db_eventcenter`.`locais` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_eventcenter`.`generos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_eventcenter`.`generos` (
  `id` BIGINT(20) UNSIGNED NOT NULL,
  `nome` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_eventcenter`.`eventos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_eventcenter`.`eventos` (
  `id` BIGINT(20) UNSIGNED NOT NULL,
  `local_id` BIGINT(20) UNSIGNED NOT NULL,
  `genero_id` BIGINT(20) UNSIGNED NOT NULL,
  `edicao` INT NULL,
  `nome` VARCHAR(100) NULL,
  `descricao` VARCHAR(1500) NULL,
  `data` DATE NULL,
  `hora` TIME NULL,
  `duracao` INT NULL,
  `situacao` VARCHAR(30) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_eventos_generos1_idx` (`genero_id` ASC),
  INDEX `fk_eventos_locais1_idx` (`local_id` ASC),
  CONSTRAINT `fk_eventos_generos1`
    FOREIGN KEY (`genero_id`)
    REFERENCES `db_eventcenter`.`generos` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_eventos_locais1`
    FOREIGN KEY (`local_id`)
    REFERENCES `db_eventcenter`.`locais` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_eventcenter`.`programacoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_eventcenter`.`programacoes` (
  `id` BIGINT(20) UNSIGNED NOT NULL,
  `evento_id` BIGINT(20) UNSIGNED NOT NULL,
  `setor_id` BIGINT(20) UNSIGNED NOT NULL,
  `genero_id` BIGINT(20) UNSIGNED NOT NULL,
  `nome` VARCHAR(100) NULL,
  `descricao` VARCHAR(1500) NULL,
  `data` DATE NULL,
  `hora` TIME NULL,
  `duracao` INT NULL,
  `situacao` VARCHAR(30) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_programacoes_setores1_idx` (`setor_id` ASC),
  INDEX `fk_programacoes_generos1_idx` (`genero_id` ASC),
  INDEX `fk_programacoes_eventos1_idx` (`evento_id` ASC),
  CONSTRAINT `fk_programacoes_setores1`
    FOREIGN KEY (`setor_id`)
    REFERENCES `db_eventcenter`.`setores` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_programacoes_generos1`
    FOREIGN KEY (`genero_id`)
    REFERENCES `db_eventcenter`.`generos` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_programacoes_eventos1`
    FOREIGN KEY (`evento_id`)
    REFERENCES `db_eventcenter`.`eventos` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
