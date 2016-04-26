DROP TABLE ZIPCode;

--Create the ZIPCode table
CREATE TABLE IF NOT EXISTS ZIPCode (
	ZIPCode		integer		not null unique,
	city		text		not null,
	state		char(2)		not null,
	PRIMARY KEY(ZIPCode)
);
--Sample Data
INSERT INTO ZIPCode
VALUES (12601,'Poughkeepsie','NY');

INSERT INTO ZIPCode
VALUES (92253,'La Quinta','CA');

INSERT INTO ZIPCode
VALUES (92260,'Palm Desert','CA');

INSERT INTO ZIPCode
VALUES (92262,'Palm Springs','CA');

INSERT INTO ZIPCode
VALUES (92276,'Thousand Palms','CA');

INSERT INTO ZIPCode
VALUES (90052,'Los Angeles','CA');

INSERT INTO ZIPCode
VALUES (94114,'San Francisco','CA');

INSERT INTO ZIPCode
VALUES (92111,'San Diego','CA');

INSERT INTO ZIPCode
VALUES (90210,'Beverly Hills','CA');
--Select the whole ZIPCode table
SELECT *
FROM ZIPCode
--Create the people table
CREATE TABLE IF NOT EXISTS people (
	pid		serial	 	not null unique,
	fullName	text 		not null unique, 			--this needs to be unique for use in the studioNames, fieldNames, and productionNames tables
	birthDate	date 		not null,
	gender		char(1) 	not null,
	email		varchar(256) 	not null,
	phoneNum	char (15) 	not null,
	streetAddress	varchar(256)	not null,
	ZIPCode		integer		not null,
	CONSTRAINT 	valid_gender 	CHECK (gender = 'F' OR gender = 'M'), -- Male or female homie
	PRIMARY KEY(pid),
	FOREIGN KEY(ZIPCode) references ZIPCode
);
--Sample Data
INSERT INTO people
VALUES (0, 'Based Codd', '19000101', 'M', 'bigfish@gmail.com', '411-007-1234', '321 Heavenly Way', (SELECT ZIPCode FROM ZIPCode WHERE city='San Diego'));

INSERT INTO people
VALUES (DEFAULT, 'Jess Farr', '19951112', 'F', 'Jessica.Farr1@marist.edu', '978-914-4426', '2516 Merengue Street', (SELECT ZIPCode FROM ZIPCode WHERE city='La Quinta'));

INSERT INTO people
VALUES (DEFAULT, 'Jenifer Daniels', '19640918', 'F', 'jenifer.daniels@cbslocal2.com', '760-485-5494', '45705 Coldbrook Lane', (SELECT ZIPCode FROM ZIPCode WHERE city='La Quinta'));

INSERT INTO people
VALUES (DEFAULT, 'Mitchell Xanders', '19951204', 'M', 'Mitchell.Xanders1@marist.edu', '760-851-8161', '45705 Coldbrook Lane', (SELECT ZIPCode FROM ZIPCode WHERE city='La Quinta'));

INSERT INTO people
VALUES (DEFAULT, 'Alan Labouseur', '19890110', 'M', 'alan@labouseur.com', '914-363-8244', '007 Craig Drive', (SELECT ZIPCode FROM ZIPCode WHERE city='Beverly Hills'));

INSERT INTO people
VALUES (DEFAULT, 'Johnny Mosho', '19960610', 'M', 'John.Mosho1@marist.edu', '627-545-3104', '575 Smorgasbord Road', (SELECT ZIPCode FROM ZIPCode WHERE city='Poughkeepsie'));

INSERT INTO people
VALUES (DEFAULT, 'Jenny Twotone', '19700215', 'F', 'onehitwonder@aol.com', '760-867-5309', '914 Tommy Lane', (SELECT ZIPCode FROM ZIPCode WHERE city='Los Angeles'));

INSERT INTO people
VALUES (DEFAULT, 'Elio Velazquez', '19951114', 'M', 'eliov40@gmail.com', '343-589-6217', '444 Gravity Drive', (SELECT ZIPCode FROM ZIPCode WHERE city='Thousand Palms'));

INSERT INTO people
VALUES (DEFAULT, 'Anita Campbell', '19780306', 'F', 'wheresmyglasses@yahoo.com', '818-8507-2020', '650 Black Street', (SELECT ZIPCode FROM ZIPCode WHERE city='San Francisco'));

INSERT INTO people
VALUES (DEFAULT, 'Bob Frapples', '19661022', 'M', 'bob4apples@aol.com', '366-517-2111', '213 Candy Cane Lane', (SELECT ZIPCode FROM ZIPCode WHERE city='Palm Springs'));

