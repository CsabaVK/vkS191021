select * from `&_laptopok`; //lekérdezés

select * from `&_pc`;
select * from `&_pc` where `sebesseg`  >= 3.00;
select modell from `&_pc`
where `sebesseg` >= 3.00;

select * from `&_laptopok` t 
	inner join `&_termekek` I 
	ON t.laptop_id = I.modell;

select gyarto 
	from `&_laptopok` t 
	inner join `&_termekek` I 
	ON t.laptop_id = I.modell 
	where hattertar >= 100;
	
	select  modell, ar 
	from 
  		(select laptop_id modell, ar from `&_laptopok`
			union
		select modell, ar from `&_pc`
			union
		select modell, ar from `&_nyomtatok` ) T
	inner join `&_termekek` 
		using(`modell`)
			where gyarto = 'B';
		
select gyarto, tipus db from `&_termekek` group by gyarto, tipus


/*111111111111111111111111*/
/* R és S relációk */

create table `R`(`A` tinyint, `B` tinyint) default charset = utf8; 
create table `S`(`B` tinyint, `C` tinyint, `D` tinyint) default charset = utf8;

insert into `R` values ( 1, 2 ), (3, 4);
insert into `S` values ( 2, 5, 6 ), (4, 7, 8), (9, 10, 11);


/* U és V relációk */
Create TABLE `U`(`A` tinyint, `B` tinyint, `C` tinyint) default charset = utf8;
Create TABLE `V`(`B` tinyint, `C` tinyint, `D` tinyint) default charset = utf8;

insert into `U` values(1, 2, 3), (6, 7, 8),(9, 7, 8);
insert into `V` values(2, 3, 4), (2, 3, 5),(7, 8, 10);


/* Filmek tábla */
create table `Filmek`(
`filmcim` VARCHAR(100),
`ev` int,
`hossz` INT,
`mufaj` VARCHAR(20),
`studioNev` VARCHAR(30),
`producerAzon` INT,
CONSTRAINT `filmek_pk` PRIMARY KEY(`filmcim`, `ev`)
)DEFAULT CHARSET = utf8;

INSERT INTO `Filmek` VALUES 
('Csillagok háborúja', 1977, 124, 'sci-fi', 'Fox', 2),
('Deadpool', 2016, 108, 'szuperhősfilm', 'Fox', 2),
('Elfújta a szél',1939,231,'dráma','MGM', 3),
('Wayne világa',1992,95,'vígjáték','Paramount', 7);


/*222222222222222222222222*/
CREATE TABLE `&_Termekek` (
  `gyarto` char(1) NOT NULL,
  `modell` smallint(6) NOT NULL,
  `tipus` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`modell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `&_Laptopok` (
  `Laptop_id` int(11) NOT NULL AUTO_INCREMENT,
  `sebesseg` float(3,2) DEFAULT NULL COMMENT 'Sebesség GHz-ben',
  `memoria` smallint(6) DEFAULT '512',
  `hattertar` smallint(6) NOT NULL,
  `kijelzo_meret` float(3,1) DEFAULT NULL,
  `ar` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`Laptop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ez egy példa tábla';

CREATE TABLE `&_PC` (
  `modell` smallint(6) NOT NULL,
  `sebesseg` float(3,2) DEFAULT NULL,
  `memoria` smallint(6) DEFAULT NULL,
  `merevlemez` smallint(6) DEFAULT NULL,
  `ar` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`modell`),
  CONSTRAINT `Termek_fk` FOREIGN KEY (`modell`) REFERENCES `&_Termekek`(`modell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `&_Nyomtatok`(
	`modell` smallint(6),
	`szines` enum('igen','nem') default 'igen',
	`tipus` varchar(12),
	`ar` smallint,
	CONSTRAINT	`&_termekek_ny_fk` FOREIGN KEY(`modell`) REFERENCES `&_Termekek`(`modell`),
	CONSTRAINT `&_Laptopok_pk` PRIMARY KEY(`modell`)
)DEFAULT CHARSET=utf8;


/*333333333333333333333333333333333333*/
/* Termék, PC, Laptop és Nyomtató táblaadatok */ 

/* Termék, PC, Laptop és Nyomtató táblaadatok */ 

INSERT INTO `&_Termekek` VALUES
('A',1001,'pc'),
('A',1002,'pc'),
('A',1003,'pc'),
('A',2004,'laptop'),
('A',2005,'laptop'),
('A',2006,'laptop'),
('B',1004,'pc'),
('B',1005,'pc'),
('B',1006,'pc'),
('B',2007,'laptop'),
('C',1007,'pc'),
('D',1008,'pc'),
('D',1009,'pc'),
('D',1010,'pc'),
('D',3004,'nyomtato'),
('D',3005,'nyomtato'),
('E',1011,'pc'),
('E',1012,'pc'),
('E',1013,'pc'),
('E',2001,'laptop'),
('E',2002,'laptop'),
('E',2003,'laptop'),
('E',3001,'nyomtato'),
('E',3002,'nyomtato'),
('E',3003,'nyomtato'),
('F',2008,'laptop'),
('F',2009,'laptop'),
('G',2010,'laptop'),
('H',3006,'nyomtato'),
('H',3007,'nyomtato');

INSERT INTO `&_PC` VALUES
(1001,2.66,1024,250,2114),
(1002,2.10,512,250,995),
(1003,1.42,512,80,478),
(1004,2.80,1024,250,649),
(1005,3.20,512,250,630),
(1006,3.20,1024,320,1049),
(1007,2.20,1024,200,510),
(1008,2.20,2048,250,770),
(1009,2.00,1024,250,650),
(1010,2.80,2048,300,770),
(1011,1.86,2048,160,959),
(1012,2.80,1024,160,649),
(1013,3.06,512,80,529);

INSERT INTO `&_Laptopok` VALUES
(2001,2.00,2048,240,20.1,3673),
(2002,1.73,1024,80,17.0,949),
(2003,1.80,512,60,15.4,549),
(2004,2.00,512,60,13.3,1150),
(2005,2.16,1024,120,17.0,2500),
(2006,2.00,2048,80,15.4,1700),
(2007,1.83,1024,120,13.3,1429),
(2008,1.60,1024,100,15.4,900),
(2009,1.60,512,80,14.1,680),
(2010,2.00,2048,160,15.4,2300);

INSERT INTO `&_Nyomtatok` VALUES
(3001,'igen','tintasugaras',99),
(3002,'nem','lézer',239),
(3003,'igen','lézer',899),
(3004,'igen','tintasugaras',120),
(3005,'nem','lézer',120),
(3006,'igen','tintasugaras',100),
(3007,'igen','lézer',200);