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


/* 2. Add foreign key constraint(s) between JobDetails and Vehicles and Drivers tables */    
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

/* 5. Add foreign key constraint(s) between StorageUnits and Warehouses tables ???? - I am not too sure about this one */
alter table StorageUnits
	add constraint fk_StorageUnits_Warehouses
		foreign key (WarehouseID) 
		references Warehouses(WarehouseID)
;


/* Check: Create validation rules as necessary to ensure that users enter consistent, complete, and accurate data in the tables */
-- Create check for table Drivers
alter table drivers 
	add constraint ck_StartDate_EndDate_Drvier check (EndDate >= StartDate)
;

-- Create check for table UnitRentals
alter table UnitRentals 
	add constraint ck_DateIn_DateOut_UnitRentals check (DateOut >= DateIn)
;

-- Create check for table Employees
alter table Employees 
	add constraint ck_StartDate_EndDate_Employees check (EndDate >= StartDate)
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








/*

6. Add records in each table. In some cases, you might need to import data stored in an Excel workbook into a table. If you have not created the table in the database, you can import the data and create the table at the same time. Robert received some Excel files from David containing data that he needs to store in the database. One of those files, Employee.xlsx (located in the Assignment 2 Data folder), contains data about the employees. Robert decides to create tblEmployee table by importing the data from the Employee.xlsx Excel file.

7. Now that you have worked with Robert Iko at the MovinOn moving and storage company to develop the design for the MovinOn database, he explains that their most pressing task is to serve the needs of the human resources department. Darnell Colmenero is an administrative assistant responsible for many human resources tasks, and asks for your help extracting information from the MovinOn database. Although an outside company processes payroll for MovinOn, Darnell and others maintain complete employment information and strive to meet management’s goal of recruiting and retaining skilled, qualified employees who are well trained in customer service. Having employees working in three warehouses in three states has made it difficult to track employee information, and the potential merger and expansion means that human resources must take advantage of the MovinOn database to maintain and retrieve employee information. Darnell asks for your help in filtering data and creating queries that provide the information that he needs.
Create queries to answer the following questions:

8. The truck drivers for MovinOn are special type of employee, and their data is stored in a table separate from the rest of the employees because of driving certification requirements. Drivers are certified to drive trucks with a specified number of axles, and MovinOn must be sertain that a driver is certified to drive a particular truck. when Darnell meets with David Bower, the general manager, he learns that only drivers who have a driving record of “A” or “B” are allowed to drive the large trucks (those with four axles or more). He asks you to identify the drivers qualified to drive the four-axle trucks. Because he will use the list you create to call drivers when he needs a substitute, include the phone numbers and driving record for each driver. Save the script as 1_4AxleDrivers.

9. Darnell also learns that he must immediately review drivers who have a driving record lower that “A” or “B”. those drivers who have a record of “C” will be put on notice, and those with a record “D” or “F” can be terminated immediately. List the drivers with these low driving records, and sort the list so that Darnell can easily determine the driving record of each driver. Because he can enroll long-term drivers in a training program, he also needs to know when each driver started working for MovinOn and whether the driver is still employed. Save the script as 2_DriversWithLowRecords.

10. If drivers are to be terminated because of their driving record, Darnell wants to include them in an additional list. Create this list for Darnell, and include all relevant employment information. Save this script as 3_DriversForTermination.
Darnell is completing a small business certification form for the U.S. Department of Labor, and needs quick answers to some basic questions about employees. Answer the following questions:

11. In what states or provinces do the employees reside? Save this script as 4_EmployeeStatesProvinces

12. How many employees in each city? Save this script as 5_EmployeesPerCity

13. Who makes the highest salary? Select Only one. Save this script as 6_SalariedEmployees

14. Who is paid the lowest hourly rate? Select Only one. Save this script as 7_EmployeeLowWage

15. How many types of jobs are offered at MonivOn? Save this script as 8_JobPositions

16. How many people are employed in each type of job? Save this script as 9_JobsPerPosition

17. To prepare for a payroll, Darnell must provide a list of list of employees that includes their salary or hourly pay rate. The list must also include Social Security Numbers and employee IDs so that an outside firm can properly process the payroll. Produce an employee list that provides this information, and sort it so that it’s easy to find an employee by name. for those employees who are on a salary, the list should show their monthly wage. Save this script as 10_Payroll.

18. Darnell sometimes needs to contact the warehouse managers, accountants, administrative assistants, and other employees at the warehouse where they work. Create a contact list that he can use to phone employees, and that contains enough information to identity employees, their positions, and their warehouses along with the warehouse phone number. Because Darnell might eventually use this list as the basis for a report, the employee’s name should appear as one full name, with the last name first. When you show this query to Darnell, he realizes that it would be more helpful if he could specify a particular warehouse before producing the list, and then see the contact information only for the employees who work in that warehouse. Create a script that meets these needs, saving it as 11_EmployeeContactByWarehouse.

19. MovinOn knows that having a workforce of long-term employees improves customer service and avoids the high expense of training new employees. Darnell wants to know if one warehouse is more effective at retaining employees than another. Create an employee list that calculates the number of years each employee has worked for MovinOn. Organize the list by job title within each warehouse. Save the script as 12_EmployeeLongevity.

20. Darnell learns that the manager of the Oregon warehouse has decided to give his hourly employees a 10% raise. He asks you to list all the employees who work in the Oregon warehouse, and show the old rate along the new rate after a 10% increase to their hourly pay rate. The increase applies only to hourly employees. Save the script as 13_OregonRateIncrease.

FINAL: Submit the zipped folder to your instructor with using My JAC Portal (OmniVox Services).


*/





