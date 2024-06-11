create database Netflix

use Netflix

select * from netflix


--1. Count of movies and TV shows.
select type, Count(type) as Count from netflix
group by type


--2. Distribution of content by country.
select country, COUNT(show_id) as count_of_content from netflix
group by country 
order by count_of_content desc 

--3. Yearly trend of content addition.
select YEAR(date_added) as Year, COUNT(show_id) as Content from netflix
group by YEAR(date_added)
order by YEAR(date_added)

--4. Distribution of Content Ratings.
select rating, count(*) as content from netflix
group by rating 
order by content

--5. Top 10 Directors by Number of Titles.
select director, COUNT(*) as content from netflix 
group by director
order by content desc


--6. Top 10 Actors by Number of Titles.
select Top 10(actor), count(*) as count
from (select TRIM(value) as actor
from netflix
cross apply string_split(cast, ',')) as actors 
group by actor
order by count desc

--7. Average Duration of Movies.
select Concat(AVG(CAST(SUBSTRING(duration, 1, CHARINDEX(' ', duration)-1) as INT)), ' mins') as avg_duration from netflix
where type = 'Movie'