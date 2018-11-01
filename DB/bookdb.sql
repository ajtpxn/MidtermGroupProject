-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

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
  `image_url` VARCHAR(45) NULL,
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
  `image_url` VARCHAR(250) NULL,
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
  `image_url` VARCHAR(250) NULL,
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
GRANT USAGE ON *.* TO admin@localhost;
 DROP USER admin@localhost;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
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
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `active`, `date_created`, `image_url`) VALUES (1, 'User', 'McUserface', 'usermcuserface', 'imauser', 1, NULL, 'https://imgur.com/a/0xEDkGy');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `active`, `date_created`, `image_url`) VALUES (2, 'Gritty', 'Mascot', 'iamgritty', 'hiimgritty', 1, NULL, 'https://imgur.com/a/R1DCHBu');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `active`, `date_created`, `image_url`) VALUES (3, 'Kyle', 'Paladini', 'mynameiskyle', 'passw0rd', 1, NULL, 'https://imgur.com/a/3UrqGOW');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `active`, `date_created`, `image_url`) VALUES (4, 'George', 'Genesee', 'george', 'password', 1, '2018-10-30 16:55:28', NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `active`, `date_created`, `image_url`) VALUES (5, 'Hank', 'Henderson', 'hank', 'password', 1, '2018-10-30 16:55:52', NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `active`, `date_created`, `image_url`) VALUES (6, 'Ike', 'Irvine', 'ike', 'password', 1, '2018-10-30 16:57:40', NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `active`, `date_created`, `image_url`) VALUES (8, 'Jack', 'Johannesburg', 'jack', 'password', 1, '2018-10-30 17:13:34', NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `active`, `date_created`, `image_url`) VALUES (9, 'Danny', 'Dallas', 'danny', 'password', 1, '2018-10-30 17:13:34', NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `active`, `date_created`, `image_url`) VALUES (10, 'Eddie', 'Earlville', 'eddie', 'password', 1, '2018-10-30 17:13:34', NULL);

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
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (1, 'The Very Hungry Caterpillar', 'A caterpillar eats a lot and then turns into a butterfly', 1, 1, 399226907, 'https://images-na.ssl-images-amazon.com/images/I/51reF9VCr1L._SY354_BO1,204,203,200_.jpg');
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (2, 'Harry Potter and the Prisoner of Azkaban', 'A young wizard in training must confront an escaped convict who may be responsible for the death of his parents.', 2, 2, NULL, 'https://www.klinebooks.com/pictures/medium/41318.jpg');
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (3, 'Slaughterhouse-Five', 'A man becomes unstuck in time and must live with the knowledge of his fate. ', 3, 3, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (4, 'Catherine the Great: Portrait of a Woman', 'Autobiography of the former Empress of Russia.', 4, 3, NULL, 'https://images.gr-assets.com/books/1403395276l/10414941.jpg');
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (5, 'The History of the Decline and Fall of the Roman Empire', 'see title', 5, 3, NULL, 'https://www.burnsiderarebooks.com/pictures/160730004_1.jpg?v=1469925334');
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (6, 'American Psycho', 'A wealthy yuppie goes on a bloody rampage in this critique of high society.', 6, 4, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (7, 'The Hobbit', 'There and Back Again', 37, 1, NULL, 'https://prodimage.images-bn.com/pimages/9780345445605_p0_v1_s550x406.jpg');
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (8, 'The Divine Comedy', NULL, 8, 1, NULL, 'https://prodimage.images-bn.com/pimages/9781435162082_p0_v2_s550x406.jpg');
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (9, 'The Brothers Karamazov', NULL, 28, 1, NULL, 'https://i.ebayimg.com/images/g/pYwAAOSwjKFZO7r5/s-l600.jpg');
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (10, 'The Adventures of Huckleberry Finn', NULL, 38, 1, NULL, 'https://www-tc.pbs.org/wgbh/americanexperience/media/filer_public_thumbnails/filer_public/d9/27/d9276988-95ca-44d4-9ef4-83d01619ee90/banned-huckfinn-feature.jpg__350x494_q85_crop_subsampling-2_upscale.jpg');
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (11, 'Alice\'s Adventures in Wonderland', NULL, 19, 1, NULL, 'https://images-na.ssl-images-amazon.com/images/I/51Dp6aAR4HL._SX357_BO1,204,203,200_.jpg');
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (12, 'Wuthering Heights', NULL, 16, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (14, 'Pride and Prejudice', NULL, 10, 1, NULL, 'https://images.penguinrandomhouse.com/cover/9780553897395');
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (15, 'Nineteen Eighty Four', NULL, 35, 1, NULL, 'https://images-na.ssl-images-amazon.com/images/I/41R3pYJCqpL._SX331_BO1,204,203,200_.jpg');
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (16, 'Great Expectations', NULL, 27, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (17, 'Gulliver\'s Travels', NULL, 36, 1, NULL, 'https://i.pinimg.com/originals/3b/e3/0a/3be30a7ff5bb858d838b11e5130d98eb.jpg');
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (18, 'David Copperfield', NULL, 27, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (19, 'The Canterbury Tales', NULL, 20, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (20, 'The Lord of the Rings', NULL, 37, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (21, 'The Lion, the Witch and the Wardrobe', NULL, 34, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (23, 'Animal Farm', NULL, 35, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (43, 'Jurassic Park', NULL, 24, 1, NULL, 'https://i2.wp.com/www.wordsarework.com/wp-content/uploads/2016/02/jurassic-park-michael-crichton-book-cover.jpg');
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (46, 'Physics & Philosophy', NULL, 30, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (49, 'Machine Learning for Hackers', NULL, 21, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (51, 'Introduction to Algorithms', NULL, 23, 1, NULL, 'https://images-na.ssl-images-amazon.com/images/I/41-1VkO%2B1lL._SX359_BO1,204,203,200_.jpg');
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (52, 'Outsider, The', NULL, 17, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (53, 'Complete Sherlock Holmes, The - Vol I', NULL, 29, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (57, 'Complete Sherlock Holmes, The - Vol II', NULL, 29, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (59, 'Tao of Physics, The', NULL, 18, 1, NULL, 'https://images-na.ssl-images-amazon.com/images/I/811tLunRdrL.jpg');
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (61, 'Farewell to Arms, A', NULL, 31, 1, NULL, 'https://images-na.ssl-images-amazon.com/images/I/5188um8SnIL._SX327_BO1,204,203,200_.jpg');
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (64, 'False Impressions', NULL, 9, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (65, 'Jurassic Park', NULL, 24, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (68, 'Russian Journal, A', NULL, 41, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (70, 'Hidden Connections, The', NULL, 18, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (71, 'Asami Asami', NULL, 26, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (72, 'Journal of a Novel', NULL, 41, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (73, 'Once There Was a War', NULL, 41, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (82, 'Moon is Down, The', NULL, 41, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (88, 'Learning OpenCV', NULL, 15, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (90, 'Crime and Punishment', NULL, 28, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (92, 'Argumentative Indian, The', NULL, 42, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (95, 'Idea of Justice, The', NULL, 42, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (98, 'Prisoner of Birth, A', NULL, 9, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (100, 'Last Mughal, The', NULL, 25, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (101, 'Radiowaril Bhashane & Shrutika', NULL, 26, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (102, 'Gun Gayin Awadi', NULL, 26, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (110, 'Aghal Paghal', NULL, 26, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (111, 'Winter of Our Discontent, The', NULL, 41, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (117, 'On Education', NULL, 39, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (118, 'Electric Universe', NULL, 14, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (119, 'Hunchback of Notre Dame, The', NULL, 32, 1, NULL, 'https://images.gr-assets.com/books/1388342667l/30597.jpg');
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (122, 'Burning Bright', NULL, 41, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (123, 'Down and Out in Paris & London', NULL, 35, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (124, 'Identity & Violence', NULL, 42, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (132, 'Beyond the Three Seas', NULL, 25, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (133, 'Artist and the Mathematician, The', NULL, 7, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (134, 'History of Western Philosophy', NULL, 39, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (136, 'Rationality & Freedom', NULL, 42, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (137, 'Uncommon Wisdom', NULL, 18, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (141, 'One', NULL, 11, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (142, 'Apulki', NULL, 26, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (145, 'Unpopular Essays', NULL, 39, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (157, 'Char Shabda', NULL, 26, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (163, 'Life in Letters, A', NULL, 41, 1, NULL, 'https://images-na.ssl-images-amazon.com/images/I/91xEFnKpSFL.jpg');
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (164, 'Grapes of Wrath, The', NULL, 41, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (166, 'Vyakti ani Valli', NULL, 26, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (167, 'Empire of the Mughal - The Tainted Throne', NULL, 40, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (168, 'Empire of the Mughal - Brothers at War', NULL, 40, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (169, 'Empire of the Mughal - Ruler of the World', NULL, 40, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (170, 'Empire of the Mughal - The Serpent\'s Tooth', NULL, 40, 1, NULL, 'https://images-na.ssl-images-amazon.com/images/I/51JnlXyBF5L._SX323_BO1,204,203,200_.jpg');
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (171, 'Empire of the Mughal - Raiders from the North', NULL, 40, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (172, 'Mossad', NULL, 12, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (174, 'Jim Corbett Omnibus', NULL, 22, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (175, 'Batatyachi Chal', NULL, 26, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (176, 'Hafasavnuk', NULL, 26, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (186, 'Urlasurla', NULL, 26, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (194, 'Men of Mathematics', NULL, 13, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (195, 'History of England, Foundation', NULL, 43, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (201, 'City of Djinns', NULL, 25, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (202, 'Eyeless in Gaza', NULL, 33, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (208, 'Tales of Beedle the Bard', NULL, 2, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (209, 'Animal Farm', NULL, 35, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (210, 'Idiot, The', NULL, 28, 1, NULL, NULL);
INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `content_rating`, `isbn`, `image_url`) VALUES (211, 'Christmas Carol, A', NULL, 27, 1, NULL, NULL);

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
INSERT INTO `copy` (`id`, `available`, `date_added`, `date_removed`, `user_id`, `book_id`, `active`, `condition_id`, `image_url`) VALUES (1, 1, '2017-02-03 12:00:00', NULL, 1, 1, 1, 1, NULL);
INSERT INTO `copy` (`id`, `available`, `date_added`, `date_removed`, `user_id`, `book_id`, `active`, `condition_id`, `image_url`) VALUES (2, 1, '2016-11-10 11:11:11', NULL, 3, 4, 1, 4, NULL);
INSERT INTO `copy` (`id`, `available`, `date_added`, `date_removed`, `user_id`, `book_id`, `active`, `condition_id`, `image_url`) VALUES (3, 1, '2016-11-08 23:00:00', NULL, 2, 2, 0, 2, NULL);
INSERT INTO `copy` (`id`, `available`, `date_added`, `date_removed`, `user_id`, `book_id`, `active`, `condition_id`, `image_url`) VALUES (4, 1, '2017-11-02 21:21:21', NULL, 2, 4, 1, 3, NULL);
INSERT INTO `copy` (`id`, `available`, `date_added`, `date_removed`, `user_id`, `book_id`, `active`, `condition_id`, `image_url`) VALUES (5, 1, '2018-10-30 17:02:08', '2018-10-30 17:02:08', 6, 119, 1, 3, NULL);
INSERT INTO `copy` (`id`, `available`, `date_added`, `date_removed`, `user_id`, `book_id`, `active`, `condition_id`, `image_url`) VALUES (6, 1, '2018-10-30 17:02:31', '2018-10-30 17:02:31', 6, 18, 1, 1, NULL);
INSERT INTO `copy` (`id`, `available`, `date_added`, `date_removed`, `user_id`, `book_id`, `active`, `condition_id`, `image_url`) VALUES (7, 1, '2018-10-30 17:02:51', '2018-10-30 17:02:51', 6, 170, 1, 1, NULL);
INSERT INTO `copy` (`id`, `available`, `date_added`, `date_removed`, `user_id`, `book_id`, `active`, `condition_id`, `image_url`) VALUES (8, 1, '2018-10-30 17:03:13', '2018-10-30 17:03:13', 6, 17, 1, 1, NULL);
INSERT INTO `copy` (`id`, `available`, `date_added`, `date_removed`, `user_id`, `book_id`, `active`, `condition_id`, `image_url`) VALUES (9, 1, '2018-10-30 17:03:43', '2018-10-30 17:03:43', 5, 51, 1, 1, NULL);
INSERT INTO `copy` (`id`, `available`, `date_added`, `date_removed`, `user_id`, `book_id`, `active`, `condition_id`, `image_url`) VALUES (10, 1, '2018-10-30 17:03:52', '2018-10-30 17:03:52', 5, 21, 1, 1, NULL);
INSERT INTO `copy` (`id`, `available`, `date_added`, `date_removed`, `user_id`, `book_id`, `active`, `condition_id`, `image_url`) VALUES (11, 1, '2018-10-30 17:03:58', '2018-10-30 17:03:58', 5, 9, 1, 1, NULL);
INSERT INTO `copy` (`id`, `available`, `date_added`, `date_removed`, `user_id`, `book_id`, `active`, `condition_id`, `image_url`) VALUES (12, 1, '2018-10-30 17:06:43', '2018-10-30 17:06:43', 4, 164, 1, 1, NULL);
INSERT INTO `copy` (`id`, `available`, `date_added`, `date_removed`, `user_id`, `book_id`, `active`, `condition_id`, `image_url`) VALUES (13, 1, '2018-10-30 17:06:57', '2018-10-30 17:06:57', 4, 157, 1, 1, NULL);
INSERT INTO `copy` (`id`, `available`, `date_added`, `date_removed`, `user_id`, `book_id`, `active`, `condition_id`, `image_url`) VALUES (14, 1, '2018-10-30 17:07:06', '2018-10-30 17:07:06', 4, 51, 1, 1, NULL);
INSERT INTO `copy` (`id`, `available`, `date_added`, `date_removed`, `user_id`, `book_id`, `active`, `condition_id`, `image_url`) VALUES (15, 1, '2018-10-30 17:07:16', '2018-10-30 17:07:16', 4, 61, 1, 1, NULL);
INSERT INTO `copy` (`id`, `available`, `date_added`, `date_removed`, `user_id`, `book_id`, `active`, `condition_id`, `image_url`) VALUES (16, 1, '2018-10-30 19:31:20', '2018-10-30 19:31:20', 8, 59, 1, 1, NULL);
INSERT INTO `copy` (`id`, `available`, `date_added`, `date_removed`, `user_id`, `book_id`, `active`, `condition_id`, `image_url`) VALUES (17, 1, '2018-10-30 19:31:55', '2018-10-30 19:31:55', 8, 163, 1, 1, NULL);
INSERT INTO `copy` (`id`, `available`, `date_added`, `date_removed`, `user_id`, `book_id`, `active`, `condition_id`, `image_url`) VALUES (18, 1, '2018-10-30 19:32:11', '2018-10-30 19:32:11', 8, 14, 1, 1, NULL);
INSERT INTO `copy` (`id`, `available`, `date_added`, `date_removed`, `user_id`, `book_id`, `active`, `condition_id`, `image_url`) VALUES (19, 1, '2018-10-31 22:00:02', '2018-10-31 22:00:02', 4, 10, 1, 1, NULL);
INSERT INTO `copy` (`id`, `available`, `date_added`, `date_removed`, `user_id`, `book_id`, `active`, `condition_id`, `image_url`) VALUES (20, 1, '2018-11-01 10:06:08', '2018-11-01 10:06:08', 6, 7, 1, 1, NULL);
INSERT INTO `copy` (`id`, `available`, `date_added`, `date_removed`, `user_id`, `book_id`, `active`, `condition_id`, `image_url`) VALUES (21, 1, '2018-11-01 10:14:23', '2018-11-01 10:14:23', 5, 2, 1, 1, NULL);
INSERT INTO `copy` (`id`, `available`, `date_added`, `date_removed`, `user_id`, `book_id`, `active`, `condition_id`, `image_url`) VALUES (22, 1, '2018-11-01 10:34:51', '2018-11-01 10:34:51', 8, 7, 1, 1, NULL);

COMMIT;

--
-- -- -----------------------------------------------------
-- -- Data for table `copy_transaction`
-- -- -----------------------------------------------------
-- START TRANSACTION;
-- USE `bookdb`;
-- INSERT INTO `copy_transaction` (`id`, `start_date`, `end_date`, `date_created`, `borrow_id`, `copy_id`) VALUES (1, '2018-10-30 17:02:08', '2018-12-01 10:14:23', '2018-10-30 17:02:08', 1, 1);
-- INSERT INTO `copy_transaction` (`id`, `start_date`, `end_date`, `date_created`, `borrow_id`, `copy_id`) VALUES (2, '2018-10-30 17:02:08', '2018-12-01 10:14:23', '2018-10-30 17:02:08', 3, 4);
-- INSERT INTO `copy_transaction` (`id`, `start_date`, `end_date`, `date_created`, `borrow_id`, `copy_id`) VALUES (3, '2018-10-30 17:02:08', '2018-12-01 10:14:23', '2018-10-30 17:02:08', 2, 2);
-- INSERT INTO `copy_transaction` (`id`, `start_date`, `end_date`, `date_created`, `borrow_id`, `copy_id`) VALUES (4, '2018-10-30 17:02:08', '2018-12-01 10:14:23', '2018-10-30 17:02:08', 2, 3);
-- INSERT INTO `copy_transaction` (`id`, `start_date`, `end_date`, `date_created`, `borrow_id`, `copy_id`) VALUES (5, '2018-10-30 17:02:08', '2018-12-01 10:14:23', '2018-10-30 17:02:08', 6, 5);
-- INSERT INTO `copy_transaction` (`id`, `start_date`, `end_date`, `date_created`, `borrow_id`, `copy_id`) VALUES (6, '2018-10-30 17:02:08', '2018-12-01 10:14:23', '2018-10-30 17:02:08', 6, 6);
-- INSERT INTO `copy_transaction` (`id`, `start_date`, `end_date`, `date_created`, `borrow_id`, `copy_id`) VALUES (7, '2018-10-30 17:02:08', '2018-12-01 10:14:23', '2018-10-30 17:02:08', 6, 7);
-- INSERT INTO `copy_transaction` (`id`, `start_date`, `end_date`, `date_created`, `borrow_id`, `copy_id`) VALUES (8, '2018-10-30 17:02:08', '2018-12-01 10:14:23', '2018-10-30 17:02:08', 6, 8);
-- INSERT INTO `copy_transaction` (`id`, `start_date`, `end_date`, `date_created`, `borrow_id`, `copy_id`) VALUES (9, '2018-10-30 17:02:08', '2018-12-01 10:14:23', '2018-10-30 17:02:08', 5, 9);
-- INSERT INTO `copy_transaction` (`id`, `start_date`, `end_date`, `date_created`, `borrow_id`, `copy_id`) VALUES (10, '2018-10-30 17:02:08', '2018-12-01 10:14:23', '2018-10-30 17:02:08', 5, 21);
-- INSERT INTO `copy_transaction` (`id`, `start_date`, `end_date`, `date_created`, `borrow_id`, `copy_id`) VALUES (11, '2018-10-30 17:02:08', '2018-12-01 10:14:23', '2018-10-30 17:02:08', 5, 12);
-- INSERT INTO `copy_transaction` (`id`, `start_date`, `end_date`, `date_created`, `borrow_id`, `copy_id`) VALUES (12, '2018-10-30 17:02:08', '2018-12-01 10:14:23', '2018-10-30 17:02:08', 4, 10);
-- INSERT INTO `copy_transaction` (`id`, `start_date`, `end_date`, `date_created`, `borrow_id`, `copy_id`) VALUES (13, '2018-10-30 17:02:08', '2018-12-01 10:14:23', '2018-10-30 17:02:08', 4, 11);
-- INSERT INTO `copy_transaction` (`id`, `start_date`, `end_date`, `date_created`, `borrow_id`, `copy_id`) VALUES (14, '2018-10-30 17:02:08', '2018-12-01 10:14:23', '2018-10-30 17:02:08', 4, 13);
-- INSERT INTO `copy_transaction` (`id`, `start_date`, `end_date`, `date_created`, `borrow_id`, `copy_id`) VALUES (15, '2018-10-30 17:02:08', '2018-12-01 10:14:23', '2018-10-30 17:02:08', 4, 14);
-- INSERT INTO `copy_transaction` (`id`, `start_date`, `end_date`, `date_created`, `borrow_id`, `copy_id`) VALUES (16, '2018-10-30 17:02:08', '2018-12-01 10:14:23', '2018-10-30 17:02:08', 8, 15);
-- INSERT INTO `copy_transaction` (`id`, `start_date`, `end_date`, `date_created`, `borrow_id`, `copy_id`) VALUES (17, '2018-10-30 17:02:08', '2018-12-01 10:14:23', '2018-10-30 17:02:08', 8, 16);
-- INSERT INTO `copy_transaction` (`id`, `start_date`, `end_date`, `date_created`, `borrow_id`, `copy_id`) VALUES (18, '2018-10-30 17:02:08', '2018-12-01 10:14:23', '2018-10-30 17:02:08', 8, 17);
-- INSERT INTO `copy_transaction` (`id`, `start_date`, `end_date`, `date_created`, `borrow_id`, `copy_id`) VALUES (19, '2018-10-30 17:02:08', '2018-12-01 10:14:23', '2018-10-30 17:02:08', 4, 18);
-- INSERT INTO `copy_transaction` (`id`, `start_date`, `end_date`, `date_created`, `borrow_id`, `copy_id`) VALUES (20, '2018-10-30 17:02:08', '2018-12-01 10:14:23', '2018-10-30 17:02:08', 6, 19);
-- INSERT INTO `copy_transaction` (`id`, `start_date`, `end_date`, `date_created`, `borrow_id`, `copy_id`) VALUES (21, '2018-10-30 17:02:08', '2018-12-01 10:14:23', '2018-10-30 17:02:08', 5, 20);
-- INSERT INTO `copy_transaction` (`id`, `start_date`, `end_date`, `date_created`, `borrow_id`, `copy_id`) VALUES (22, '2018-10-30 17:02:08', '2018-12-01 10:14:23', '2018-10-30 17:02:08', 8, 22);
--
-- COMMIT;


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
