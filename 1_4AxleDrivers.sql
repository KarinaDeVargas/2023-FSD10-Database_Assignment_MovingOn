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
The truck drivers for MovinOn are special type of employee, and their data is stored in a table 
separate from the rest of the employees because of driving certification requirements. Drivers are 
certified to drive trucks with a specified number of axles, and MovinOn must be certain that a 
driver is certified to drive a particular truck.
when Darnell meets with David Bower, the general manager, he learns that only drivers who 
have a driving record of “A” or “B” are allowed to drive the large trucks (those with four axles or 
more). He asks you to identify the drivers qualified to drive the four-axle trucks. Because he will 
use the list you create to call drivers when he needs a substitute, include the phone numbers and 
driving record for each driver. Save the script as 1_4AxleDrivers. 
*/

select D.DriverID as 'Driver ID', concat_ws(' ', D.DriverFN, coalesce(D.DriverMN, ''), 
       D.DriverLN) as 'Driver Name', D.Phone as 'Phone No', D.Cell as 'Cell Phone',
       D.DrivingRecord as 'Driveing Record'
from drivers as D
where D.DrivingRecord in('A', 'B')
;