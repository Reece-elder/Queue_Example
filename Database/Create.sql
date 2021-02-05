DROP DATABASE IF EXISTS project;

CREATE DATABASE project;

USE project;

DROP TABLE IF EXISTS `ticket`;

CREATE TABLE `ticket` (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    author VARCHAR(255),
    timestamp DATETIME,
    description VARCHAR(255),
    status VARCHAR(255)
);