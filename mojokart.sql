-- --------------------------------------------------------

--
-- Database
--
DROP DATABASE IF EXISTS mojokart;

CREATE DATABASE mojokart;

USE mojokart;

-- --------------------------------------------------------



CREATE TABLE IF NOT EXISTS user_info (
  id int(11) NOT NULL AUTO_INCREMENT,
  user_name varchar(255),
  email varchar(255) not null,
  first_name varchar(255) not null,
  last_name varchar(255) not null,
  mobile varchar(255),
  deleted tinyint(1) NOT NULL DEFAULT 0,
  created_date date NOT NULL,
  created_by varchar(255) NOT NULL,
  last_modified_date date NULL,
  last_modified_by varchar(255) NULL,
  PRIMARY KEY (id)
  );
 
 CREATE TABLE IF NOT EXISTS role_info (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255),
  deleted tinyint(1) NOT NULL DEFAULT 0,
  created_date date NOT NULL,
  created_by varchar(255) NOT NULL,
  last_modified_date date NULL,
  last_modified_by varchar(255) NULL,
  PRIMARY KEY (id)
  );
 
  CREATE TABLE IF NOT EXISTS authority (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255),
  deleted tinyint(1) NOT NULL DEFAULT 0,
  created_date date NOT NULL,
  created_by varchar(255) NOT NULL,
  last_modified_date date NULL,
  last_modified_by varchar(255) NULL,
  PRIMARY KEY (id)
  );
 
  CREATE TABLE IF NOT EXISTS user_role (
  id int(11) NOT NULL AUTO_INCREMENT,
  role_id int(11),
  user_id int(11),
  deleted tinyint(1) NOT NULL DEFAULT 0,
  created_date date NOT NULL,
  created_by varchar(255) NOT NULL,
  last_modified_date date NULL,
  last_modified_by varchar(255) NULL,
  PRIMARY KEY (id)
  );
 
ALTER TABLE user_role ADD CONSTRAINT fk_user_role_role_id FOREIGN KEY (role_id)
REFERENCES role_info (id) ON DELETE CASCADE;

ALTER TABLE user_role ADD CONSTRAINT fk_user_role_user_id FOREIGN KEY (user_id)
REFERENCES user_info (id) ON DELETE CASCADE;

CREATE TABLE IF NOT EXISTS role_authority (
  id int(11) NOT NULL AUTO_INCREMENT,
  role_id int(11),
  authority_id int(11),
  deleted tinyint(1) NOT NULL DEFAULT 0,
  created_date date NOT NULL,
  created_by varchar(255) NOT NULL,
  last_modified_date date NULL,
  last_modified_by varchar(255) NULL,
  PRIMARY KEY (id)
  );
 
ALTER TABLE role_authority ADD CONSTRAINT fk_role_authority_role_id FOREIGN KEY (role_id)
REFERENCES role_info (id) ON DELETE CASCADE;

ALTER TABLE role_authority ADD CONSTRAINT fk_role_authority_authority_id FOREIGN KEY (authority_id)
REFERENCES authority (id) ON DELETE CASCADE;
