-- Game Review Database
-- Creates a game review backend that stores games, reviews, tags, developers, and other related information.
-- DB Games: Anthony Carrillo, TM1, TM2, TM3

DROP DATABASE IF EXISTS `gamereview`;
CREATE DATABASE IF NOT EXISTS `gamereview`;
USE `gamereview`;

CREATE TABLE USERS 
    ( 
    UserID                INT, 
    Username              VARCHAR(30)         NOT NULL, 
    FName                 VARCHAR(30)         NOT NULL, 
    LName                 VARCHAR(30), 
    DOB                   DATE, 
    Joined                DATE                NOT NULL, 
    PRIMARY KEY (UserID) 
    );

CREATE TABLE COMPANY 
    ( 
    CompanyID            INT, 
    CompanyName          VARCHAR(128)         NOT NULL, 
    PRIMARY KEY (CompanyID) 
    );

CREATE TABLE LANGUAGE 
    ( 
    LanguageID            INT, 
    LanguageName          VARCHAR(30)        NOT NULL, 
    PRIMARY KEY (LanguageID) 
    );

CREATE TABLE ESRB 
    ( 
    ESRBID                INT, 
    ESRBRating            VARCHAR(60), 
    PRIMARY KEY (ESRBID) 
    );

CREATE TABLE TAG 
    ( 
    TagID                  INT, 
    Tag                    VARCHAR(30), 
    PRIMARY KEY (TagID)
    );

CREATE TABLE PLATFORM
    ( 
    PlatformID              INT, 
    PlatformName            VARCHAR(60), 
    PRIMARY KEY (PlatformID) 
    );

