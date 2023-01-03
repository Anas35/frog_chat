CREATE TABLE IF NOT EXISTS `Group` (
    groupId varchar(5) primary key not null,
    groupName varchar(10)
);

CREATE TABLE IF NOT EXISTS `User` (
    id binary(16) primary key not null,
    name varchar(10)
);

CREATE TABLE IF NOT EXISTS Participants (
    id int NOT NULL AUTO_INCREMENT,
    groupId varchar(5),
    userId binary(16),
    PRIMARY KEY (id),
    FOREIGN KEY (groupId) REFERENCES `Group`(groupId),
    FOREIGN KEY (userId) REFERENCES `User`(id)
);

CREATE TABLE IF NOT EXISTS Messages (
    `id` int NOT NULL AUTO_INCREMENT,
    groupId varchar(5),
    userId binary(16),
    `message` varchar(100),
    PRIMARY KEY (id),
    FOREIGN KEY (groupId) REFERENCES `Group`(groupId),
    FOREIGN KEY (userId) REFERENCES `User`(id)
);