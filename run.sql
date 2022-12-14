-- Calling procedure
SELECT * FROM region;
SELECT * FROM gameplatformregionsales;

CALL changeRegion('EU', 'EU&U', 'European Union and Ukraine');

-- Calling function
SELECT * FROM game;
SELECT * FROM gameplatform;

SELECT * FROM publisherReleases('Electronic Arts');

-- Calling trigger
SELECT * FROM game;
SELECT * FROM gameplatform;
SELECT * FROM gameplatformregionsales;

DELETE FROM game WHERE game_id = 1;

