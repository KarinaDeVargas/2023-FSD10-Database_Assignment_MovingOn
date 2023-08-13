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
How many types of jobs are offered at MonivOn? Save this script as 8_JobPositions
*/
select COUNT(distinct E.PositionID) as 'Number Of Positions'
from Employees as E
;