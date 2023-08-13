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
Darnell also learns that he must immediately review drivers who have a driving record lower that 
“A” or “B”. those drivers who have a record of “C” will be put on notice, and those with a record 
“D” or “F” can be terminated immediately. List the drivers with these low driving records, and 
sort the list so that Darnell can easily determine the driving record of each driver. Because he can 
enroll long-term drivers in a training program, he also needs to know when each driver started 
working for MovinOn and whether the driver is still employed. Save the script as 
2_DriversWithLowRecords.
*/


select D.DriverID as 'Driver ID', concat_ws(' ', D.DriverFN, coalesce(D.DriverMN, ''), 
       D.DriverLN) as 'Driver Name', D.Phone as 'Phone No', D.Cell as 'Cell Phone', 
       D.StartDate as 'Started Working',
       CASE
		WHEN D.EndDate IS NULL THEN 'Employed'
        ELSE 'Not Employed'
	   END as 'Employment Status',
       D.DrivingRecord as 'Driveing Record'
from drivers as D
where D.DrivingRecord in('C', 'D', 'F')
order by D.DrivingRecord desc
;