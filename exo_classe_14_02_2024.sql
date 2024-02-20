CREATE DATABASE library2;

DROP DATABASE IF EXISTS library;
use library2;
DROP TABLE IF EXISTS jobs;
CREATE TABLE jobs(
	job_id tinyint NOT NULL AUTO_INCREMENT /* PRIMARY KEY */,
    job_desc varchar(100) NOT NULL /* UNIQUE */,
    min_lvl varchar(50) NULL,
    max_lvl varchar(50) NULL,
    CONSTRAINT pk_jobs PRIMARY KEY(job_id),
    CONSTRAINT uniq_jobs UNIQUE(job_id)
);

DROP TABLE IF EXISTS publishers;
CREATE TABLE publishers(
	pub_id tinyint NOT NULL AUTO_INCREMENT /* PRIMARY KEY*/,
    pub_name varchar(50) NOT NULL /* UNIQUE */,
    city varchar(50),
    state varchar(50),
    country varchar(50),
    CONSTRAINT pk_publishers PRIMARY KEY(pub_id),
    CONSTRAINT uniq_publishers UNIQUE(pub_name)
);

DROP TABLE IF EXISTS employee;
CREATE TABLE employee(
	emp_id tinyint NOT NULL AUTO_INCREMENT /* PRIMARY KEY */,
    fname varchar(50) NOT NULL,
    minit varchar(50),
    lname varchar(50) NOT NULL,
    job_id tinyint NOT NULL REFERENCES jobs(job_id),
    job_lvl tinyint NULL,
    pub_id tinyint NOT NULL REFERENCES publishers(pub_id),
    hire_date date,
	CONSTRAINT pk_employee PRIMARY KEY(emp_id),
	CONSTRAINT uniq_employee UNIQUE(emp_id)
);

DROP TABLE IF EXISTS titles;
create table titles(
	tiles_id TINYINT AUTO_INCREMENT PRIMARY KEY,
	titles VARCHAR(100),
	`type` enum('Roman', 'Politique', 'Science', 'Histoire'),
	pub_id SMALLINT,
	price FLOAT,
	advance FLOAT,
	notes VARCHAR(255),
	pub_date DATE,
	CONSTRAINT `fk_pub_id` FOREIGN KEY (`pub_id`) REFERENCES `publishers` (`pub_id`)
);