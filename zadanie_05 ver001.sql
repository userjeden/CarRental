
# create USER's and pivileges

DROP USER 'user_ro'@'localhost';
DROP USER 'user_rw_projekt'@'localhost';
FLUSH PRIVILEGES;


CREATE USER IF NOT EXISTS 'user_ro'@'localhost'
IDENTIFIED BY 'user_ro_sophisticatedpass';

GRANT SELECT ON rental.* TO 'user_ro'@'localhost';


CREATE USER IF NOT EXISTS 'user_rw_projekt'@'localhost'
IDENTIFIED BY 'user_rw_sophisticatedpass';

GRANT ALL PRIVILEGES ON rental.vehicle TO 'user_rw_projekt'@'localhost';


SHOW GRANTS FOR 'user_ro'@'localhost';
SHOW GRANTS FOR 'user_rw_projekt'@'localhost';



