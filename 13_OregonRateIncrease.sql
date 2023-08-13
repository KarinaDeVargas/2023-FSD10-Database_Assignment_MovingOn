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
Darnell learns that the manager of the Oregon warehouse has decided to give his hourly 
employees a 10% raise. He asks you to list all the employees who work in the Oregon warehouse, 
and show the old rate along the new rate after a 10% increase to their hourly pay rate. The 
increase applies only to hourly employees. Save the script as 13_OregonRateIncrease.
*/

select concat_ws(' ', E.EmpFN, coalesce(E.EmpMN, ''), E.EmpLN) as `Employee Name`,
       E.HourlyRate as 'Old Hourly Rate',
       ROUND(HourlyRate * 1.10, 2) as 'New Hourly Rate'
from Employees E
join Warehouses as W on E.WarehouseID = W.WarehouseID
where W.WarehouseID = 'OR-1' -- 'OR-1' represents Oregon
and E.HourlyRate IS NOT NULL
order by `Employee Name`
;