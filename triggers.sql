use transport;
SET autocommit=0;

-- 1 [DELETE]
DROP TRIGGER company_info_cascade_delete;
--
DELIMITER //
CREATE 
TRIGGER company_info_cascade_delete
BEFORE DELETE ON transport.company
FOR EACH ROW
DELETE FROM transport.company_info WHERE OLD.Company_id = Company_id;
//

DELIMITER ;

START TRANSACTION;
SELECT * FROM company;
SELECT * FROM company_info;
DELETE FROM transport.company WHERE Company_id = 5;
SELECT * FROM company;
SELECT * FROM company_info;
ROLLBACK;

-- 2 [INSERT]

DROP TRIGGER driver_age_checker;

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

START TRANSACTION;
INSERT INTO driver (First_name, Last_name, Age, Driver_license_category)  VALUES
		('Eugene', 'Zasoba', 22, 'D');
SELECT * FROM driver WHERE Driver_id = 14;

INSERT INTO driver (First_name, Last_name, Age, Driver_license_category)  VALUES
		('Natalia', 'Shakhovska', 19, 'D');
SELECT * FROM driver WHERE Driver_id = 15;
ROLLBACK;

-- 3 [UPDATE]
DROP TRIGGER company_cascade_upd;

DELIMITER //
CREATE 
TRIGGER company_cascade_upd
BEFORE UPDATE ON transport.company
FOR EACH ROW
BEGIN
	UPDATE company_info SET Release_date = now() WHERE OLD.Company_id = Company_id;
END //
DELIMITER ;

START TRANSACTION;
SELECT * FROM company;
SELECT * FROM company_info;
UPDATE company SET company_name = 'Renamed company' WHERE Company_id = 2;
SELECT * FROM company;
SELECT * FROM company_info;
ROLLBACK;