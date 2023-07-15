-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema littleLemon
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema littleLemon
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `littleLemon` DEFAULT CHARACTER SET utf8 ;
USE `littleLemon` ;

-- -----------------------------------------------------
-- Table `littleLemon`.`orders_delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littleLemon`.`orders_delivery` (
  `order_delivery_id` INT NOT NULL,
  `delivery_date` DATE NOT NULL,
  `status` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`order_delivery_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littleLemon`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littleLemon`.`staff` (
  `staff_id` INT NOT NULL,
  `role` VARCHAR(100) NOT NULL,
  `salary` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`staff_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littleLemon`.`cuisines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littleLemon`.`cuisines` (
  `cuisine_id` INT NOT NULL,
  `cuisine_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`cuisine_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littleLemon`.`items_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littleLemon`.`items_type` (
  `item_type_id` INT NOT NULL,
  `item_type_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`item_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littleLemon`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littleLemon`.`customers` (
  `customer_id` INT NOT NULL,
  `customer_name` VARCHAR(100) NOT NULL,
  `telefone` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littleLemon`.`menu_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littleLemon`.`menu_items` (
  `menu_item_id` INT NOT NULL,
  `item_name` VARCHAR(100) NOT NULL,
  `price` VARCHAR(100) NOT NULL,
  `cuisine_id` INT NOT NULL,
  `item_type_id` INT NOT NULL,
  PRIMARY KEY (`menu_item_id`),
  INDEX `item_type_id_idx` (`item_type_id` ASC) VISIBLE,
  INDEX `cuisine_id_idx` (`cuisine_id` ASC) VISIBLE,
  CONSTRAINT `item_type_id`
    FOREIGN KEY (`item_type_id`)
    REFERENCES `littleLemon`.`items_type` (`item_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cuisine_id`
    FOREIGN KEY (`cuisine_id`)
    REFERENCES `littleLemon`.`cuisines` (`cuisine_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littleLemon`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littleLemon`.`orders` (
  `order_id` INT NOT NULL,
  `order_date` DATE NOT NULL,
  `total_cost` DECIMAL(10,2) NOT NULL,
  `staff_id` INT NOT NULL,
  `customer_id` VARCHAR(45) NULL,
  PRIMARY KEY (`order_id`),
  INDEX `staff_id_idx` (`staff_id` ASC) VISIBLE,
  CONSTRAINT `staff_id`
    FOREIGN KEY (`staff_id`)
    REFERENCES `littleLemon`.`staff` (`staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `customer_id`
    FOREIGN KEY ()
    REFERENCES `littleLemon`.`customers` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `orders_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `littleLemon`.`orders_delivery` (`order_delivery_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littleLemon`.`orders_menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littleLemon`.`orders_menu` (
  `order_menu_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  `menu_item_id` INT NOT NULL,
  `quantity` INT NULL,
  PRIMARY KEY (`order_menu_id`),
  INDEX `order_id_idx` (`order_id` ASC) VISIBLE,
  INDEX `menu_item_id_idx` (`menu_item_id` ASC) VISIBLE,
  CONSTRAINT `order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `littleLemon`.`orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `menu_item_id`
    FOREIGN KEY (`menu_item_id`)
    REFERENCES `littleLemon`.`menu_items` (`menu_item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littleLemon`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littleLemon`.`bookings` (
  `booking_id` INT NOT NULL,
  `date` DATE NOT NULL,
  `slot_hours` INT NOT NULL,
  `table_number` INT NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`booking_id`),
  INDEX `customer_id_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `littleLemon`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
