
# genereta QUERIES as per list


# QUERY 4a:
SELECT wname, surname, birthdate, TIMESTAMPDIFF(YEAR, worker.birthdate, CURDATE()) AS age
FROM worker HAVING age > 25
ORDER BY age DESC;


# QUERY 4b:
SELECT surname, CHAR_LENGTH(surname) AS length
FROM worker HAVING length > 8
ORDER BY length DESC;


# QUERY 4c:
SELECT wname, surname
FROM worker WHERE surname LIKE '_F%';


# QUERY 4d:
SELECT manufacturer, veh_model, mileage
FROM vehicle 
ORDER BY mileage DESC
LIMIT 2;


# QUERY 4e:
SELECT COUNT(id) AS mileage_between_200k_and_300K
FROM vehicle WHERE mileage BETWEEN 200000 AND 300000;


# QUERY 4f:
SELECT wname, surname, job
FROM worker wo
JOIN positions po ON wo.position_id = po.id
WHERE po.job = 'manager';


# QUERY 4g:
SELECT cu.id, cu.cname, cu.surname, COUNT(vehicle_id) AS rent_occur
FROM lease le
JOIN customer cu ON le.customer_id = cu.id
GROUP BY le.customer_id;


# QUERY 4h:
SELECT cu.cname, cu.surname, COUNT(DISTINCT vehicle_id) AS different_cars
FROM lease le
JOIN customer cu ON le.customer_id = cu.id
GROUP BY le.customer_id;


# QUERY 4i:
SELECT ve.id, ve.manufacturer, ve.veh_model, COUNT(ve.id) AS times_rented
FROM lease le 
JOIN vehicle ve ON le.vehicle_id = ve.id
GROUP BY ve.id
ORDER BY times_rented DESC;


# QUERY 4j:
SELECT cu.cname, cu.surname, SUM(le.lease_value) AS client_turnover
FROM lease le
JOIN customer cu ON le.customer_id = cu.id
GROUP BY le.customer_id
ORDER BY client_turnover DESC;


# QUERY 4k:
SELECT cu.cname, cu.surname, taken_date, return_date
FROM lease le
JOIN customer cu ON le.customer_id = cu.id
WHERE le.vehicle_id = 2 
AND le.taken_date > '2016-12-31'
AND le.return_date < '2017-12-31'; 


# QUERY 4l:
UPDATE vehicle 
SET colour = 'yellow' WHERE id = '1';
SELECT * FROM vehicle;


# QUERY 4m:
SELECT cu.cname, cu.surname, COUNT(le.id) AS returns_diff_place
FROM lease le 
JOIN customer cu ON le.customer_id = cu.id
WHERE le.taken_place_id <> le.return_place_id
GROUP BY cu.id;


# QUERY 4o:
SELECT SUBSTRING_INDEX(co.email, '@', -1) AS domain, COUNT(cu.id) AS accounts_in_domain
FROM customer cu
JOIN contact co ON cu.contact_id = co.id
GROUP BY SUBSTRING_INDEX(co.email, '@', -1)
ORDER BY accounts_in_domain DESC;


# QUERY 4p:
SELECT ve.id, ve.manufacturer, ve.veh_model, ve.colour, COUNT(DISTINCT vw.worker_id) AS no_of_keepers
FROM vehicle ve 
JOIN vehicle_worker vw ON ve.id = vw.vehicle_id
GROUP BY ve.id
HAVING no_of_keepers > 1;


# QUERY 4r:
SELECT wo.wname, wo.surname, wo.birthdate, po.job
FROM worker wo
JOIN positions po ON wo.position_id = po.id
WHERE wo.id NOT IN (SELECT worker_id FROM vehicle_worker WHERE vehicle_id IS NOT NULL);



