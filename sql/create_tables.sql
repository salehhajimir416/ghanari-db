CREATE TABLE `ghanari`.`member` (
  `first_name` VARCHAR(20) NOT NULL,
  `last_name` VARCHAR(20) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(128) NOT NULL,
  `birth_date` DATE NOT NULL,
  `membership_date` DATE NOT NULL,
  `biography` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`username`));


CREATE TABLE `ghanari`.`tweet` (
  `content` VARCHAR(256) NOT NULL,
  `sender_username` VARCHAR(20) NOT NULL,
  `sending_date` DATE NOT NULL,
  `tweet_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`tweet_id`),
  UNIQUE INDEX `tweet_id_UNIQUE` (`tweet_id` ASC) VISIBLE);
  
  ALTER TABLE `ghanari`.`tweet` 
ADD COLUMN `tweet_mention_id` INT NULL DEFAULT NULL AFTER `tweet_id`;


ALTER TABLE `ghanari`.`tweet` 
ADD INDEX `fk_tweet_mention_id_idx` (`tweet_mention_id` ASC) VISIBLE;
;
ALTER TABLE `ghanari`.`tweet` 
ADD CONSTRAINT `fk_tweet_mention_id`
  FOREIGN KEY (`tweet_mention_id`)
  REFERENCES `ghanari`.`tweet` (`tweet_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

  
  
  
  
  
  
  
  
  
  CREATE TABLE `ghanari`.`message` (
  `sender_username` VARCHAR(20) NOT NULL,
  `receiver_username` VARCHAR(20) NOT NULL,
  `sending_time` DATETIME NOT NULL,
  `content` VARCHAR(256) NOT NULL,
  `message_id` INT NOT NULL AUTO_INCREMENT,
  `message_tweet_id` INT NULL,
  PRIMARY KEY (`message_id`),
  UNIQUE INDEX `message_id_UNIQUE` (`message_id` ASC) VISIBLE);
  
 

  
  
  ALTER TABLE `ghanari`.`message` 
ADD INDEX `fk_message_tweet_id_idx` (`message_tweet_id` ASC) VISIBLE,
ADD INDEX `fk_sender_idx` (`sender_username` ASC) VISIBLE,
ADD INDEX `fk_receiver_idx` (`receiver_username` ASC) VISIBLE;
;
ALTER TABLE `ghanari`.`message` 
ADD CONSTRAINT `fk_message_tweet_id`
  FOREIGN KEY (`message_tweet_id`)
  REFERENCES `ghanari`.`tweet` (`tweet_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_sender`
  FOREIGN KEY (`sender_username`)
  REFERENCES `ghanari`.`member` (`username`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_receiver`
  FOREIGN KEY (`receiver_username`)
  REFERENCES `ghanari`.`member` (`username`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
   ALTER TABLE `ghanari`.`message` 
CHANGE COLUMN `content` `content` VARCHAR(256) NULL ;

  
  
  
  
  
  
  
  CREATE TABLE `ghanari`.`hashtag` (
  `content` CHAR(6) NOT NULL,
  `corresponding_tweet_id` INT NULL,
  PRIMARY KEY (`content`));
  
  
  ALTER TABLE `ghanari`.`hashtag` 
CHANGE COLUMN `corresponding_tweet_id` `corresponding_tweet_id` INT NULL ,
ADD INDEX `fk_corresponding_tweet_id_idx` (`corresponding_tweet_id` ASC) VISIBLE;
;
ALTER TABLE `ghanari`.`hashtag` 
ADD CONSTRAINT `fk_corresponding_tweet_id`
  FOREIGN KEY (`corresponding_tweet_id`)
  REFERENCES `ghanari`.`tweet` (`tweet_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  ALTER TABLE `ghanari`.`hashtag` 
RENAME TO  `ghanari`.`hashtag_tweets` ;

ALTER TABLE `ghanari`.`hashtag_tweets` 
ADD CONSTRAINT `fk_hashtag`
  FOREIGN KEY (`content`)
  REFERENCES `ghanari`.`hashtag` (`hashtag_content`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


  
  
  
  
  
  
  
  
  
  CREATE TABLE `ghanari`.`logins` (
  `member_username` VARCHAR(20) NOT NULL,
  `login_date` DATE NOT NULL);
  
  
  ALTER TABLE `ghanari`.`logins` 
ADD INDEX `fk_member_idx` (`member_username` ASC) VISIBLE;
;
ALTER TABLE `ghanari`.`logins` 
ADD CONSTRAINT `fk_member`
  FOREIGN KEY (`member_username`)
  REFERENCES `ghanari`.`member` (`username`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

  
  
  
  
  
  
  
  
  CREATE TABLE `ghanari`.`blocks` (
  `blocker_username` VARCHAR(20) NOT NULL,
  `blocked_username` VARCHAR(20) NOT NULL);
  
ALTER TABLE `ghanari`.`blocks` 
ADD PRIMARY KEY (`blocked_username`, `blocker_username`);
;


ALTER TABLE `ghanari`.`blocks` 
ADD INDEX `fk_blocker_idx` (`blocker_username` ASC) VISIBLE;
;
ALTER TABLE `ghanari`.`blocks` 
ADD CONSTRAINT `fk_blocker`
  FOREIGN KEY (`blocker_username`)
  REFERENCES `ghanari`.`member` (`username`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_blocked`
  FOREIGN KEY (`blocked_username`)
  REFERENCES `ghanari`.`member` (`username`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


  
  
  
  
  
  CREATE TABLE `ghanari`.`follow` (
  `follower_username` VARCHAR(20) NOT NULL,
  `following_username` VARCHAR(20) NOT NULL);
  
  
ALTER TABLE `ghanari`.`follow` 
ADD PRIMARY KEY (`follower_username`, `following_username`);
;

ALTER TABLE `ghanari`.`follow` 
ADD INDEX `fk_following_idx` (`following_username` ASC) VISIBLE;
;
ALTER TABLE `ghanari`.`follow` 
ADD CONSTRAINT `fk_follower`
  FOREIGN KEY (`follower_username`)
  REFERENCES `ghanari`.`member` (`username`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_following`
  FOREIGN KEY (`following_username`)
  REFERENCES `ghanari`.`member` (`username`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;








CREATE TABLE `ghanari`.`favorite` (
  `liker_username` VARCHAR(20) NOT NULL,
  `favorite_tweet_id` INT NOT NULL,
  PRIMARY KEY (`liker_username`, `favorite_tweet_id`));
ALTER TABLE `ghanari`.`favorite` 
ADD INDEX `fk_favorite_tweet_id_idx` (`favorite_tweet_id` ASC) VISIBLE;
;
ALTER TABLE `ghanari`.`favorite` 
ADD CONSTRAINT `fk_liker_username`
  FOREIGN KEY (`liker_username`)
  REFERENCES `ghanari`.`member` (`username`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_favorite_tweet_id`
  FOREIGN KEY (`favorite_tweet_id`)
  REFERENCES `ghanari`.`tweet` (`tweet_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;







  
  CREATE TABLE `ghanari`.`mention` (
  `mention_id` INT NOT NULL,
  `tweet_id` INT NOT NULL,
  PRIMARY KEY (`mention_id`, `tweet_id`));
  
  
ALTER TABLE `ghanari`.`mention` 
DROP FOREIGN KEY `fk_id`;
ALTER TABLE `ghanari`.`mention` 
ADD INDEX `fk_tweet_id_idx` (`tweet_id` ASC) VISIBLE;
;
ALTER TABLE `ghanari`.`mention` 
ADD CONSTRAINT `fk_mention_id`
  FOREIGN KEY (`mention_id`)
  REFERENCES `ghanari`.`tweet` (`tweet_id`),
ADD CONSTRAINT `fk_tweet_id`
  FOREIGN KEY (`tweet_id`)
  REFERENCES `ghanari`.`tweet` (`tweet_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  drop table mention;
  
  
  
  
  
  
  
  
  
  
  
  
  CREATE TABLE `ghanari`.`hashtag` (
  `hashtag_content` CHAR(6) NOT NULL,
  PRIMARY KEY (`hashtag_content`));


