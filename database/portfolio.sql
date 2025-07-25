-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `id` VARCHAR(36) NOT NULL,
  `username` VARCHAR(64) NOT NULL,
  `email` VARCHAR(64) NOT NULL,
  `password` TEXT(60) NOT NULL,
  `points` INT NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`proposals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`proposals` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(64) NOT NULL,
  `proposta` VARCHAR(2048) NOT NULL,
  `orc_base` DECIMAL NULL,
  `orc_teto` DECIMAL NULL,
  `term_max` DATE NULL,
  `status` ENUM("accept", "pending", "refused") NOT NULL,
  `user_id` VARCHAR(36) NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `end_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_proposals_users_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_proposals_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`feedbacks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`feedbacks` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `starts` TINYINT NOT NULL,
  `comment` VARCHAR(1024) NOT NULL,
  `proposal_id` INT NOT NULL,
  `user_id` VARCHAR(36) NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_feedbacks_proposals1_idx` (`proposal_id` ASC) VISIBLE,
  INDEX `fk_feedbacks_users1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_feedbacks_proposals1`
    FOREIGN KEY (`proposal_id`)
    REFERENCES `mydb`.`proposals` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_feedbacks_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
