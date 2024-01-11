-- TABLEAU DASHBOARD LINK -- https://public.tableau.com/app/profile/gabriel.mihailescu/viz/Call_Of_Duty_franchies_overview_dashboard/Dashboard1?publish=yes

-- Overview over years for Call of Duty franchise games in eSports --

SELECT
    g.game,
    EXTRACT(YEAR FROM h.date) AS Year,
    SUM(CEIL(h.earnings)) AS Total_Earnings,
    SUM(g.total_players) AS Total_Players,
    COUNT(h.tournaments) AS Total_Tournaments
FROM
    general_esports_data g
JOIN
    historical_esports_data h ON g.ID = h.game_id
WHERE
    g.genre = 'First-Person Shooter' AND g.game LIKE 'Call of Duty%'
GROUP BY
    g.game, EXTRACT(YEAR FROM h.date)
ORDER BY
    g.game, EXTRACT(YEAR FROM h.date);
	

-- Online vs Offline Earnings for Call of Duty franchise games in eSports --

SELECT
    g.game,
    SUM(CEIL(g.total_earnings - g.offline_earnings)) AS Online_Earnings,
    SUM(CEIL(g.offline_earnings)) AS Offline_Earnings
FROM
    general_esports_data g
WHERE
    g.genre = 'First-Person Shooter' AND g.game LIKE 'Call of Duty%'
GROUP BY
    g.game;
	
-- Average players per tournaments and amount of tournaments for Call of Duty franchise games in eSports --

SELECT
    g.game,
    ROUND(AVG(g.total_players), 0) AS Average_Players_Per_Tournament,
	SUM(h.tournaments) AS Total_Tournaments
FROM
    general_esports_data g
JOIN
    historical_esports_data h ON g.ID = h.game_id	
WHERE
    g.genre = 'First-Person Shooter' AND g.game LIKE 'Call of Duty%'
GROUP BY
    g.game;


-- TOP 5 Call of Duty games and the eSports earnings registered --

SELECT
    g.game,
    SUM(CEIL(h.earnings)) AS TotalEarnings
FROM
    general_esports_data g
JOIN
    historical_esports_data h ON g.ID = h.game_id
WHERE
    g.genre = 'First-Person Shooter' AND g.game LIKE 'Call of Duty%'
GROUP BY
    g.game
ORDER BY
    TotalEarnings DESC
LIMIT 5;


-- END --