INSERT INTO people
VALUES (DEFAULT, 'Summer Skye', '19900706', 'F', 'shades90@yahoo.com', '760-124-6630', '450 Sunset Boulevard', (SELECT ZIPCode FROM ZIPCode WHERE city='Palm Desert'));

INSERT INTO people
VALUES (DEFAULT, 'Brady Thomas', '19770124', 'M', 'fourrings@gmail.com', '714-552-3694', '16 Flat Street', (SELECT ZIPCode FROM ZIPCode WHERE city='Poughkeepsie'));

INSERT INTO people
VALUES (DEFAULT, 'PJ Pants', '19850401', 'M', 'pajamaparty@yahoo.com', '291-505-4998', '304 Night Drive', (SELECT ZIPCode FROM ZIPCode WHERE city='Palm Springs'));

INSERT INTO people
VALUES (DEFAULT, 'Carl Maggio', '19960316', 'M', 'caaaaaaaaarl@gmail.com', '760-333-1790', '404 Blank Circle', (SELECT ZIPCode FROM ZIPCode WHERE city='Palm Desert'));

INSERT INTO people
VALUES (DEFAULT, 'Shane King', '19960521', 'M', 'milkisnumba1@yahoo.com', '914-286-2251', '311 Gamma Lane', (SELECT ZIPCode FROM ZIPCode WHERE city='Poughkeepsie'));

INSERT INTO people
VALUES (DEFAULT, 'Astro Beamer', '19970214', 'M', 'cooldawgz@gmail.com', '760-522-3104', '400 Runaway Lane', (SELECT ZIPCode FROM ZIPCode WHERE city='Thousand Palms'));

INSERT INTO people
VALUES (DEFAULT, 'Tubby Fujita', '19970124', 'F', 'flysrscary@yahoo.com', '760-210-1159', '369 Coldberry Cove', (SELECT ZIPCode FROM ZIPCode WHERE city='San Francisco'));

INSERT INTO people
VALUES (DEFAULT, 'Austin Braunschweiger', '19941107', 'M', 'swagg@gmail.com', '760-803-4110', '62 Desert Road', (SELECT ZIPCode FROM ZIPCode WHERE city='La Quinta'));

INSERT INTO people
VALUES (DEFAULT, 'Eury Fabian', '19930821', 'M', 'e@gmail.com', '410-259-3688', '101 Pennsylvania Avenue', (SELECT ZIPCode FROM ZIPCode WHERE city='San Francisco'));

INSERT INTO people
VALUES (DEFAULT, 'Flair Lens', '19851229', 'F', 's0h1pster@yahoo.com', '911-411-1762', '1985 Polaroid Road', (SELECT ZIPCode FROM ZIPCode WHERE city='San Francisco'));

INSERT INTO people
VALUES (DEFAULT, 'Captain George', '19590326', 'M', 'tharsheblows@yahoo.com', '909-567-0045', '4500 High Sea Street', (SELECT ZIPCode FROM ZIPCode WHERE city='San Diego'));

INSERT INTO people
VALUES (DEFAULT, 'Penny Nichols', '19810620', 'F', 'ca$hm0ney@gmail.com', '510-292-1147', '25 Dime Street', (SELECT ZIPCode FROM ZIPCode WHERE city='Palm Springs'));

INSERT INTO people
VALUES (DEFAULT, 'Kay Nine', '19760811', 'F', 'barkbark@yahoo.com', '714-202-5865', '12 Plateau Drive', (SELECT ZIPCode FROM ZIPCode WHERE city='Palm Desert'));

INSERT INTO people
VALUES (DEFAULT, 'Jordan Michael', '19630217', 'M', 'retire23@gmail.com', '408-362-5174', '6 Ring Drive', (SELECT ZIPCode FROM ZIPCode WHERE city='San Diego'));

INSERT INTO people
VALUES (DEFAULT, 'Michelle Bay', '19790925', 'F', 'BIGexplosions@yahoo.com', '253-646-9000', '911 Boom Boulevard', (SELECT ZIPCode FROM ZIPCode WHERE city='Los Angeles'));

INSERT INTO people
VALUES (DEFAULT, 'Cam Era', '19890411', 'M', 'photofinish@gmail.com', '309-694-1820', '133 Melody Lane', (SELECT ZIPCode FROM ZIPCode WHERE city='San Francisco'));
--Select the entire people table
SELECT *
FROM people
ORDER BY pid ASC;
--Create the studioWorkers table
CREATE TABLE IF NOT EXISTS studioWorkers (
	sid		integer		not null unique references people(pid), --sid=pid
	position	varchar(8)	check (position='Anchor' or position='Weather' or position='Sports' or position='Camera'), --for bigger project with more sample data, Camera could be used more often, but I decided it'd be better to keep it simpler
	PRIMARY KEY(sid)
);
--Sample Data
INSERT INTO studioWorkers
VALUES ((SELECT pid FROM people WHERE fullName='Jenifer Daniels'), 'Anchor');

