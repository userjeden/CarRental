
# create TRIGGER 


DELIMITER //
CREATE TRIGGER lease_minimal_value_100 BEFORE INSERT ON lease
FOR EACH ROW
BEGIN 
  IF NEW.lease_value < 100 THEN
  SET NEW.lease_value = 100;
  END IF;
END //
DELIMITER ;
