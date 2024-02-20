CREATE DATABASE if not exists library2;

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
CREATE TABLE titles(
	tiles_id TINYINT AUTO_INCREMENT PRIMARY KEY,
	titles VARCHAR(100),
	`type` enum('Roman', 'Politique', 'Science', 'Histoire'),
	pub_id SMALLINT REFERENCES publishers (pub_id),
	price FLOAT,
	advance FLOAT,
	notes VARCHAR(255),
	pub_date DATE
);

DROP TABLE IF EXISTS stores;
CREATE TABLE stores(
    stor_id TINYINT AUTO_INCREMENT PRIMARY KEY,
    stor_name VARCHAR(50),
    stor_address VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50)
);

DROP TABLE IF EXISTS sales; 
CREATE TABLE sales (
    store_id TINYINT REFERENCES `stores` (`stor_id`),
    ord_num TINYINT,
    title_id SMALLINT REFERENCES `titles` (`title_id`),
    ord_date datetime,
    qty INT,
    PRIMARY KEY (store_id, ord_num, title_id)
);

DROP TABLE IF EXISTS redactions;
CREATE TABLE redactions(
	au_id tinyint not null REFERENCES `authors` (`au_id`),
    title_id tinyint not null REFERENCES `titles` (`title_id`),
    au_ord tinyint not null,
    royalty float
);

DROP TABLE IF EXISTS authors;
CREATE TABLE authors(
  au_id TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  au_lname VARCHAR(50) NOT NULL,
  au_fname VARCHAR(50) NOT NULL,
  phone varchar(20) not null UNIQUE CHECK (phone LIKE '+%' AND length(phone) BETWEEN 10 AND 15),
  address VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NULL,
  zip VARCHAR(6) CHECK (zip regexp '^[A-Za-z][0-9][A-Za-z][0-9][A-Za-z][0-9]$') NOT NULL,
  contract text null, 
  email varchar(50) NOT NULL unique CHECK(email LIKE '%@%')
  -- PRIMARY KEY (`au_id`),
  -- UNIQUE INDEX `au_id_UNIQUE` (`au_id` ASC) VISIBLE);
);