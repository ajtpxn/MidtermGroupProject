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
-- Table `copy_condition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `copy_condition` ;

CREATE TABLE IF NOT EXISTS `copy_condition` (
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
    REFERENCES `copy_condition` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `copy_transaction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `copy_transaction` ;

CREATE TABLE IF NOT EXISTS `copy_transaction` (
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
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `active`, `date_created`) VALUES (2, 'Gritty', 'Mascot', 'iamgritty', 'hiimgritty', 1, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `active`, `date_created`) VALUES (3, 'Kyle', 'Paladini', 'mynameiskyle', 'passw0rd', 1, NULL);

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
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (6, 'Bret Easton', 'Ellis');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (7, 'Amir', 'Aczel');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (8, 'Dante', 'Alighieri');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (9, 'Jeffery', 'Archer');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (10, 'Jane', 'Austen');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (11, 'Richard', 'Bach');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (12, 'Michael', 'Baz-Zohar');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (13, 'E T', 'Bell');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (14, 'David', 'Bodanis');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (15, 'Gary', 'Bradsky');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (16, 'Emily', 'Bronte');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (17, 'Albert', 'Camus');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (18, 'Fritjof', 'Capra');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (19, 'Lewis', 'Carroll');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (20, 'Geoffrey', 'Chaucer');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (21, 'Drew', 'Conway');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (22, 'Jim', 'Corbett');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (23, 'Thomas', 'Cormen');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (24, 'Michael', 'Crichton');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (25, 'William', 'Dalrymple');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (26, 'P L', 'Deshpande');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (27, 'Dickens', 'Dickens');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (28, 'Fyodor', 'Dostoevsky');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (29, 'Arthur Conan', 'Doyle');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (30, 'Werner', 'Heisenberg');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (31, 'Ernest', 'Hemingway');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (32, 'Victor', 'Hugo');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (33, 'Aldous', 'Huxley');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (34, 'CS', 'Lewis');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (35, 'George', 'Orwell');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (36, 'Jonathan ', 'Swift');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (37, 'J.R.R.', 'Tolkien');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (38, 'Mark', 'Twain');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (39, 'Bertrand', 'Russell');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (40, 'Alex', 'Rutherford');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (41, 'John', 'Steinbeck');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (42, 'Amartya', 'Sen');
INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES (43, 'Peter', 'Ackroyd');

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
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (6, 'American Psycho', 'A wealthy yuppie goes on a bloody rampage in this critique of high society.', 6, 4, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (7, 'The Hobbit', 'There and Back Again', 37, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (8, 'The Divine Comedy', '', 8, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (9, 'The Brothers Karamazov', '', 28, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (10, 'The Adventures of Huckleberry Finn', '', 38, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (11, 'Alice\'s Adventures in Wonderland', '', 19, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (12, 'Wuthering Heights', '', 16, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (14, 'Pride and Prejudice', '', 10, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (15, 'Nineteen Eighty Four', '', 35, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (16, 'Great Expectations', '', 27, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (17, 'Gulliver\'s Travels', '', 36, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (18, 'David Copperfield', '', 27, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (19, 'The Canterbury Tales', '', 20, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (20, 'The Lord of the Rings', '', 37, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (21, 'The Lion, the Witch and the Wardrobe', '', 34, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (23, 'Animal Farm', '', 35, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (43, 'Jurassic Park', '', 24, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (46, 'Physics & Philosophy', '', 30, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (49, 'Machine Learning for Hackers', '', 21, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (51, 'Introduction to Algorithms', '', 23, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (52, 'Outsider, The', '', 17, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (53, 'Complete Sherlock Holmes, The - Vol I', '', 29, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (57, 'Complete Sherlock Holmes, The - Vol II', '', 29, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (59, 'Tao of Physics, The', '', 18, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (61, 'Farewell to Arms, A', '', 31, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (64, 'False Impressions', '', 9, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (65, 'Jurassic Park', '', 24, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (68, 'Russian Journal, A', '', 41, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (70, 'Hidden Connections, The', '', 18, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (71, 'Asami Asami', '', 26, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (72, 'Journal of a Novel', '', 41, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (73, 'Once There Was a War', '', 41, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (82, 'Moon is Down, The', '', 41, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (88, 'Learning OpenCV', '', 15, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (90, 'Crime and Punishment', '', 28, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (92, 'Argumentative Indian, The', '', 42, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (95, 'Idea of Justice, The', '', 42, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (98, 'Prisoner of Birth, A', '', 9, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (100, 'Last Mughal, The', '', 25, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (101, 'Radiowaril Bhashane & Shrutika', '', 26, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (102, 'Gun Gayin Awadi', '', 26, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (110, 'Aghal Paghal', '', 26, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (111, 'Winter of Our Discontent, The', '', 41, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (117, 'On Education', '', 39, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (118, 'Electric Universe', '', 14, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (119, 'Hunchback of Notre Dame, The', '', 32, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (122, 'Burning Bright', '', 41, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (123, 'Down and Out in Paris & London', '', 35, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (124, 'Identity & Violence', '', 42, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (132, 'Beyond the Three Seas', '', 25, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (133, 'Artist and the Mathematician, The', '', 7, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (134, 'History of Western Philosophy', '', 39, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (136, 'Rationality & Freedom', '', 42, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (137, 'Uncommon Wisdom', '', 18, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (141, 'One', '', 11, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (142, 'Apulki', '', 26, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (145, 'Unpopular Essays', '', 39, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (157, 'Char Shabda', '', 26, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (163, 'Life in Letters, A', '', 41, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (164, 'Grapes of Wrath, The', '', 41, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (166, 'Vyakti ani Valli', '', 26, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (167, 'Empire of the Mughal - The Tainted Throne', '', 40, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (168, 'Empire of the Mughal - Brothers at War', '', 40, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (169, 'Empire of the Mughal - Ruler of the World', '', 40, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (170, 'Empire of the Mughal - The Serpent\'s Tooth', '', 40, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (171, 'Empire of the Mughal - Raiders from the North', '', 40, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (172, 'Mossad', '', 12, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (174, 'Jim Corbett Omnibus', '', 22, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (175, 'Batatyachi Chal', '', 26, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (176, 'Hafasavnuk', '', 26, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (186, 'Urlasurla', '', 26, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (194, 'Men of Mathematics', '', 13, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (195, 'History of England, Foundation', '', 43, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (201, 'City of Djinns', '', 25, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (202, 'Eyeless in Gaza', '', 33, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (208, 'Tales of Beedle the Bard', '', 2, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (209, 'Animal Farm', '', 35, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (210, 'Idiot, The', '', 28, 1, 0);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`) VALUES (211, 'Christmas Carol, A', '', 27, 1, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `copy_condition`
-- -----------------------------------------------------
START TRANSACTION;
USE `bookdb`;
INSERT INTO `copy_condition` (`id`, `name`) VALUES (1, 'Brand New');
INSERT INTO `copy_condition` (`id`, `name`) VALUES (2, 'Well Kept');
INSERT INTO `copy_condition` (`id`, `name`) VALUES (3, 'Used');
INSERT INTO `copy_condition` (`id`, `name`) VALUES (4, 'Worn');
INSERT INTO `copy_condition` (`id`, `name`) VALUES (5, 'Last Legs');

COMMIT;


-- -----------------------------------------------------
-- Data for table `copy`
-- -----------------------------------------------------
START TRANSACTION;
USE `bookdb`;
INSERT INTO `copy` (`id`, `available`, `date_added`, `date_removed`, `user_id`, `book_id`, `active`, `condition_id`) VALUES (1, 1, '2017-02-03 12:00:00', NULL, 1, 1, 1, 1);
INSERT INTO `copy` (`id`, `available`, `date_added`, `date_removed`, `user_id`, `book_id`, `active`, `condition_id`) VALUES (2, 1, '2016-11-10 11:11:11', NULL, 3, 4, 1, 4);
INSERT INTO `copy` (`id`, `available`, `date_added`, `date_removed`, `user_id`, `book_id`, `active`, `condition_id`) VALUES (3, 0, '2016-11-08 23:00:00', NULL, 2, 2, 0, 2);
INSERT INTO `copy` (`id`, `available`, `date_added`, `date_removed`, `user_id`, `book_id`, `active`, `condition_id`) VALUES (4, 1, '2017-11-02 21:21:21', NULL, 2, 4, 1, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `copy_transaction`
-- -----------------------------------------------------
START TRANSACTION;
USE `bookdb`;
INSERT INTO `copy_transaction` (`id`, `start_date`, `end_date`, `date_created`, `borrow_id`, `copy_id`) VALUES (1, '2011-01-01 00:00:00', '2011-01-07 00:00:00', '2010-12-25 00:00:00', 3, 2);
INSERT INTO `copy_transaction` (`id`, `start_date`, `end_date`, `date_created`, `borrow_id`, `copy_id`) VALUES (2, '2011-07-30 03:07:20', '2011-09-20 18:30:19', '2007-04-30 01:02:03', 1, 2);
INSERT INTO `copy_transaction` (`id`, `start_date`, `end_date`, `date_created`, `borrow_id`, `copy_id`) VALUES (3, '2018-10-25 05:20:13', '2018-11-11 11:11:11', '2018-10-01 04:03:02', 2, 3);

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
INSERT INTO `book_genre` (`genre_id`, `book_id`) VALUES (2, 2);
INSERT INTO `book_genre` (`genre_id`, `book_id`) VALUES (5, 3);
INSERT INTO `book_genre` (`genre_id`, `book_id`) VALUES (3, 4);
INSERT INTO `book_genre` (`genre_id`, `book_id`) VALUES (4, 4);
INSERT INTO `book_genre` (`genre_id`, `book_id`) VALUES (3, 5);
INSERT INTO `book_genre` (`genre_id`, `book_id`) VALUES (5, 6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `book_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `bookdb`;
INSERT INTO `book_rating` (`id`, `rating`, `date_created`, `book_id`, `user_id`) VALUES (5, '5', '2017-01-02 18:19:20', 6, 2);

COMMIT;

