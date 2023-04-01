CREATE DATABASE IF NOT EXISTS chats;

USE chats;

CREATE TABLE IF NOT EXISTS `groups` (
    groupId int(7) primary key not null,
    groupName varchar(10)
);

CREATE TABLE IF NOT EXISTS `users` (
    id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` varchar(20),
    email varchar(50) UNIQUE KEY,
    `password` varchar(200)
);

CREATE TABLE IF NOT EXISTS participants (
    id int NOT NULL AUTO_INCREMENT,
    groupId int(7),
    userId int(11),
    PRIMARY KEY (id),
    FOREIGN KEY (groupId) REFERENCES `groups`(groupId),
    FOREIGN KEY (userId) REFERENCES `users`(`id`)
);

CREATE TABLE IF NOT EXISTS messages (
    id int NOT NULL AUTO_INCREMENT,
    groupId int(7),
    userId int(11),
    `message` varchar(100),
    PRIMARY KEY (id),
    FOREIGN KEY (groupId) REFERENCES `groups`(groupId),
    FOREIGN KEY (userId) REFERENCES `users`(id)
);