-- 
-- Created by SQL::Translator::Producer::MySQL
-- Created on Mon Apr 25 16:48:15 2011
-- 
;
SET foreign_key_checks=0;
--
-- Table: `contributor`
--
CREATE TABLE `contributor` (
  `contributor_id` varchar(22) NOT NULL,
  `note` text NOT NULL,
  PRIMARY KEY (`contributor_id`)
) ENGINE=InnoDB;
--
-- Table: `creator`
--
CREATE TABLE `creator` (
  `creator_id` varchar(22) NOT NULL,
  `uri` varchar(196) NOT NULL,
  `note` text NOT NULL,
  PRIMARY KEY (`creator_id`)
) ENGINE=InnoDB;
--
-- Table: `language`
--
CREATE TABLE `language` (
  `language_id` varchar(22) NOT NULL,
  `code_alpha2` char(2) NOT NULL,
  PRIMARY KEY (`language_id`),
  UNIQUE `language_code_alpha2` (`code_alpha2`)
) ENGINE=InnoDB;
--
-- Table: `right`
--
CREATE TABLE `right` (
  `right_id` varchar(22) NOT NULL,
  `clause` varchar(196) NOT NULL,
  PRIMARY KEY (`right_id`)
) ENGINE=InnoDB;
--
-- Table: `role`
--
CREATE TABLE `role` (
  `role_id` varchar(22) NOT NULL,
  `title` varchar(24) NOT NULL,
  `description` varchar(64) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE `role_description` (`description`),
  UNIQUE `role_title` (`title`)
) ENGINE=InnoDB;
--
-- Table: `source`
--
CREATE TABLE `source` (
  `source_id` varchar(22) NOT NULL,
  `uri` varchar(196) NOT NULL,
  `note` text NOT NULL,
  PRIMARY KEY (`source_id`)
) ENGINE=InnoDB;
--
-- Table: `status`
--
CREATE TABLE `status` (
  `status_id` varchar(22) NOT NULL,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`status_id`),
  UNIQUE `status_name` (`name`)
) ENGINE=InnoDB;
--
-- Table: `subject`
--
CREATE TABLE `subject` (
  `subject_id` varchar(22) NOT NULL,
  `label` varchar(40) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB;
--
-- Table: `user`
--
CREATE TABLE `user` (
  `user_id` varchar(22) NOT NULL,
  `email` varchar(96) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE `user_email` (`email`)
) ENGINE=InnoDB;
--
-- Table: `tag`
--
CREATE TABLE `tag` (
  `tag_id` varchar(22) NOT NULL,
  `language_id` varchar(36) NOT NULL,
  `term` varchar(40) NOT NULL,
  `created` datetime NOT NULL,
  INDEX `tag_idx_language_id` (`language_id`),
  PRIMARY KEY (`tag_id`),
  UNIQUE `tag_term` (`term`),
  CONSTRAINT `tag_fk_language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;
--
-- Table: `user_role`
--
CREATE TABLE `user_role` (
  `user_id` varchar(22) NOT NULL,
  `role_id` varchar(22) NOT NULL,
  INDEX `user_role_idx_role_id` (`role_id`),
  INDEX `user_role_idx_user_id` (`user_id`),
  PRIMARY KEY (`user_id`, `role_id`),
  CONSTRAINT `user_role_fk_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_role_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;
--
-- Table: `video`
--
CREATE TABLE `video` (
  `video_id` varchar(22) NOT NULL,
  `language_id` varchar(22) NOT NULL,
  `status_id` varchar(22) NOT NULL,
  `title` varchar(24) NOT NULL,
  `description` varchar(140) NOT NULL,
  `transcript` text NOT NULL,
  `published_on_site` datetime NOT NULL,
  INDEX `video_idx_language_id` (`language_id`),
  INDEX `video_idx_status_id` (`status_id`),
  PRIMARY KEY (`video_id`),
  CONSTRAINT `video_fk_language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `video_fk_status_id` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;
--
-- Table: `video_contributor`
--
CREATE TABLE `video_contributor` (
  `video_id` varchar(22) NOT NULL,
  `contributor_id` varchar(22) NOT NULL,
  INDEX `video_contributor_idx_contributor_id` (`contributor_id`),
  INDEX `video_contributor_idx_video_id` (`video_id`),
  PRIMARY KEY (`video_id`, `contributor_id`),
  CONSTRAINT `video_contributor_fk_contributor_id` FOREIGN KEY (`contributor_id`) REFERENCES `contributor` (`contributor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `video_contributor_fk_video_id` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;
--
-- Table: `video_creator`
--
CREATE TABLE `video_creator` (
  `video_id` varchar(22) NOT NULL,
  `creator_id` varchar(22) NOT NULL,
  INDEX `video_creator_idx_creator_id` (`creator_id`),
  INDEX `video_creator_idx_video_id` (`video_id`),
  PRIMARY KEY (`video_id`, `creator_id`),
  CONSTRAINT `video_creator_fk_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `creator` (`creator_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `video_creator_fk_video_id` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`)
) ENGINE=InnoDB;
--
-- Table: `video_right`
--
CREATE TABLE `video_right` (
  `video_id` varchar(22) NOT NULL,
  `right_id` varchar(22) NOT NULL,
  INDEX `video_right_idx_right_id` (`right_id`),
  INDEX `video_right_idx_video_id` (`video_id`),
  PRIMARY KEY (`video_id`, `right_id`),
  CONSTRAINT `video_right_fk_right_id` FOREIGN KEY (`right_id`) REFERENCES `right` (`right_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `video_right_fk_video_id` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;
--
-- Table: `video_source`
--
CREATE TABLE `video_source` (
  `video_id` varchar(22) NOT NULL,
  `source_id` varchar(22) NOT NULL,
  INDEX `video_source_idx_source_id` (`source_id`),
  INDEX `video_source_idx_video_id` (`video_id`),
  PRIMARY KEY (`video_id`, `source_id`),
  CONSTRAINT `video_source_fk_source_id` FOREIGN KEY (`source_id`) REFERENCES `source` (`source_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `video_source_fk_video_id` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`)
) ENGINE=InnoDB;
--
-- Table: `video_subject`
--
CREATE TABLE `video_subject` (
  `video_id` varchar(22) NOT NULL,
  `subject_id` varchar(22) NOT NULL,
  INDEX `video_subject_idx_subject_id` (`subject_id`),
  INDEX `video_subject_idx_video_id` (`video_id`),
  PRIMARY KEY (`video_id`, `subject_id`),
  CONSTRAINT `video_subject_fk_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `video_subject_fk_video_id` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;
--
-- Table: `video_tag`
--
CREATE TABLE `video_tag` (
  `video_id` varchar(22) NOT NULL,
  `tag_id` varchar(22) NOT NULL,
  INDEX `video_tag_idx_tag_id` (`tag_id`),
  INDEX `video_tag_idx_video_id` (`video_id`),
  PRIMARY KEY (`video_id`, `tag_id`),
  CONSTRAINT `video_tag_fk_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `video_tag_fk_video_id` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;
SET foreign_key_checks=1