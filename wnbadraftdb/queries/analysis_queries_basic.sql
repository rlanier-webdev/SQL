-- ==========================================
-- SQL Practice Tasks: WNBADraftDB
-- Author: RaShunda
-- Purpose: Practice SQL querying skills on WNBA Draft data
-- ==========================================
USE WNBADraftDB
GO

SELECT * FROM Picks;

-- 1. List all players who were drafted in the year 2000.
SELECT player FROM Picks WHERE year = 2000;

-- 2. Find all players who played more than 5 seasons (years_played).
SELECT player FROM Picks WHERE years_played > 5;

-- 3. Show all players who scored more than 500 total points.
SELECT player, SUM(games * points) AS total_points 
FROM Picks 
GROUP BY player 
HAVING SUM(games * points) > 500
ORDER BY total_points DESC;

-- 4. Get the details of the player picked first (overall_pick = 1) in the 2004 draft.
SELECT * FROM Picks WHERE overall_pick = 1 AND year = 2004;

-- 5. List the top 10 players by total points scored.
SELECT TOP 10 player, SUM(games * points) AS total_points 
FROM Picks 
GROUP BY player
ORDER BY total_points DESC;

-- 6. Show the top 5 players with the highest win shares (win_shares).
SELECT TOP 5 player, win_shares
FROM Picks
ORDER BY win_shares DESC;

-- 7. Get the 3 players with the lowest win shares per 40 minutes (win_shares_40).
SELECT TOP 3 player, win_shares_40
FROM Picks
WHERE win_shares_40 IS NOT NULL
ORDER BY win_shares ASC;

-- 8. Find the average points scored by players from each college.
SELECT college, AVG(points) AS avg_points
FROM Picks
WHERE college IS NOT NULL
GROUP BY college
ORDER BY avg_points DESC;

-- 9. Count how many players each team has drafted.
SELECT team, COUNT(player) AS drafted_players
FROM Picks
GROUP BY team
ORDER BY drafted_players DESC;

-- 10. Calculate the total games played by all players drafted in 2001.
SELECT SUM(games) AS total_games
FROM Picks
WHERE year = 2001
GROUP BY year;

-- 11. Which college has produced the most WNBA draftees in this dataset?
SELECT TOP 1 college, COUNT(college) AS number_of_draftees
FROM Picks
GROUP BY college
ORDER BY number_of_draftees DESC;

-- 12. List all players whose name starts with 'D'.
SELECT player FROM Picks WHERE player LIKE 'd%';

-- 13. Find all players who played for a team with 'Shock' in the name.
SELECT team, player FROM Picks WHERE team LIKE '%Shock%';

-- 14. Show players drafted before the year 2000 who played more than 100 games.
SELECT player, games FROM Picks WHERE year < 2000 AND games > 100;

-- 15. Use a CASE statement to create a column that labels players as 'Veteran' if they played more than 6 seasons, otherwise 'Rookie'.
SELECT player, 
 CASE 
  When games > 6 Then 'Veteran' 
  Else 'Rookie' 
 END AS rookie_vet 
FROM Picks;

-- 16. Find the player(s) who played the most minutes.
SELECT player, minutes_played
FROM Picks
WHERE minutes_played = (
  SELECT MAX(minutes_played) FROM Picks
);

-- 17. List the players who scored more points than the average points of all players.
SELECT player, points
FROM Picks
WHERE points > (
	SELECT AVG(points) FROM Picks
) ORDER BY points DESC;

-- 18. Add a column showing each player's rank based on total points scored, ordered from highest to lowest.
SELECT player, SUM(games * points) AS total_points, RANK() OVER(ORDER BY SUM(games * points) DESC) Rank
FROM Picks 
GROUP BY player
ORDER BY total_points DESC, Rank;

-- 19. Partition the data by college and rank the players by win shares within their college.
SELECT college, player, win_shares, RANK() OVER(PARTITION BY college ORDER BY win_shares DESC) Rank
FROM Picks
ORDER BY college, Rank;

-- 20. Show the top player (by win shares) drafted each year.
SELECT p.year, player, win_shares
FROM Picks p
JOIN (SELECT year, MAX(win_shares) AS max_win 
 FROM Picks 
 GROUP BY year
) AS top_per_year
ON p.year = top_per_year.year AND p.win_shares = top_per_year.max_win
ORDER BY p.year;