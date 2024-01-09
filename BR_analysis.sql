
-- General Information on Battle Royale Genre on eSports scene -- game/total players/total tournaments

SELECT
	genre,
	game,
	release_date,
	total_players,
	total_tournaments
FROM
	general_esports_data
WHERE
	genre = 'Battle Royale'
ORDER BY game;	


-- Total earnings per each game from Battle Royale genre - DESC order --

SELECT
	game,
	CEIL(SUM(total_earnings)) AS Total_Earnings
FROM
	general_esports_data
WHERE
	genre = 'Battle Royale'
GROUP BY	
	game
ORDER BY
	Total_Earnings DESC;


-- Total Earnings Per Years for 3 Major names on Battle Royale scene -- Fortnite, PUBG, Apex - 

SELECT
	g.game,
	EXTRACT (YEAR FROM h.date) AS Year,
	SUM(CEIL(g.total_earnings)) AS Total_Earnings
FROM
	general_esports_data g
JOIN
	historical_esports_data h ON g.id = h.game_id
WHERE
	g.genre = 'Battle Royale' AND g.game IN ('Fortnite', 'Apex Legends', 'PLAYERUNKNOWN’S BATTLEGROUNDS')
GROUP BY 
	g.game, EXTRACT (YEAR FROM h.date)
ORDER BY
	g.game;
	
	
-- Total Players Per Years for 3 Major names on Battle Royale scene -- Fortnite, PUBG, Apex -

SELECT
	game,
	total_players
FROM
	general_esports_data
WHERE
	genre = 'Battle Royale' AND game IN ('Fortnite', 'Apex Legends', 'PLAYERUNKNOWN’S BATTLEGROUNDS');
	

-- Total Players Per Years for 3 Major names on Battle Royale scene -- Fortnite, PUBG, Apex -

SELECT
    g.game,
    EXTRACT(YEAR FROM h.date) AS Year,
    SUM(h.players) AS Total_Players
FROM
    general_esports_data g
JOIN
    historical_esports_data h ON g.id = h.game_id
WHERE
    g.genre = 'Battle Royale' AND g.game IN ('Fortnite', 'Apex Legends', 'PLAYERUNKNOWN’S BATTLEGROUNDS')
GROUP BY
    g.game, EXTRACT(YEAR FROM h.date)
ORDER BY
    g.game, EXTRACT(YEAR FROM h.date);	


-- Total Tournaments and earnings per Years for 3 Major names on Battle Royale scene -- Fortnite, PUBG, Apex - 
	
SELECT
    g.game,
    EXTRACT (YEAR FROM h.date) AS Year,
    SUM(h.tournaments) AS Total_Tournaments,
    SUM(CEIL(h.earnings)) AS Total_Earnings
FROM
    general_esports_data g
JOIN
    historical_esports_data h ON g.id = h.game_id
WHERE
	g.genre = 'Battle Royale' AND g.game IN ('Fortnite', 'Apex Legends', 'PLAYERUNKNOWN’S BATTLEGROUNDS')
GROUP BY
    g.game, EXTRACT (YEAR FROM h.date);


-- Difference between online and offline earnings for 3 Major names on Battle Royale scene -- Fortnite, PUBG, Apex -

SELECT
	game,
	CEIL(SUM(total_earnings - offline_earnings)) AS Online_Earnings,
	CEIL(SUM(offline_earnings)) AS Offline_Earnings
FROM 
	general_esports_data
WHERE
	genre = 'Battle Royale' AND game IN ('Fortnite', 'Apex Legends', 'PLAYERUNKNOWN’S BATTLEGROUNDS')
GROUP BY 
	game, offline_earnings
	

-- END --
	
	