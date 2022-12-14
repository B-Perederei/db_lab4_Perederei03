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
BEFORE DELETE ON game
FOR EACH ROW EXECUTE PROCEDURE deleteGameRecordsFromDB();