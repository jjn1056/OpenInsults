-- 
-- Created by SQL::Translator::Producer::SQLite
-- Created on Mon Apr 25 16:48:15 2011
-- 

;
BEGIN TRANSACTION;
--
-- Table: contributor
--
CREATE TABLE contributor (
  contributor_id varchar(22) NOT NULL,
  note text NOT NULL,
  PRIMARY KEY (contributor_id)
);
--
-- Table: creator
--
CREATE TABLE creator (
  creator_id varchar(22) NOT NULL,
  uri varchar(196) NOT NULL,
  note text NOT NULL,
  PRIMARY KEY (creator_id)
);
--
-- Table: language
--
CREATE TABLE language (
  language_id varchar(22) NOT NULL,
  code_alpha2 char(2) NOT NULL,
  PRIMARY KEY (language_id)
);
CREATE UNIQUE INDEX language_code_alpha2 ON language (code_alpha2);
--
-- Table: right
--
CREATE TABLE right (
  right_id varchar(22) NOT NULL,
  clause varchar(196) NOT NULL,
  PRIMARY KEY (right_id)
);
--
-- Table: role
--
CREATE TABLE role (
  role_id varchar(22) NOT NULL,
  title varchar(24) NOT NULL,
  description varchar(64) NOT NULL,
  PRIMARY KEY (role_id)
);
CREATE UNIQUE INDEX role_description ON role (description);
CREATE UNIQUE INDEX role_title ON role (title);
--
-- Table: source
--
CREATE TABLE source (
  source_id varchar(22) NOT NULL,
  uri varchar(196) NOT NULL,
  note text NOT NULL,
  PRIMARY KEY (source_id)
);
--
-- Table: status
--
CREATE TABLE status (
  status_id varchar(22) NOT NULL,
  name varchar(40) NOT NULL,
  PRIMARY KEY (status_id)
);
CREATE UNIQUE INDEX status_name ON status (name);
--
-- Table: subject
--
CREATE TABLE subject (
  subject_id varchar(22) NOT NULL,
  label varchar(40) NOT NULL,
  comment text NOT NULL,
  PRIMARY KEY (subject_id)
);
--
-- Table: user
--
CREATE TABLE user (
  user_id varchar(22) NOT NULL,
  email varchar(96) NOT NULL,
  created datetime NOT NULL,
  PRIMARY KEY (user_id)
);
CREATE UNIQUE INDEX user_email ON user (email);
--
-- Table: tag
--
CREATE TABLE tag (
  tag_id varchar(22) NOT NULL,
  language_id varchar(36) NOT NULL,
  term varchar(40) NOT NULL,
  created datetime NOT NULL,
  PRIMARY KEY (tag_id)
);
CREATE INDEX tag_idx_language_id ON tag (language_id);
CREATE UNIQUE INDEX tag_term ON tag (term);
--
-- Table: user_role
--
CREATE TABLE user_role (
  user_id varchar(22) NOT NULL,
  role_id varchar(22) NOT NULL,
  PRIMARY KEY (user_id, role_id)
);
CREATE INDEX user_role_idx_role_id ON user_role (role_id);
CREATE INDEX user_role_idx_user_id ON user_role (user_id);
--
-- Table: video
--
CREATE TABLE video (
  video_id varchar(22) NOT NULL,
  language_id varchar(22) NOT NULL,
  status_id varchar(22) NOT NULL,
  title varchar(24) NOT NULL,
  description varchar(140) NOT NULL,
  transcript text NOT NULL,
  published_on_site datetime NOT NULL,
  PRIMARY KEY (video_id)
);
CREATE INDEX video_idx_language_id ON video (language_id);
CREATE INDEX video_idx_status_id ON video (status_id);
--
-- Table: video_contributor
--
CREATE TABLE video_contributor (
  video_id varchar(22) NOT NULL,
  contributor_id varchar(22) NOT NULL,
  PRIMARY KEY (video_id, contributor_id)
);
CREATE INDEX video_contributor_idx_contributor_id ON video_contributor (contributor_id);
CREATE INDEX video_contributor_idx_video_id ON video_contributor (video_id);
--
-- Table: video_creator
--
CREATE TABLE video_creator (
  video_id varchar(22) NOT NULL,
  creator_id varchar(22) NOT NULL,
  PRIMARY KEY (video_id, creator_id)
);
CREATE INDEX video_creator_idx_creator_id ON video_creator (creator_id);
CREATE INDEX video_creator_idx_video_id ON video_creator (video_id);
--
-- Table: video_right
--
CREATE TABLE video_right (
  video_id varchar(22) NOT NULL,
  right_id varchar(22) NOT NULL,
  PRIMARY KEY (video_id, right_id)
);
CREATE INDEX video_right_idx_right_id ON video_right (right_id);
CREATE INDEX video_right_idx_video_id ON video_right (video_id);
--
-- Table: video_source
--
CREATE TABLE video_source (
  video_id varchar(22) NOT NULL,
  source_id varchar(22) NOT NULL,
  PRIMARY KEY (video_id, source_id)
);
CREATE INDEX video_source_idx_source_id ON video_source (source_id);
CREATE INDEX video_source_idx_video_id ON video_source (video_id);
--
-- Table: video_subject
--
CREATE TABLE video_subject (
  video_id varchar(22) NOT NULL,
  subject_id varchar(22) NOT NULL,
  PRIMARY KEY (video_id, subject_id)
);
CREATE INDEX video_subject_idx_subject_id ON video_subject (subject_id);
CREATE INDEX video_subject_idx_video_id ON video_subject (video_id);
--
-- Table: video_tag
--
CREATE TABLE video_tag (
  video_id varchar(22) NOT NULL,
  tag_id varchar(22) NOT NULL,
  PRIMARY KEY (video_id, tag_id)
);
CREATE INDEX video_tag_idx_tag_id ON video_tag (tag_id);
CREATE INDEX video_tag_idx_video_id ON video_tag (video_id);
COMMIT