CREATE DATABASE library2;

DROP DATABASE IF EXISTS library;
use library2;
DROP TABLE IF EXISTS jobs;
CREATE TABLE jobs (
	job_id tinyint NOT NULL AUTO_INCREMENT /* PRIMARY KEY */,
    job_desc varchar(100) NOT NULL /* UNIQUE */,
    min_lvl varchar(50) NULL,
    max_lvl varchar(50) NULL,
    CONSTRAINT pk_jobs PRIMARY KEY(job_id),
    CONSTRAINT uniq_jobs UNIQUE(job_id)
);