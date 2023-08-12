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
-- 1. Load Data from Warehouses Source
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/MovinOn_Data_Source/Warehouses_CSV.csv'
into table Warehouses
fields terminated by ','
lines terminated by '\r\n'
ignore 1 rows
;

select *
from Warehouses
;

-- 2. Load Data from Positions Source
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/MovinOn_Data_Source/Positions_CSV.csv'
into table Positions
fields terminated by ','
lines terminated by '\r\n'
ignore 1 rows
;

select *
from Positions
;

-- 3. Load Data from Employees Source
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/MovinOn_Data_Source/Employees.csv'
into table Employees
fields terminated by ','
lines terminated by '\r\n'
ignore 1 rows
;

select *
from Employees
;

-- 4. Load Data from Customers Source
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/MovinOn_Data_Source/Customers.csv'
into table Customers
fields terminated by ','
lines terminated by '\r\n'
ignore 1 rows
;

select *
from Customers
;

-- 5. Load Data from Drivers Source
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/MovinOn_Data_Source/Drivers.csv'
into table Drivers
fields terminated by ','
lines terminated by '\r\n'
ignore 1 rows
;

select *
from Drivers
;

-- 6. Load Data from Vehicles Source
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/MovinOn_Data_Source/Vehicles.csv'
into table Vehicles
fields terminated by ','
lines terminated by '\r\n'
ignore 1 rows
;

select *
from Vehicles
;

-- 7. Load Data from JobOrders Source
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/MovinOn_Data_Source/JobOrders.csv'
into table JobOrders
fields terminated by ','
lines terminated by '\r\n'
ignore 1 rows
;

select *
from JobOrders
;

-- 8. Load Data from JobDetails Source
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/MovinOn_Data_Source/JobDetails.csv'
into table JobDetails
fields terminated by ','
lines terminated by '\r\n'
ignore 1 rows
;

select *
from JobDetails
;

-- 9. Load Data from StorageUnits Source
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/MovinOn_Data_Source/StorageUnits.csv'
into table StorageUnits
fields terminated by ','
lines terminated by '\r\n'
ignore 1 rows
;

select *
from StorageUnits
;

-- 10. Load Data from UnitRentals Source
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/MovinOn_Data_Source/UnitRentals.csv'
into table UnitRentals
fields terminated by ','
lines terminated by '\r\n'
ignore 1 rows
;

select *
from UnitRentals
;