INSERT INTO studioWorkers
VALUES ((SELECT pid FROM people WHERE fullName='Mitchell Xanders'), 'Sports');

INSERT INTO studioWorkers
VALUES ((SELECT pid FROM people WHERE fullName='Brady Thomas'), 'Sports');

INSERT INTO studioWorkers
VALUES ((SELECT pid FROM people WHERE fullName='Summer Skye'), 'Weather');

INSERT INTO studioWorkers
VALUES ((SELECT pid FROM people WHERE fullName='Bob Frapples'), 'Anchor');

INSERT INTO studioWorkers
VALUES ((SELECT pid FROM people WHERE fullName='Tubby Fujita'), 'Weather');

INSERT INTO studioWorkers
VALUES ((SELECT pid FROM people WHERE fullName='Penny Nichols'), 'Anchor');

INSERT INTO studioWorkers
VALUES ((SELECT pid FROM people WHERE fullName='Kay Nine'), 'Anchor');

INSERT INTO studioWorkers
VALUES ((SELECT pid FROM people WHERE fullName='Captain George'), 'Anchor');
--Useful for testing our identify_new_studioWorker trigger
DELETE FROM studioWorkers
WHERE sid='23';

INSERT INTO studioWorkers
VALUES ((SELECT pid FROM people WHERE fullName='Jordan Michael'), 'Sports');

SELECT *
FROM studioWorkers;
--Our first view, a look at all who are available to work in the studio
CREATE VIEW Studio_Roster AS
SELECT studioWorkers.sid, people.fullName, studioWorkers.position
FROM people, studioWorkers
WHERE people.pid = studioWorkers.sid
ORDER BY position ASC;
SELECT *
FROM Studio_Roster;
--Create the fieldWorkers table
CREATE TABLE IF NOT EXISTS fieldWorkers (
	fid		integer		not null unique references people(pid),
	position	varchar(8)	check (position='Reporter' or position='Camera'),
	PRIMARY KEY(fid)
);
--Sample Data
INSERT INTO fieldWorkers
VALUES ((SELECT pid FROM people WHERE fullName='Alan Labouseur'), 'Reporter');

INSERT INTO fieldWorkers
VALUES ((SELECT pid FROM people WHERE fullName='Johnny Mosho'), 'Camera');

INSERT INTO fieldWorkers
VALUES ((SELECT pid FROM people WHERE fullName='Elio Velazquez'), 'Reporter');

INSERT INTO fieldWorkers
VALUES ((SELECT pid FROM people WHERE fullName='PJ Pants'), 'Camera');

INSERT INTO fieldWorkers
VALUES ((SELECT pid FROM people WHERE fullName='Anita Campbell'), 'Camera');

INSERT INTO fieldWorkers
VALUES ((SELECT pid FROM people WHERE fullName='Astro Beamer'), 'Reporter');

INSERT INTO fieldWorkers
VALUES ((SELECT pid FROM people WHERE fullName='Austin Braunschweiger'), 'Camera');

INSERT INTO fieldWorkers
VALUES ((SELECT pid FROM people WHERE fullName='Flair Lens'), 'Camera');

INSERT INTO fieldWorkers
VALUES ((SELECT pid FROM people WHERE fullName='Eury Fabian'), 'Camera');
--Useful for showing off our identify_new_fieldWorker trigger
DELETE FROM fieldWorkers
WHERE sid='25';

INSERT INTO fieldWorkers
VALUES ((SELECT pid FROM people WHERE fullName='Cam Era'), 'Camera');

SELECT *
FROM fieldWorkers;
--Our second view, a look at all who are available to take on assignments out in the field
CREATE VIEW Field_Roster AS
SELECT fieldWorkers.fid, people.fullName, fieldWorkers.position
FROM people, fieldWorkers
WHERE people.pid = fieldWorkers.fid
ORDER BY position ASC;
SELECT *
FROM Field_Roster;
--Create the production table
CREATE TABLE IF NOT EXISTS production (
	prid		integer		not null unique references people(pid),
	position	varchar(9)	check (position='Director' or position='Producer'),
	PRIMARY KEY(prid)
);
--Sample Data
INSERT INTO production
VALUES ((SELECT pid FROM people WHERE fullName='Jess Farr'), 'Director');

INSERT INTO production
VALUES ((SELECT pid FROM people WHERE fullName='Jenny Twotone'), 'Producer');

INSERT INTO production
VALUES ((SELECT pid FROM people WHERE fullName='Carl Maggio'), 'Producer');

