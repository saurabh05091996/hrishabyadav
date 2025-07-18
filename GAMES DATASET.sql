/* 1. Insert a new game with the title "Future Racing", genre "Racing", release date
"2024-10-01", and developer "Speed Studios" */ 

INSERT INTO  games (GameID,GameTitle,Genre,ReleaseDate,Developer)
VALUES("151","Future Racing","Racing", "2024-10-01","Speed Studios");

/* 2. Update the price of the game with GameID 2 on the PlayStation platform to 60  */

UPDATE game_sales
SET Price = 60
WHERE GameID = 2
AND Platform = "PlayStation";

/* 3. Delete the record of the game with GameID 5 from the Game Sales table. */ 

DELETE FROM  game_sales 
WHERE GameID = 5;

/* 4. Calculate the total number of units sold for each game across all platforms and
regions. */ 
select GameID ,SUM(UnitsSold) as Total_Number_of_UnitSold
from game_sales 
group by GameID;

/* 5.Identify the game with the highest number of units sold in North America */
select GameID ,Sum(UnitsSold) as Highest_number_of_Unitsolds 
from game_sales
where SalesRegion = 'North America'
group by GameID
order by Highest_number_of_Unitsolds desc
limit 1;

/* 6. Get the game titles, platforms, and sales regions along with the units sold for each game. */ 

select g.GameTitle , Platform,SalesRegion ,UnitsSold
from game_sales as gs
join games as g
on g.GameID= gs.GameID;

/* 7. Find all games, including those that have no sales data in the Game Sales table.  */
select * 
from games as g
left join game_sales as gs
on g.GameID = gs.GameID;

/*  8. Retrieve sales records where the game details are missing in the Games table. */ 

select *
from game_sales as gs
left join games as g
on gs.GameID= g.GameID;

/* 9. Retrieve game sales data for North America and Europe removing duplicate records */ 

select distinct * from game_sales
where SalesRegion in ('North America','Europe');

/* 10. Retrieve all game sales data from North America and Europe without removing duplicate records. */

select * from game_sales
where SalesRegion in ('North America','Europe');




