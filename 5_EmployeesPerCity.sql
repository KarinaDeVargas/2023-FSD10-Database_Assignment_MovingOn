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
How many employees in each city? Save this script as 5_EmployeesPerCity
*/

select E.City as 'City', COUNT(*) as 'Number Of Employees'
from Employees as E
group by E.City;
