-- Function for getting number of releases of given game publisher

DROP FUNCTION IF EXISTS publisherReleases(publisher varchar(80));
CREATE OR REPLACE FUNCTION publisherReleases(publisher varchar(80)) RETURNS int
LANGUAGE plpgsql
AS $$
DECLARE
	count int;
BEGIN 
    count := (SELECT COUNT(*) 
		   FROM game INNER JOIN gameplatform ON game.game_id = gameplatform.game_id 
	   	   WHERE game_publisher = publisher);
	RETURN count;
END
$$; 