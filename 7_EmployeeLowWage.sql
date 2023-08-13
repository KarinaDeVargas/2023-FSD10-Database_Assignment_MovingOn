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
Who is paid the lowest hourly rate? Select Only one. Save this script as 7_EmployeeLowWage
*/

select E.EmpID as 'Employee ID', concat_ws(' ', E.EmpFN, coalesce(E.EmpMN, ''), E.EmpLN) as 'Employee Name',
       E.HourlyRate as 'Hourly Rate'
from Employees as E
where E.HourlyRate IS NOT NULL
order by E.HourlyRate asc
limit 1;