INSERT INTO production
VALUES ((SELECT pid FROM people WHERE fullName='Shane King'), 'Director');
--Useful for showing off our identify_new_productionMember trigger
DELETE FROM production
WHERE sid='24';

INSERT INTO production
VALUES ((SELECT pid FROM people WHERE fullName='Michelle Bay'), 'Director');

SELECT *
FROM production
--Our third view shows everyone available to work on the production team
CREATE VIEW Production_Roster AS
SELECT production.prid, people.fullName, production.position
FROM people, production
WHERE people.pid = production.prid
ORDER BY position ASC;
SELECT *
FROM Production_Roster;

--Create a view with every employee, their id, and what position they have
CREATE VIEW Full_Roster AS
SELECT people.pid, people.fullName, fieldWorkers.position
FROM people RIGHT OUTER JOIN fieldWorkers ON people.pid = fieldWorkers.fid
UNION ALL
SELECT people.pid, people.fullName, studioWorkers.position
FROM people RIGHT OUTER JOIN studioWorkers ON people.pid = studioWorkers.sid
UNION ALL
SELECT people.pid, people.fullName, production.position
FROM people RIGHT OUTER JOIN production ON people.pid = production.prid
ORDER BY position ASC;
SELECT *
FROM Full_Roster;

--Creating a table for studioNames. This will make it easier to add names to a table or view displaying who is working when. That way the user does not have to decode whose id belongs to who.
CREATE TABLE IF NOT EXISTS studioNames (
	sid		integer		not null unique references studioWorkers(sid),
	name		text		not null unique references people(fullName), 	--this is why name needed to be a unique value in the people table
	PRIMARY KEY(sid),
	FOREIGN KEY(sid) REFERENCES studioWorkers(sid),
	FOREIGN KEY(name) REFERENCES people(fullName)
);
--Used initially to insert multiple sid's and names more efficiently. Made obselete by identify_new_studioWorker trigger.
INSERT INTO studioNames (sid, name)
SELECT studioWorkers.sid, people.fullName
FROM people
INNER JOIN studioWorkers ON studioWorkers.sid = people.pid;
--Take a look at the whole table
SELECT *
FROM studioNames
ORDER by sid ASC;
--Create a fieldNames table. This serves the same purposes as the studioNames table, just for our field workers.
CREATE TABLE IF NOT EXISTS fieldNames (
	fid		integer		not null unique references fieldWorkers(fid),
	name		text		not null unique references people(fullName),
	PRIMARY KEY(fid),
	FOREIGN KEY(fid) REFERENCES fieldWorkers(fid),
	FOREIGN KEY(name) REFERENCES people(fullName)
);
--Initially made it possible to efficiently insert names into the table. The identify_new_fieldWorker trigger took its job.
INSERT INTO fieldNames (fid, name)
SELECT fieldWorkers.fid, people.fullName
FROM people
INNER JOIN fieldWorkers ON fieldWorkers.fid = people.pid;
--Looky looky it's a whole table.
SELECT *
FROM fieldNames
ORDER BY fid ASC;
--Creating a similar table for production members
CREATE TABLE IF NOT EXISTS productionNames (
	prid		integer		not null unique references production(prid),
	name		text		not null unique references people(fullName),
	PRIMARY KEY(prid),
	FOREIGN KEY(prid) REFERENCES production(prid),
	FOREIGN KEY(name) REFERENCES people(fullName)
);
--Another mass insert made obselete by a trigger
INSERT INTO productionNames (prid, name)
SELECT production.prid, people.fullName
FROM people
INNER JOIN production ON production.prid = people.pid;
--Let's get a good look at that table, too
SELECT *
FROM productionNames
ORDER BY prid ASC;
--Our first stored procedure that sets up our first trigger
CREATE OR REPLACE FUNCTION identify_new_studioWorker() RETURNS trigger AS
$$
BEGIN
	IF NEW.sid = (SELECT MAX(sid) FROM studioWorkers) THEN 			--Because the id's of employees will only increase, we're setting the newest input to the studioWorkers table equal to the highest(most recently distributed) id in the table
		INSERT INTO studioNames (sid, name)
		SELECT NEW.sid, people.fullName 				--finding the name belonging to the id and inserting into the table
		FROM people
		WHERE NEW.sid = people.pid;
	END IF;
	RETURN NEW;
END;
$$
LANGUAGE PLPGSQL;

CREATE TRIGGER identify_new_studioWorker 			--the trigger runs when a new person is added to the studioWorkers table, identifying the new worker and adding their name to the studioNames table
AFTER INSERT ON studioWorkers
FOR EACH ROW
EXECUTE PROCEDURE identify_new_studioWorker(); 			--RUN IT

