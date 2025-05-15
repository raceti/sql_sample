use procedures_db;

--1. 5 most frequent procedures.
select description, count(*) as procedure_count
from procedures
group by description
order by procedure_count desc
limit 5;

--2. 5 most expensive procedures.
select description, avg(base_cost) as avg_cost
from procedures
group by description
order by avg_cost desc
limit 5;

--3. cancer related procedures.
select description, reasondescription, count(*) as count
from procedures
where lower(reasondescription) like '%cancer%'
group by description, reasondescription
order by count desc;

--4. monthly procdure by volume. 
select date_format(str_to_date(left(start, 10), '%y-%m-%d'), '%y-%m') as month,
  count(*) as num_procedures
from procedures
group by month
order by month;

--5. cost distribution of each procedure.
select
case
  when base_cost < 1000 then 'Under $1k'
  when base_cost between 1000 and 4999 then '$1k-$5k'
  when base_cost between 5000 and 9999 then '$5k-$10k'
else 'Over $10k'
end as cost_range,
count(*) as num_procedures
from procedures
group by cost_range
order by num_procedures desc;

--6. top 5 diagnoses requiring most expensive procedures.
select reasondescription, avg(base_cost) as avg_cost
from procedures
where reasondescription is not null
group by reasondescription
order by avg_cost desc
limit 5;
