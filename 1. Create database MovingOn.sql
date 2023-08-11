/*
Purpose:  To create database to manage employee, driver, customer, and order data..
*/

/* Script Date: August 10, 2023
   Developed by: Team 3
					De Vargas Pereira, Karina
					Feng, Xiaoli
					Hsu, Sophie 
*/

/* Partial Syntax: 
create object_type object_name
CREATE DATABASE [IF NOT EXISTS] <database name>
[[DEFAULT] CHARACTER SET <character set name>]
[[DEFAULT] COLLATE <collation name>]
*/

/*
create object_type object_name
where object_type: database, table, view, index, function, ...
*/

-- create MovingOn_Team3 database
create database MovingOn_Team3
;

-- switch to the MovingOn_Team3 database
-- use database_name
use MovingOn_Team3
;

-- show MovingOn_Team3 table object 
show tables
;