-- Dota 2 Analysis as eSport --

-- Dota 2 general view on game and earnings --

SELECT
	game, release_date, 
	total_players, 
	total_tournaments, 
	CEIL(total_earnings) AS Total_Earnings
FROM
	general_esports_data
WHERE 
	game IN ('Dota 2');	
	
	
-- Dota 2 Total Offline vs Online Earnings --

SELECT
	CEIL(total_earnings - offline_earnings) AS Online_Earnings,
	CEIL(offline_earnings)
FROM
	general_esports_data
WHERE game In ('Dota 2');	


-- Dota 2 total Tournaments per years and earnings --
	
SELECT
    EXTRACT(YEAR FROM h.date) AS Year,
    COUNT(DISTINCT h.tournaments) AS Total_Tournaments,
    SUM(CEIL(h.earnings)) AS Total_Earnings
FROM 
    general_esports_data g
JOIN
    historical_esports_data h ON g.ID = h.game_id
WHERE
    g.game = 'Dota 2'
GROUP BY
    EXTRACT(YEAR FROM h.date)
ORDER BY
    EXTRACT(YEAR FROM h.date);
	

-- Dota 2 players per years --

SELECT 
    EXTRACT(YEAR FROM h.date) AS Year,
    SUM(h.players) AS Total_Players
FROM 
    historical_esports_data h
JOIN
    general_esports_data g ON h.game_id = g.id
WHERE
    g.game = 'Dota 2'
GROUP BY
    EXTRACT(YEAR FROM h.date)
ORDER BY
    EXTRACT(YEAR FROM h.date);

-- END --

-- DASBOARD LINK TO TABLEAU -- https://public.tableau.com/app/profile/gabriel.mihailescu/viz/Dota2_Analysis/Dashboard1 
