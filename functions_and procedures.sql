SET GLOBAL log_bin_trust_function_creators = 1;


-- FUNCTION
DROP FUNCTION `stops_for_transport`;

DELIMITER || 
CREATE FUNCTION `stops_for_transport`(t_id INT) RETURNS int
BEGIN
	DECLARE cnt INT;
    SELECT COUNT(*) INTO cnt
    FROM transport_has_stop 
    WHERE Transport_id = t_id;
    RETURN cnt;
END;
|| DELIMITER ;

select stops_for_transport(1);


-- PROCEDURE
DROP PROCEDURE `company_list`;

DELIMITER ||
CREATE DEFINER=`root`@`localhost` PROCEDURE `company_list`(IN cmpny CHAR(50))
BEGIN
    
	CREATE TABLE IF NOT EXISTS transport.company_full_list (type CHAR(50), license_plate varchar(45),  description varchar(45));
	TRUNCATE transport.company_full_list;
	INSERT INTO transport.company_full_list 
			SELECT tt.type, t.license_plate, r.description 
			FROM transport t
			INNER JOIN route r USING(Route_num)
			INNER JOIN company c USING(Company_id)
			INNER JOIN transport_type tt ON transport_type_id = Transport_Type_id
			WHERE c.company_name = cmpny
			ORDER BY tt.type;
	SELECT * FROM company_full_list;
END
|| DELIMITER ;

CALL company_list('KP LvivElectroTrans');