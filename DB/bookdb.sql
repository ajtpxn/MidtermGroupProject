-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bookdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `bookdb` ;

-- -----------------------------------------------------
-- Schema bookdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bookdb` DEFAULT CHARACTER SET utf8 ;
USE `bookdb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `active` TINYINT NULL,
  `date_created` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `author`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `author` ;

CREATE TABLE IF NOT EXISTS `author` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `content_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `content_rating` ;

CREATE TABLE IF NOT EXISTS `content_rating` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `book`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `book` ;

CREATE TABLE IF NOT EXISTS `book` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NULL,
  `description` TEXT NULL,
  `author_id` INT NOT NULL,
  `content_rating` INT NOT NULL,
  `isbn` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_book_author1_idx` (`author_id` ASC),
  INDEX `fk_book_content_rating1_idx` (`content_rating` ASC),
  CONSTRAINT `fk_book_author1`
    FOREIGN KEY (`author_id`)
    REFERENCES `author` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_content_rating1`
    FOREIGN KEY (`content_rating`)
    REFERENCES `content_rating` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wishlist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wishlist` ;

CREATE TABLE IF NOT EXISTS `wishlist` (
  `user_id` INT NOT NULL,
  `book_id` INT NOT NULL,
  INDEX `fk_wishlist_transaction_idx` (`user_id` ASC),
  INDEX `fk_wishlist_book1_idx` (`book_id` ASC),
  PRIMARY KEY (`user_id`, `book_id`),
  CONSTRAINT `fk_wishlist_transaction`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_wishlist_book1`
    FOREIGN KEY (`book_id`)
    REFERENCES `book` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `condition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `condition` ;

CREATE TABLE IF NOT EXISTS `condition` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `copy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `copy` ;

CREATE TABLE IF NOT EXISTS `copy` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `available` TINYINT NOT NULL,
  `date_added` DATETIME NULL DEFAULT current_timestamp,
  `date_removed` DATETIME NULL,
  `user_id` INT NOT NULL,
  `book_id` INT NOT NULL,
  `active` TINYINT NOT NULL,
  `condition_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_copy_user1_idx` (`user_id` ASC),
  INDEX `fk_copy_book1_idx` (`book_id` ASC),
  INDEX `fk_copy_condition1_idx` (`condition_id` ASC),
  CONSTRAINT `fk_copy_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_copy_book1`
    FOREIGN KEY (`book_id`)
    REFERENCES `book` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_copy_condition1`
    FOREIGN KEY (`condition_id`)
    REFERENCES `condition` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transaction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `transaction` ;

CREATE TABLE IF NOT EXISTS `transaction` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `start_date` DATETIME NOT NULL,
  `end_date` DATETIME NOT NULL,
  `date_created` DATETIME NULL DEFAULT current_timestamp,
  `borrow_id` INT NOT NULL,
  `copy_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_transaction_user2_idx` (`borrow_id` ASC),
  INDEX `fk_transaction_copy1_idx` (`copy_id` ASC),
  CONSTRAINT `fk_transaction_user2`
    FOREIGN KEY (`borrow_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_copy1`
    FOREIGN KEY (`copy_id`)
    REFERENCES `copy` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `genre` ;

CREATE TABLE IF NOT EXISTS `genre` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `book_genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `book_genre` ;

CREATE TABLE IF NOT EXISTS `book_genre` (
  `genre_id` INT NOT NULL,
  `book_id` INT NOT NULL,
  PRIMARY KEY (`genre_id`, `book_id`),
  INDEX `fk_genre_has_book_book1_idx` (`book_id` ASC),
  INDEX `fk_genre_has_book_genre1_idx` (`genre_id` ASC),
  CONSTRAINT `fk_genre_has_book_genre1`
    FOREIGN KEY (`genre_id`)
    REFERENCES `genre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_genre_has_book_book1`
    FOREIGN KEY (`book_id`)
    REFERENCES `book` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `book_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `book_rating` ;

CREATE TABLE IF NOT EXISTS `book_rating` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rating` ENUM('1', '2', '3', '4', '5') NULL,
  `date_created` DATETIME NULL DEFAULT current_timestamp,
  `book_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_book_rating_book1_idx` (`book_id` ASC),
  INDEX `fk_book_rating_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_book_rating_book1`
    FOREIGN KEY (`book_id`)
    REFERENCES `book` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_rating_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS admin@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'book2book';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'admin'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `bookdb`;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `active`, `date_created`) VALUES (1, 'User', 'McUserface', 'usermcuserface', 'imauser', 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `author`
-- -----------------------------------------------------
START TRANSACTION;
USE `bookdb`;
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (1, 'Eric', 'Carle');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (2, 'J.K. ', 'Rowling');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (3, 'Kurt', 'Vonnegut');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (4, 'Robert K.', 'Massie');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (5, 'Edward', 'Gibbon');

COMMIT;


-- -----------------------------------------------------
-- Data for table `content_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `bookdb`;
INSERT INTO `content_rating` (`id`, `name`) VALUES (1, 'Kids');
INSERT INTO `content_rating` (`id`, `name`) VALUES (2, 'Young Adult');
INSERT INTO `content_rating` (`id`, `name`) VALUES (3, 'Adult');
INSERT INTO `content_rating` (`id`, `name`) VALUES (4, 'Adult plus');

COMMIT;


-- -----------------------------------------------------
-- Data for table `book`
-- -----------------------------------------------------
START TRANSACTION;
USE `bookdb`;
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (1, 'The Very Hungry Caterpillar', 'A caterpillar eats a lot and then turns into a butterfly', 1, 1, 0399226907);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (2, 'Harry Potter and the Prisoner of Azkaban', 'A young wizard in training must confront an escaped convict whom may be responsible for the death of his parents.', 2, 2, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (3, 'Slaughterhouse-Five', 'A man becomes unstuck in time and must live with the knowledge of his fate. ', 3, 3, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (4, 'Catherine the Great: Portrait of a Woman', 'Autobiography of the former Empress of Russia.', 4, 3, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (5, 'The History of the Decline and Fall of the Roman Empire', 'see title', 5, 3, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `condition`
-- -----------------------------------------------------
START TRANSACTION;
USE `bookdb`;
INSERT INTO `condition` (`id`, `name`) VALUES (1, 'Brand New');

COMMIT;


-- -----------------------------------------------------
-- Data for table `copy`
-- -----------------------------------------------------
START TRANSACTION;
USE `bookdb`;
INSERT INTO `copy` (`id`, `available`, `date_added`, `date_removed`, `user_id`, `book_id`, `active`, `condition_id`) VALUES (1, 1, NULL, NULL, 1, 1, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `bookdb`;
INSERT INTO `genre` (`id`, `name`) VALUES (1, 'Children\'s');
INSERT INTO `genre` (`id`, `name`) VALUES (2, 'Fantasy');
INSERT INTO `genre` (`id`, `name`) VALUES (3, 'History');
INSERT INTO `genre` (`id`, `name`) VALUES (4, 'Biography');
INSERT INTO `genre` (`id`, `name`) VALUES (5, 'Satire');

COMMIT;


-- -----------------------------------------------------
-- Data for table `book_genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `bookdb`;
INSERT INTO `book_genre` (`genre_id`, `book_id`) VALUES (1, 1);

COMMIT;
