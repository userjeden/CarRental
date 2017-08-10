
# generate INDEX'es


CREATE INDEX ind_vehicle_id_fk
ON vehicle_worker (vehicle_id);


CREATE INDEX ind_worker_id_fk
ON vehicle_worker (worker_id);


CREATE INDEX ind_customer_name
ON customer (cname);


CREATE INDEX ind_customer_surname
ON customer (surname);