--Another stored procedure to ready a trigger, this time for identifying new field workers. Procedure works just like the first one.
CREATE OR REPLACE FUNCTION identify_new_fieldWorker() RETURNS trigger AS 
$$
BEGIN
	IF NEW.fid = (SELECT MAX(fid) FROM fieldWorkers) THEN
		INSERT INTO fieldNames (fid, name)
		SELECT NEW.fid, people.fullName
		FROM people
		WHERE NEW.fid = people.pid;
	END IF;
	RETURN NEW;
END;
$$
LANGUAGE PLPGSQL;

CREATE TRIGGER identify_new_fieldWorker 	--gives the new person a name in the fieldNames table
AFTER INSERT ON fieldWorkers
FOR EACH ROW
EXECUTE PROCEDURE identify_new_fieldWorker();

--Making the stored procedure for the trigger to name our new production members
CREATE OR REPLACE FUNCTION identify_new_productionMember() RETURNS trigger AS 
$$
BEGIN
	IF NEW.prid = (SELECT MAX(prid) FROM production) THEN
		INSERT INTO productionNames (prid, name)
		SELECT NEW.prid, people.fullName
		FROM people
		WHERE NEW.prid = people.pid;
	END IF;
	RETURN NEW;
END;
$$
LANGUAGE PLPGSQL;

CREATE TRIGGER identify_new_productionMember 		--gives the new person a name in the productionNames table
AFTER INSERT ON production
FOR EACH ROW
EXECUTE PROCEDURE identify_new_productionMember();

--Creates the shows table....this one is a doozy	
CREATE TABLE IF NOT EXISTS shows(
	shid		serial		not null unique,
	showTime	varchar(20)	not null CHECK (showTime='Morning' OR showTime='Evening' OR showTime='Night'),
	anchor1		integer		not null references studioWorkers(sid),
	anchor1name	text		null references studioNames(name), 						--this is where our studioNames, fieldNames, and productionNames tables come in handy.
	anchor2		integer		null references studioWorkers(sid), 						-- making those tables makes it easy to bring the names of personalities into the shows table
	anchor2name	text		null references studioNames(name),
	weather		integer		not null references studioWorkers(sid),
	weathername	text		null references studioNames(name),
	sports		integer		not null references studioWorkers(sid),
	sportsname	text		null references studioNames(name),
	camera1		integer		not null references fieldWorkers(fid),
	camera1name	text		null references fieldNames(name),
	camera2		integer		not null references fieldWorkers(fid),
	camera2name	text		null references fieldNames(name),
	reporter	integer		not null references fieldWorkers(fid),
	reportername	text		null references fieldNames(name),
	director	integer		not null references production(prid),
	directorname	text		null references productionNames(name),
	producer	integer		not null references production(prid),
	producername	text		null references productionNames(name),
	PRIMARY KEY(shid),
	FOREIGN KEY(anchor1) REFERENCES studioNames(sid),
	FOREIGN KEY(anchor1name) REFERENCES studioNames(name), 					--There's a couple of foreign keys in this table.
	FOREIGN KEY(anchor2) REFERENCES studioNames(sid),
	FOREIGN KEY(anchor2name) REFERENCES studioNames(name),
	FOREIGN KEY(weather) REFERENCES studioNames(sid),
	FOREIGN KEY(weathername) REFERENCES studioNames(name),
	FOREIGN KEY(sports) REFERENCES studioNames(sid),
	FOREIGN KEY(sportsname) REFERENCES studioNames(name),
	FOREIGN KEY(camera1) REFERENCES fieldNames(fid),
	FOREIGN KEY(camera1name) REFERENCES fieldNames(name),
	FOREIGN KEY(camera2) REFERENCES fieldNames(fid),
	FOREIGN KEY(camera2name) REFERENCES fieldNames(name),
	FOREIGN KEY(reporter) REFERENCES fieldNames(fid),
	FOREIGN KEY(reportername) REFERENCES fieldNames(name),
	FOREIGN KEY(director) REFERENCES productionNames(prid),
	FOREIGN KEY(directorname) REFERENCES productionNames(name),
	FOREIGN KEY(producer) REFERENCES productionNames(prid),
	FOREIGN KEY(producername) REFERENCES productionNames(name)
);
--Sample Data to get us started
INSERT INTO shows (shid, showTime, anchor1, anchor2, weather, sports, camera1, camera2, reporter, director, producer)
VALUES (DEFAULT, 'Morning', 9, 2, 16, 11, 5, 8, 4, 14, 13);

