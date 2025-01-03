	use Workout;
	SET FOREIGN_KEY_CHECKS = 0; 
	DROP table if exists Timeline ; 
	SET FOREIGN_KEY_CHECKS = 1;

	create table Timeline
	(
	  TimelineId bigint AUTO_INCREMENT NOT NULL,
	  UserId int not null,
	  Code int NOT NULL,
	  Type char NOT NULL,
	  Start DateTime NOT NULL,
	  End DateTime  NULL,
	  CreationDate dateTime NOT NULL,
	  LastEditDate datetime NULL ,
	  Active bool NOT NULL default true,
	  CONSTRAINT PK_Training PRIMARY KEY (TimelineId)
	);


	delimiter //
	create trigger Insert_Trigger_Timeline  BEFORE INSERT on Timeline
	FOR EACH ROW
	BEGIN
	  SET new.CreationDate := (SELECT NOW());
	  SET new.LastEditDate := (SELECT NOW());
	END
	//

	delimiter //
	create trigger Update_Trigger_Timeline  BEFORE UPDATE on Timeline
	FOR EACH ROW
	BEGIN
	  SET new.LastEditDate := (SELECT NOW());
	END
	//

	ALTER TABLE `Timeline` ADD CONSTRAINT `fk_timeline_users` FOREIGN KEY ( `UserID` ) REFERENCES Workout.user ( `UserId` ) ;
	ALTER TABLE `Timeline` ADD CONSTRAINT `fk_timeline_training` FOREIGN KEY ( `Code` ) REFERENCES Workout.training ( `Code` ) ;
	ALTER TABLE `Timeline` ADD CONSTRAINT `fk_timeline_training_type` FOREIGN KEY ( `Type` ) REFERENCES Workout.training ( `Type` ) ;
