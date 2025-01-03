use Workout;
CREATE USER 'IUSER_Workout'@'localhost' IDENTIFIED WITH mysql_native_password BY 'W0rk4ouT!';
GRANT CREATE, SELECT, INSERT, UPDATE, LOCK TABLES,DELETE,drop, execute  ON Corporate.* TO 'IUSER_Workout'@'localhost';


/*Remote Connection*/
CREATE USER 'root'@'186.220.36.124' IDENTIFIED BY '081991@Ratm';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'186.220.36.124';
FLUSH PRIVILEGES;
