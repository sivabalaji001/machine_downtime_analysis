-- create a table with a name machine_data
create table if not exists machine_data(
	date_ varchar,
	Machine_ID varchar,
	Assembly_Line_No varchar,
	Hydraulic_Pressure float,
	Coolant_Pressure float,
	Air_System_Pressure float,
	Coolant_Temperature	float,
	Hydraulic_Oil_Temperature float,
	Spindle_Bearing_Temperature float,
	Spindle_Vibration float,
	Tool_Vibration	float,
	Spindle_Speed float,
	Voltage float,
	Torque float,
	Cutting float,
	Downtime varchar
);
-- first 5 rows of the table
select * from machine_data limit 5;

-- change data type of the date_ column
-- alter table machine_data alter column date_ set data type date using to_date(date_,'dd-mm-yyyy');


-- shape of the table
-- finding no of columns and rows
select count(column_name) from information_schema.columns where table_name='machine_data';
select COUNT(*) from machine_data;
-- shape=(rows=2500,columns=16)


select count(*) from machine_data where downtime='No_Machine_Failure';
select count(*) from machine_data where downtime='Machine_Failure';
-- there is 1265 rows results machine failure and 1235 rows results no machine failure.


-- finding unique values in varchar columns
select machine_id , count(*) from machine_data group by machine_id having count(*)>1;

select assembly_line_no , count(*) from machine_data group by assembly_line_no having count(*)>1;



-- select machine_id,assembly_line_no from machine_data where assembly_line_no='Shopfloor-L2';
--  machine_id and assembly_line_no are have 3 unique values and each value in machine_id have a corresponding same assembly_line_no value
select machine_id,assembly_line_no , count(*) from machine_data group by machine_id,assembly_line_no having count(*)>1;
-- "Makino-L3-Unit1-2015"	"Shopfloor-L3"	818
-- "Makino-L2-Unit1-2015"	"Shopfloor-L2"	808
-- "Makino-L1-Unit1-2013"	"Shopfloor-L1"	874


-- this data have a details upto 164 days machine production from 2021-08-12 to 2022-12-05.
select distinct date_ from machine_data order by date_ asc;
select count(distinct date_) from machine_data;
select min(date_),max(date_) from machine_data;



-- select aggregate_function(hydraulic_pressure) from machine_data;
select 
avg(hydraulic_pressure) as avg_hydrap,
min(hydraulic_pressure) as min_hydrap,
max(hydraulic_pressure) as max_hydrap,
avg(voltage) as avg_vol,
min(voltage) as min_vol,
max(voltage) as max_vol
from machine_data;

select 
avg(voltage) as avg_vol,
min(voltage) as min_vol,
max(voltage) as max_vol
from machine_data;

-- Handling null values
select hydraulic_pressure 
CASE
    WHEN hydraulic_pressure ISNULL then avg(hydraulic_pressure)
	else hydraulic_pressure
end from machine_data ;
	
select hydraulic_pressure 
CASE
    WHEN hydraulic_pressure ISNULL then avg(hydraulic_pressure)
	else hydraulic_pressure
end from machine_data ;

select count(hydraulic_pressure),count(Coolant_Pressure),count(Air_System_Pressure),count(Coolant_Temperature) from machine_data where hydraulic_pressure isnull;

select count(*) from machine_data where hydraulic_pressure  isnull;
select count(*) from machine_data where Coolant_Pressure  isnull;
select count(*) from machine_data where Coolant_Temperature  isnull;
select count(*) from machine_data where Air_System_Pressure  isnull;
select count(*) from machine_data where hydraulic_pressure  isnull;
