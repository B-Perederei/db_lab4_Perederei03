-- Function for getting most recent statistics of total sold copies of given game on given platform

DROP FUNCTION IF EXISTS getTotalCopiesSoldByNow(int, varchar);
CREATE OR REPLACE FUNCTION getTotalCopiesSoldByNow(g_id int, p_id varchar) RETURNS numeric(4, 2)
LANGUAGE plpgsql
AS $$
DECLARE
	sum numeric(4, 2);
BEGIN 
	sum := (SELECT SUM(copies_sold) FROM (SELECT MAX(copies_sold) AS copies_sold
								  FROM gameplatformregionsales
								  WHERE game_id = g_id AND plat_id = p_id
								  GROUP BY region_id) AS most_recent_sold_copies);
	RETURN sum;
END;
$$;