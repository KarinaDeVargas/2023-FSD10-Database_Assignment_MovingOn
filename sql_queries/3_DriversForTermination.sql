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
If drivers are to be terminated because of their driving record, Darnell wants to include them in 
an additional list. Create this list for Darnell, and include all relevant employment information. 
Save this script as 3_DriversForTermination.
*/

-- update table drivers to set one driving record as ’F‘
UPDATE drivers
SET DrivingRecord = 'F'
WHERE DriverID = 2;

select *
from drivers
;
-- script 3_DriversForTermination
select D.DriverID as 'Driver ID', concat_ws(' ', D.DriverFN, coalesce(D.DriverMN, ''), 
       D.DriverLN) as 'Driver Name', D.Phone as 'Phone No', D.Cell as 'Cell Phone', 
       D.StartDate as 'Started Working',
       CASE
		WHEN D.EndDate IS NULL THEN 'Employed'
        ELSE 'Terminated'
	   END as 'Status',
       D.DrivingRecord as 'Driveing Record',
       D.Address as 'Address', D.City as 'City', D.State as 'State', D.ZIP as 'ZIP'
from drivers as D
where D.DrivingRecord in('D', 'F')
order by D.DrivingRecord desc
;


