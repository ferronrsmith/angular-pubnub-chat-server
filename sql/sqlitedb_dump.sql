PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;


CREATE TABLE group_info (
	id INTEGER NOT NULL, 
	name VARCHAR(50), 
	PRIMARY KEY (id), 
	UNIQUE (name)
);
INSERT INTO "group_info" VALUES(1,'private');
INSERT INTO "group_info" VALUES(2,'love');
INSERT INTO "group_info" VALUES(3,'geeks');
INSERT INTO "group_info" VALUES(4,'hackers');
INSERT INTO "group_info" VALUES(5,'tech');

CREATE TABLE user (
	id INTEGER NOT NULL, 
	username VARCHAR(50), 
	password VARCHAR(50), 
	firstname VARCHAR(50), 
	lastname VARCHAR(50), 
	"cellPhone" VARCHAR(50), 
	email VARCHAR(50), 
	picture VARCHAR(100), 
	gender VARCHAR(50), 
	token VARCHAR(50), 
	datecreated DATETIME, 
	lastupdated DATETIME, 
	PRIMARY KEY (id), 
	UNIQUE (username), 
	UNIQUE (email), 
	UNIQUE (token)
);

INSERT INTO "user" VALUES(1,'stevenw','sha1$vgLpXM1p$ae49e63581951ebc613ff1993f07685420bbba7f','Steven','Wells','781-000-0012','swells@fakemail.com','steven_wells.jpg','M','8d41e5a4-2174-11e2-9b2b-5cac4caa5fae','2012-10-29 02:58:44.434582','2012-10-29 02:58:44.434619');
INSERT INTO "user" VALUES(2,'jamesk','sha1$vgLpXM1p$ae49e63581951ebc613ff1993f07685420bbba7f','James','King','781-000-0001','jking@fakemail.com','james_king.jpg','M','9d41e5a4-2174-11e2-9b2b-5cac4caa5fae','2012-10-29 02:58:44.434583','2012-10-29 02:58:44.434620');
INSERT INTO "user" VALUES(3,'juliet','sha1$vgLpXM1p$ae49e63581951ebc613ff1993f07685420bbba7f','Julie','Taylor','781-000-0002','jtaylor@fakemail.com','julie_taylor.jpg','F','10d41e5a4-2174-11e2-9b2b-5cac4caa5fae','2012-10-29 02:58:44.434584','2012-10-29 02:58:44.434621');
INSERT INTO "user" VALUES(4,'elee','sha1$vgLpXM1p$ae49e63581951ebc613ff1993f07685420bbba7f','Eugene','Lee','781-000-0003','elee@fakemail.com','eugene_lee.jpg','M','11d41e5a4-2174-11e2-9b2b-5cac4caa5fae','2012-10-29 02:58:44.434585','2012-10-29 02:58:44.434622');
INSERT INTO "user" VALUES(5,'johnw','sha1$vgLpXM1p$ae49e63581951ebc613ff1993f07685420bbba7f','John','Williams','781-000-0004','jwilliams@fakemail.com','john_williams.jpg','M','12d41e5a4-2174-11e2-9b2b-5cac4caa5fae','2012-10-29 02:58:44.434586','2012-10-29 02:58:44.434623');
INSERT INTO "user" VALUES(6,'raymo','sha1$vgLpXM1p$ae49e63581951ebc613ff1993f07685420bbba7f','Ray','Moore','781-000-0005','rmoore@fakemail.com','ray_moore.jpg','M','13d41e5a4-2174-11e2-9b2b-5cac4caa5fae','2012-10-29 02:58:44.434587','2012-10-29 02:58:44.434624');
INSERT INTO "user" VALUES(7,'pauljj','sha1$vgLpXM1p$ae49e63581951ebc613ff1993f07685420bbba7f','Paul','Jones','781-000-0006','pjones@fakemail.com','paul_jones.jpg','M','14d41e5a4-2174-11e2-9b2b-5cac4caa5fae','2012-10-29 02:58:44.434588','2012-10-29 02:58:44.434625');
INSERT INTO "user" VALUES(8,'paulag','sha1$vgLpXM1p$ae49e63581951ebc613ff1993f07685420bbba7f','Paula','Gates','781-000-0007','pgates@fakemail.com','paula_gates.jpg','F','15d41e5a4-2174-11e2-9b2b-5cac4caa5fae','2012-10-29 02:58:44.434589','2012-10-29 02:58:44.434626');
INSERT INTO "user" VALUES(9,'lisaw','sha1$vgLpXM1p$ae49e63581951ebc613ff1993f07685420bbba7f','Lisa','Wong','781-000-0008','lwong@fakemail.com','lisa_wong.jpg','F','16d41e5a4-2174-11e2-9b2b-5cac4caa5fae','2012-10-29 02:58:44.434590','2012-10-29 02:58:44.434627');
INSERT INTO "user" VALUES(10,'garyd','sha1$vgLpXM1p$ae49e63581951ebc613ff1993f07685420bbba7f','Gary','Donovan','781-000-0009','gdonovan@fakemail.com','gary_donovan.jpg','M','17d41e5a4-2174-11e2-9b2b-5cac4caa5fae','2012-10-29 02:58:44.434591','2012-10-29 02:58:44.434628');
INSERT INTO "user" VALUES(11,'kathleenb','sha1$vgLpXM1p$ae49e63581951ebc613ff1993f07685420bbba7f','Kathleen','Bryne','781-000-0010','kbyrne@fakemail.com','kathleen_byrne.jpg','F','18d41e5a4-2174-11e2-9b2b-5cac4caa5fae','2012-10-29 02:58:44.434592','2012-10-29 02:58:44.434629');
INSERT INTO "user" VALUES(12,'anyjj','sha1$vgLpXM1p$ae49e63581951ebc613ff1993f07685420bbba7f','Amy','James','781-000-0011','ajones@fakemail.com','amy_jones.jpg','F','19d41e5a4-2174-11e2-9b2b-5cac4caa5fae','2012-10-29 02:58:44.434593','2012-10-29 02:58:44.434630');
INSERT INTO "user" VALUES(13,'ferronrsmith','sha1$vgLpXM1p$ae49e63581951ebc613ff1993f07685420bbba7f','Ferron','Smith','781-000-0013','ferron@fakemail.com','ferron_smith.jpg','M','20d41e5a4-2174-11e2-9b2b-5cac4caa5fae','2012-10-29 02:58:44.434594','2012-10-29 02:58:44.434631');