CREATE TABLE GAME
	(
	GameID		INT,
	Name		VARCHAR(128) 	NOT NULL,	
	ReleaseDate	DATE		DEFAULT NULL,
	DeveloperID	INT		DEFAULT 0 NOT NULL,
	PublisherID	INT		DEFAULT 0 NOT NULL,
	LanguageID	INT		DEFAULT 1,
	ESRBID		INT		DEFAULT 5,
	PlatformID	INT		DEFAULT NULL,
	DLCCount	INT		DEFAULT 0,
	PlayerCount	INT		DEFAULT 1,
	PRIMARY KEY (GameID),
	FOREIGN KEY (DeveloperID) REFERENCES COMPANY (CompanyID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (PublisherID) REFERENCES COMPANY (CompanyID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (LanguageID) REFERENCES LANGUAGE (LanguageID) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT chk_dlc CHECK (DLCCount > -1),
	CONSTRAINT chk_player CHECK (PlayerCount > 0)
	);

CREATE TABLE REVIEW
	(
	UserID		INT,
	GameID		INT,
	Rating		INT		NOT NULL,
	TagID1		INT		DEFAULT NULL, 
	TagID2		INT		DEFAULT NULL,
	TagID3		INT		DEFAULT NULL,
	DLCNecessary	INT		NOT NULL,
	PRIMARY KEY (UserID, GameID),
	FOREIGN KEY (TagID1) REFERENCES TAG (TagID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (TagID2) REFERENCES TAG (TagID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (TagID3) REFERENCES TAG (TagID) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT chk_rating CHECK (Rating >= 1 AND Rating <= 5),
	CONSTRAINT chk_dlcn CHECK (DLCNecessary >= 1 AND DLCNecessary <= 5)
	);


INSERT INTO USERS VALUES (1, 'NotGeorgeWashington', 'George', 'Washington', '1990-04-12', '2022-10-23');
INSERT INTO USERS VALUES (2, 'KeanuGaming', 'Keanu', 'Reeves', '1964-09-02', '2022-10-25');
INSERT INTO USERS VALUES (5, 'SandstoneBestow', 'Mya', 'Arias', '1988-08-18', '2018-08-18');
INSERT INTO USERS VALUES (6, 'Jellyfishpallograph', 'Monica', 'Salas', '1999-08-07', '2016-04-05');
INSERT INTO USERS VALUES (7, 'telosuser45', 'Hank', 'Tank', '1995-06-12', '2019-05-19');
INSERT INTO USERS VALUES (8, 'zeldafan64', 'Bill', 'Franklin', '1993-07-13', '2020-07-13');
INSERT INTO USERS VALUES (9, 'bigman73', 'Drew', 'Park', '2000-01-01', '2022-04-09');
INSERT INTO USERS VALUES (10, 'ColonelOneill', 'Jack', 'Oneill', '1962-05-05', '2020-01-01');
INSERT INTO USERS VALUES (11, 'DrJackson199', 'Daniel', 'Jackson', '1973-01-05', '2020-01-07');
INSERT INTO USERS VALUES (12, 'GateShip1', 'Smantha', 'Carter', '1975-08-21', '2020-01-04');
INSERT INTO USERS VALUES (3, 'DaigoUmehara', 'Daigo', 'Umehara', '1981-05-19', '2022-06-23');
INSERT INTO USERS VALUES (4, 'CoatiCod', 'Dionne', 'Nelson', '2001-01-01', '2022-02-02');

INSERT INTO COMPANY VALUES (1, 'Arc System Works');
INSERT INTO COMPANY VALUES (2, 'Capcom');
INSERT INTO COMPANY VALUES (3, 'Respawn Entertainment');
INSERT INTO COMPANY VALUES (4, 'Electronic Arts');
INSERT INTO COMPANY VALUES (5, 'Nintendo');
INSERT INTO COMPANY VALUES (6, '0 Deer Soft');
INSERT INTO COMPANY VALUES (7, 'Jinthree Studio');
INSERT INTO COMPANY VALUES (8, 'Square Enix');
INSERT INTO COMPANY VALUES (9, 'Artdink');
INSERT INTO COMPANY VALUES (10, 'Jagex');
INSERT INTO COMPANY VALUES (11, 'Bethesda');
INSERT INTO COMPANY VALUES (12, 'Heart Machine');

INSERT INTO LANGUAGE VALUES (1, 'English');
INSERT INTO LANGUAGE VALUES (2, 'Japanese');
INSERT INTO LANGUAGE VALUES (3, 'Spanish');
INSERT INTO LANGUAGE VALUES (4, 'Chinese');
INSERT INTO LANGUAGE VALUES (5, 'French');
INSERT INTO LANGUAGE VALUES (6, 'Korean');
INSERT INTO LANGUAGE VALUES (7, 'German');
INSERT INTO LANGUAGE VALUES (8, 'Italian');
INSERT INTO LANGUAGE VALUES (9, 'Russian');
INSERT INTO LANGUAGE VALUES (10, 'Dutch');
INSERT INTO LANGUAGE VALUES (11, 'Vietnamese');
INSERT INTO LANGUAGE VALUES (12, 'Latin');

INSERT INTO ESRB VALUES (0, 'Everyone');
INSERT INTO ESRB VALUES (1, 'Everyone 10+');
INSERT INTO ESRB VALUES (2, 'Teen');
INSERT INTO ESRB VALUES (3, 'Mature 17+');
INSERT INTO ESRB VALUES (4, 'Adults Only 18+');
INSERT INTO ESRB VALUES (5, 'Rating Pending');
INSERT INTO ESRB VALUES (6, 'Rating Pending Likely Mature 17+');
INSERT INTO ESRB VALUES (7, 'Rating Pending Likely Teen');
INSERT INTO ESRB VALUES (8, 'Rating Pending Likely Everyone 10+');
INSERT INTO ESRB VALUES (9, 'Rating Pending Like Everyone');
INSERT INTO PLATFORM VALUES (0, 'PC');
INSERT INTO PLATFORM VALUES (1, 'PS3');
INSERT INTO PLATFORM VALUES (2, 'PS4');
INSERT INTO PLATFORM VALUES (3, 'PS5');
INSERT INTO PLATFORM VALUES (4, 'Nintendo Consoles');
INSERT INTO PLATFORM VALUES (5, 'Mobile');

INSERT INTO TAG VALUES (1, '2D Fighter');
INSERT INTO TAG VALUES (2, '3D Fighter');
INSERT INTO TAG VALUES (3, 'Platform Fighter');
INSERT INTO TAG VALUES (4, 'Anime');
INSERT INTO TAG VALUES (5, 'Good Soundtrack');
INSERT INTO TAG VALUES (6, 'FPS');
INSERT INTO TAG VALUES (7, 'Movement Shooter');
INSERT INTO TAG VALUES (8, 'Open World');
INSERT INTO TAG VALUES (9, 'Puzzle');
INSERT INTO TAG VALUES (10, 'Racing');
INSERT INTO TAG VALUES (11, 'Virtual Reality');
INSERT INTO TAG VALUES (12, 'Survival');
INSERT INTO TAG VALUES (13, 'Co-Operative');
INSERT INTO TAG VALUES (14, 'Strategy');
INSERT INTO TAG VALUES (15, 'City & Settlement');
INSERT INTO TAG VALUES (16, 'Sports');
INSERT INTO TAG VALUES (17, 'Action');
INSERT INTO TAG VALUES (18, 'Simulation');
INSERT INTO TAG VALUES (19, 'Story-Rich');
INSERT INTO TAG VALUES (20, 'Role-Playing (RPG)');
INSERT INTO TAG VALUES (21, 'Adventure');
INSERT INTO TAG VALUES (22, 'Horror');
INSERT INTO TAG VALUES (23, 'FTP');

INSERT INTO GAME VALUES (1, 'Guilty Gear Strive', '2021-06-11', 1, 1, 2, 2, 0, 15, 2);
INSERT INTO GAME VALUES (2, 'Street Fighter V', '2016-02-15', 2, 2, 1, 2, 0, 25, 2);
INSERT INTO GAME VALUES (3, 'Titanfall 2', '2016-10-28', 3, 4, 1, 3, 2, 5, 16);
INSERT INTO GAME VALUES (4, 'Legend of Zelda: Breath of the Wild', '2017-03-03', 4, 4, 1, 2, 4, 1, 1);
INSERT INTO GAME VALUES (5, 'Escape Memoirs: Mini Stories', '2022-09-30', 6, 6, 1, 1, 0, 1, 2);
INSERT INTO GAME VALUES (6, 'Broken Universe - Tower Defense', '2021-05-24', 7, 7, 1, 1, 0, 1, 1);
INSERT INTO GAME VALUES (7, 'Triangle Strategy', '2022-10-13', 9, 8, 1, 2, 0, 1, 1);
INSERT INTO GAME VALUES (8, 'Runescape', '2001-04-01', 10, 10, 1, 2, 0, 0, 1500);
INSERT INTO GAME VALUES (9, 'Monster Hunter World', '2018-01-26', 2, 2, 1, 2, 0, 230, 4);
INSERT INTO GAME VALUES (11, 'Animal Crossing New Horizons', '2020-03-20', 5, 5, 1, 1, 0, 1, 8);
INSERT INTO GAME VALUES (12, 'Hyper Light Drifter', '2016-05-31', 12, 12, 1, 4, 0, 0, 2);

INSERT INTO REVIEW VALUES (1,	1, 	5, 	1, 	4, 	5, 	3);
INSERT INTO REVIEW VALUES (2, 	2, 	5, 	1, 	NULL, 	NULL, 	3);
INSERT INTO REVIEW VALUES (3, 	3, 	5, 	6, 	7, 	NULL, 	1);
INSERT INTO REVIEW VALUES (4, 	5, 	4, 	9, 	23, 	22, 	1);
INSERT INTO REVIEW VALUES (5, 	6, 	5, 	14, 	9, 	21, 	1);
INSERT INTO REVIEW VALUES (6, 	7, 	5, 	14, 	20, 	17, 	1);
INSERT INTO REVIEW VALUES (7, 	8, 	5, 	8, 	20, 	19, 	1);
INSERT INTO REVIEW VALUES (8, 	4, 	5, 	8, 	17, 	21, 	1);
INSERT INTO REVIEW VALUES (9, 	9, 	3, 	17, 	5, 	2, 	1);
INSERT INTO REVIEW VALUES (10, 	12, 	5, 	20, 	17, 	7, 	1);
INSERT INTO REVIEW VALUES (11, 	11, 	5, 	20, 	18, 	15, 	1);
INSERT INTO REVIEW VALUES (12, 	10, 	5, 	20, 	12, 	8, 	1);
INSERT INTO REVIEW VALUES (3, 9, 1, 6, 10, NULL, 1);
INSERT INTO REVIEW VALUES (7, 4, 1, 14, 20, NULL, 3);
INSERT INTO REVIEW VALUES (8, 9, 1, 8, 20, NULL, 2);
INSERT INTO REVIEW VALUES (5, 9, 2, 21, 14, NULL, 1);
INSERT INTO REVIEW VALUES (7, 2, 5, 17, NULL, NULL, 1);
INSERT INTO REVIEW VALUES (7, 12, 2, 14, NULL, NULL, 3);
INSERT INTO REVIEW VALUES (5, 2, 4, NULL, NULL, NULL, 5);
INSERT INTO REVIEW VALUES (9, 8, 5, 17, 20, NULL, 2);
INSERT INTO REVIEW VALUES (6, 12, 3, 14, NULL, NULL, 2);
INSERT INTO REVIEW VALUES (11, 7, 1, 20, 18, 15, 2);
INSERT INTO REVIEW VALUES (12, 7, 5, 15, 8, 3, 5);
INSERT INTO REVIEW VALUES (5, 7, 4, 20, 18, 15, 1);
INSERT INTO REVIEW VALUES (3, 1, 1, 7, 17, NULL, 2);
INSERT INTO REVIEW VALUES (6, 10, 2, 14, 10, 5, 4);
INSERT INTO REVIEW VALUES (7, 7, 2, 13, 9, 4, 1);
INSERT INTO REVIEW VALUES (2, 6, 2, 13, 6, 7, 5);
INSERT INTO REVIEW values (10, 2, 3, 4, 2, 3, 4);
INSERT INTO REVIEW values (6, 3, 2, 17, NULL, NULL, 2);
INSERT INTO REVIEW values (7, 1, 5, 20, 3, 7, 3);
INSERT INTO REVIEW values (8, 1, 1, 8, NULL, NULL, 2);
INSERT INTO REVIEW values (2, 3, 3, 12, 1, 11, 1);
INSERT INTO REVIEW values (10, 9, 1, 1, 5, 13, 3);
INSERT INTO REVIEW values (7, 10, 3, 8, 14, 17, 2);
INSERT INTO REVIEW values (11, 10, 3, 20, 18, NULL, 2);
INSERT INTO REVIEW values (3, 2, 1, 17, 7, NULL, 5);
