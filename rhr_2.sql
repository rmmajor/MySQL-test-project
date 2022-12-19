use transport;
SET GLOBAL log_bin_trust_function_creators = 1;

-- 1
DROP PROCEDURE make_full_route;
DROP TABLE transport.full_route;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `make_full_route`(IN r_num INT)
BEGIN
	CREATE TABLE IF NOT EXISTS transport.full_route (stop_name CHAR(50), Start_time time, Stop_time time, Spanding_time time);
	TRUNCATE transport.full_route;
	INSERT INTO transport.full_route
			SELECT s.stop_name, ts.Start_time, ts.Stop_time, ts.Spanding_time
			FROM transport t
			INNER JOIN transport_has_stop ts
				ON t.Transport_id = ts.Transport_id
			INNER JOIN `stop` s
				ON s.Stop_id = ts.Stop_id
			WHERE Route_num = r_num;
	SELECT * FROM full_route;
END
|| DELIMITER ;

-- Виклик процедури:
CALL make_full_route(1);

-- 2
DROP FUNCTION routes_by_type_counter;

DELIMITER || 
CREATE FUNCTION `routes_by_type_counter`(tp VARCHAR(45)) RETURNS VARCHAR(45)
BEGIN
	DECLARE cnt INT;
	DECLARE n_id INT;
    
    SELECT tranport_type_id INTO n_id
	FROM transport_type
    WHERE type = tp;
    
    SELECT COUNT(Route_num) INTO cnt
    FROM route r
	WHERE Transport_Type_id = n_id;
    
    RETURN cnt;
END;
|| DELIMITER ;

SELECT routes_by_type_counter('Bus');

-- 3
DROP TRIGGER driver_backup;
--
DELIMITER //
CREATE 
TRIGGER driver_backup
BEFORE DELETE ON transport.driver
FOR EACH ROW
UPDATE transport.transport SET Driver_id = 1 WHERE Driver_id = OLD.Driver_id; -- 1 це резервний водій
//

DELIMITER ;

-- демонстрація
START TRANSACTION;
SELECT * FROM transport LIMIT 3;
DELETE FROM transport.driver WHERE Driver_id  = 7;
SELECT * FROM transport LIMIT 3;
SELECT * FROM driver LIMIT 10;
ROLLBACK;

