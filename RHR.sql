use transport;

-- 1. Валідація водія за віком (тригер)
DELIMITER //
CREATE 
TRIGGER driver_age_checker 
BEFORE INSERT ON driver
FOR EACH ROW
BEGIN
	IF NEW.Age < 21 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Forbidden age!!!";
	END IF;
END //
DELIMITER ;    

-- демонстрація роботи
START TRANSACTION;
SELECT * FROM company;
SELECT * FROM company_info;
DELETE FROM transport.company WHERE Company_id = 5;
SELECT * FROM company;
SELECT * FROM company_info;
ROLLBACK;

-- -----------------------------------------------------------------------------------------------------------------------
-- 2. Процедура формуватиме таблицю-список всього парку транспортниз засобів,
-- що перебуває у власності певної компанії разом з типами транспортних засобів і маршрутами які вони обслуговують:
-- корисно для проведення тендерів і конкурсів серед підрядних компаній

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


-- Виклик процедури:
CALL company_list('KP LvivElectroTrans');

-- -----------------------------------------------------------------------------------------------------------------------
-- 3. Статистика розвиненості транспортної мережі за маршрутами кожного типу транспорту
-- (корисно для планування майбутніх будівництв)
SELECT color, COUNT(*)
FROM transport
GROUP BY color;

-- -----------------------------------------------------------------------------------------------------------------------
-- 4 Каскадне видалення і оновлення таблиць company і company_info

-- тригер на видалення 
DELIMITER //
CREATE 
TRIGGER company_info_cascade_delete
BEFORE DELETE ON transport.company
FOR EACH ROW
DELETE FROM transport.company_info WHERE OLD.Company_id = Company_id;
//
DELIMITER ;

-- демонстрація

START TRANSACTION;
SELECT * FROM company;
SELECT * FROM company_info;
DELETE FROM transport.company WHERE Company_id = 5;
SELECT * FROM company;
SELECT * FROM company_info;
ROLLBACK;

-- тригер на оновлення
DELIMITER //
CREATE 
TRIGGER driver_age_checker 
BEFORE INSERT ON driver
FOR EACH ROW
BEGIN
	IF NEW.Age < 21 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Forbidden age!!!";
	END IF;
END //
DELIMITER ;    

-- демонстрація
START TRANSACTION;
SELECT * FROM company;
SELECT * FROM company_info;
UPDATE company SET company_name = 'Renamed company' WHERE Company_id = 2;
SELECT * FROM company;
SELECT * FROM company_info;
ROLLBACK;

-- -----------------------------------------------------------------------------------------------------------------------
-- 5. Функція, що повідомляє водію скілки зупинок йому доведеться зробити протягом дня

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

-- демонстрація
select stops_for_transport(1);
-- -----------------------------------------------------------------------------------------------------------------------
-- 6. 
SET GLOBAL log_bin_trust_function_creators = 1;
DROP FUNCTION time_left_to_wait;

DELIMITER || 
CREATE FUNCTION `time_left_to_wait`(t_id INT) RETURNS text
BEGIN
	DECLARE ans TEXT;
    SELECT timediff(time(now()), ts.start_time) as time_left
    INTO ans
	FROM transport_has_stop ts
	INNER JOIN `stop` s 
	WHERE s.Stop_id = t_id
	ORDER BY time_left DESC
	LIMIT 1;
    RETURN ans;
	END;
|| DELIMITER ;

select time_left_to_wait(1);