-- 1
SELECT * 
FROM company
WHERE company_name LIKE '%company%';

-- 2
SELECT * 
FROM driver
ORDER BY age DESC
LIMIT 5;

-- 3.1
SELECT t.type, r.description
FROM route r 
INNER JOIN transport_type t 
ON 	tranport_type_id = Transport_Type_id;

-- 3.2
SELECT t.type, COUNT(*)
FROM route r 
INNER JOIN transport_type t 
ON 	tranport_type_id = Transport_Type_id
GROUP BY t.type;

-- 4
SELECT color, COUNT(*)
FROM transport
GROUP BY color;

-- 5
SELECT HOUR(Start_time) AS hour,
	COUNT(Stop_id) AS stops
FROM transport_has_stop
GROUP BY hour 
WITH ROLLUP;

-- 6
SELECT  tp.type, AVG(t.max_speed) as max_speed
FROM transport t
INNER JOIN route r USING(Route_num)
INNER JOIN transport_type tp
	ON tranport_type_id = Transport_Type_id
GROUP BY tp.type;

-- 7
SELECT c.company_name, COUNT(t.Route_num) AS route_count
FROM company c
INNER JOIN transport t
	USING(Company_id)
GROUP BY c.company_name
ORDER BY route_count DESC
LIMIT 5;