CREATE TABLE admin (
	id INTEGER NOT NULL, 
	user_id INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(user_id) REFERENCES user (id)
);

INSERT INTO "admin" VALUES(1,13);

CREATE TABLE chat (
	id INTEGER NOT NULL, 
	user_id INTEGER, 
	group_id INTEGER, 
	"senderId" INTEGER, 
	message TEXT, 
	datecreated DATETIME, 
	lastupdated DATETIME, 
	PRIMARY KEY (id), 
	FOREIGN KEY(user_id) REFERENCES user (id), 
	FOREIGN KEY(group_id) REFERENCES group_info (id), 
	FOREIGN KEY("senderId") REFERENCES user (id)
);

CREATE TABLE user_group (
	id INTEGER NOT NULL, 
	user_id INTEGER, 
	group_id INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(user_id) REFERENCES user (id), 
	FOREIGN KEY(group_id) REFERENCES group_info (id)
);


INSERT INTO "user_group" VALUES(1,1,3);
INSERT INTO "user_group" VALUES(2,2,2);
INSERT INTO "user_group" VALUES(3,3,3);
INSERT INTO "user_group" VALUES(4,4,4);
INSERT INTO "user_group" VALUES(5,5,5);
INSERT INTO "user_group" VALUES(6,6,3);
INSERT INTO "user_group" VALUES(7,7,2);
INSERT INTO "user_group" VALUES(8,8,3);
INSERT INTO "user_group" VALUES(9,9,4);
INSERT INTO "user_group" VALUES(10,10,5);
INSERT INTO "user_group" VALUES(11,11,6);
INSERT INTO "user_group" VALUES(12,12,7);
INSERT INTO "user_group" VALUES(13,13,3);
INSERT INTO "user_group" VALUES(14,13,2);
INSERT INTO "user_group" VALUES(15,13,5);
INSERT INTO "user_group" VALUES(16,4,3);
INSERT INTO "user_group" VALUES(17,5,4);


CREATE TABLE status_msg (
	id INTEGER NOT NULL, 
	message VARCHAR(500), 
	user_id INTEGER, 
	PRIMARY KEY (id), 
	UNIQUE (message), 
	FOREIGN KEY(user_id) REFERENCES user (id)
);


INSERT INTO "status_msg" VALUES(1,'Busy at work DND',1);
INSERT INTO "status_msg" VALUES(2,'In the depth of winter I finally learned that there was in me an invincible summer.',2);
INSERT INTO "status_msg" VALUES(3,'In order to succeed your desire for success should be greater than your fear of failure.',3);
INSERT INTO "status_msg" VALUES(4,'A successful man is one who can lay a firm foundation with the bricks others have thrown at him.',4);
INSERT INTO "status_msg" VALUES(5,'A life spent making mistakes is not only more honorable; but more useful than a life spent doing nothing.',12);
INSERT INTO "status_msg" VALUES(6,'All life is an experiment. The more experiments you make the better.',13);

ANALYZE sqlite_master;

INSERT INTO "sqlite_stat1" VALUES('admin',NULL,'1');
INSERT INTO "sqlite_stat1" VALUES('group_info','sqlite_autoindex_group_info_1','5 1');
INSERT INTO "sqlite_stat1" VALUES('status_msg','sqlite_autoindex_status_msg_1','6 1');
INSERT INTO "sqlite_stat1" VALUES('user','sqlite_autoindex_user_3','13 1');
INSERT INTO "sqlite_stat1" VALUES('user','sqlite_autoindex_user_2','13 1');
INSERT INTO "sqlite_stat1" VALUES('user','sqlite_autoindex_user_1','13 1');
INSERT INTO "sqlite_stat1" VALUES('user_group',NULL,'17');

COMMIT;
