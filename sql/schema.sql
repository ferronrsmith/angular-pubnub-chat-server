/*
User table
--stores basic user info
*/

drop table if exists user;
create table user(
	userid integer PRIMARY KEY AUTOINCREMENT,
	username string not null,
	password string not null,
	firstname string not null,
	lastname string not null,
	gender string not null,
	datecreated text not null,
	lastupdated text not null
);

/*
GroupInfo table
--stores basic group info
*/
drop table if exists groupinfo;
create table groupinfo(
	groupid integer PRIMARY KEY AUTOINCREMENT,
	groupname string not null
);

/*
Status table
--stores user status message(s) 
*/
drop table if exists status;
create table status(
	statid integer PRIMARY KEY AUTOINCREMENT,
	uid integer not null,
	message string not null,
	FOREIGN KEY(uid) REFERENCES user(userid)
);

/*
Administrator table
--stores administrator credentials 
*/
drop table if exists admin;
create table admin(
	adminid integer PRIMARY KEY AUTOINCREMENT,
	uid integer not null,
	FOREIGN KEY(uid) REFERENCES user(userid)
);

/*
User_Group table
--stores users and their corresponding group(s)
*/
drop table if exists user_group;
create table user_group(
	ugid integer PRIMARY KEY AUTOINCREMENT,
	uid integer not null,
	gid integer not null,
	FOREIGN KEY(uid) REFERENCES user(userid),
	FOREIGN KEY(gid) REFERENCES groupinfo(groupid)
);

/*
Chat table
--stores users' conversations
*/
drop table if exists chat;
create table chat(
	chatid integer PRIMARY KEY AUTOINCREMENT,
	gid integer not null,		--if privatechat then gid = 0
	uid integer not null,
	receiverid integer not null,
	message string not null,
	timestamp text not null,
	FOREIGN KEY(uid) REFERENCES user(userid),
	FOREIGN KEY(receiverid) REFERENCES user(userid),
	FOREIGN KEY(gid) REFERENCES groupinfo(groupid)
);

/*
PrivateChat table
--stores users' private conversation(s)
*/
drop table if exists privatechat;
create table privatechat(
	pchatid integer PRIMARY KEY AUTOINCREMENT,
	cid integer not null,
	uid integer not null,
	receiverid integer not null,
	FOREIGN KEY(cid) REFERENCES chat(chatid),
	FOREIGN KEY(uid) REFERENCES user(userid),
	FOREIGN KEY(receiverid) REFERENCES user(userid)
);

/*
Location table
--stores current location of user(s) 
*/
drop table if exists location;
create table location(
	locid integer PRIMARY KEY AUTOINCREMENT,
	uid integer not null,
	country string,
	city string,
	longitude string,
	latitude string,
	FOREIGN KEY(uid) REFERENCES user(userid)
);

/*
Gravatar table
--stores user gravatar/picture 
*/
drop table if exists gravatar;
create table gravatar(
	gravatarid integer PRIMARY KEY AUTOINCREMENT,
	uid integer not null,
	gravatarUrl not null,
	FOREIGN KEY(uid) REFERENCES user(userid)
);