/* Purpose: Manipulating Data in the MovingOn_Team3 database  
   Script Date: August 12, 2023
   Developed by: Team 3
					De Vargas Pereira, Karina
					Feng, Xiaoli
					Hsu, Sophie 
*/
   
-- switch to the MovingOnTeam3 database
use MovingOn_Team3
;

/*
Darnell sometimes needs to contact the warehouse managers, accountants, administrative 
assistants, and other employees at the warehouse where they work. Create a contact list that he 
can use to phone employees, and that contains enough information to identity employees, their 
positions, and their warehouses along with the warehouse phone number. Because Darnell might 
eventually use this list as the basis for a report, the employee’s name should appear as one full 
name, with the last name first. When you show this query to Darnell, he realizes that it would be 
more helpful if he could specify a particular warehouse before producing the list, and then see the 
contact information only for the employees who work in that warehouse. Create a script that 
meets these needs, saving it as 11_EmployeeContactByWarehouse.
*/

select concat_ws(' ', E.EmpFN, coalesce(E.EmpMN, ''), E.EmpLN) as `Employee Name`,
       P.Title as 'Position',
       W.WarehouseID as `Warehouse ID`, 
       W.Phone as 'Warehouse Phone',
       E.Phone as 'Employee Phone', 
       E.Cell as 'Employee CellPhone'
from Employees as E
join Positions as P on E.PositionID = P.PositionID
join Warehouses as W on E.WarehouseID = W.WarehouseID
order by `Employee Name`, `Warehouse ID`
;