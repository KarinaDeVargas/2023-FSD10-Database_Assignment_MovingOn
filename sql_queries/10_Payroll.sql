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
To prepare for a payroll, Darnell must provide a list of list of employees that includes their salary 
or hourly pay rate. The list must also include Social Security Numbers and employee IDs so that 
an outside firm can properly process the payroll. Produce an employee list that provides this 
information, and sort it so that it’s easy to find an employee by name. for those employees who 
are on a salary, the list should show their monthly wage. Save this script as 10_Payroll.
*/

select E.EmpID as 'Employee ID', concat_ws(' ', E.EmpFN, coalesce(E.EmpMN, ''), E.EmpLN) as 'Employee Name', E.SSN as 'Social Security Numbers',
       CASE
           when HourlyRate IS NOT NULL then CONCAT('Hourly: $', format(HourlyRate, 2))
           when Salary IS NOT NULL then CONCAT('Monthly: $', format(Salary / 12, 2))
           else 'N/A'
       END as 'Pay Rate'
from Employees as E
order by E.EmpID
;