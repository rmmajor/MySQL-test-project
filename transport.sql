-- MySQL Script generated by MySQL Workbench
-- Tue Nov 29 15:03:14 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema transport
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema transport
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `transport` DEFAULT CHARACTER SET utf8 ;
USE `transport` ;

-- -----------------------------------------------------
-- Table `transport`.`Transport_Type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transport`.`Transport_Type` (
  `tranport_type_id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`tranport_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transport`.`Route`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transport`.`Route` (
  `Route_num` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(45) NOT NULL,
  `Transport_Type_id` INT NOT NULL,
  PRIMARY KEY (`Route_num`),
  INDEX `fk_Route_Transport_Type1_idx` (`Transport_Type_id` ASC) VISIBLE,
  CONSTRAINT `fk_Route_Transport_Type1`
    FOREIGN KEY (`Transport_Type_id`)
    REFERENCES `transport`.`Transport_Type` (`tranport_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transport`.`Company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transport`.`Company` (
  `Company_id` INT NOT NULL AUTO_INCREMENT,
  `Country` VARCHAR(45) NOT NULL,
  `company_name` VARCHAR(45) NOT NULL,
  `region` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Company_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transport`.`Driver`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transport`.`Driver` (
  `Driver_id` INT NOT NULL AUTO_INCREMENT,
  `First_name` VARCHAR(45) NOT NULL,
  `Last_name` VARCHAR(45) NOT NULL,
  `Age` INT NOT NULL,
  `Driver_license_category` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Driver_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transport`.`Transport`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transport`.`Transport` (
  `Transport_id` INT NOT NULL AUTO_INCREMENT,
  `max_speed` INT NOT NULL,
  `finance_los` DOUBLE NOT NULL,
  `number_of_passengers` INT NOT NULL,
  `license_plate` VARCHAR(45) NOT NULL,
  `Color` VARCHAR(45) NOT NULL,
  `Route_num` INT NOT NULL,
  `Company_id` INT NOT NULL,
  `Driver_id` INT NOT NULL,
  PRIMARY KEY (`Transport_id`),
  INDEX `fk_Transport_Route1_idx` (`Route_num` ASC) VISIBLE,
  INDEX `fk_Company_Company_Info2_idx` (`Company_id` ASC) VISIBLE,
  INDEX `fk_Transport_Driver1_idx` (`Driver_id` ASC) VISIBLE,
  CONSTRAINT `fk_Transport_Route1`
    FOREIGN KEY (`Route_num`)
    REFERENCES `transport`.`Route` (`Route_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Company_Company_Info2`
    FOREIGN KEY (`Company_id`)
    REFERENCES `transport`.`Company` (`Company_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transport_Driver1`
    FOREIGN KEY (`Driver_id`)
    REFERENCES `transport`.`Driver` (`Driver_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transport`.`Company_Info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transport`.`Company_Info` (
  `Company_id` INT NOT NULL,
  `Registration_date` DATE NOT NULL,
  `Release_date` DATE NOT NULL,
  `number_of_employees` INT NOT NULL,
  PRIMARY KEY (`Company_id`),
  UNIQUE INDEX `Company_id_UNIQUE` (`Company_id` ASC) VISIBLE,
  CONSTRAINT `Company_id`
    FOREIGN KEY (`Company_id`)
    REFERENCES `transport`.`Company` (`Company_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transport`.`Stop`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transport`.`Stop` (
  `Stop_id` INT NOT NULL AUTO_INCREMENT,
  `stop_name` VARCHAR(45) NOT NULL,
  `street_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Stop_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transport`.`Transport_has_Stop`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transport`.`Transport_has_Stop` (
  `Transport_id` INT NOT NULL,
  `Stop_id` INT NOT NULL,
  `Start_time` TIME NOT NULL,
  `Stop_time` TIME NOT NULL,
  `Spanding_time` TIME NOT NULL,
  INDEX `fk_Transport_has_Stop1_Stop1_idx` (`Stop_id` ASC) VISIBLE,
  INDEX `fk_Transport_has_Stop1_Transport1_idx` (`Transport_id` ASC) VISIBLE,
  CONSTRAINT `fk_Transport_has_Stop1_Transport1`
    FOREIGN KEY (`Transport_id`)
    REFERENCES `transport`.`Transport` (`Transport_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transport_has_Stop1_Stop1`
    FOREIGN KEY (`Stop_id`)
    REFERENCES `transport`.`Stop` (`Stop_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
