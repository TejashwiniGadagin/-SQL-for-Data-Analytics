-- Data Cleaning 

update myschema.coviddata 
set longtitude=0 where longtitude is null;


select COUNT(*) from myschema.coviddata;


---Display 10 records from table

select  * from myschema.coviddata
limit 10 ;

--write query to display records by month in asceding order.

SELECT distinct(date_part('month',date)) as nb_months from myschema.coviddata
order by nb_months;

--write query to display records by year in asceding order.

select distinct(date_part('year',date)) as nb_year from myschema.coviddata
order by nb_year;


--write query to select distinct month and year from date.

select distinct(date_part('month',date)) as nb_months,date_part('year',date) as nb_year from myschema.coviddata
order by nb_year;

--Start date of covid cases
select min(date) from myschema.coviddata;


--no of cases for each month of the year ordered by year and month

select date_part('year',date)as nb_year,date_part('month',date) as nb_month,
count(*) as nb_rows
from myschema.coviddata
group by nb_year, nb_month
order by 1,2;



