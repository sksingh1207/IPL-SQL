use ipl

/*
We write a comment (or instructions / notes, etc), basically a non-SQL statement under a 
pair of forward slash and an asterix and end it with an asterix forward slash. 
*/

/*SQL - pronounced commonly as SEQUEL or just S Q L is a conditional language 
supported by all the famous databases (eg: MySQL, Oracle, SQL Server, PostgreSQL, etc) 
and reporting tools (Power BI, Tableau, Python, and even Excel).

SQL is used to query or send instructions to a database management system to carry on certain 
tasks such as populate data, manipulate data, and query data. SQL contains several 
commands for doing database operations such as: 
SELECT - to read / extract data from the tables. 
INSERT - to add row(s) of data into a table.
UPDATE - to modify exisiting data of a table. 
DELETE - to delete row(s) from a table

CREATE, ALTER, DROP, GRANT, REVOKE, etc. 

These statements are divided into 4 major categories: 
DDL (Data definitional language) - CREATE, ALTER, DROP, TRUNCATE
DML (Data manipulation language) - INSERT, UPDATE, DELETE, SELECT
DCL (Data control language) - GRANT, REVOKE
TCL (Transaction control language) - Rollback, SAVEPOINT
*/

/*Why is the SELECT statement the most commonly used SQL statement?

Data analysts and data scientists most oftenly need access to data from tables. Hence, 
they most commonly use SELECT statement to extract / retrieve the data from the tables meeting 
their critera.

How do we read / extract / query the data from the tables?

SELECT <columns separated by comma> 
FROM <table name>
WHERE <conditions to filter the rows, if any>
Limit <restrict the number of rows to extract>;

*/
select *
from 2019_batsmen
where mat>10;

select *
from 2019_batsmen
limit 5;

SELECT *  /* here the asterix will fetch all columns from the table*/
FROM `ipl.2019_batsmen` /*projectname.dataset.table*/
LIMIT 5; /*Extracts the first 5 records only*/

select Player, Team
from `2019_batsmen(1)`
limit 5;

/*What are the names and teams of all batsmen who played in 2018?
Explanation: This question is designed to demonstrate how to select specific columns from a table using the SELECT statement.*/

SELECT Player, Team
FROM `2018_batsmen_new`;


/*Which teams are represented by all the batsmen from 2019?
Explanation: This question is designed to demonstrate the use of the DISTINCT keyword, which returns only unique values for the specified column(s).*/
select DISTINCT Team
from `2019_batsmen`;

select DISTINCT Team
from `2019_bowlers_new`;

/*What are the total runs scored by all the batsmen in 2018?
Explanation: This question is designed to demonstrate the use of the SUM function, which returns the total value of the specified column across all rows in the table.*/
select sum(Runs) as TotalRuns
from `2018_batsmen_new`;

select sum(Runs) as TotalRuns -- creating a column alias
from `ivyproschool-bootcamp-2023.ipl_men_analysis.2018_batsmen`;

/*List the Chennai batsmen name and total number of matches played in 2019?
Explanation: This question is designed to demonstrate the use of the WHERE clause, which allows us to filter the results based on a specified condition.*/
SELECT Player, Mat
FROM `2019_batsmen`
where Team = "Chennai Super Kings";

select * from `ivyproschool-bootcamp-2023.ipl_men_analysis.2018_bowlers`
limit 5;


-- Q1: Name the bowlers who took 4 wickets haul(s) in 2018.
-- Q2: List the names of teams and the bowlers from 2019
-- Q3. List the 2018 teams that played that had at least one bowler who took 4 wickets haul.

-- q1: 
select Player, Team, 4w
from `2018_bowlers`
where 4w > 0;

/*What are the names and runs incurred by the bowlers in the 2018. 
Show the bowlers who gave the least amount of runs first?
Explanation: This question is designed to demonstrate the use of the ORDER BY clause, which allows us to sort the results based on the specified column(s).*/
select Player, Runs
from `2018_bowlers`
order by Runs asc;

-- List two bowlers who gave the least amount of runs across all teams in 2018. 
select Player, Runs
from `2018_bowlers`
order by Runs asc
limit 2;


-- Q4. Name two bowlers who took most number of wickets. 
select Player, Wkts
from `2018_bowlers`
order by Wkts DESC
limit 2;

/*What are the names and teams of all Allrounders in the year 2018?
Explanation: This question is designed to demonstrate the use of the INNER JOIN clause, which allows us to combine rows from two or more tables based on a related column(s).*/
select a.Player, a.Team
from `2018_bowlers` as a inner join 
`2018_batsmen_new` as b on a.Player = b.Player;


