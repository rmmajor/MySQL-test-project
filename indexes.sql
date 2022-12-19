-- 1
SHOW INDEX FROM transport;
SHOW INDEX FROM company;

-- 2
CREATE INDEX company_idx ON company(company_name, address);
SHOW INDEX FROM company;

CREATE INDEX transport_idx ON transport(license_plate);
SHOW INDEX FROM transport;

-- 3
EXPLAIN SELECT c.company_name, COUNT(t.Route_num) AS route_count
FROM company c
INNER JOIN transport t
	USING(Company_id)
GROUP BY c.company_name
ORDER BY route_count DESC
LIMIT 5;

EXPLAIN SELECT STRAIGHT_JOIN
	c.company_name, COUNT(t.Route_num) AS route_count
FROM company c
INNER JOIN transport t
	USING(Company_id)
GROUP BY c.company_name
ORDER BY route_count DESC
LIMIT 5;
