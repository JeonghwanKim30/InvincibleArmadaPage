-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema invinciblearmada
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema invinciblearmada
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `invinciblearmada` DEFAULT CHARACTER SET utf8mb3 ;
USE `invinciblearmada` ;

-- -----------------------------------------------------
-- Table `invinciblearmada`.`team`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `invinciblearmada`.`team` (
  `team_no` INT NOT NULL AUTO_INCREMENT,
  `team_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`team_no`),
  UNIQUE INDEX `team_name_UNIQUE` (`team_name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `invinciblearmada`.`team_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `invinciblearmada`.`team_detail` (
  `team_no` INT NOT NULL,
  `team_win_count` INT NULL DEFAULT '0',
  `team_lose_count` INT NULL DEFAULT '0',
  `rating` INT NULL DEFAULT '0',
  PRIMARY KEY (`team_no`),
  CONSTRAINT `team_detail_team_no_fk`
    FOREIGN KEY (`team_no`)
    REFERENCES `invinciblearmada`.`team` (`team_no`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `invinciblearmada`.`team_video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `invinciblearmada`.`team_video` (
  `team_no` INT NOT NULL,
  `video_link` VARCHAR(100) NOT NULL,
  INDEX `team_video_team_no_fk` (`team_no` ASC) VISIBLE,
  CONSTRAINT `team_video_team_no_fk`
    FOREIGN KEY (`team_no`)
    REFERENCES `invinciblearmada`.`team` (`team_no`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `invinciblearmada`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `invinciblearmada`.`user` (
  `user_no` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(45) NOT NULL,
  `user_password` VARCHAR(45) NOT NULL,
  `user_id` VARCHAR(45) NOT NULL,
  `user_nickname` VARCHAR(45) NOT NULL,
  `type` INT NULL DEFAULT NULL,
  PRIMARY KEY (`user_no`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `invinciblearmada`.`user_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `invinciblearmada`.`user_detail` (
  `user_no` INT NOT NULL,
  `team_no` INT NULL DEFAULT NULL,
  `user_description` VARCHAR(200) NULL DEFAULT NULL,
  `user_email` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`user_no`),
  INDEX `team_team_no_fk_idx` (`team_no` ASC) VISIBLE,
  CONSTRAINT `team_team_no_fk`
    FOREIGN KEY (`team_no`)
    REFERENCES `invinciblearmada`.`team` (`team_no`),
  CONSTRAINT `user_user_no_fk`
    FOREIGN KEY (`user_no`)
    REFERENCES `invinciblearmada`.`user` (`user_no`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `invinciblearmada`.`team_comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `invinciblearmada`.`team_comment` (
  `team_no` INT NOT NULL,
  `user_no` INT NULL,
  `team_comment` VARCHAR(200) NULL,
  `team_commentcol` VARCHAR(45) NULL,
  `team_comment_datatime` DATETIME NULL DEFAULT now(),
  PRIMARY KEY (`team_no`),
  INDEX `team_comment_user_no_fk_idx` (`user_no` ASC) VISIBLE,
  CONSTRAINT `team_comment_team_no_fk`
    FOREIGN KEY (`team_no`)
    REFERENCES `invinciblearmada`.`team` (`team_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `team_comment_user_no_fk`
    FOREIGN KEY (`user_no`)
    REFERENCES `invinciblearmada`.`user` (`user_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `invinciblearmada`.`user_record`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `invinciblearmada`.`user_record` (
  `user_no` INT NOT NULL,
  `team_no` INT NOT NULL,
  `win_count` INT NULL DEFAULT 0,
  `lost_count` INT NULL DEFAULT 0,
  PRIMARY KEY (`user_no`, `team_no`),
  INDEX `user_record_team_no_idx` (`team_no` ASC) VISIBLE,
  CONSTRAINT `user_record_user_no`
    FOREIGN KEY (`user_no`)
    REFERENCES `invinciblearmada`.`user` (`user_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_record_team_no`
    FOREIGN KEY (`team_no`)
    REFERENCES `invinciblearmada`.`team` (`team_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `invinciblearmada`.`match`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `invinciblearmada`.`match` (
  `match_no` INT NOT NULL AUTO_INCREMENT,
  `team_home` INT NULL,
  `team_away` INT NULL,
  PRIMARY KEY (`match_no`),
  INDEX `match_team_home_idx` (`team_home` ASC) VISIBLE,
  INDEX `match_team_away_idx` (`team_away` ASC) VISIBLE,
  CONSTRAINT `match_team_home`
    FOREIGN KEY (`team_home`)
    REFERENCES `invinciblearmada`.`team` (`team_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `match_team_away`
    FOREIGN KEY (`team_away`)
    REFERENCES `invinciblearmada`.`team` (`team_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `invinciblearmada`.`match_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `invinciblearmada`.`match_detail` (
  `match_no` INT NOT NULL,
  `player` INT NULL,
  PRIMARY KEY (`match_no`),
  INDEX `match_detail_player_fk_idx` (`player` ASC) VISIBLE,
  CONSTRAINT `match_detail_match_no_fk`
    FOREIGN KEY (`match_no`)
    REFERENCES `invinciblearmada`.`match` (`match_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `match_detail_player_fk`
    FOREIGN KEY (`player`)
    REFERENCES `invinciblearmada`.`user` (`user_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `invinciblearmada`.`match_rate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `invinciblearmada`.`match_rate` (
  `match_no` INT NOT NULL,
  `player` INT NOT NULL,
  `register` INT NOT NULL,
  `rate` INT NOT NULL check ( rate >= 0 and rate <=10),
  PRIMARY KEY (`match_no`, `player`, `register`),
  INDEX `register_idx` (`register` ASC) VISIBLE,
  INDEX `player_idx` (`player` ASC) VISIBLE,
  CONSTRAINT `match_rate_match_no_fk`
    FOREIGN KEY (`match_no`)
    REFERENCES `invinciblearmada`.`match` (`match_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `player`
    FOREIGN KEY (`player`)
    REFERENCES `invinciblearmada`.`user` (`user_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `register`
    FOREIGN KEY (`register`)
    REFERENCES `invinciblearmada`.`user` (`user_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
