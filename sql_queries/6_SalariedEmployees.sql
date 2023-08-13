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
Who makes the highest salary? Select Only one. Save this script as 6_SalariedEmployees
*/

select E.EmpID as 'Employee ID', concat_ws(' ', E.EmpFN, coalesce(E.EmpMN, ''), E.EmpLN) as 'Employee Name',
	   E.Salary
from Employees as E
where E.Salary IS NOT NULL
order by E.Salary desc
limit 1;