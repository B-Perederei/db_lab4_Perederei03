-- Procedure for changing id and name of a given region in Region and GamePlatformRegionSales tables

DROP PROCEDURE IF EXISTS changeRegion(varchar, varchar, varchar);
CREATE OR REPLACE PROCEDURE changeRegion(old_region_id varchar, new_region_id varchar, new_region_name varchar)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO region (region_id, region_name) VALUES (new_region_id, new_region_name);
	UPDATE gameplatformregionsales SET region_id = new_region_id WHERE region_id = old_region_id;
	DELETE FROM region WHERE region_id = old_region_id;
END;
$$;