INSERT INTO shows (shid, showTime, anchor1, anchor2, weather, sports, camera1, camera2, reporter, director, producer)
VALUES (DEFAULT, 'Evening', 20, 21, 10, 3, 17, 18, 15, 1, 6);
--Throwing the NULL in there to show off that some news programs can run with only 1 anchor at the desk, but it's also easy to add a name there
INSERT INTO shows (shid, showTime, anchor1, anchor2, weather, sports, camera1, camera2, reporter, director, producer)
VALUES (DEFAULT, 'Night', 22, NULL, 10, 3, 12, 19, 7, 1, 6);

SELECT *
FROM shows
--Our last trigger. This one puts a name to every number we just inserted above
CREATE OR REPLACE FUNCTION identify_cast() RETURNS trigger AS
$$
BEGIN
	IF NEW.anchor1 IN (SELECT anchor1						--This bad boy takes the id number from an UPDATE statement corresponding to a certain column.
			   FROM shows							--It then looks to see if the target area IS NULL, or if value other than the one entered in
		           WHERE anchor1name IS NULL					--the UPDATE statement occupies the cell. If either of these is the case, the function finds
		           OR anchor1name NOT IN (SELECT name				--the name of the personality whose id number is being entered and enters them in the appropriate cell.
						  FROM studioNames			--This guy skips through until the the column being updated can be found in the IF statement.
						  WHERE studioNames.sid = NEW.anchor1)
			  )
	THEN
	    UPDATE shows
	    SET anchor1name = studioNames.name
	    FROM studioNames
	    WHERE shows.anchor1 = studioNames.sid;
	END IF;
	IF NEW.anchor2 IN (SELECT anchor2
			   FROM shows
		           WHERE anchor2name IS NULL
		           OR anchor2name NOT IN (SELECT name
						  FROM studioNames
						  WHERE studioNames.sid = NEW.anchor2)
			  )
	THEN
	    UPDATE shows
	    SET anchor2name = studioNames.name
	    FROM studioNames
	    WHERE shows.anchor2 = studioNames.sid;
	END IF;
	IF NEW.weather IN (SELECT weather
			   FROM shows
		           WHERE weathername IS NULL
		           OR weathername NOT IN (SELECT name
						  FROM studioNames
						  WHERE studioNames.sid = NEW.weather)
			  )
	THEN
	    UPDATE shows
	    SET weathername = studioNames.name
	    FROM studioNames
	    WHERE shows.weather = studioNames.sid;
	END IF;	
	IF NEW.sports IN (SELECT sports
			   FROM shows
		           WHERE sportsname IS NULL
		           OR sportsname NOT IN (SELECT name
						 FROM studioNames
						 WHERE studioNames.sid = NEW.sports)
			  )
	THEN
	    UPDATE shows
	    SET sportsname = studioNames.name
	    FROM studioNames
	    WHERE shows.sports = studioNames.sid;
	END IF;
	IF NEW.camera1 IN (SELECT camera1
			   FROM shows
		           WHERE camera1name IS NULL
		           OR camera1name NOT IN (SELECT name
						  FROM fieldNames
						  WHERE fieldNames.fid = NEW.camera1)
			  )
	THEN
	    UPDATE shows
	    SET camera1name = fieldNames.name
	    FROM fieldNames
	    WHERE shows.camera1 = fieldNames.fid;
	END IF;	
	IF NEW.camera2 IN (SELECT camera2
			   FROM shows
		           WHERE camera2name IS NULL
		           OR camera2name NOT IN (SELECT name
						  FROM fieldNames
						  WHERE fieldNames.fid = NEW.camera2)
			  )
	THEN
	    UPDATE shows
	    SET camera2name = fieldNames.name
	    FROM fieldNames
	    WHERE shows.camera2 = fieldNames.fid;
	END IF;	
	IF NEW.reporter IN (SELECT reporter
			   FROM shows
		           WHERE reportername IS NULL
		           OR reportername NOT IN (SELECT name
						   FROM fieldNames
						   WHERE fieldNames.fid = NEW.reporter)
			  )
	THEN
	    UPDATE shows
	    SET reportername = fieldNames.name
	    FROM fieldNames
	    WHERE shows.reporter = fieldNames.fid;
	END IF;
	IF NEW.director IN (SELECT director
			   FROM shows
		           WHERE directorname IS NULL
		           OR directorname NOT IN (SELECT name
					 	   FROM productionNames
						   WHERE productionNames.prid = NEW.director)
			  )
	THEN
	    UPDATE shows
	    SET directorname = productionNames.name
	    FROM productionNames
	    WHERE shows.director = productionNames.prid;
	END IF;
	IF NEW.producer IN (SELECT producer
			   FROM shows
		           WHERE producername IS NULL
		           OR producername NOT IN (SELECT name
						   FROM productionNames
						   WHERE productionNames.prid = NEW.producer)
			  )
	THEN
	    UPDATE shows
	    SET producername = productionNames.name
	    FROM productionNames
	    WHERE shows.producer = productionNames.prid;
	END IF;					
