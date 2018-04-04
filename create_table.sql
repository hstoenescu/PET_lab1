CREATE DATABASE FIRST_DATA;
USE FIRST_DATA;
CREATE TABLE people_region (
	id INT NOT NULL AUTO_INCREMENT,
	age INT NOT NULL,
	region_id INT NOT NULL,
	location_type INT NOT NULL,
	answer VARCHAR(1) NOT NULL,
	primary key (id)
);
