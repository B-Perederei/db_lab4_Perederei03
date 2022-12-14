-- Trigger for deleting all records of a game in all tables of database

DROP TRIGGER IF EXISTS deleteGameFromDB ON Game;
CREATE OR REPLACE FUNCTION deleteGameRecordsFromDB() RETURNS trigger 
LANGUAGE 'plpgsql'
AS $$
BEGIN
	DELETE FROM gameplatformregionsales WHERE game_id = OLD.game_id;
	DELETE FROM gameplatform WHERE game_id = OLD.game_id;
	RETURN OLD;
END;
$$;

CREATE TRIGGER deleteGameFromDB 
BEFORE DELETE ON Game
FOR EACH ROW EXECUTE FUNCTION deleteGameRecordsFromDB();