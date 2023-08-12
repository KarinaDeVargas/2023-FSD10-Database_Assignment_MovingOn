/* Purpose: Insert Data into tables in the MovingOn_Team3 database  

/* Script Date: August 10, 2023
   Developed by: Team 3
					De Vargas Pereira, Karina
					Feng, Xiaoli
					Hsu, Sophie 
*/
   
-- switch to the MovingOnTeam3 database
use MovingOn_Team3
;

SHOW VARIABLES WHERE Variable_Name="datadir";

/* load data from external csv file */
-- Load Data from Warehouses Source
load data infile '/usr/local/mysql/data/movingon_data_csv/Warehouses_CSV.csv'
into table Warehouses
fields terminated by ','
lines terminated by '\n'
ignore 1 rows
;

select *
from Warehouses
;

-- Load Data from Positions Source
load data infile '/usr/local/mysql/data/movingon_data_csv/Positions_CSV.csv'
into table Positions
fields terminated by ','
lines terminated by '\n'
ignore 1 rows
;

select *
from Positions
;

-- Load Data from Employees Source
load data infile '/usr/local/mysql/data/movingon_data_csv/Employees.csv'
into table Employees
FIELDS OPTIONALLY ENCLOSED BY '"' TERMINATED BY ','
lines terminated by '\n'
ignore 1 rows
;

select *
from Employees
;

-- Load Data from Customers Source
load data infile '/usr/local/mysql/data/movingon_data_csv/Customers.csv'
into table Customers
fields terminated by ','
lines terminated by '\n'
ignore 1 rows
;

select *
from Customers
;

-- Load Data from Drivers Source
load data infile '/usr/local/mysql/data/movingon_data_csv/Drivers.csv'
into table Drivers
fields terminated by ','
lines terminated by '\n'
ignore 1 rows
;

select *
from Drivers
;

-- Load Data from JobDetails Source
load data infile '/usr/local/mysql/data/movingon_data_csv/JobDetails.csv'
into table JobDetails
fields terminated by ','
lines terminated by '\n'
ignore 1 rows
;

select *
from JobDetails
;

-- Load Data from JobOrders Source
load data infile '/usr/local/mysql/data/movingon_data_csv/JobOrders.csv'
into table JobOrders
fields terminated by ','
lines terminated by '\n'
ignore 1 rows
;

select *
from JobOrders
;

-- Load Data from StorageUnits Source
load data infile '/usr/local/mysql/data/movingon_data_csv/StorageUnits.csv'
into table StorageUnits
fields terminated by ','
lines terminated by '\n'
ignore 1 rows
;

select *
from StorageUnits
;

-- Load Data from UnitRentals Source
load data infile '/usr/local/mysql/data/movingon_data_csv/UnitRentals.csv'
into table UnitRentals
fields terminated by ','
lines terminated by '\n'
ignore 1 rows
;

select *
from UnitRentals
;

-- Load Data from Vehicles Source
load data infile '/usr/local/mysql/data/movingon_data_csv/Vehicles.csv'
into table Vehicles
fields terminated by ','
lines terminated by '\n'
ignore 1 rows
;

select *
from Vehicles
;






















/* **********************************************************
in case you want to reset the auto_increment value, you need to
1. delete all data from the table, for exaqmple
select * 
from dvds
;

delete 
from DVDs
;

2. then, alter the table and reset the auto_increment to 1
alter table DVDs
	auto_increment = 1
;

************************************************************ */

