--You are working on a data analysis project at Deloitte where you need to analyze a dataset containing information
--about various cities. Your task is to calculate the population density of these cities, rounded to the nearest integer, and identify the cities with the minimum and maximum densities.
--The population density should be calculated as (Population / Area).
--The output should contain 'city', 'country', 'density'.

Query:
select city,country,density
from (select city,country, round(population/nullif(area,0)) as density
from cities_population
order by  density asc
limit 1)
as min_density
union all
select city,country,density
from (select city,country, round(population/nullif(area,0)) as density
from cities_population
order by  density desc
limit 1)
as max_density

