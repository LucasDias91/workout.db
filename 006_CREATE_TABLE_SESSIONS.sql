use Workout;
SET FOREIGN_KEY_CHECKS = 0; 
DROP table if exists Session ; 
SET FOREIGN_KEY_CHECKS = 1;

create table Session
(
  SessionId bigint AUTO_INCREMENT NOT NULL,
  UserId int NOT NULL,
  AuthType varchar(50) not null,
  UserAgent varchar(2000) not null,
  UserIp varchar(10) not null,
  Host varchar (255) not null,
  Logout datetime null,
  AccessToken varchar(8000)  not null,
  RefreshToken varchar (255) not null,
  Created dateTime NOT NULL,
  Expiration datetime NOT NULL,
  Active bool NOT NULL default true,
  SessionKey varchar(255) not null,
  CONSTRAINT PK_Session PRIMARY KEY (SessionID)
);

ALTER TABLE `Session` ADD CONSTRAINT `fk_users` FOREIGN KEY ( `UserID` ) REFERENCES corporate.user ( `UserId` ) ;
