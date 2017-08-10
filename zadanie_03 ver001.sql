
# generate VIEW's


# QUERY 3a:
CREATE VIEW lease_occurencies_view AS
SELECT cu.cname, cu.surname, le.taken_date, le.taken_place_id, 
       le.return_date, le.return_place_id, ve.manufacturer, ve.veh_model
FROM lease le 
JOIN customer cu ON le.customer_id = cu.id
JOIN vehicle ve ON le.vehicle_id = ve.id
ORDER BY ve.id, le.return_date;

SELECT * FROM lease_occurencies_view;


# QUERY 3b:
CREATE VIEW car_current_location_view AS
SELECT l1.vehicle_id, ve.manufacturer, 
       ve.veh_model AS model, 
       l1.return_date AS last_return, 
       l1.return_place_id AS car_current_location
       
FROM lease l1
JOIN vehicle ve ON l1.vehicle_id = ve.id
WHERE l1.return_date = (SELECT MAX(return_date) FROM lease l2 WHERE l1.vehicle_id = l2.vehicle_id)
ORDER BY l1.vehicle_id ASC;

SELECT * FROM car_current_location_view;


# QUERY 3c:
CREATE VIEW car_is_under_care_view AS
SELECT l1.vehicle_id, ve.manufacturer, 
       ve.veh_model AS model, 
       l1.return_date AS last_return, 
       SUM(IF(wo.agency_id = l1.return_place_id, 1, 0)) AS car_is_under_care
       
FROM lease l1
JOIN vehicle ve ON l1.vehicle_id = ve.id
JOIN vehicle_worker vw ON l1.vehicle_id = vw.vehicle_id
JOIN worker wo ON vw.worker_id = wo.id
WHERE l1.return_date = (SELECT MAX(return_date) FROM lease l2 WHERE l1.vehicle_id = l2.vehicle_id)
GROUP BY vehicle_id;

SELECT * FROM car_is_under_care_view;




