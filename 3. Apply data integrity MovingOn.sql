/*
Purpose: Apply data integrity to tables in the MovingOn_Team3 database .
*/

/* Script Date: August 10, 2023
   Developed by: Team 3
					De Vargas Pereira, Karina
					Feng, Xiaoli
					Hsu, Sophie 
*/
   
-- switch to the MovingOnTeam3 database
use MovingOn_Team3
;
 
/* Data Integrity Types:
• Domain
• Enity 
• Referential

Constraint Types:
1) Primary Key --> pk_table_name 

2) Foreign key (fk_)
	2a. between 2 tables
		fk_table_name_1_table_name_2	
    2b. between columns withing the same table   
		fk_table_name.column_name1_column_name2 
        
3) Unique - apply to non-primary key column 
		uq_column_name_table_name 

4) Default
	df_column_name_table_name 
    
5) Check
	5a.	ck_column_name_table_name --> ck_Quantity_Orders (quantity condition) 
    5b. ck_column_name1_column_name2_table_name --> ck_DateDue_DateOut_Transactions (DateDue >= DateOut)
*/


/* add froeign key constraint(s) to all the table */

/* 1. Add foreign key constraint(s) between Employees and Warehouses tables */   
alter table Employees
    add constraint fk_Employees_Warehouses 
		foreign key (WarehouseID) 
		references Warehouses (WarehouseID)
; 

SHOW FULL COLUMNS FROM Employees;
SHOW FULL COLUMNS FROM Warehouses;

/* 2. Add foreign key constraint(s) between Drivers and Warehouses tables */
alter table Drivers
	add constraint fk_Drivers_Warehouses foreign key (WarehouseID)
		references Warehouses(WarehouseID)
;

/* 3. Add foreign key constraint(s) between JobDetails and Vehicles tables */    
alter table JobDetails
    add constraint fk_JobDetails_Vehicles 
		foreign key (VehicleID) 
		references Vehicles(VehicleID)
;

/* 4. Add foreign key constraint(s) between JobDetails and Drivers tables */
alter table JobDetails
    add constraint fk_JobDetails_Drivers 
		foreign key (DriverID) 
		references Drivers(DriverID)
;

/* 5. Add foreign key constraint(s) between JobOrders and Customers tables */
alter table JobOrders
    add constraint fk_JobOrders_Customers
		foreign key (CustID) 
		references Customers(CustID)
;

/* 6. Add foreign key constraint(s) between UnitRentals and Customers tables */
alter table UnitRentals
    add constraint fk_UnitRentals_Customers
		foreign key (CustID) 
		references Customers(CustID)
;

/* 7. Add foreign key constraint(s) between UnitRentals and Warehouses tables */
alter table UnitRentals
    add constraint fk_UnitRentals_Warehouses
		foreign key (WarehouseID) 
		references Warehouses(WarehouseID)
;

/* 8. Add foreign key constraint(s) between UnitRentals and StorageUnits tables */
alter table UnitRentals
    add constraint fk_UnitRentals_StorageUnits
		foreign key (UnitID) 
		references StorageUnits(UnitID)
;

/* 9. Add foreign key constraint(s) between Employees and Positions tables */
alter table Employees
    add constraint fk_Employees_Positions
		foreign key (PositionID) 
		references Positions(PositionID)
;



/* 
===============================
===============================
I have stopped here - Ass Karina
===============================
===============================
*/



















/* *************************************************************** */

-- set the DVD Name to unique constraint 
alter table DVDs
	add constraint uq_DVDName_DVDs unique (DVDName)
;
    
/* return the definition of table DVDs */
describe DVDs
;

show columns
from DVDs
;

/* *************************************************************** */
/* set the default value of the column NumDisks in the table DVDs to one. */
alter table DVDs
	alter column NumDisks
		set default 1
;        


/* return the table definition of DVDs */
show columns 
from DVDs
;

/* *************************************************************** */

/* set a check constraint to the table Transactions 
on Date Due to be greater than or equal to Date Out */

alter table Transactions 
	add constraint ck_DateDue_DateOut_Transactions check (DateDue >= DateOut)
;

-- remove the constraint check
alter table Transactions
	drop check ck_DateDue_DateOut_Transactions
;
    
/* return the definition of the table Transaction */
show columns 
from Transactions
;
   
describe Transactions
;
    

/* *************************************************************** */
/* return foreign key constraints in table DVDs */
select *
from information_schema.TABLE_CONSTRAINTS
where table_name = 'DVDs'
and
	constraint_type = 'FOREIGN KEY'	
and 
	table_schema = 'Flix23H2'
;

-- in DVDParticipants
select *
from information_schema.TABLE_CONSTRAINTS
where tabLe_name = 'DVDParticipants'
 and 
	constraint_type = 'FOREIGN KEY'
 and 
	table_schema = 'Flix23H2'
;

/* return the number of foreign key constraints in DVDs */
select count(*) as `No. of Foreign Key Constraints`
from information_schema.TABLE_CONSTRAINTS
where tabLe_name = 'DVDParticipants'
 and 
	constraint_type = 'FOREIGN KEY'
 and 
	table_schema = 'Flix23H2'
;

/*  which key columns have constraints. */
select *
from information_schema.KEY_COLUMN_USAGE
where table_schema = 'Flix23H2'
and constraint_schema = 'FOREIGN KEY'
;

/* count number of foreign key constraint in each table 
DVDs = 5
DVDParticipants - 3
Orders - 2
Transactions - 2
*/

/* ******************************************************** */
-- Drop a constraint 

-- remove the check constraint 
alter table table_name
	drop check ck_constraint_name
;
   
-- remove the foreign key constraint 
alter table table_name
	drop foreign key fk_constraint_name
;
   
-- remove the unique constraint 
alter table table_name
	drop index uq_constraint_name
;

-- remove default constraint
alter table table_name
	alter column_name drop default
;

-- remove primary key constraint
alter table table_name
	drop primary key
;


