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
MovinOn knows that having a workforce of long-term employees improves customer service and 
avoids the high expense of training new employees. Darnell wants to know if one warehouse is 
more effective at retaining employees than another. Create an employee list that calculates the 
number of years each employee has worked for MovinOn. Organize the list by job title within 
each warehouse. Save the script as 12_EmployeeLongevity
*/

select concat_ws(' ', E.EmpFN, coalesce(E.EmpMN, ''), E.EmpLN) as `Employee Name`,
       P.Title as 'Position',
       W.WarehouseID as `Warehouse ID`, 
       DATEDIFF(NOW(), StartDate) / 365 as `Years Worked`,
       W.Phone as 'Warehouse Phone'
from Employees as E
join Positions as P on E.PositionID = P.PositionID
join Warehouses as W on E.WarehouseID = W.WarehouseID
order by `Warehouse ID`, P.Title, `Years Worked` desc, `Employee Name`
;