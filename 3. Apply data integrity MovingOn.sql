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

/* 1. Add foreign key constraint(s) between Employees and Warehouses and Positions tables */   
alter table Employees
    add constraint fk_Employees_Warehouses 
		foreign key (WarehouseID) 
		references Warehouses (WarehouseID),
	add constraint fk_Employees_Positions
		foreign key (PositionID) 
		references Positions(PositionID)        
; 


/* 2. Add foreign key constraint(s) between JobDetails and Vehicles and Drivers and JobOrders tables */    
alter table JobDetails
    add constraint fk_JobDetails_Vehicles 
		foreign key (VehicleID) 
		references Vehicles(VehicleID),
	add constraint fk_JobDetails_Drivers 
		foreign key (DriverID) 
		references Drivers(DriverID),
	add constraint fk_JobDetails_JobOrders 
		foreign key (JobOrderID) 
		references JobOrders(JobOrderID)
;

/* 3. Add foreign key constraint(s) between JobOrders and Customers tables */
alter table JobOrders
    add constraint fk_JobOrders_Customers
		foreign key (CustID) 
		references Customers(CustID)
;

/* 4. Add foreign key constraint(s) between UnitRentals and Customers and Warehouses and StorageUnits tables */
alter table UnitRentals
    add constraint fk_UnitRentals_Customers
		foreign key (CustID) 
		references Customers(CustID),
	add constraint fk_UnitRentals_StorageUnits
		foreign key (StorageUnitID) 
		references StorageUnits(StorageUnitID)
;

/* 5. Add foreign key constraint(s) between StorageUnits and Warehouses tables */
alter table StorageUnits
	add constraint fk_StorageUnits_Warehouses
		foreign key (WarehouseID) 
		references Warehouses(WarehouseID)
;

-- Create check for table UnitRentals
alter table UnitRentals 
	add constraint ck_DateIn_DateOut_UnitRentals check (DateOut >= DateIn)
;


/* -- Create check for table JobOrders
alter table JobOrders 
	add constraint ck_MoveDate_JobOrders check (MoveDate > curdate()+1) -- Moving date must be at least 1 day from todays date
;
*/

/* Unique: Create validation rules as necessary to ensure that users enter consistent, complete, and accurate data in the tables */
-- Create unique values for table Drivers
alter table Drivers
	add constraint uq_SSN_Drivers unique (SSN)
;

-- Create unique values for table Employees
alter table Employees
	add constraint uq_SSN_Employees unique (SSN)
;




