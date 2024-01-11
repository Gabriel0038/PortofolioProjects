-- General Stats on MOBA genre --

SELECT
    g.genre,
    COUNT(DISTINCT g.game) AS Total_Games,
    SUM(g.total_players) AS Total_Players,
    SUM(CEIL(h.earnings)) AS Total_Earnings
FROM
    general_esports_data g
JOIN
    historical_esports_data h ON g.ID = h.game_id
WHERE
    g.genre = 'Multiplayer Online Battle Arena'
GROUP BY
    g.genre;

-- Total Earnings per Years on MOBA games --

SELECT
	g.game,
    EXTRACT(YEAR FROM h.date) AS Year,
    SUM(CEIL(h.earnings)) AS Total_Earnings
FROM
    general_esports_data g
JOIN
    historical_esports_data h ON g.ID = h.game_id
WHERE
    g.genre = 'Multiplayer Online Battle Arena'
GROUP BY
    g.game, EXTRACT(YEAR FROM h.date)
ORDER BY
    g.game, EXTRACT(YEAR FROM h.date);


-- Total Players Per Years on MOBA games -- 

SELECT
	g.game,
    EXTRACT(YEAR FROM h.date) AS Year,
    SUM(g.total_players) AS Total_Players
FROM
    general_esports_data g
JOIN
    historical_esports_data h ON g.ID = h.game_id
WHERE
    g.genre = 'Multiplayer Online Battle Arena'
GROUP BY
	g.game,
    EXTRACT(YEAR FROM h.date)
ORDER BY
	g.game,
    EXTRACT(YEAR FROM h.date);
	
	
-- Total Tournaments Per Years on MOBA games -- 

SELECT
	g.game,
    EXTRACT(YEAR FROM h.date) AS Year,
    COUNT(DISTINCT h.tournaments) AS Total_Tournaments
FROM
    general_esports_data g
JOIN
    historical_esports_data h ON g.ID = h.game_id
WHERE
    g.genre = 'Multiplayer Online Battle Arena'
GROUP BY
	g.game,
    EXTRACT(YEAR FROM h.date)
ORDER BY
	g.game,
    EXTRACT(YEAR FROM h.date);


-- TOP MOBA Games based on earnings -- 

SELECT
    g.game,
    SUM(CEIL(h.earnings)) AS Total_Earnings
FROM
    general_esports_data g
JOIN
    historical_esports_data h ON g.ID = h.game_id
WHERE
    g.genre = 'Multiplayer Online Battle Arena'
GROUP BY
    g.game
ORDER BY
    TotalEarnings DESC
LIMIT 10;

-- END --