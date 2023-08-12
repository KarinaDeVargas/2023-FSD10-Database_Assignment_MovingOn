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

/* load data from external csv file */
-- Load Data from Warehouses Source
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/MovinOn_Data_Source/Warehouses_CSV.csv'
into table Warehouses
fields terminated by ','
lines terminated by '\r\n'
ignore 1 rows
;

select *
from Warehouses
;

-- Load Data from Positions Source
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/MovinOn_Data_Source/Positions_CSV.csv'
into table Positions
fields terminated by ','
lines terminated by '\r\n'
ignore 1 rows
;

select *
from Positions
;

-- Load Data from Positions Source
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/MovinOn_Data_Source/Positions_CSV.csv'
into table Positions
fields terminated by ','
lines terminated by '\r\n'
ignore 1 rows
;

select *
from Positions
;

-- Load Data from Employees Source
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/MovinOn_Data_Source/Employees_CSV.csv'
into table Employees
fields terminated by ','
lines terminated by '\r\n'
ignore 1 rows
;

select *
from Employees
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

