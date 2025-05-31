-- ==========================================
-- Advanced SQL Practice Tasks: WNBADraftDB
-- Author: RaShunda
-- Purpose: Level up SQL skills using advanced logic and insights
-- ==========================================

USE WNBADraftDB
GO

-- 21. Compare total points, minutes, and win shares for each draft year to identify the strongest draft classes.
SELECT year, 
	   SUM(games * points) AS total_points, 
	   SUM(games * minutes_played) AS total_minutes, 
	   SUM(games * win_shares) AS total_win_shares
FROM Picks
GROUP BY year
ORDER BY year DESC;

-- 22. Group players by team and calculate the average win shares, total points, and career length per team to evaluate team-level draft outcomes.
SELECT team,
	   AVG(win_shares) AS average_win_shares,
	   SUM(games * points) AS total_team_points,
	   AVG(years_played) AS average_career_length
FROM Picks
GROUP BY team
ORDER BY total_team_points DESC;

-- 23. Find players drafted after the 20th overall pick who ended up in the top 10% for win shares (late-round gems).
SELECT TOP 10 PERCENT 
	overall_pick, 
	player, 
	win_shares
FROM Picks
WHERE overall_pick > 20 AND win_shares IS NOT NULL
ORDER BY win_shares DESC;

-- 24. Calculate average win shares per player drafted by each team. Rank teams based on drafting efficiency.
SELECT team,
       average_win_shares,
       RANK() OVER (ORDER BY average_win_shares DESC) AS rank
FROM (
    SELECT team, AVG(win_shares) AS average_win_shares
    FROM Picks
    GROUP BY team
) AS TeamAverages
ORDER BY average_win_shares DESC;

-- 25. Calculate the average win shares for each overall draft pick (1st, 2nd, 3rd, etc.) to evaluate pick value over time.
SELECT overall_pick, 
	AVG(
	CASE
		When win_shares IS NULL Then 0
		Else win_shares
	END) AS average_win_shares
FROM Picks
GROUP BY overall_pick
ORDER BY overall_pick;

-- 26. Identify players who had significantly longer or shorter careers (years_played) compared to their draft year peers.
WITH average_career_per_year AS (
	SELECT year, AVG(years_played) AS average_years_played
	FROM Picks
	GROUP BY year
) SELECT player, 
		 years_played, 
		 average_years_played, 
		 (years_played - average_years_played) AS difference 
FROM PICKS
JOIN average_career_per_year ON Picks.year = average_career_per_year.year
ORDER BY ABS(years_played - average_years_played) DESC;

-- 27. For each college, calculate number of draftees, average win shares, and total games played. Rank colleges by draft success.
WITH CollegeStats AS (
	SELECT college, 
		   count(*) AS draftees, 
		   AVG(win_shares) AS average_win_shares, 
		   SUM(games) AS total_games_played,
		   AVG(win_shares) * COUNT(*) AS draft_success_score
	FROM Picks
	GROUP BY college
) SELECT *,
  RANK() OVER (ORDER BY draft_success_score DESC) AS draft_success_rank
  FROM CollegeStats
  WHERE college IS NOT NULL;


-- 28. Calculate the standard deviation of win shares for each draft year to analyze year-to-year volatility.
SELECT year, STDEV(win_shares) AS win_shares_stddev
FROM Picks
GROUP BY year
ORDER BY win_shares_stddev DESC;

-- 29. Use NTILE(4) or a similar method to bucket players into quartiles based on win shares (Q1 = elite, Q4 = lowest).
WITH PlayerQuartiles AS (
	SELECT player, win_shares, NTILE(4) OVER (ORDER BY win_shares DESC) AS quartile
	FROM Picks
	WHERE win_shares IS NOT NULL
) SELECT player,
	win_shares,
	CASE quartile
		WHEN 1 THEN 'ELITE (Q1)'
		WHEN 2 THEN 'Above Average (Q2)'
		WHEN 3 THEN 'Below Average (Q3)'
		WHEN 4 THEN 'Low (Q4)'
	END AS quartile_label
FROM PlayerQuartiles
ORDER BY win_shares DESC;

-- 30. Analyze correlation between pick number, games played, and minutes played against win shares to find strongest predictors of success.
SELECT overall_pick, games, minutes_played, win_shares
FROM Picks
WHERE win_shares IS NOT NULL;

---- Groups players by draft pick range (quintiles) and then analyzes the average win shares in each group to see how draft position relates to performance.
WITH PickBuckets AS (
  SELECT 
    overall_pick,
    win_shares,
    NTILE(5) OVER (ORDER BY overall_pick) AS pick_bucket
  FROM Picks
  WHERE win_shares IS NOT NULL
)
SELECT 
  pick_bucket,
  AVG(win_shares) AS avg_win_shares,
  COUNT(*) AS player_count
FROM PickBuckets
GROUP BY pick_bucket
ORDER BY pick_bucket;

