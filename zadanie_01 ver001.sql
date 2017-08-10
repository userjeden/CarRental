drop database rental;
create database rental;
use rental;


CREATE TABLE `rental`.`contact` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `phone` VARCHAR(25) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
  
  
CREATE TABLE `rental`.`address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NOT NULL,
  `h_num` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `postal` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
  
  
CREATE TABLE `rental`.`agency` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address_id` INT NOT NULL,
  `contact_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_address_a`
    FOREIGN KEY (`address_id`)
    REFERENCES `rental`.`address` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_contact_a`
    FOREIGN KEY (`contact_id`)
    REFERENCES `rental`.`contact` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


CREATE TABLE `rental`.`customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cname` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `birthdate` DATE NOT NULL,
  `creditcard` BIGINT NOT NULL,
  `address_id` INT NOT NULL,
  `contact_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_address_c`
    FOREIGN KEY (`address_id`)
    REFERENCES `rental`.`address` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_contact_c`
    FOREIGN KEY (`contact_id`)
    REFERENCES `rental`.`contact` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


CREATE TABLE `rental`.`positions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `job` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`));


CREATE TABLE `rental`.`worker` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `wname` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `birthdate` DATE NOT NULL,
  `agency_id` INT NOT NULL,
  `position_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_agency_w`
    FOREIGN KEY (`agency_id`)
    REFERENCES `rental`.`agency` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_position_w`
    FOREIGN KEY (`position_id`)
    REFERENCES `rental`.`positions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE `rental`.`vehicle` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `veh_type` VARCHAR(45) NOT NULL,
  `veh_model` VARCHAR(45) NOT NULL,
  `manufacturer` VARCHAR(45) NOT NULL,
  `prod_year` YEAR NOT NULL,
  `colour` VARCHAR(25) NOT NULL,
  `capacity` INT NOT NULL,
  `horsepower` INT NOT NULL,
  `mileage` INT NOT NULL,
  PRIMARY KEY (`id`));


CREATE TABLE `rental`.`vehicle_worker` (
  `vehicle_id` INT NOT NULL,
  `worker_id` INT NOT NULL,
  CONSTRAINT `fk_vehicle_vw`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `rental`.`vehicle` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_worker_vw`
    FOREIGN KEY (`worker_id`)
    REFERENCES `rental`.`worker` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE `rental`.`lease` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `vehicle_id` INT NOT NULL,
  `lease_value` INT NOT NULL,
  `taken_place_id` INT NOT NULL,
  `taken_date` DATE NOT NULL,
  `return_place_id` INT NOT NULL,
  `return_date` DATE NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `rental`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehicle_id`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `rental`.`vehicle` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_taken_place_id`
    FOREIGN KEY (`taken_place_id`)
    REFERENCES `rental`.`agency` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_return_place_id`
    FOREIGN KEY (`return_place_id`)
    REFERENCES `rental`.`agency` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


