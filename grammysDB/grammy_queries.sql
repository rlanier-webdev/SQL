-- ==========================================
-- SQL Practice Tasks: GrammysDB
-- Author: RaShunda
-- Purpose: Practice SQL querying skills on Grammy Winners and Nominees from 1965 to 2024
-- ==========================================

USE GrammysDB;
GO

-- 1. Select all columns from the awards table.
SELECT * FROM awards;

-- 2. Select only the year, category, and artist from the awards table.
SELECT year, category, artist FROM awards;

-- 3. Find all records where the artist is "Beyoncé".
SELECT * FROM awards WHERE artist = 'Beyoncé';

-- 4. Find all awards from the year 2020.
SELECT * FROM awards WHERE year = 2020;

-- 5. List all unique categories in the dataset.
SELECT DISTINCT category FROM awards;

-- 6. Count how many total records (nominations + wins) are in the table.
SELECT COUNT(*) AS total_records FROM awards;

-- 7. Count how many awards Beyoncé has been nominated for.
SELECT COUNT(*) AS total_nominations FROM awards WHERE artist = 'Beyoncé';;

-- 8. Count how many Grammy wins Beyoncé has (where winner = 1).
SELECT COUNT(*) AS total_wins FROM awards WHERE artist = 'Beyoncé' AND winner = 'TRUE';

-- 9. List all songs or albums that won in the category 'Record of the Year'.
SELECT song_or_album FROM awards WHERE category = 'Record of the Year' AND winner = 'TRUE';

-- 10. List all years Beyoncé won a Grammy.
SELECT DISTINCT year FROM awards WHERE artist = 'Beyoncé' AND winner = 'TRUE';

-- 11a. Get the number of awards (wins and nominations that did NOT win) each artist has, sorted by most to least.
SELECT artist, COUNT(*) AS total_awards FROM awards GROUP BY artist ORDER BY total_awards DESC;

-- 11b. Get the number of awards in seperate columns (wins and nominations that did NOT win) each artist has, sorted by most wins to least.
SELECT artist, 
	COUNT(CASE WHEN winner = 'TRUE' THEN 1 ELSE NULL END) AS total_wins,
	COUNT(CASE WHEN winner = 'FALSE' THEN 1 ELSE NULL END) AS total_nominations
FROM awards
GROUP BY artist
ORDER BY total_wins DESC;

-- 12. Find the artist(s) who received the most nominations in a single year.
WITH nominations_per_artist_year AS (
  SELECT artist, year, COUNT(*) AS nomination_count
  FROM awards
  GROUP BY artist, year
)
SELECT artist, year, nomination_count
FROM nominations_per_artist_year
WHERE nomination_count = (
  SELECT MAX(nomination_count) FROM nominations_per_artist_year
);

-- 13. Show the top 5 categories with the most nominations.
SELECT TOP 5 category, COUNT(*) AS total_noms FROM awards GROUP BY category ORDER BY total_noms DESC;

-- 14. Find all awards (wins) where the song_or_album field contains the word 'Love'.
SELECT * FROM awards WHERE winner = 'TRUE' AND song_or_album LIKE '%Love%';

-- 15. Retrieve all records that have multiple producers listed.
SELECT * FROM awards WHERE producers LIKE '%,%';

-- 16. Group the data by year and count how many total awards were given each year.
SELECT year, COUNT(winner) as total_awards FROM awards WHERE winner = 'TRUE' GROUP BY year ORDER BY year ASC;

-- 17. Group by category and count how many wins versus nominations there are.
SELECT category, 
	COUNT(CASE WHEN winner = 'TRUE' THEN 1 ELSE NULL END) AS total_wins,
	COUNT(CASE WHEN winner = 'FALSE' THEN 1 ELSE NULL END) AS total_nominations
FROM awards
GROUP BY category
ORDER BY total_wins DESC;

-- 18. Find all duplicate nominations (same year, category, artist, and song_or_album).
SELECT year, category, artist, song_or_album, COUNT(*) AS duplicate_count
FROM awards 
GROUP BY year, category, artist, song_or_album 
HAVING COUNT(*) > 1;

-- 19. Identify the artist(s) who have won at least one Grammy in 3 or more different categories.
SELECT artist, COUNT(DISTINCT category) AS different_categories
FROM awards
WHERE winner = 'TRUE'
GROUP BY artist
HAVING COUNT(DISTINCT category) >= 3;

-- 20. Find all artists who were nominated at least once but never won.
SELECT artist
FROM awards
GROUP BY artist
HAVING COUNT(CASE WHEN winner = 'TRUE' THEN 1 END) = 0;