use patients_db;
--1. view all patients.
select * from patients;

--2. count patients by gender
select gender, count(*) as total
from patients
group by gender;

--3. number of deceased patients.
select count(*) as deceased_patients
from patients
where deathdate is not null;

--4. average patient age.
select avg(datediff(curdate(), birthdate)/365.25) as avg_age
from patients;

--5. count by race/ethincity.
select race, ethnicity, count(*) as total
from patients 
group by race, ethnicity
order by total desc;

--6. patients per city
select city, count(*) as num_patients
from patients
group by city
order by num_patients desc;

--7. marital status
select martial_status, count(*) as count
from patients
group by martial_status;
