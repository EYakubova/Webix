/*
MySQL Data Transfer
Source Host: localhost
Source Database: myapp
Target Host: localhost
Target Database: myapp
Date: 11-Jul-14 04:07:50
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for events
-- ----------------------------
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL,
  `location` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for speakers
-- ----------------------------
DROP TABLE IF EXISTS `speakers`;
CREATE TABLE `speakers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author` varchar(255) NOT NULL,
  `topic` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `event_id` bigint(20) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `events` VALUES ('1', 'Front-end # 1', 'We will consider different aspects of web app development: Promises, AntiAliasing, HTML-import, using DevTools at the upcoming event in detail! We are waiting for you! ', '2014-06-06', 'Minsk,Сentralnaya str.1, Blue conference hall', 'frontend1.png');
INSERT INTO `events` VALUES ('2', 'Front-end #2', 'Interesting reports on Front-end development that will be presented by real gurus of JavaScript-programming!', '2014-06-20', 'Minsk,Сentralnaya str.1, Blue conference hall', 'frontend2.png');
INSERT INTO `events` VALUES ('3', 'Front-end #3', 'Interesting reports on Front-end development that will be presented by real gurus of JavaScript-programming!', '2014-07-04', 'Minsk,Сentralnaya str.1, Blue conference hall', 'frontend3.png');
INSERT INTO `events` VALUES ('4', 'Front-end #4', 'Interesting reports on Front-end development that will be presented by real gurus of JavaScript-programming!', '2014-07-18', 'Minsk,Сentralnaya str.1, Blue conference hall', 'frontend4.png');
INSERT INTO `events` VALUES ('5', 'Front-end #5', 'Interesting reports on Front-end development that will be presented by real gurus of JavaScript-programming!', '2014-08-01', 'Minsk,Сentralnaya str.1, Blue conference hall', 'frontend5.png');
INSERT INTO `events` VALUES ('6', 'Front-end #6', 'Interesting reports on Front-end development that will be presented by real gurus of JavaScript-programming!', '2014-08-15', 'Minsk,Сentralnaya str.1, Blue conference hall', 'frontend6.png');
INSERT INTO `speakers` VALUES ('1', 'Iron Man', 'JavaScript Promises - There and Back Again', 'ironman.jpg', '1', 'One of the new features that browser developers are preparing for us together with the developers who write specifications of JavaScript Promises is that this template of writing asynchronous code popular with lots of users gets native support. What’s the point of Promises and how to deal with them?');
INSERT INTO `speakers` VALUES ('2', 'Hulk', 'Avoiding Unnecessary Re-rendering', 'halk.jpg ', '2', 'Rendering elements for a site or an application can take too much time and may have a negative impact on performance. We will consider the reasons for re-rendering in a browser and learn how to avoid unnecessary calls.');
INSERT INTO `speakers` VALUES ('3', 'Spider-Man', 'Using Your Terminal from the DevTools', 'spiderman.jpg', '1', 'DevTools Terminal is a new Chrome extension which provides the command-line functionality right in your browser.');
INSERT INTO `speakers` VALUES ('4', 'Thor', 'High Performance Animations', 'thor.jpg', '2', 'Diving deep into getting faster animations in your projects. We’ll discover why modern browsers can easily animate the following properties: position, scale, rotation, opacity.');
INSERT INTO `speakers` VALUES ('5', 'Batman', 'AntiAliasing. Basics.', 'batman.jpg', '1', 'An introduction to antialiasing, explaining how vector shapes and text are rendered smoothly.');
INSERT INTO `speakers` VALUES ('6', 'Captain America', 'HTML-Import', 'captainamerica.jpg', '1', 'HTML-import is a way of including some HTML documents into others. You’re not limited to markup either. You can also include CSS, JavaScript or anything else an .html file can contain.');
