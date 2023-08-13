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
In what states or provinces do the employees reside? Save this script as 
4_EmployeeStatesProvinces
*/

select distinct E.State as 'State'
from Employees as E
;



