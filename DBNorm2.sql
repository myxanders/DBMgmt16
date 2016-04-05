 
--Address
DROP TABLE IF EXISTS Address;
CREATE TABLE Address (
  adid      	char(4) not null,
  housenum  	int not null,
  street    	varchar(255) not null,
  city	  	varchar(48) not null,
  state	  	varchar(24) not null,
  ZIP		  	int not null,
 primary key(adid)
 );

--Personnel
DROP TABLE IF EXISTS Personnel;
CREATE TABLE Personnel (
  pid			char(4) not null
  adid		char(4) not null references Address(adid),
  birthdate	date not null,
  name		varchar(48),
 primary key(pid)
 );  

--Actors
DROP TABLE IF EXISTS Actors;
CREATE TABLE Actors (
  pid		 	char(4) not null references Personnel(pid),
  aid			char(4) not null,
  hairColor	varchar(24) not null,
  eyeColor		varchar(24) not null,
  heightIn		real not null,
  weightLb		real not null,
  spouseName	varchar(48) not null,
  favColor		varchar(24) not null,
 primary key(pid,aid)
 );

--Directors
DROP TABLE IF EXISTS Directors;
CREATE TABLE Directors (
  pid			char(4) not null references Personnel(pid),
  did			char(4) not null,
  spouseName	varchar(48) not null,
  favLens		varchar(24) not null,
 primary key(pid,did)
 );

--Screen Actors’ Guild Anniversary
DROP TABLE IF EXISTS ActGuildAnniversary;
CREATE TABLE ActGuildAnniversary (
  aid			char(4) not null references Actors(aid),
  actGuildDate	date not null,
 primary key(aid)
 );

--Directors’ Guild Anniversary
DROP TABLE IF EXISTS DirGuildAnniversary;
CREATE TABLE DirGuildAnniversary (
  did			char(4) not null references Directors(did),
  dirGuildDate	date not null,
  primary key(did)
  );

--Film Schools
DROP TABLE IF EXISTS FilmSchools;
CREATE TABLE FilmSchools (
  sid			char(4) not null,
  name		varchar(24) not null,
 primary key(sid)
 );

--Film School Students
DROP TABLE IF EXISTS FilmStudents;
CREATE TABLE FilmStudents (
  pid			char(4) not null references Personnel(pid),
  sid			char(4) not null references FilmSchools(sid),
  year		int not null,
  degree		varchar(24) not null,
 primary key(pid,sid,year)
 );

--Movies
DROP TABLE IF EXISTS Movies;
CREATE TABLE Movies (
  mid			char(4) not null,
  name		varchar(48) not null,
  year		int not null,
  MPAAnum		int not null,
 primary key(mid)
 );

--Position
DROP TABLE IF EXISTS Position;
CREATE TABLE Position (
  posid		char(4) not null,
  positionTitle	varchar(24) not null,
 primary key(posid)
 );

--Movie Position
DROP TABLE IF EXISTS MoviePosition;
CREATE TABLE MoviePosition (
  pid			char(4) not null references Personnel(pid),
  posid		char(4) not null references Position(posid),
  mid			char(4) not null references Movies(mid),
  salaryUSD	real not null,
 primary key(pid,posid,mid)
 );

--Movie Sales
DROP TABLE IF EXISTS MovieSales;
CREATE TABLE MovieSales (
  mid			char(4) not null references Movies(mid),
  boxOfficeDom	real not null,
  boxOfficeFor	real not null,
  DVDBluRaysales	real not null,
 primary key(mid)
 );

SELECT name
FROM Personnel
WHERE pid IN (SELECT pid
              FROM MoviePosition
              WHERE posid IN (SELECT posid
                              FROM Position
                              WHERE positionTitle = ‘Director’
                              )
              AND mid IN (SELECT MID
                          FROM MoviePosition
                          WHERE pid IN (SELECT pid
                                        FROM Personnel
                                        WHERE name = ‘Sean Connery’
                                        )
                          )
              );
