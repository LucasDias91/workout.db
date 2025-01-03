use Workout;

SET FOREIGN_KEY_CHECKS = 0; 
DROP table User; 
SET FOREIGN_KEY_CHECKS = 1;

create table User
(
UserId int AUTO_INCREMENT NOT NULL,
Name varchar(50) NOT NULL,
UserName nvarchar(255) not null,
Password nvarchar (50) not null,
Avatar longtext null,
CreationDate datetime NULL,
LastEditDate datetime NULL,
Active bool NOT NULL default true,
UserKey nvarchar(255) not null default  (UUID()),
CONSTRAINT PK_User PRIMARY KEY (UserId)
);


delimiter //
create trigger Insert_Trigger_User  BEFORE INSERT on User
FOR EACH ROW
BEGIN
  SET new.CreationDate := (SELECT NOW());
  SET new.LastEditDate := (SELECT NOW());
END
//

delimiter //
create trigger Update_Trigger_User  BEFORE UPDATE on User
FOR EACH ROW
BEGIN
  SET new.LastEditDate := (SELECT NOW());
END
//


