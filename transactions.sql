SET autocommit=0;

SELECT * FROM transport_has_stop WHERE Transport_id > 19;
START TRANSACTION;
	INSERT INTO transport_has_stop VALUES (21, 10, '07:30:00', '07:32:00', '00:02:00');
	INSERT INTO transport_has_stop VALUES (20, 12, '08:30:00', '08:35:00', '00:05:00');
COMMIT;
ROLLBACK;
SELECT * FROM transport_has_stop WHERE Transport_id > 19;
