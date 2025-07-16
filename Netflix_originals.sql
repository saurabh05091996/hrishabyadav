/*  1. Retrieve all Netflix Originals with an IMDb score greater than 7, runtime greater than 100 minutes, and the
language is either English or Spanish */

select * from netflix_originals
WHERE IMDBScore > 7 
AND Runtime >100
AND LANGUAGE IN ('spanish','english');

/* 2. Find the total number of Netflix Originals in each language, but only show those languages that have more
than 5 titles */

SELECT  Language , count(*) AS total_number_of_title FROM netflix_originals
group by Language
having count(*) > 5
order by total_number_of_title desc;

/* 3. Get the top 3 longest-running movies in Hindi language sorted by IMDb 
score in descending order */ 

select * from netflix_originals 
where Language in ('Hindi')
order by IMDBScore desc
limit 3;

/*  Retrieve all titles that contain the word "House" in their
name and have an IMDb score greater than 6. */ 
 
select * from netflix_originals 
where Title like ('%House%')
and IMDBScore > 6;

/* 5. Find all Netflix Originals released between the years 2018 and 2020 that are in
either English, Spanish, or Hindi */

select * from netflix_originals 
where str_to_date(Premiere_Date, '%d-%m-%Y') between '2018-01-01' and '2020-12-31'
  and Language in ('English', 'Spanish' , 'Hindi');
  
/* 6. Find all movies that either have a runtime less than 60 minutes or an 
IMDbscore less than 5, sorted by Premiere Date. */

select * from netflix_originals 
where Runtime < 60
or  IMDBScore < 5 
order by STR_TO_DATE(Premiere_Date, '%d-%m-%Y');

/* 7. Get the average IMDb score for each genre where the genre has at least 10 movies. */

select GenreID,count(*) as count_movies,round(avg(IMDBScore),2) as avg_IMDBScore from netflix_originals 
group by GenreID
having count(*) >= 10
order by avg_IMDBScore desc;

/* 8. Retrieve the top 5 most common runtimes for Netflix Originals. */

select Runtime,count(*) as total_title from netflix_originals
group by Runtime
order by total_title desc
limit 5;

/* 9. List all Netflix Originals that were released in 2020, grouped by language, and show the total count of titles for
each language. */

select Language ,count(*)  as count_of_Title 
from netflix_originals 
where year(str_to_date(Premiere_Date, '%d-%m-%Y')) = 2020
group by Language
order by count_of_Title desc;

/* 10. Create a new table that enforces a constraint on the IMDb score to be between 0 and 10 and the runtime to
be greater than 30 minutes. */

CREATE TABLE netflix_validated(
ID INT auto_increment PRIMARY KEY,
TITLE varchar(255),
GENRE VARCHAR(100),
LANGUAGE VARCHAR(100),
PREMIERE_DATE DATE,
RUNTIME INT,
IMDBSCORE DECIMAL (3,1),

CHECK (IMDBScore >= 0 AND IMDBScore <= 10),
CHECK (Runtime > 30));

select * from netflix_validated;
DESCRIBE netflix_validated;
show create table netflix_validated