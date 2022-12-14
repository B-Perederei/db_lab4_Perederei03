-- Deleting any record in DB, where given publisher is involved

DROP PROCEDURE IF EXISTS deletePublisherFromDB(varchar(80));
CREATE OR REPLACE PROCEDURE deletePublisherFromDB(IN publisher varchar(80))
LANGUAGE plpgsql
AS $$
  BEGIN
    DELETE FROM gameplatformregionsales WHERE game_id IN (SELECT game_id FROM Game WHERE game_publisher = publisher);
	DELETE FROM gameplatform WHERE game_id IN (SELECT game_id FROM Game WHERE game_publisher = publisher);
	DELETE FROM game WHERE game_publisher = publisher;
  END;
$$;
