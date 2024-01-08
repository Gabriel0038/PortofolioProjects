-- Table - general_esports_data

CREATE TABLE general_esports_data (
    ID SERIAL PRIMARY KEY,
    Game VARCHAR(255),
    Release_Date INTEGER,
    Genre VARCHAR(255),
    Total_Earnings NUMERIC,
    Offline_Earnings NUMERIC,
    Percent_Offline NUMERIC,
    Total_Players INTEGER,
    Total_Tournaments INTEGER
);

-- Table - historical_esports_data

CREATE TABLE historical_esports_data (
    ID SERIAL PRIMARY KEY,
    Date DATE,
    Game VARCHAR(255),
    Earnings NUMERIC,
    Players INTEGER,
    Tournaments INTEGER
);

-- After data modeling, add data into tables -- Permision was needed for PostgreSQL to access the files - 

COPY general_esports_data FROM 'C:\way\to\general_esports_data.csv' DELIMITER ',' CSV HEADER;
COPY historical_esports_data FROM 'C:\way\to\historical_esports_data.csv' DELIMITER ',' CSV HEADER;


-- Create Foreign Key between tables - Normalization

-- Add 'game_id' column in 'historical_esports_data'

ALTER TABLE historical_esports_data
ADD COLUMN game_id INTEGER;

-- Update 'game_id' column

UPDATE historical_esports_data h
SET game_id = g.ID
FROM general_esports_data g
WHERE h.Game = g.Game;

-- Add constraint for foreign key (ID table FROM general_esports_data linked with game_id FROM historical_esports_data)

ALTER TABLE historical_esports_data
ADD CONSTRAINT fk_game_id
FOREIGN KEY (game_id)
REFERENCES general_esports_data(ID);

-- Queries for the DB --

SELECT * FROM general_esports_data;
SELECT * FROM historical_esports_data;
