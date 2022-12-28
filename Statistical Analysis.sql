select * from myschema.coviddata;

---Mean

select date_part('year',date)as nb_year, date_part('month',date) as nb_month,
round(avg(confirmed),0) mean_confirmed,
round(avg("Death"),0)mean_deaths,
round(avg(recovered),0) mean_recovered
	  from myschema.coviddata
	  group by nb_year, nb_month
	  order by 1,2;


--- TOP 50 percent cases
select percentile_disc(0.5) within group(order by myschema.coviddata.confirmed
									)
from myschema.coviddata;
									
									
---- 1.2. The dispersion: refers to the spread of the values around the central tendency:
-- RANGE = max value - min value
-- VARIANCE
-- STANDART DEVIATION


--confirmed

 select (max(confirmed)- min(confirmed)) as confirmed_range,
 round(variance(confirmed),2)as confirmed_var,round(stddev(confirmed),2)as confirmed_stddev
 from myschema.coviddata;


 -- Death

 select (max("Death")- min("Death")) as Death_range,
 round(variance("Death"),2)as Death_var,round(stddev("Death"),2)as Death_stddev
 from myschema.coviddata;
 
 select (max(recovered)- min(recovered)) as recovered_range,
 round(variance(recovered),2)as recovered_var,round(stddev(recovered),2)as recovered_stddev
 from myschema.coviddata;


 --- spread out of confirmed per month

 select date_part('year',date) as nb_year, date_part('month',date) as nb_month,
 (max(confirmed)- min(confirmed)) as confirmed_range,
 round(variance(confirmed),2)as confirmed_var,round(stddev(confirmed),2)as confirmed_stddev
 from myschema.coviddata
 group by nb_year,nb_month
 order by 1,2;


 -- spread out for death

 select date_part('year',date) as nb_year, date_part('month',date) as nb_month,
 max("Death")- min("Death") as Death_range,
 round(variance("Death"),2)as Death_var,round(stddev("Death"),2)as Death_stddev
 from myschema.coviddata
  group by nb_year,nb_month
 order by 1,2;


 --spread out for recovered per month

 select date_part('year',date) as nb_year, date_part('month',date) as nb_month,
 (max(recovered)- min(recovered)) as recovered_range,
 round(variance(recovered),2)as recovered_var,round(stddev(recovered),2)as recovered_stddev
 from myschema.coviddata
 group by nb_year,nb_month
 order by 1,2;

--Correlation coefficient

 select corr(confirmed,recovered)
 from myschema.coviddata;

 ---
 select percentile_disc(0.5)within group(order by confirmed)
 from myschema.coviddata;
 
 select percentile_disc(0.6)within group(order by confirmed)
 from myschema.coviddata;
 
select percentile_disc(0.75)within group(order by confirmed)
 from myschema.coviddata; 
 
 
 select confirmed 
 from myschema.coviddata
 group by confirmed
 order by confirmed desc;
 
 select percentile_cont(0.75)within group(order by confirmed)
 from myschema.coviddata; 


--- Adding row number to the result set

 select *,
 date_part('year',date) as nb_year, 
 date_part('month',date) as nb_month,
 row_number()over(partition by country order by date)as rn
 from myschema.coviddata; 
					 
 
 select *,
 date_part('year',date) as nb_year, 
 date_part('month',date) as nb_month,
 row_number()over(partition by country order by date)as rn
 from myschema.coviddata
 where date>'2021-01-01' ;
						
						
 select *,
 date_part('year',date) as nb_year, 
 date_part('month',date) as nb_month,
row_number()over(partition by country order by date)as rn
from myschema.coviddata
where date between'2020-01-01'and '2021-12-31';
											
							
 