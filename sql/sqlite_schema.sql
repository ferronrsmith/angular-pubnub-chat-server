CREATE TABLE group_info (
	id INTEGER NOT NULL, 
	name VARCHAR(50), 
	PRIMARY KEY (id), 
	UNIQUE (name)
);
;
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
;
;
;
CREATE TABLE admin (
	id INTEGER NOT NULL, 
	user_id INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(user_id) REFERENCES user (id)
);
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
CREATE TABLE status_msg (
	id INTEGER NOT NULL, 
	message VARCHAR(500), 
	user_id INTEGER, 
	PRIMARY KEY (id), 
	UNIQUE (message), 
	FOREIGN KEY(user_id) REFERENCES user (id)
);
;
