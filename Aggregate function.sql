

--Min no of confirmed,death and recovered cases per month

select * from myschema.coviddata;

select date_part('year',date) as nb_year,date_part('month',date) as nb_month,
min(confirmed) as min_confirmed,
min("Death") as min_deaths,
min(recovered) as min_recovered
from myschema.coviddata
group by nb_year,nb_month
order by 1,2;


--Max no of confirmed,death and recovered cases per month

select date_part('year',date) as nb_year,date_part('month',date) as nb_month,
max(confirmed) as max_confirmed,
max("Death") as max_deaths,
max(recovered) as max_recovered
from myschema.coviddata
group by nb_year,nb_month
order by 1,2;

--Sum no of confirmed,death and recovered cases per month

select date_part('year',date) as nb_year,date_part('month',date) as nb_month,
sum(confirmed) as total_confirmed,
sum("Death") as total_deaths,
sum(recovered) as total_recovered
from myschema.coviddata
group by nb_year,nb_month
order by 1,2;