RETURN NULL;
END;
$$
LANGUAGE PLPGSQL;
--The trigger that sets off this magic
CREATE TRIGGER identify_cast
AFTER UPDATE ON shows
FOR EACH ROW
EXECUTE PROCEDURE identify_cast();
--This is where the can update who is working what position at what time
UPDATE shows
SET camera1 = 5
WHERE shid = 1;
--Take a look at the table in all its glory
SELECT *
FROM shows
ORDER BY shid ASC;
--Creates our next view, which ditches the id numbers and puts the information out in plain English
CREATE VIEW Lineups AS
SELECT showTime, anchor1name, anchor2name, weathername, sportsname, camera1name, camera2name, reportername, directorname, producername
FROM shows
ORDER BY shid ASC;
SELECT *
FROM Lineups			  
--Creates the equipment table
CREATE TABLE IF NOT EXISTS equipment (
	eid		serial		not null unique,
	name		varchar(45)	not null,
	PRIMARY KEY(eid)
);
--Sample Data
INSERT INTO equipment
VALUES (DEFAULT, 'camera 1');

INSERT INTO equipment
VALUES (DEFAULT, 'camera 2');

INSERT INTO equipment
VALUES (DEFAULT, 'camera 3');

INSERT INTO equipment
VALUES (DEFAULT, 'wireless mic 1');

INSERT INTO equipment
VALUES (DEFAULT, 'wireless mic 2');

INSERT INTO equipment
VALUES (DEFAULT, 'wireless mic 3');

INSERT INTO equipment
VALUES (DEFAULT, 'wireless mic 4');

INSERT INTO equipment
VALUES (DEFAULT, 'wireless mic 5');

INSERT INTO equipment
VALUES (DEFAULT, 'microphone 1');

INSERT INTO equipment
VALUES (DEFAULT, 'microphone 2');

INSERT INTO equipment
VALUES (DEFAULT, 'microphone 3');

INSERT INTO equipment
VALUES (DEFAULT, 'microphone 4');

INSERT INTO equipment
VALUES (DEFAULT, 'tripod 1');

INSERT INTO equipment
VALUES (DEFAULT, 'tripod 2');

INSERT INTO equipment
VALUES (DEFAULT, 'tripod 3');

INSERT INTO equipment
VALUES (DEFAULT, 'van 1');

INSERT INTO equipment
VALUES (DEFAULT, 'van 2');
--Some would say that table is pretty nifty. See for yourself
SELECT *
FROM equipment;
--Creates the rentals table where we can track what equipment is being rented out and returned
CREATE TABLE IF NOT EXISTS rentals (
	eid		integer				not null unique references equipment(eid),
	pid		integer				not null references people(pid) DEFAULT '0', 	--Our boy Based Codd is a placeholder to satisfy the not null constraint.
	timeOut		date				not null DEFAULT '2016-01-01',			--Another placeholder to satisfy the not null constraint. We'll assume we got this equipment at the start of the calendar year.
	timeIn		date				null, 						--Can be null because sometimes items are rented out and haven't been returned yet
	CONSTRAINT	valid_time			CHECK (timeOut <= timeIn), 			--The time the item is turned in better be after it's checked out
	PRIMARY KEY(eid,pid),
	FOREIGN KEY(eid) REFERENCES equipment(eid),
	FOREIGN KEY(pid) REFERENCES people(pid)
);
--Placeholder values. The placeholder date is too allow for rentals to be made through our stored procedures.
INSERT INTO rentals
VALUES (1,DEFAULT,DEFAULT, '9999-12-31');

INSERT INTO rentals
VALUES (2,DEFAULT,DEFAULT, '9999-12-31');

INSERT INTO rentals
VALUES (3,DEFAULT,DEFAULT, '9999-12-31');

INSERT INTO rentals
VALUES (4,DEFAULT,DEFAULT, '9999-12-31');

INSERT INTO rentals
VALUES (5,DEFAULT,DEFAULT, '9999-12-31');

INSERT INTO rentals
VALUES (6,DEFAULT,DEFAULT, '9999-12-31');

INSERT INTO rentals
VALUES (7,DEFAULT,DEFAULT, '9999-12-31');

INSERT INTO rentals
VALUES (8,DEFAULT,DEFAULT, '9999-12-31');

INSERT INTO rentals
VALUES (9,DEFAULT,DEFAULT, '9999-12-31');

INSERT INTO rentals
VALUES (10,DEFAULT,DEFAULT, '9999-12-31');

