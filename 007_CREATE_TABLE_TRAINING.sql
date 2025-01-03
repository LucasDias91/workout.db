use Workout;
SET FOREIGN_KEY_CHECKS = 0; 
DROP table if exists Training ; 
SET FOREIGN_KEY_CHECKS = 1;

create table Training
(
  TrainingId bigint AUTO_INCREMENT NOT NULL,
  Date Date NOT NULL,
  Goal varchar(50) NOT NULL,
 `Group` varchar(50) NOT NULL,
  Code int NOT NULL,
  Type char NOT NULL,
  Exercise varchar(100) not null,
  SxR varchar(10)  null,
  Technique varchar(50) not null,
  CreationDate dateTime NOT NULL,
  LastEditDate datetime NULL,
  Active bool NOT NULL default true,
  CONSTRAINT PK_Training PRIMARY KEY (TrainingId)
);


delimiter //
create trigger Insert_Trigger_Training  BEFORE INSERT on Training
FOR EACH ROW
BEGIN
  SET new.CreationDate := (SELECT NOW());
  SET new.LastEditDate := (SELECT NOW());
END
//

delimiter //
create trigger Update_Trigger_Training  BEFORE UPDATE on Training
FOR EACH ROW
BEGIN
  SET new.LastEditDate := (SELECT NOW());
END
//