select p.Player, p.Team
from `ivyproschool-bootcamp-2023.ipl_men_analysis.2019_batsmen` as p 
  INNER JOIN `ivyproschool-bootcamp-2023.ipl_men_analysis.2019_bowlers` as a on p.Player = a.Player;

-- Q5. Show the list of batsmen who played in 2018 as well in 2019.
select a.player
from `2019_batsmen` as a inner join 
`2018_batsmen_new` as b on a.Player = b.Player;

/*How many batsmen were there in each team in 2019? 
Explanation: This question is designed to demonstrate the use of the GROUP BY clause, which allows us to group the results based on the specified column(s), and the use of the COUNT function, which returns the total number of rows in each group.*/
select Team, count(Player) as TotalCount
from `2019_batsmen`
group by team;

select Team, count(Player) as TotalCount
from `ivyproschool-bootcamp-2023.ipl_men_analysis.2019_batsmen`
group by Team;

/*Now show the data sorted by the number of batsmen in descending order.*/
select Team, count(Player) as TotalCount
from `2019_batsmen`
group by Team
order by TotalCount DESC;


/*Explanation: This question is designed to demonstrate the use of the GROUP BY clause in combination with the ORDER BY clause, which allows us to sort the grouped results based on the specified column(s).*/
select Team, count(Player) as TotalCount
from `2019_batsmen`
group by Team
order by count(Player) DESC;

-- Q6. How many bowlers were there in each team in 2018 who took at least one 4 wicket haul? 
-- Show the top 2 teams that had most number of such bowers

select Team, count(player) as TotalCount
from `2018_bowlers`
where 4w > 1
group by Team;

/*What are the names of top 2 teams which consists of most number of bowlers in 2018?
Explanation: This question is designed to demonstrate the use of the GROUP BY clause in combination with the ORDER BY clause and the LIMIT clause, which allows us to limit the number of results returned.*/
select Team, count(Player) as TotalCount
from `2018_bowlers`
group by Team
order by count(Player) DESC
limit 2;

-- Which bowlers took the most wickets in the 2018 season?
select Player, Wkts
from `2018_bowlers`
order by Wkts DESC
limit 1;


/*Questions to practice:
1. Which bowler took the most wickets in the 2018 season?
2. Which batsmen scored the most runs in the 2018 season while maintaining an average strike rate of at least 130?
3. Which bowlers took the most wickets in the 2018 season while maintaining an economy rate of less than 7 runs per over?
4. Which batsmen scored the most runs across both 2018 and 2019 seasons?
5. Which batsmen has hit the maximum number of boundaries in 2018, combining 4s and 6s?
6. Name the bowlers who have got 4 wickets haul in 2019.
7. Name 5 such bowlers who bowled the least number of overs in 2018.
8. Which team scored the maximum number of runs in 2019?
9. Name the Batsmen who has hit maximum half centuries, both the years combined
*/

select Player, Wkts
from `2018_bowlers`
order by Wkts DESC
limit 1;

select Player, sum(Runs) as Totalruns
from `2018_batsmen_new`
group by Player
having avg(Strike) >=130
order by TotalRuns desc
limit 1;

SELECT Player, SUM(Wkts) AS TotalWickets
FROM `2018_bowlers(1)`
WHERE Economy < 7
GROUP BY Player
ORDER BY TotalWickets DESC;

select a.Player, sum(b.Runs) as Totalruns
from 2018_batsmen_new as a inner join 2019_batsmen as b on a.Player=b.Player
group by a.Player
order by TotalRuns desc
limit 1;

SELECT Player, SUM(4s) + SUM(6s) AS TotalBoundaries
FROM `2018_batsmen_new`
GROUP BY Player
ORDER BY TotalBoundaries DESC
LIMIT 1;

SELECT Player
FROM `2019_bowlers_new`
WHERE Wkts = 4;

SELECT Player, SUM(Overs) AS TotalOvers
FROM `2018_bowlers(1)`
GROUP BY Player
ORDER BY TotalOvers ASC
LIMIT 5;

SELECT Team, SUM(Runs) AS TotalRuns
FROM `2019_batsmen`
GROUP BY Team
ORDER BY TotalRuns DESC
LIMIT 1;

SELECT a.Player, SUM(a.`50s`) AS TotalHalfCenturies
FROM `2018_batsmen_new` AS a
INNER JOIN `2019_batsmen` AS b ON a.Player = b.Player
GROUP BY a.Player
ORDER BY TotalHalfCenturies DESC
LIMIT 1;

-------------------------