INSERT INTO rentals
VALUES (11,DEFAULT,DEFAULT, '9999-12-31');

INSERT INTO rentals
VALUES (12,DEFAULT,DEFAULT, '9999-12-31');

INSERT INTO rentals
VALUES (13,DEFAULT,DEFAULT, '9999-12-31');

INSERT INTO rentals
VALUES (14,DEFAULT,DEFAULT, '9999-12-31');

INSERT INTO rentals
VALUES (15,DEFAULT,DEFAULT, '9999-12-31');

INSERT INTO rentals
VALUES (16,DEFAULT,DEFAULT, '9999-12-31');

INSERT INTO rentals
VALUES (17,DEFAULT,DEFAULT, '9999-12-31');
--Get a nice look at this rentals table
SELECT *
FROM rentals
ORDER BY eid ASC;
--The checkRent stored procedure checks if an item is available to be rented out
CREATE OR REPLACE FUNCTION checkRent (integer) returns date AS
$$
DECLARE
	desiredItem	integer		= $1;
BEGIN
	IF desiredItem IN (SELECT eid
			   FROM rentals
			   WHERE timeIn IS NULL)			--If there's no timeIn recorded, then it hasn't been turned in yet, so you cannot rent it.
	THEN RAISE EXCEPTION 'Item not available to be checked out';
	END IF;
	RETURN timeIn FROM rentals
	WHERE eid = desiredItem;
END;
$$
LANGUAGE PLPGSQL;

SELECT checkRent(11); 							--Run that function for me

--Stored procedure checkOut allows you to check out your equipment as needed if available.
CREATE OR REPLACE FUNCTION checkOut (integer, integer, date) returns date AS
$$
DECLARE
	checkoutEid	integer		= $1;
	checkoutPid	integer		= $2;
	checkoutTime    date	 	= $3;
	
BEGIN
	PERFORM checkRent(checkoutEid);						--That fancy checkRent function we just saw? He gets used right here automatically for us wow what a stud.
	IF checkRent(checkoutEid) IS NULL
	THEN RAISE EXCEPTION 'Item not available to be checked out';
	END IF;
	UPDATE rentals SET pid = $2 WHERE eid = $1;
	UPDATE rentals SET timeIn = NULL WHERE rentals.eid = $1			--Sets timeIn to null because the item is no longer in.
					 AND rentals.pid = $2;				 
	UPDATE rentals SET timeOut = $3 WHERE eid = $1;
	
	RETURN checkoutTime;
END;
$$
LANGUAGE PLPGSQL;

SELECT checkOut (11,1,CURRENT_DATE);						--Just input your id, the item id, and we'll stamp it with today's date.
SELECT *
FROM rentals
ORDER BY eid ASC;
--This stored procedure makes sure you're not trying to return an item that's already here
CREATE OR REPLACE FUNCTION checkReturn (integer) returns date AS
$$
DECLARE
	desiredItem	integer		= $1;
BEGIN
	IF desiredItem IN (SELECT eid
			   FROM rentals
			   WHERE timeIn IS NOT NULL)			--If there's a value for timeIn then it's in stock.
	THEN RAISE EXCEPTION 'This item is still here';
	END IF;
	RETURN timeOut FROM rentals
	WHERE eid = desiredItem;
END;
$$
LANGUAGE PLPGSQL;

SELECT checkReturn(12); 						--Gimme dat czech

--This stored procedure makes it possible to return the equipment
CREATE OR REPLACE FUNCTION turnIn (integer, integer, date) returns date AS
$$
DECLARE
	returnEid	integer		= $1;
	returnPid	integer		= $2;
	itemTimeIn      date	 	= $3;
BEGIN
	PERFORM checkReturn(returnEid);						--Automatically runs that cute little checkReturn function we just made.
	IF checkReturn(returnEid) IS NULL
	THEN RAISE EXCEPTION 'This item is still here';
	END IF;
	UPDATE rentals SET pid = $2 WHERE eid = $1;
	UPDATE rentals SET timeIn = $3 WHERE eid = $1;				--Sets the timeIn to the current date of turning it in. Voila!
	RETURN itemTimeIn;
END;
$$
LANGUAGE PLPGSQL; 

SELECT turnIn(13,4,CURRENT_DATE);						--Just enter your id and the id of the item you're returning.

--Our final view allows you to view the names of rentors and the names of the items they're renting or were the last to return.
CREATE VIEW Inventory AS
SELECT people.fullName, equipment.name, rentals.timeOut, rentals.timeIn
FROM people, equipment, rentals
WHERE people.pid = rentals.pid
  AND equipment.eid = rentals.eid;
SELECT *
FROM Inventory  
ORDER BY name ASC;