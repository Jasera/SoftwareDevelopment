SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `t_car`;
CREATE TABLE IF NOT EXISTS `t_car` (
  `carId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `consumption` double DEFAULT NULL,
  `fuelType` int(11) DEFAULT NULL,
  `pictureURL` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`carId`),
  KEY `FK_5rytyidabbijiq937r65gi4go` (`userId`),
  CONSTRAINT `FK_5rytyidabbijiq937r65gi4go` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

DELETE FROM `t_car`;

INSERT INTO `t_car` (`carId`, `name`, `consumption`, `fuelType`, `pictureURL`, `type`, `userId`) VALUES
	(1, 'Ford', 8, 2, NULL, 'Fiesta', 2),
	(2, 'Ford', 8, 2, NULL, 'Fiesta', 1),
	(3, 'Audi', 11, 0, NULL, 'A5', NULL),
	(4, 'Renault', 9.9, 0, NULL, 'Civic', 6),
	(5, 'Renault', 9.9, 0, NULL, 'Civic', 6),
	(6, 'Renault', 9.9, 0, NULL, 'Civic', 6),
	(7, 'Skoda', 10.3, 1, NULL, 'SkÃ¶dalike', NULL),
	(8, 'Peugeot', 7.2, 0, NULL, 'Partner', 9),
	(9, 'Lamborghini', 18.3, 2, NULL, 'Aventador', 10),
	(10, 'Peugeot', 7.2, 0, NULL, 'Partner', 11),
	(11, 'Audi', 11, 0, NULL, 'A5', NULL),
	(12, 'Audi', 11, 0, 'src\\main\\webapp\\carImages\\AudiA51938203996.jpg', 'A5', NULL),
	(13, 'BMW', 11, 0, NULL, 'X9', 20),
	(14, 'Renault', 9.9, 0, NULL, 'Civic', 20),
	(15, 'Renault', 9.9, 0, NULL, 'Civic', 20),
	(16, 'Renault', 9.9, 0, NULL, 'Civic', 20),
	(17, 'Audi', 10.2, 0, NULL, 'C4', NULL);

DROP TABLE IF EXISTS `t_place`;
CREATE TABLE IF NOT EXISTS `t_place` (
  `placeId` int(11) NOT NULL AUTO_INCREMENT,
  `lat` float DEFAULT NULL,
  `lon` float DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `placeTime` tinyblob,
  PRIMARY KEY (`placeId`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
DELETE FROM `t_place`;
INSERT INTO `t_place` (`placeId`, `lat`, `lon`, `name`, `placeTime`) VALUES
	(1, 231.989, 132.567, 'Kieldrecht', NULL),
	(2, 431.99, 411.989, 'Zwijndrecht Krijgsbaan', NULL),
	(3, 564.987, 342.971, 'Carpoolparking Vrasene', NULL),
	(4, 154.987, 189.987, 'Melsele Dijk', NULL),
	(5, 10, 10, 'Home', NULL),
	(6, 20, 10, 'Work', NULL),
	(7, 10, 20, 'RouteHome', NULL),
	(8, 11, 20, 'RouteWork', NULL),
	(9, 231.989, 132.567, 'Kieldrecht', NULL),
	(10, 431.99, 411.989, 'Zwijndrecht Krijgsbaan', NULL),
	(11, 564.987, 342.971, 'Carpoolparking Vrasene', NULL),
	(12, 154.987, 189.987, 'Melsele Dijk', NULL),
	(13, 10, 20, 'RouteAHome', NULL),
	(14, 11, 20, 'RouteAWork', NULL),
	(15, 10, 20, 'RouteBHome', NULL),
	(16, 11, 20, 'RouteBWork', NULL),
	(17, 10, 20, 'RouteCHome', NULL),
	(18, 11, 20, 'RouteCWork', NULL),
	(19, 10, 20, 'RouteCHome', NULL),
	(20, 11, 20, 'RouteCWork', NULL),
	(21, 10, 20, 'UserHome', NULL),
	(22, 11, 20, 'UserWork', NULL),
	(23, 9, 18, 'OtherUserHome', NULL),
	(24, 9, 20, 'OtherUserWork', NULL),
	(25, 10, 20, 'UserHome', NULL),
	(26, 11, 20, 'UserWork', NULL),
	(27, 9, 18, 'OtherUserHome', NULL);


DROP TABLE IF EXISTS `t_placetime`;
CREATE TABLE IF NOT EXISTS `t_placetime` (
  `placetimeId` int(11) NOT NULL AUTO_INCREMENT,
  `time` tinyblob,
  `placeId` int(11) DEFAULT NULL,
  `routeId` int(11) DEFAULT NULL,
  `trajectId` int(11) DEFAULT NULL,
  `weekdayRouteId` int(11) DEFAULT NULL,
  PRIMARY KEY (`placetimeId`),
  KEY `FK_jvcdxdqbcyewowuwi5vh6pjkf` (`placeId`),
  KEY `FK_9pn673sj6a63iu76e0hrscj9o` (`routeId`),
  KEY `FK_na5s06eldnoiw1djfjr2og74n` (`trajectId`),
  KEY `FK_gsqkf1sih7wlj5mtqim3yy98x` (`weekdayRouteId`),
  CONSTRAINT `FK_gsqkf1sih7wlj5mtqim3yy98x` FOREIGN KEY (`weekdayRouteId`) REFERENCES `t_weekdayroute` (`weekdayrouteId`),
  CONSTRAINT `FK_9pn673sj6a63iu76e0hrscj9o` FOREIGN KEY (`routeId`) REFERENCES `t_route` (`id`),
  CONSTRAINT `FK_jvcdxdqbcyewowuwi5vh6pjkf` FOREIGN KEY (`placeId`) REFERENCES `t_place` (`placeId`),
  CONSTRAINT `FK_na5s06eldnoiw1djfjr2og74n` FOREIGN KEY (`trajectId`) REFERENCES `t_traject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

DELETE FROM `t_placetime`;
INSERT INTO `t_placetime` (`placetimeId`, `time`, `placeId`, `routeId`, `trajectId`, `weekdayRouteId`) VALUES
	(1, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C00007870770205F778, 1, NULL, NULL, 1),
	(2, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C0000787077030508F578, 2, NULL, NULL, 1),
	(3, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C0000787077030508EB78, 3, NULL, NULL, 1),
	(4, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C0000787077030508E678, 4, NULL, NULL, 1),
	(5, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C00007870770205F878, 1, NULL, NULL, 2),
	(6, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C0000787077030507F578, 2, NULL, NULL, 2),
	(7, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C0000787077030507EB78, 3, NULL, NULL, 2),
	(8, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C0000787077030507E678, 4, NULL, NULL, 2),
	(9, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C0000787077030508EB78, 5, 1, NULL, NULL),
	(10, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C0000787077030512EB78, 6, 1, NULL, NULL),
	(11, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C0000787077030508E178, 7, 2, NULL, NULL),
	(12, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C0000787077030510E178, 8, 2, NULL, NULL),
	(13, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C00007870770205F778, 9, 3, NULL, NULL),
	(14, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C0000787077030508F578, 10, 3, NULL, NULL),
	(15, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C0000787077030508EB78, 11, 3, NULL, NULL),
	(16, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C0000787077030508E678, 12, 3, NULL, NULL),
	(17, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C00007870770205F878, 9, 3, NULL, NULL),
	(18, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C0000787077030507F578, 10, 3, NULL, NULL),
	(19, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C0000787077030507EB78, 11, 3, NULL, NULL),
	(20, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C0000787077030507E678, 12, 3, NULL, NULL),
	(21, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C0000787077030508E178, 13, 4, NULL, NULL),
	(22, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C0000787077030510E178, 14, 4, NULL, NULL),
	(23, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C0000787077030508E178, 15, 5, NULL, NULL),
	(24, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C0000787077030510E178, 16, 5, NULL, NULL),
	(25, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C0000787077030508E178, 17, 6, NULL, NULL),
	(26, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C0000787077030510E178, 18, 6, NULL, NULL),
	(27, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C0000787077030508E178, 19, 7, NULL, NULL),
	(28, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C0000787077030510E178, 20, 7, NULL, NULL),
	(29, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C0000787077030508E678, 21, 4, 1, NULL),
	(30, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C000078707703050CE178, 22, 4, 1, NULL),
	(31, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C0000787077030509E178, 23, NULL, 2, NULL),
	(32, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C0000787077030511D278, 24, NULL, 2, NULL),
	(35, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C0000787077030509E178, 27, NULL, NULL, NULL);
DROP TABLE IF EXISTS `t_route`;
CREATE TABLE IF NOT EXISTS `t_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `begin_date` tinyblob,
  `capacity` int(11) DEFAULT NULL,
  `end_date` tinyblob,
  `repeating` tinyint(1) DEFAULT NULL,
  `carId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `routeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_o1uk5yrlj7pbptj9616qiv6vl` (`carId`),
  KEY `FK_dl2p57ymq27nuc5mxu7g9mfq7` (`userId`),
  KEY `FK_3awlwf9tbh1c2hm5yp2mjt8uy` (`routeId`),
  CONSTRAINT `FK_3awlwf9tbh1c2hm5yp2mjt8uy` FOREIGN KEY (`routeId`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_dl2p57ymq27nuc5mxu7g9mfq7` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_o1uk5yrlj7pbptj9616qiv6vl` FOREIGN KEY (`carId`) REFERENCES `t_car` (`carId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

DELETE FROM `t_route`;
INSERT INTO `t_route` (`id`, `begin_date`, `capacity`, `end_date`, `repeating`, `carId`, `userId`, `routeId`) VALUES
	(1, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C00007870770E04000007DE02180C3A3708D24D0078, 69, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C00007870770E04000007DE02180C3A3708D24D0078, 1, 8, 9, NULL),
	(2, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C00007870770E04000007DE02180C3A37119557C078, 69, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C00007870770E04000007DE02180C3A37119557C078, 0, 9, 10, 10),
	(3, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C00007870770E04000007DE02180C3A37187F5CC078, 69, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C00007870770E04000007DE02180C3A37187F5CC078, 1, 10, 11, NULL),
	(4, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C00007870770904000007DE0A0308E678, 4, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C00007870770804000007DE0A03EE78, 1, 11, 12, 12),
	(5, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C00007870770904000007DE0A0308E678, 4, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C00007870770804000007DE0A03EE78, 1, 11, 13, 13),
	(6, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C00007870770904000007DE0A0308E678, 4, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C00007870770804000007DE0A03EE78, 1, 11, 14, 14),
	(7, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C00007870770904000007DE0A0308E678, 4, _binary 0xACED0005737200136F72672E746872656574656E2E62702E536572955D84BA1B2248B20C00007870770804000007DE0A03EE78, 1, 11, 15, 15);

DROP TABLE IF EXISTS `t_textmessage`;
CREATE TABLE IF NOT EXISTS `t_textmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isRead` tinyint(1) DEFAULT NULL,
  `messageBody` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `receiverId` int(11) DEFAULT NULL,
  `senderId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5rllkdv99lk3ycq3wbxjrlja4` (`receiverId`),
  KEY `FK_avorx6t4o1evct1qsx12k12dq` (`senderId`),
  CONSTRAINT `FK_avorx6t4o1evct1qsx12k12dq` FOREIGN KEY (`senderId`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_5rllkdv99lk3ycq3wbxjrlja4` FOREIGN KEY (`receiverId`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

DELETE FROM `t_textmessage`;
INSERT INTO `t_textmessage` (`id`, `isRead`, `messageBody`, `subject`, `receiverId`, `senderId`) VALUES
	(1, 0, 'New message body1', 'New message header1', 10, 9),
	(2, 0, 'New message body2', 'New message header2', 10, 9),
	(3, 0, 'New message body3', 'New message header3', 10, 9),
	(4, 0, 'New message body4', 'New message header4', 10, 9),
	(5, 0, 'New message body5', 'New message header5', 10, 9),
	(6, 0, 'New message body6', 'New message header6', 10, 9),
	(7, 0, 'New message body7', 'New message header7', 10, 9),
	(8, 0, 'New message body8', 'New message header8', 10, 9),
	(9, 0, 'New message body9', 'New message header9', 10, 9),
	(10, 0, 'New message body10', 'New message header10', 10, 9),
	(11, 0, 'New message body11', 'New message header11', 10, 9),
	(12, 0, 'New message body12', 'New message header12', 10, 9),
	(13, 0, 'New message body13', 'New message header13', 10, 9),
	(14, 0, 'New message body14', 'New message header14', 10, 9),
	(15, 0, 'New message body15', 'New message header15', 10, 9),
	(16, 0, 'New message body16', 'New message header16', 10, 9),
	(20, 0, 'New message body TWO', 'New message header TWO', 10, 9);

DROP TABLE IF EXISTS `t_session`;
CREATE TABLE IF NOT EXISTS `t_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expirationDate` datetime DEFAULT NULL,
  `sessionToken` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_td2jkj3d323m8fprao4wn3bed` (`user_id`),
  CONSTRAINT `FK_td2jkj3d323m8fprao4wn3bed` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

DELETE FROM `t_session`;
INSERT INTO `t_session` (`id`, `expirationDate`, `sessionToken`, `user_id`) VALUES
	(1, '2014-02-25 13:58:54', '18a8a009-1eb7-437c-a6b6-4e1706356cdc', 1),
	(2, '2014-02-25 13:58:54', 'db695b5f-6a75-487d-ab02-2bf804469859', 3),
	(3, '2014-02-25 13:58:55', 'cffe0b57-51a6-4b88-95a8-b91afccc7acd', 4),
	(4, '2014-02-25 13:58:55', '9f23dfb3-c19e-47d0-84f8-8b1db75e651e', 5),
	(5, '2014-02-25 13:58:55', 'ee0ff093-4984-49e2-9657-15a0320402e7', 7),
	(6, '2014-02-25 13:58:55', 'a7e8d5e5-9f33-487b-be02-68248f7e0c39', 8),
	(7, '2014-02-25 13:58:57', 'f433b76e-1889-4566-8d51-d8cb5046b1b5', 18),
	(8, '2014-02-25 13:58:57', '69f3afdb-6e07-490e-9c8c-4155c0d3f11a', 16),
	(10, '2014-02-25 13:58:58', '5018259a-224a-4645-a1bb-0c73b27c28f6', 21),
	(11, '2014-02-25 13:58:58', 'c57832a0-b06a-4d9c-94fd-52f279bcd501', 19),
	(12, '2014-02-25 15:33:48', '3189306a-6360-442b-b5c4-628ede15f13c', 6);

DROP TABLE IF EXISTS `t_traject`;
CREATE TABLE IF NOT EXISTS `t_traject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isAccepted` tinyint(1) DEFAULT NULL,
  `dropoffId` int(11) DEFAULT NULL,
  `pickupId` int(11) DEFAULT NULL,
  `routeId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_gnw9bkc64556wxl9fphql09tn` (`dropoffId`),
  KEY `FK_ajndv3u8k11yfwmiaaotcpxv0` (`pickupId`),
  KEY `FK_ew6t1i1un66maaxl4xabmawj3` (`routeId`),
  KEY `FK_fhq5khy90118wkmefy7racewt` (`userId`),
  CONSTRAINT `FK_fhq5khy90118wkmefy7racewt` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_ajndv3u8k11yfwmiaaotcpxv0` FOREIGN KEY (`pickupId`) REFERENCES `t_placetime` (`placetimeId`),
  CONSTRAINT `FK_ew6t1i1un66maaxl4xabmawj3` FOREIGN KEY (`routeId`) REFERENCES `t_route` (`id`),
  CONSTRAINT `FK_gnw9bkc64556wxl9fphql09tn` FOREIGN KEY (`dropoffId`) REFERENCES `t_placetime` (`placetimeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

DELETE FROM `t_traject`;
INSERT INTO `t_traject` (`id`, `isAccepted`, `dropoffId`, `pickupId`, `routeId`, `userId`) VALUES
	(1, 0, 30, 29, 4, 12),
	(2, 0, 32, 31, 7, 15);


DROP TABLE IF EXISTS `t_user`;
CREATE TABLE IF NOT EXISTS `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatarURL` varchar(255) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `smoker` tinyint(1) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_jhib4legehrm4yscx9t3lirqi` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;


DELETE FROM `t_user`;
INSERT INTO `t_user` (`id`, `avatarURL`, `dateOfBirth`, `gender`, `name`, `password`, `smoker`, `username`) VALUES
	(1, NULL, '1993-01-01', 1, 'TestUser', '2ac9cb7dc02b3c0083eb70898e549b63', 0, 'username@addcar.controller.it.example.com'),
	(2, NULL, '1993-01-01', 1, 'otherUser', '2ac9cb7dc02b3c0083eb70898e549b63', 0, 'otheruser@car.controller.it.example.com'),
	(3, NULL, '1993-01-01', 1, 'TestUser', '2ac9cb7dc02b3c0083eb70898e549b63', 0, 'username@route.controller.it.example.com'),
	(4, NULL, '1993-10-20', 0, 'username', '70c04e53f3216a44d9b4f3e517f9b45c', 0, 'username@cp.test.com'),
	(5, NULL, '1993-10-20', 0, 'username', '2ac9cb7dc02b3c0083eb70898e549b63', 0, 'username@lc.test.com'),
	(6, NULL, '1993-10-20', 1, 'TestUser', 'adbd9581843b090f677a7570ed47f791', 0, 'profile@test.com'),
	(7, NULL, '1993-10-03', 0, 'Test User', '2ac9cb7dc02b3c0083eb70898e549b63', 1, 'username@rc.test.com'),
	(8, NULL, '1993-10-03', 0, 'Test User', '2ac9cb7dc02b3c0083eb70898e549b63', 1, 'username2@rc.test.com'),
	(9, NULL, '1993-04-12', 1, 'Tim', 'b5058238d6ae739867815a4ddf405de3', 1, 'timv@nroe.yen'),
	(10, NULL, '1993-10-20', 0, 'PJ', '0907a61f74e304e8538d84914c99e2c5', 0, 'gio@degruyter.com'),
	(11, NULL, '1993-04-12', 1, 'Tim', 'b5058238d6ae739867815a4ddf405de3', 1, 'thierryv@nnn.loo'),
	(12, NULL, '1993-10-20', 1, 'TestUser', 'adbd9581843b090f677a7570ed47f791', 0, 'user@tt.test.com'),
	(13, NULL, '1993-10-20', 1, 'TestUser', 'adbd9581843b090f677a7570ed47f791', 0, 'user2@tt.test.com'),
	(14, NULL, '1993-10-20', 1, 'TestUser', 'adbd9581843b090f677a7570ed47f791', 0, 'user3@tt.test.com'),
	(15, NULL, '1993-10-20', 1, 'TestUser', 'adbd9581843b090f677a7570ed47f791', 0, 'user4@tt.test.com'),
	(16, NULL, '1993-10-20', 1, 'TestUser', 'adbd9581843b090f677a7570ed47f791', 0, 'Thierry@test.com'),
	(17, NULL, '1993-10-20', 1, 'TestUser', 'adbd9581843b090f677a7570ed47f791', 0, 'TestUser2@test.com'),
	(18, NULL, '1993-10-20', 1, 'TestUser', 'adbd9581843b090f677a7570ed47f791', 0, 'TestUser3@test.com'),
	(19, 'src\\main\\webapp\\userImages\\TestUser-1688883175.png', '1993-10-20', 1, 'TestUser', 'adbd9581843b090f677a7570ed47f791', 0, 'Thierry2@test.com'),
	(20, NULL, '1993-10-20', 0, 'OneCarUser', 'adbd9581843b090f677a7570ed47f791', 0, 'Onecar@test.com'),
	(21, NULL, '1914-02-08', 0, 'PJ', 'd1557bbeb3b6a8d1689728a1afbb3928', 1, 'pieterjanvdp@gmail.com'),
	(22, NULL, '1993-05-05', 0, 'My Name', 'bb0739bd5ce6d7c38bd15681f6f5b1f5', 1, 'ihaveacar@cars.car'),
	(23, NULL, '1993-10-20', 0, 'Wimmetje', '48df5fcbd46f7beb49840eb03af4c190', 0, 'test@user.com');

DROP TABLE IF EXISTS `t_weekdayroute`;
CREATE TABLE IF NOT EXISTS `t_weekdayroute` (
  `weekdayrouteId` int(11) NOT NULL AUTO_INCREMENT,
  `day` int(11) DEFAULT NULL,
  `routeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`weekdayrouteId`),
  KEY `FK_p9evtkccgmxmcnxax3kfs84gt` (`routeId`),
  CONSTRAINT `FK_p9evtkccgmxmcnxax3kfs84gt` FOREIGN KEY (`routeId`) REFERENCES `t_route` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

DELETE FROM `t_weekdayroute`;
INSERT INTO `t_weekdayroute` (`weekdayrouteId`, `day`, `routeId`) VALUES
	(1, 0, 1),
	(2, 1, 1);

	SET FOREIGN_KEY_CHECKS = 1;
